#!/usr/bin/env python3
import pathlib
import sys


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: python3 bin2mem.py input.bin output.mem")
        return 1

    in_path = pathlib.Path(sys.argv[1])
    out_path = pathlib.Path(sys.argv[2])
    data = in_path.read_bytes()
    if len(data) % 4:
        data += b"\x00" * (4 - (len(data) % 4))

    with out_path.open("w", encoding="ascii", newline="\n") as f:
        f.write("@00000000\n")
        for i in range(0, len(data), 4):
            word = int.from_bytes(data[i : i + 4], byteorder="little")
            f.write(f"{word:08x}\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
