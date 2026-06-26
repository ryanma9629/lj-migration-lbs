# Legacy Wabacus Docker Runbook

## Prerequisites

- Docker with Compose support
- Required third-party jars copied into `docker/app/lib/`

## Build the MySQL schema file

```bash
python3 scripts/convert_db2_schema_to_mysql.py
```

## Start the stack

```bash
docker compose up --build
```

## Application URL

- Login page: `http://127.0.0.1:18080/LBIBS/jsp/login/login.html`

## Seeded login

- User: `admin`
- Password: `12345`

## Validated pages

- `home`
- `system_menu`
- `system_parameter`
- `system_consts`

## Smoke check

```bash
sh scripts/smoke-check.sh
```

## Expected first troubleshooting areas

- Missing Wabacus jars in `docker/app/lib/`
- Java compilation failures from unresolved third-party classes
- MySQL DDL statements that still contain DB2-only syntax
- Page-specific SQL incompatibilities outside the initial validation set
