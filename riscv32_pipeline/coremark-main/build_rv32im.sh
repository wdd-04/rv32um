#!/usr/bin/env bash
set -euo pipefail

make -f Makefile.rv32im clean
make -f Makefile.rv32im all "$@"

echo
echo "Generated:"
echo "  coremark.elf"
echo "  coremark.asm"
echo "  coremark_source.asm"
echo "  coremark.bin"
echo "  coremark.coe"
echo "  coremark.mem"
