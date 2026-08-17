#!/usr/bin/env python3
import pathlib
import sys


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: python3 bin2coe.py input.bin output.coe")
        return 1

    in_path = pathlib.Path(sys.argv[1])
    out_path = pathlib.Path(sys.argv[2])
    data = in_path.read_bytes()
    if len(data) % 4:
        data += b"\x00" * (4 - (len(data) % 4))

    words = [
        int.from_bytes(data[i : i + 4], byteorder="little")
        for i in range(0, len(data), 4)
    ]

    with out_path.open("w", encoding="ascii", newline="\n") as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        for i, word in enumerate(words):
            f.write(f"{word:08x}{',' if i + 1 < len(words) else ';'}\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
