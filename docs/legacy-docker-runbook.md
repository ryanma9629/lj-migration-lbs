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

## Bring-up Evidence

### 2026-06-26 attempt

Executed from `/Users/ryanma/work/lj-migration-lbs`:

```bash
python3 scripts/convert_db2_schema_to_mysql.py
docker compose up --build
docker compose logs mysql
docker compose logs app
```

Observed results:

- `python3 scripts/convert_db2_schema_to_mysql.py` exited successfully and regenerated `docker/mysql/init/01-schema.sql`.
- `docker compose up --build` failed before either service started with:

```text
Image mysql:5.7 Pulling
Image mysql:5.7 Error no matching manifest for linux/arm64/v8 in the manifest list entries: no match for platform in manifest: not found
Error response from daemon: no matching manifest for linux/arm64/v8 in the manifest list entries: no match for platform in manifest: not found
```

- `docker compose logs mysql` produced no output.
- `docker compose logs app` produced no output.

Interpretation:

- The first concrete blocker is platform-level, not schema-level or application-level: the configured `mysql:5.7` image could not be pulled for `linux/arm64/v8` on this machine.
- Because the failure occurs before container creation, there is no MySQL startup log, no app startup log, and no basis to run `./scripts/smoke-check.sh`.
- This blocker is outside the allowed file scope for Task 6. Resolving it would require changing compose/image platform strategy or using a compatible MySQL image, neither of which is permitted in this task.
