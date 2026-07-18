#!/usr/bin/env python3
"""Pack an Arma 3 mission folder into a .pbo file.

Missions do not require binarization, so a plain PBO archive of the folder
contents is sufficient. Uses only the Python standard library.

Usage: make_pbo.py <mission-folder> -o <output.pbo>

PBO format (all integers little-endian uint32):
  - version entry: empty name, method "sreV", then null-terminated
    key/value extension properties, terminated by an empty string
  - one header entry per file: null-terminated path (backslash separators),
    method, original size, reserved, timestamp, data size
  - blank terminating entry
  - file data blobs, concatenated in header order
  - a zero byte followed by the SHA-1 of everything before it
"""

import argparse
import hashlib
import struct
import sys
from pathlib import Path

PACKING_METHOD_VERSION = 0x56657273  # "sreV"
PACKING_METHOD_UNCOMPRESSED = 0x00000000

JUNK_NAMES = {".git", ".gitignore", ".DS_Store", "Thumbs.db", "desktop.ini"}


def asciiz(text: str) -> bytes:
    return text.encode("utf-8") + b"\x00"


def entry(name: str, method: int, original_size: int, reserved: int,
          timestamp: int, data_size: int) -> bytes:
    return asciiz(name) + struct.pack(
        "<5I", method, original_size, reserved, timestamp, data_size)


def collect_files(mission_dir: Path) -> list[Path]:
    files = []
    for path in sorted(mission_dir.rglob("*")):
        if not path.is_file():
            continue
        relative = path.relative_to(mission_dir)
        if any(part in JUNK_NAMES for part in relative.parts):
            continue
        files.append(path)
    return files


def build_pbo(mission_dir: Path, output: Path) -> int:
    files = collect_files(mission_dir)
    if not files:
        print(f"error: no files found in '{mission_dir}'", file=sys.stderr)
        return 1

    blob = bytearray()

    blob += entry("", PACKING_METHOD_VERSION, 0, 0, 0, 0)
    blob += asciiz("prefix") + asciiz(mission_dir.name)
    blob += b"\x00"

    for path in files:
        internal_name = "\\".join(path.relative_to(mission_dir).parts)
        stat = path.stat()
        blob += entry(internal_name, PACKING_METHOD_UNCOMPRESSED,
                      stat.st_size, 0, int(stat.st_mtime), stat.st_size)

    blob += entry("", 0, 0, 0, 0, 0)

    for path in files:
        blob += path.read_bytes()

    blob += b"\x00" + hashlib.sha1(blob).digest()

    output.write_bytes(blob)
    print(f"packed {len(files)} files from '{mission_dir}' into '{output}'")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("mission", type=Path, help="mission folder to pack")
    parser.add_argument("-o", "--output", type=Path,
                        help="output .pbo path (default: <mission>.pbo)")
    args = parser.parse_args()

    mission_dir = args.mission
    if not mission_dir.is_dir():
        print(f"error: '{mission_dir}' is not a directory", file=sys.stderr)
        return 1

    output = args.output or mission_dir.with_name(mission_dir.name + ".pbo")
    return build_pbo(mission_dir, output)


if __name__ == "__main__":
    sys.exit(main())
