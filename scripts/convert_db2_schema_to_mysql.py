#!/usr/bin/env python3
from pathlib import Path
import re

source = Path("refs/table_structures_utf8.txt")
target = Path("docker/mysql/init/01-schema.sql")

allowed_schemas = {"cst", "ibs"}
create_table_pattern = re.compile(
    r"^\s*Create\s+Table\s+([A-Z_0-9]+)\.([A-Z_0-9]+)\s*\(\s*$",
    flags=re.IGNORECASE,
)
header_line_pattern = re.compile(r"^-+\s*Create\s+Table\b", flags=re.IGNORECASE)
separator_line_pattern = re.compile(r"^-+\s*$")
standalone_tablespace_pattern = re.compile(
    r"^in\s+[A-Z_0-9]+\s*;?\s*$",
    flags=re.IGNORECASE,
)
closing_line_pattern = re.compile(
    r"\)\s*(?:in\s+[A-Z_0-9]+\s*)?;?\s*$",
    flags=re.IGNORECASE,
)


def normalize_sql_line(line: str) -> str:
    line = re.sub(r"\bINTEGER\b", "INT", line, flags=re.IGNORECASE)
    line = re.sub(r"\bTIMESTAMP\b", "DATETIME", line, flags=re.IGNORECASE)
    line = re.sub(r"\bWITH\s+DEFAULT\b", "DEFAULT", line, flags=re.IGNORECASE)
    return line.rstrip()


text = source.read_text(encoding="utf-8-sig")
tables = []
current_table = []
in_allowed_table = False
in_post_table_clauses = False

for raw_line in text.splitlines():
    line = raw_line.rstrip()
    stripped = line.strip()

    create_match = create_table_pattern.match(stripped)
    if create_match:
        if current_table:
            tables.append("\n".join(current_table))
            current_table = []

        schema = create_match.group(1).lower()
        table = create_match.group(2)
        in_allowed_table = schema in allowed_schemas
        in_post_table_clauses = False

        if in_allowed_table:
            current_table.append(f"CREATE TABLE {schema}.{table} (")
        continue

    if not in_allowed_table:
        continue

    upper = stripped.upper()

    if not stripped:
        continue
    if separator_line_pattern.fullmatch(stripped):
        continue
    if header_line_pattern.match(stripped):
        continue
    if upper.startswith("PARTITIONING KEY "):
        continue
    if upper.startswith("COMMENT ON TABLE "):
        continue
    if upper.startswith("COMMENT ON COLUMN "):
        continue
    if upper == "COMPRESS YES;":
        continue
    if standalone_tablespace_pattern.fullmatch(stripped):
        continue

    if in_post_table_clauses:
        continue

    normalized = normalize_sql_line(line)

    if closing_line_pattern.search(normalized):
        normalized = closing_line_pattern.sub(");", normalized)
        current_table.append(normalized)
        in_post_table_clauses = True
        continue

    current_table.append(normalized)

if current_table:
    tables.append("\n".join(current_table))

result = "\n\n".join(tables)

target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(result + "\n", encoding="utf-8")
