#include <ctype.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MEM_SIZE (1024u * 1024u)
#define UART_TX  0xFFFFF080u
#define UART_ST  0xFFFFF084u
#define TIMER    0xFFFFF090u

static uint8_t mem[MEM_SIZE];
static uint32_t xreg[32];
static uint32_t pc;
static uint32_t timer_counter;
static char recent[16];
static char finish_recent[40];

static uint32_t u32(uint64_t v) { return (uint32_t)v; }
static int32_t s32(uint32_t v) { return (int32_t)v; }
static int32_t sext(uint32_t v, int bits) {
    uint32_t m = 1u << (bits - 1);
    return (int32_t)((v ^ m) - m);
}

static uint8_t rb(uint32_t addr) {
    if (addr == UART_ST) return 0;
    if (addr == TIMER) return (uint8_t)timer_counter;
    if (addr >= MEM_SIZE) return 0;
    return mem[addr];
}

static uint16_t rh(uint32_t addr) {
    return (uint16_t)(rb(addr) | ((uint16_t)rb(addr + 1) << 8));
}

static uint32_t rw(uint32_t addr) {
    if (addr == UART_ST) return 0;
    if (addr == TIMER) return timer_counter;
    if (addr + 3 >= MEM_SIZE) return 0;
    return (uint32_t)mem[addr] |
           ((uint32_t)mem[addr + 1] << 8) |
           ((uint32_t)mem[addr + 2] << 16) |
           ((uint32_t)mem[addr + 3] << 24);
}

static void push_uart(uint8_t ch) {
    putchar(ch);
    fflush(stdout);
    memmove(recent, recent + 1, sizeof(recent) - 2);
    recent[sizeof(recent) - 2] = (char)ch;
    recent[sizeof(recent) - 1] = 0;
    memmove(finish_recent, finish_recent + 1, sizeof(finish_recent) - 2);
    finish_recent[sizeof(finish_recent) - 2] = (char)ch;
    finish_recent[sizeof(finish_recent) - 1] = 0;
}

static void wb(uint32_t addr, uint32_t val) {
    if (addr == UART_TX) {
        push_uart((uint8_t)val);
        return;
    }
    if (addr < MEM_SIZE) mem[addr] = (uint8_t)val;
}

static void wh(uint32_t addr, uint32_t val) {
    wb(addr, val);
    wb(addr + 1, val >> 8);
}

static void ww(uint32_t addr, uint32_t val) {
    if (addr == UART_TX) {
        push_uart((uint8_t)val);
        return;
    }
    if (addr + 3 >= MEM_SIZE) return;
    mem[addr] = (uint8_t)val;
    mem[addr + 1] = (uint8_t)(val >> 8);
    mem[addr + 2] = (uint8_t)(val >> 16);
    mem[addr + 3] = (uint8_t)(val >> 24);
}

static uint32_t divs(uint32_t a, uint32_t b) {
    int32_t sa = s32(a), sb = s32(b);
    if (sb == 0) return 0xFFFFFFFFu;
    if (sa == (int32_t)0x80000000u && sb == -1) return 0x80000000u;
    return (uint32_t)(sa / sb);
}

static uint32_t rems(uint32_t a, uint32_t b) {
    int32_t sa = s32(a), sb = s32(b);
    if (sb == 0) return a;
    if (sa == (int32_t)0x80000000u && sb == -1) return 0;
    return (uint32_t)(sa % sb);
}

static void load_mem(const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "cannot open %s\n", path);
        exit(2);
    }
    char line[256];
    uint32_t addr = 0;
    while (fgets(line, sizeof(line), f)) {
        char *p = line;
        while (isspace((unsigned char)*p)) p++;
        if (*p == 0 || *p == '/' || *p == '#') continue;
        if (*p == '@') {
            addr = (uint32_t)strtoul(p + 1, NULL, 16) * 4u;
            continue;
        }
        uint32_t word = (uint32_t)strtoul(p, NULL, 16);
        if (addr + 3 < MEM_SIZE) {
            mem[addr] = (uint8_t)word;
            mem[addr + 1] = (uint8_t)(word >> 8);
            mem[addr + 2] = (uint8_t)(word >> 16);
            mem[addr + 3] = (uint8_t)(word >> 24);
        }
        addr += 4;
    }
    fclose(f);
}

