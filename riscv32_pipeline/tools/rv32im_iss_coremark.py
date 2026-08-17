#!/usr/bin/env python3
import argparse
from pathlib import Path


MASK32 = 0xFFFFFFFF


def u32(x):
    return x & MASK32


def s32(x):
    x &= MASK32
    return x - 0x100000000 if x & 0x80000000 else x


def sext(x, bits):
    sign = 1 << (bits - 1)
    return (x & (sign - 1)) - (x & sign)


def load_mem_words(path, mem):
    addr = 0
    for raw in Path(path).read_text(encoding="utf-8", errors="ignore").splitlines():
        line = raw.strip()
        if not line or line.startswith("//"):
            continue
        if line.startswith("@"):
            addr = int(line[1:], 16) * 4
            continue
        word = int(line.split()[0], 16) & MASK32
        if addr + 4 > len(mem):
            mem.extend(b"\x00" * (addr + 4 - len(mem)))
        mem[addr:addr + 4] = word.to_bytes(4, "little")
        addr += 4


class RV32IM:
    def __init__(self, mem_path, cpu_hz=75_000_000, max_steps=100_000_000):
        self.mem = bytearray(1024 * 1024)
        load_mem_words(mem_path, self.mem)
        self.x = [0] * 32
        self.pc = 0
        self.cpu_hz = cpu_hz
        self.timer = 0
        self.max_steps = max_steps
        self.uart = []
        self.running = True

    def rb(self, addr):
        addr &= MASK32
        if addr == 0xFFFFF084:
            return 0
        if addr == 0xFFFFF090:
            return self.timer & 0xFF
        if addr >= len(self.mem):
            return 0
        return self.mem[addr]

    def rh(self, addr):
        return self.rb(addr) | (self.rb(addr + 1) << 8)

    def rw(self, addr):
        addr &= MASK32
        if addr == 0xFFFFF084:
            return 0
        if addr == 0xFFFFF090:
            return self.timer
        if addr + 4 > len(self.mem):
            return 0
        return int.from_bytes(self.mem[addr:addr + 4], "little")

    def wb(self, addr, val):
        addr &= MASK32
        val &= 0xFF
        if addr == 0xFFFFF080:
            self.uart.append(chr(val))
            print(chr(val), end="", flush=True)
            return
        if addr >= len(self.mem):
            return
        self.mem[addr] = val

    def wh(self, addr, val):
        self.wb(addr, val)
        self.wb(addr + 1, val >> 8)

    def ww(self, addr, val):
        addr &= MASK32
        val &= MASK32
        if addr == 0xFFFFF080:
            self.wb(addr, val)
            return
        if addr >= len(self.mem):
            return
        if addr + 4 > len(self.mem):
            self.mem.extend(b"\x00" * (addr + 4 - len(self.mem)))
        self.mem[addr:addr + 4] = val.to_bytes(4, "little")

    def divs(self, a, b):
        a, b = s32(a), s32(b)
        if b == 0:
            return MASK32
        if a == -0x80000000 and b == -1:
            return 0x80000000
        return u32(int(a / b))

    def rems(self, a, b):
        a, b = s32(a), s32(b)
        if b == 0:
            return u32(a)
        if a == -0x80000000 and b == -1:
            return 0
        return u32(a - int(a / b) * b)

    def step(self):
        insn = self.rw(self.pc)
        pc0 = self.pc
        self.pc = u32(self.pc + 4)
        op = insn & 0x7F
        rd = (insn >> 7) & 0x1F
        f3 = (insn >> 12) & 7
        rs1 = (insn >> 15) & 0x1F
        rs2 = (insn >> 20) & 0x1F
        f7 = (insn >> 25) & 0x7F
        x = self.x

        if op == 0x37:
            x[rd] = u32(insn & 0xFFFFF000)
        elif op == 0x17:
            x[rd] = u32(pc0 + (insn & 0xFFFFF000))
        elif op == 0x6F:
            imm = ((insn >> 31) << 20) | (((insn >> 12) & 0xFF) << 12) | (((insn >> 20) & 1) << 11) | (((insn >> 21) & 0x3FF) << 1)
            x[rd] = self.pc
            self.pc = u32(pc0 + sext(imm, 21))
        elif op == 0x67:
            imm = sext(insn >> 20, 12)
            t = u32(x[rs1] + imm) & ~1
            x[rd] = self.pc
            self.pc = t
        elif op == 0x63:
            imm = ((insn >> 31) << 12) | (((insn >> 7) & 1) << 11) | (((insn >> 25) & 0x3F) << 5) | (((insn >> 8) & 0xF) << 1)
            take = (
                (f3 == 0 and x[rs1] == x[rs2]) or
                (f3 == 1 and x[rs1] != x[rs2]) or
                (f3 == 4 and s32(x[rs1]) < s32(x[rs2])) or
                (f3 == 5 and s32(x[rs1]) >= s32(x[rs2])) or
                (f3 == 6 and x[rs1] < x[rs2]) or
                (f3 == 7 and x[rs1] >= x[rs2])
            )
            if take:
                self.pc = u32(pc0 + sext(imm, 13))
        elif op == 0x03:
            addr = u32(x[rs1] + sext(insn >> 20, 12))
            if f3 == 0:
                x[rd] = u32(sext(self.rb(addr), 8))
            elif f3 == 1:
                x[rd] = u32(sext(self.rh(addr), 16))
            elif f3 == 2:
                x[rd] = self.rw(addr)
            elif f3 == 4:
                x[rd] = self.rb(addr)
            elif f3 == 5:
                x[rd] = self.rh(addr)
        elif op == 0x23:
            imm = ((insn >> 25) << 5) | rd
            addr = u32(x[rs1] + sext(imm, 12))
            if f3 == 0:
                self.wb(addr, x[rs2])
            elif f3 == 1:
                self.wh(addr, x[rs2])
            elif f3 == 2:
                self.ww(addr, x[rs2])
        elif op == 0x13:
            imm = sext(insn >> 20, 12)
            sh = (insn >> 20) & 0x1F
            if f3 == 0:
                x[rd] = u32(x[rs1] + imm)
            elif f3 == 2:
                x[rd] = 1 if s32(x[rs1]) < imm else 0
            elif f3 == 3:
                x[rd] = 1 if x[rs1] < u32(imm) else 0
            elif f3 == 4:
                x[rd] = u32(x[rs1] ^ imm)
            elif f3 == 6:
                x[rd] = u32(x[rs1] | imm)
            elif f3 == 7:
                x[rd] = u32(x[rs1] & imm)
            elif f3 == 1:
                x[rd] = u32(x[rs1] << sh)
            elif f3 == 5:
                x[rd] = u32(s32(x[rs1]) >> sh) if f7 == 0x20 else u32(x[rs1] >> sh)
        elif op == 0x33:
            if f7 == 1:
                a, b = x[rs1], x[rs2]
                if f3 == 0:
                    x[rd] = u32(a * b)
                elif f3 == 1:
                    x[rd] = u32((s32(a) * s32(b)) >> 32)
                elif f3 == 2:
                    x[rd] = u32((s32(a) * b) >> 32)
                elif f3 == 3:
                    x[rd] = u32((a * b) >> 32)
                elif f3 == 4:
                    x[rd] = self.divs(a, b)
                elif f3 == 5:
                    x[rd] = MASK32 if b == 0 else u32(a // b)
                elif f3 == 6:
                    x[rd] = self.rems(a, b)
                elif f3 == 7:
                    x[rd] = a if b == 0 else u32(a % b)
            else:
                if f3 == 0:
                    x[rd] = u32(x[rs1] - x[rs2]) if f7 == 0x20 else u32(x[rs1] + x[rs2])
                elif f3 == 1:
                    x[rd] = u32(x[rs1] << (x[rs2] & 31))
                elif f3 == 2:
                    x[rd] = 1 if s32(x[rs1]) < s32(x[rs2]) else 0
                elif f3 == 3:
                    x[rd] = 1 if x[rs1] < x[rs2] else 0
                elif f3 == 4:
                    x[rd] = u32(x[rs1] ^ x[rs2])
                elif f3 == 5:
                    sh = x[rs2] & 31
                    x[rd] = u32(s32(x[rs1]) >> sh) if f7 == 0x20 else u32(x[rs1] >> sh)
                elif f3 == 6:
                    x[rd] = u32(x[rs1] | x[rs2])
                elif f3 == 7:
                    x[rd] = u32(x[rs1] & x[rs2])
        elif op == 0x0F:
            pass
        elif op == 0x73:
            self.running = False
        else:
            raise RuntimeError(f"unsupported opcode pc=0x{pc0:08x} insn=0x{insn:08x}")

        x[0] = 0
        self.timer = u32(self.timer + 1)

    def run(self):
        for step in range(self.max_steps):
            if not self.running:
                break
            self.step()
            if "CoreMark 1.0" in "".join(self.uart):
                break
        return "".join(self.uart)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("mem")
    ap.add_argument("--max-steps", type=int, default=100_000_000)
    args = ap.parse_args()
    sim = RV32IM(args.mem, max_steps=args.max_steps)
    out = sim.run()
    print(f"\n\n[ISS] pc=0x{sim.pc:08x} timer={sim.timer} chars={len(out)}")


if __name__ == "__main__":
    main()
