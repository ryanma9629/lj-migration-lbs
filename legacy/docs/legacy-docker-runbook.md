# Legacy Wabacus Docker Runbook

## Prerequisites

- Docker with Compose support
- `curl`
- Required third-party jars copied into `docker/app/lib/`

## Build the MySQL schema file

```bash
cd legacy
python3 scripts/convert_db2_schema_to_mysql.py
```

## Start the stack

```bash
cd legacy
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

The current Docker profile is intentionally reduced to those core pages. Legacy business reports outside this set are not loaded during startup.

## Smoke check

```bash
./scripts/smoke-check.sh
```

If your local environment cannot reach Docker-published localhost ports from the current shell, you can verify the same flow inside the app container:

```bash
docker compose exec app sh -lc 'cookie=$(mktemp); body=$(mktemp); base=http://127.0.0.1:8080/LBIBS; curl -fsS -c "$cookie" "$base/jsp/login/login.html" >/dev/null && curl -fsS -L -c "$cookie" -b "$cookie" -d "TxtUserID=admin" -d "TxtPassword=12345" "$base/jsp/login/login.jsp" >/dev/null && for page in home system_menu system_parameter system_consts; do curl -fsS -b "$cookie" "$base/ShowReport.wx?PAGEID=$page" > "$body"; done; rm -f "$cookie" "$body"'
```

## Expected first troubleshooting areas

- Missing Wabacus jars in `docker/app/lib/`
- Java compilation failures from unresolved third-party classes
- MySQL DDL statements that still contain DB2-only syntax
- Page-specific SQL incompatibilities outside the initial validation set

## Bring-up Evidence

### 2026-06-26 attempt

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy`:

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

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy` after adding `platform: linux/amd64` to the `mysql` service in `docker-compose.yml`:

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

### 2026-06-27 core-page bring-up

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy` after vendoring Wabacus jars, replacing the Druid datasource implementation, stubbing Lenovo SSO/SOP integration points, and reducing Wabacus startup to the core system pages:

```bash
docker compose up --build -d
docker compose logs app --tail=120
docker compose exec app sh -lc 'cookie=$(mktemp); body=$(mktemp); base=http://127.0.0.1:8080/LBIBS; curl -fsS -c "$cookie" "$base/jsp/login/login.html" >/dev/null && curl -fsS -L -c "$cookie" -b "$cookie" -d "TxtUserID=admin" -d "TxtPassword=12345" "$base/jsp/login/login.jsp" >/dev/null && for page in home system_menu system_parameter system_consts; do curl -fsS -b "$cookie" "$base/ShowReport.wx?PAGEID=$page" > "$body"; done; rm -f "$cookie" "$body"'
```

Observed results:

- `docker compose logs app --tail=120` included `wabacus应用启动完成!`.
- Tomcat stayed up with `0.0.0.0:18080->8080/tcp`.
- An authenticated in-container smoke check reached all four target pages and validated:
  - `home` contains `所有功能`
  - `system_menu` contains `菜单名称`
  - `system_parameter` contains `通用参数设置`
  - `system_consts` contains `Consts设定`

Interpretation:

- The Dockerized legacy runtime is now operational for the agreed core validation set.
- Remaining unported business pages are intentionally outside the startup scope and still need incremental compatibility work if you want them loaded in this environment.