static int step(void) {
    uint32_t insn = rw(pc);
    uint32_t pc0 = pc;
    pc = pc + 4;
    uint32_t op = insn & 0x7f;
    uint32_t rd = (insn >> 7) & 31;
    uint32_t f3 = (insn >> 12) & 7;
    uint32_t rs1 = (insn >> 15) & 31;
    uint32_t rs2 = (insn >> 20) & 31;
    uint32_t f7 = (insn >> 25) & 0x7f;
    uint32_t imm, addr, sh;

    switch (op) {
    case 0x37:
        xreg[rd] = insn & 0xFFFFF000u;
        break;
    case 0x17:
        xreg[rd] = pc0 + (insn & 0xFFFFF000u);
        break;
    case 0x6f:
        imm = ((insn >> 31) << 20) | (((insn >> 12) & 0xff) << 12) |
              (((insn >> 20) & 1) << 11) | (((insn >> 21) & 0x3ff) << 1);
        xreg[rd] = pc;
        pc = pc0 + sext(imm, 21);
        break;
    case 0x67:
        imm = (uint32_t)sext(insn >> 20, 12);
        addr = (xreg[rs1] + imm) & ~1u;
        xreg[rd] = pc;
        pc = addr;
        break;
    case 0x63: {
        imm = ((insn >> 31) << 12) | (((insn >> 7) & 1) << 11) |
              (((insn >> 25) & 0x3f) << 5) | (((insn >> 8) & 0xf) << 1);
        int take = 0;
        if (f3 == 0) take = xreg[rs1] == xreg[rs2];
        else if (f3 == 1) take = xreg[rs1] != xreg[rs2];
        else if (f3 == 4) take = s32(xreg[rs1]) < s32(xreg[rs2]);
        else if (f3 == 5) take = s32(xreg[rs1]) >= s32(xreg[rs2]);
        else if (f3 == 6) take = xreg[rs1] < xreg[rs2];
        else if (f3 == 7) take = xreg[rs1] >= xreg[rs2];
        if (take) pc = pc0 + sext(imm, 13);
        break;
    }
    case 0x03:
        addr = xreg[rs1] + (uint32_t)sext(insn >> 20, 12);
        if (f3 == 0) xreg[rd] = (uint32_t)sext(rb(addr), 8);
        else if (f3 == 1) xreg[rd] = (uint32_t)sext(rh(addr), 16);
        else if (f3 == 2) xreg[rd] = rw(addr);
        else if (f3 == 4) xreg[rd] = rb(addr);
        else if (f3 == 5) xreg[rd] = rh(addr);
        break;
    case 0x23:
        imm = ((insn >> 25) << 5) | rd;
        addr = xreg[rs1] + (uint32_t)sext(imm, 12);
        if (f3 == 0) wb(addr, xreg[rs2]);
        else if (f3 == 1) wh(addr, xreg[rs2]);
        else if (f3 == 2) ww(addr, xreg[rs2]);
        break;
    case 0x13:
        imm = (uint32_t)sext(insn >> 20, 12);
        sh = (insn >> 20) & 31;
        if (f3 == 0) xreg[rd] = xreg[rs1] + imm;
        else if (f3 == 2) xreg[rd] = s32(xreg[rs1]) < (int32_t)imm;
        else if (f3 == 3) xreg[rd] = xreg[rs1] < imm;
        else if (f3 == 4) xreg[rd] = xreg[rs1] ^ imm;
        else if (f3 == 6) xreg[rd] = xreg[rs1] | imm;
        else if (f3 == 7) xreg[rd] = xreg[rs1] & imm;
        else if (f3 == 1) xreg[rd] = xreg[rs1] << sh;
        else if (f3 == 5) xreg[rd] = (f7 == 0x20) ? (uint32_t)(s32(xreg[rs1]) >> sh) : (xreg[rs1] >> sh);
        break;
    case 0x33:
        if (f7 == 1) {
            uint32_t a = xreg[rs1], b = xreg[rs2];
            int64_t sa = s32(a), sb = s32(b);
            uint64_t ua = a, ub = b;
            if (f3 == 0) xreg[rd] = (uint32_t)(a * b);
            else if (f3 == 1) xreg[rd] = (uint32_t)((sa * sb) >> 32);
            else if (f3 == 2) xreg[rd] = (uint32_t)((sa * (int64_t)ub) >> 32);
            else if (f3 == 3) xreg[rd] = (uint32_t)((ua * ub) >> 32);
            else if (f3 == 4) xreg[rd] = divs(a, b);
            else if (f3 == 5) xreg[rd] = b ? (a / b) : 0xFFFFFFFFu;
            else if (f3 == 6) xreg[rd] = rems(a, b);
            else if (f3 == 7) xreg[rd] = b ? (a % b) : a;
        } else {
            sh = xreg[rs2] & 31;
            if (f3 == 0) xreg[rd] = (f7 == 0x20) ? (xreg[rs1] - xreg[rs2]) : (xreg[rs1] + xreg[rs2]);
            else if (f3 == 1) xreg[rd] = xreg[rs1] << sh;
            else if (f3 == 2) xreg[rd] = s32(xreg[rs1]) < s32(xreg[rs2]);
            else if (f3 == 3) xreg[rd] = xreg[rs1] < xreg[rs2];
            else if (f3 == 4) xreg[rd] = xreg[rs1] ^ xreg[rs2];
            else if (f3 == 5) xreg[rd] = (f7 == 0x20) ? (uint32_t)(s32(xreg[rs1]) >> sh) : (xreg[rs1] >> sh);
            else if (f3 == 6) xreg[rd] = xreg[rs1] | xreg[rs2];
            else if (f3 == 7) xreg[rd] = xreg[rs1] & xreg[rs2];
        }
        break;
    case 0x0f:
        break;
    case 0x73:
        return 0;
    default:
        fprintf(stderr, "\nunsupported pc=0x%08x insn=0x%08x op=0x%02x\n", pc0, insn, op);
        return 0;
    }
    xreg[0] = 0;
    timer_counter++;
    return 1;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "usage: %s coremark.mem [max_steps]\n", argv[0]);
        return 2;
    }
    uint64_t max_steps = (argc >= 3) ? strtoull(argv[2], NULL, 0) : 2000000000ull;
    load_mem(argv[1]);
    for (uint64_t i = 0; i < max_steps; i++) {
        if (!step()) break;
        if (strstr(finish_recent, "Finished Successfully")) break;
    }
    printf("\n\n[ISS-C] pc=0x%08x timer=%u\n", pc, timer_counter);
    return 0;
}
