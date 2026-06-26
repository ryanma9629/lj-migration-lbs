# Legacy Wabacus Docker Runbook

## Prerequisites

- Docker with Compose support
- `curl`
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

- Submit `admin` / `12345` to match the smoke check login flow.
- If authentication is stubbed or permissive in your local environment, this confirms session establishment and protected-page access rather than strong password validation.

## Validated pages

- `home`
- `system_menu`
- `system_parameter`
- `system_consts`

## Smoke check

```bash
./scripts/smoke-check.sh
```

## Expected first troubleshooting areas

- Missing Wabacus jars in `docker/app/lib/`
- Java compilation failures from unresolved third-party classes
- MySQL DDL statements that still contain DB2-only syntax
- Page-specific SQL incompatibilities outside the initial validation set
