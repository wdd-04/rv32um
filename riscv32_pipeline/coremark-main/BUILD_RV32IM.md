# RV32IM CoreMark Build

This build is for the current RV32IM bare-metal CPU.

## Build on the server

From this directory:

```sh
chmod +x build_rv32im.sh
./build_rv32im.sh ITERATIONS=0 CPU_HZ=75000000
```

If your RISC-V tools use another prefix:

```sh
./build_rv32im.sh RISCV_PREFIX=riscv64-unknown-elf- ITERATIONS=0 CPU_HZ=75000000
```

Generated files:

- `coremark.coe`: bind this to Vivado instruction memory for FPGA boot.
- `coremark.mem`: use this for simulation `$readmemh`.
- `coremark.asm` and `coremark_source.asm`: use these to inspect instructions.
- `coremark.map`: use this to check code/data size.

## Important Vivado notes

- Program memory starts at `0x00000000`.
- RAM space is currently `0x00000000` to `0x0000ffff`.
- UART TX data is `0xfffff080`.
- UART TX status is `0xfffff084`, busy bit is bit 0.
- Timer is `0xfffff090`.
- The old ILA/MRD score capture path at `0x0000f000` is removed. CoreMark
  results are printed through UART, and elapsed time comes from the hardware
  timer.

The CPU clock used for score calculation must match `CPU_HZ`.

`ITERATIONS=0` lets CoreMark choose a run length automatically. Use
`ITERATIONS=100` only for a quick bring-up image.
