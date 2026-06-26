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

### 2026-06-27 continuation

Executed from `/Users/ryanma/work/lj-migration-lbs` after adding `platform: linux/amd64` to the `mysql` service in `docker-compose.yml`:

```bash
docker compose up --build
docker compose logs mysql
docker compose logs app
```

Observed results:

- The previous arm64 manifest blocker was cleared. `mysql:5.7` pulled successfully under emulated `linux/amd64`.
- The MySQL container completed initialization, ran:
  - `/docker-entrypoint-initdb.d/00-create-databases.sql`
  - `/docker-entrypoint-initdb.d/01-schema.sql`
  - `/docker-entrypoint-initdb.d/02-seed.sql`
- MySQL then reached `mysqld: ready for connections.` on port `3306`.
- The app image built, but the app container exited during Java compilation with unresolved external classes.

Representative app errors:

```text
/workspace/legacy/src/com/customer/CustomerSelect.java:10: error: package com.wabacus.config does not exist
import com.wabacus.config.Config;
/workspace/legacy/src/com/customer/CustomerSelect.java:17: error: package com.wabacus.system.dataset does not exist
import com.wabacus.system.dataset.IReportDataSet;
/workspace/legacy/src/com/customer/CustomerSelect.java:23: error: package com.lenovo.ebank.pub does not exist
import com.lenovo.ebank.pub.SopIntf;
/workspace/legacy/src/com/customer/CustomerUpdate.java:32: error: cannot find symbol
public class CustomerUpdate extends AbsJavaEditActionBean
...
100 errors
```

Interpretation:

- The minimal compose change was sufficient to preserve MySQL 5.7 and get past the platform blocker.
- The next concrete blocker is missing third-party runtime jars under `docker/app/lib/`, not MySQL schema or seed data.
- `docker compose logs mysql` confirms database initialization succeeded.
- `docker compose logs app` confirms the app cannot compile because classes from Wabacus and at least one Lenovo package are absent from the runtime jar set.
- `./scripts/smoke-check.sh` could not be run because the app container never reached a serving state.

Exact dependency evidence recorded in `docker/app/lib/README.md`:

- Wabacus packages rooted at `com.wabacus.*`
- `com.lenovo.ebank.pub.SopIntf`
