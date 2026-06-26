#!/usr/bin/env python3
from pathlib import Path
import re

source = Path("refs/table_structures_utf8.txt")
target = Path("docker/mysql/init/01-schema.sql")

text = source.read_text(encoding="utf-8-sig")
lines = []

for raw_line in text.splitlines():
    line = raw_line.rstrip()
    stripped = line.strip()

    if not stripped:
        lines.append("")
        continue

    upper = stripped.upper()

    if set(stripped) == {"-"}:
        continue
    if upper.startswith("PARTITIONING KEY "):
        continue
    if upper.startswith("COMMENT ON TABLE "):
        continue
    if upper.startswith("COMMENT ON COLUMN "):
        continue
    if re.fullmatch(r"in\s+TS_[A-Z_]+\s*;?", stripped, flags=re.IGNORECASE):
        continue

    line = re.sub(r"\)\s*in\s+TS_[A-Z_]+\s*$", ")", line, flags=re.IGNORECASE)
    lines.append(line)

result = "\n".join(lines)
result = result.replace("Create table CST.", "CREATE TABLE cst.")
result = result.replace("Create table IBS.", "CREATE TABLE ibs.")
result = result.replace("Create Table CST.", "CREATE TABLE cst.")
result = result.replace("Create Table IBS.", "CREATE TABLE ibs.")
result = re.sub(r"\bINTEGER\b", "INT", result, flags=re.IGNORECASE)
result = re.sub(r"\bTIMESTAMP\b", "DATETIME", result, flags=re.IGNORECASE)
result = re.sub(r"\)\s*;", ");", result)

target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(result + "\n", encoding="utf-8")
