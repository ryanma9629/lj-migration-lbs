# Legacy Wabacus Docker Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Run the legacy JSP/Wabacus application inside Docker with MySQL replacing DB2, and verify login plus the `home`, `system_menu`, and `system_parameter` page paths against seeded MySQL data.

**Architecture:** Use a two-container `docker compose` stack: MySQL provides `cst` and `ibs` schemas initialized from a converted form of `refs/table_structures_utf8.txt`, while a Tomcat container compiles and deploys the legacy webapp from source at build time. Keep the Wabacus datasource name `ds_db2` to minimize XML churn, but repoint it to MySQL and patch only the startup-critical DB2 incompatibilities.

**Tech Stack:** Docker Compose, MySQL 5.7, Tomcat 8.5 + JDK 8, shell scripting, Python 3 for DDL conversion, JSP/Servlet 2.4, Wabacus XML config, Java source compilation with `javac`

---

## File Structure

### Files to Create

- `docker-compose.yml`
- `docker/mysql/init/00-create-databases.sql`
- `docker/mysql/init/01-schema.sql`
- `docker/mysql/init/02-seed.sql`
- `docker/app/Dockerfile`
- `docker/app/entrypoint.sh`
- `docker/app/lib/README.md`
- `scripts/convert_db2_schema_to_mysql.py`
- `scripts/smoke-check.sh`
- `docs/legacy-docker-runbook.md`

### Files to Modify

- `legacy/src/reportconfig/wabacus.cfg.xml`
- `legacy/src/com/customer/security/Login.java`
- `legacy/src/com/customer/security/GlobalInterceptor.java`

### Files to Read While Implementing

- `refs/table_structures_utf8.txt`
- `legacy/WebContent/WEB-INF/web.xml`
- `legacy/src/reportconfig/report/basic.xml`
- `legacy/src/reportconfig/report/system_menu.xml`
- `legacy/src/reportconfig/report/system_parameter.xml`

### Validation Targets

- Login entry: `/LBIBS/jsp/login/login.html`
- Home page: `/LBIBS/ShowReport.wx?PAGEID=home`
- Menu page: `/LBIBS/ShowReport.wx?PAGEID=system_menu`
- Parameter page: `/LBIBS/ShowReport.wx?PAGEID=system_parameter`

---

### Task 1: Scaffold Docker Runtime and Dependency Staging

**Files:**
- Create: `docker-compose.yml`
- Create: `docker/app/Dockerfile`
- Create: `docker/app/entrypoint.sh`
- Create: `docker/app/lib/README.md`
- Test: local compose config validation

- [ ] **Step 1: Confirm the repo does not yet define the Docker stack**

Run:

```bash
test -f docker-compose.yml
```

Expected: command exits non-zero because `docker-compose.yml` does not exist yet.

- [ ] **Step 2: Add the initial `docker-compose.yml`**

```yaml
services:
  mysql:
    image: mysql:5.7
    command:
      - --character-set-server=utf8mb4
      - --collation-server=utf8mb4_unicode_ci
      - --lower_case_table_names=1
      - --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_ROOT_PASSWORD: root
      TZ: Asia/Shanghai
    ports:
      - "13306:3306"
    volumes:
      - ./docker/mysql/init:/docker-entrypoint-initdb.d:ro
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "127.0.0.1", "-proot"]
      interval: 10s
      timeout: 5s
      retries: 20

  app:
    build:
      context: .
      dockerfile: docker/app/Dockerfile
    environment:
      APP_CONTEXT: LBIBS
      TZ: Asia/Shanghai
    ports:
      - "18080:8080"
    depends_on:
      mysql:
        condition: service_healthy
```

- [ ] **Step 3: Add the application container `Dockerfile`**

```dockerfile
FROM tomcat:8.5.100-jdk8-temurin

ENV CATALINA_OPTS="-Dfile.encoding=UTF-8 -Duser.timezone=Asia/Shanghai"
ENV APP_CONTEXT=LBIBS

WORKDIR /workspace

COPY legacy /workspace/legacy
COPY docker/app/entrypoint.sh /entrypoint.sh
COPY docker/app/lib /opt/legacy-lib

RUN chmod +x /entrypoint.sh \
    && rm -rf /usr/local/tomcat/webapps/*

ENTRYPOINT ["/entrypoint.sh"]
```

- [ ] **Step 4: Add the container entrypoint that assembles and compiles the webapp**

```sh
#!/bin/sh
set -eu

APP_DIR="/usr/local/tomcat/webapps/${APP_CONTEXT}"
SRC_DIR="/workspace/legacy/src"
WEB_DIR="/workspace/legacy/WebContent"
CLASS_DIR="${APP_DIR}/WEB-INF/classes"
LIB_DIR="${APP_DIR}/WEB-INF/lib"

mkdir -p "${APP_DIR}" "${CLASS_DIR}" "${LIB_DIR}"
cp -R "${WEB_DIR}/." "${APP_DIR}/"

if [ -d /opt/legacy-lib ]; then
  find /opt/legacy-lib -type f \( -name '*.jar' -o -name '*.zip' \) -exec cp {} "${LIB_DIR}/" \;
fi

CLASSPATH="${LIB_DIR}/*:/usr/local/tomcat/lib/servlet-api.jar"
find "${SRC_DIR}" -name '*.java' | sort > /tmp/legacy-sources.txt

javac -encoding UTF-8 -cp "${CLASSPATH}" -d "${CLASS_DIR}" @/tmp/legacy-sources.txt
cp -R "${SRC_DIR}/reportconfig" "${CLASS_DIR}/"
cp "${SRC_DIR}/log4j.properties" "${CLASS_DIR}/"

exec catalina.sh run
```

- [ ] **Step 5: Add a dependency staging note for missing jars**

```md
# Legacy Runtime Jars

Place third-party runtime jars required by the legacy app in this directory before building the `app` image.

Minimum expected contents:

- Wabacus runtime jars required by `com.wabacus.WabacusServlet`
- MySQL JDBC driver compatible with Java 8, for example `mysql-connector-java-5.1.49.jar`
- Druid connection pool jar used by `com.customer.util.DruidDataSourceUtil`
- Any transitive jars needed for the Wabacus runtime and current source compilation

The Docker entrypoint copies every `.jar` and `.zip` file from this directory into `WEB-INF/lib` before compilation.
```

- [ ] **Step 6: Validate the compose syntax**

Run:

```bash
docker compose config
```

Expected: `services.app` and `services.mysql` render successfully with no YAML errors.

- [ ] **Step 7: Commit the scaffold**

```bash
git add docker-compose.yml docker/app/Dockerfile docker/app/entrypoint.sh docker/app/lib/README.md
git commit -m "chore: scaffold legacy docker runtime"
```

---

### Task 2: Convert DB2 DDL into MySQL Initialization Assets

**Files:**
- Create: `scripts/convert_db2_schema_to_mysql.py`
- Create: `docker/mysql/init/00-create-databases.sql`
- Create: `docker/mysql/init/01-schema.sql`
- Test: generated schema content

- [ ] **Step 1: Confirm the MySQL schema file does not yet exist**

Run:

```bash
test -f docker/mysql/init/01-schema.sql
```

Expected: command exits non-zero because the generated schema file is not present yet.

- [ ] **Step 2: Add the schema conversion script**

```python
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
    if stripped in {"in TS_FACT", "in TS_IBS", "in TS_REP", "in TS_PUB"}:
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
```

- [ ] **Step 3: Add the schema bootstrap file for the two logical databases**

```sql
CREATE DATABASE IF NOT EXISTS cst CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS ibs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'wabacus'@'%' IDENTIFIED BY 'wabacus';
GRANT ALL PRIVILEGES ON cst.* TO 'wabacus'@'%';
GRANT ALL PRIVILEGES ON ibs.* TO 'wabacus'@'%';
FLUSH PRIVILEGES;
```

- [ ] **Step 4: Run the converter to generate `01-schema.sql`**

Run:

```bash
python3 scripts/convert_db2_schema_to_mysql.py
```

Expected: `docker/mysql/init/01-schema.sql` is created without Python exceptions.

- [ ] **Step 5: Sanity-check the generated DDL for stripped DB2-only clauses**

Run:

```bash
rg -n "Partitioning Key|Comment on Table|Comment on Column| in TS_|^-+$" docker/mysql/init/01-schema.sql
```

Expected: no matches.

- [ ] **Step 6: Sanity-check that both logical schemas remain qualified**

Run:

```bash
rg -n "^CREATE TABLE (cst|ibs)\\." docker/mysql/init/01-schema.sql | sed -n '1,10p'
```

Expected: the output includes `CREATE TABLE cst.` rows and `CREATE TABLE ibs.` rows.

- [ ] **Step 7: Commit the schema conversion assets**

```bash
git add scripts/convert_db2_schema_to_mysql.py docker/mysql/init/00-create-databases.sql docker/mysql/init/01-schema.sql
git commit -m "feat: generate mysql schema from db2 ddl"
```

---

### Task 3: Seed the Minimum Authorization and Login Data

**Files:**
- Create: `docker/mysql/init/02-seed.sql`
- Test: seed SQL contains login, menu, page, and privilege rows

- [ ] **Step 1: Confirm the seed file does not yet exist**

Run:

```bash
test -f docker/mysql/init/02-seed.sql
```

Expected: command exits non-zero because the seed file is not present yet.

- [ ] **Step 2: Add the minimum seed data needed for login and system pages**

```sql
USE cst;

DELETE FROM cst.SYS_C_SEC_USER WHERE USER_ID='admin';
DELETE FROM cst.SYS_C_SEC_USER_GROUP WHERE USER_ID='admin';
DELETE FROM cst.SYS_C_SEC_GPPV WHERE GROUP_ID='admin_group';
DELETE FROM cst.SYS_C_SEC_PVLT WHERE PRIVILEGE_ID='admin_priv';
DELETE FROM cst.SYS_C_SEC_PRIV WHERE PRIVILEGE_ID='admin_priv';
DELETE FROM cst.SYS_C_APP_MNLT WHERE GROUP_ID='admin_group' AND PAGE_ID IN ('home','system_menu','system_parameter','system_consts');
DELETE FROM cst.SYS_C_APP_MENU WHERE MENU_ID IN ('menu_home','menu_system');
DELETE FROM cst.SYS_C_SEC_PAGE WHERE PAGE_ID IN ('home','system_menu','system_parameter','system_consts');
DELETE FROM cst.SYS_C_SET_PARM WHERE PARAM_TYPE='system' AND PARAM_ID='demo_flag';
DELETE FROM cst.SYS_C_APP_CONSTS WHERE CONST_TYPE='system' AND CONST_NAME='demo_limit';
DELETE FROM cst.SYS_C_SEC_GROP WHERE GROUP_ID='admin_group';

INSERT INTO cst.SYS_C_SEC_USER (USER_ID, USER_NAME, ORG_ID, IS_ENABLE, SKIN, LM_USER, LM_TIME, PASSWORD, DEPARTMENT, DEPT_ID)
VALUES ('admin', '管理员', '1000', 'Y', 'vista', 'seed', NOW(), 'Due2bkAVWVY=', 'IT', 'IT');

INSERT INTO cst.SYS_C_SEC_GROP (GROUP_ID, GROUP_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_group', '管理员角色', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_USER_GROUP (USER_ID, GROUP_ID, LM_USER, LM_TIME, UR_NO)
VALUES ('admin', 'admin_group', 'seed', NOW(), 'admin-admin_group');

INSERT INTO cst.SYS_C_SEC_PRIV (PRIVILEGE_ID, PRIORITY, PRIVILEGE_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_priv', 1, '管理员首页和系统页', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_GPPV (GROUP_ID, PRIVILEGE_ID, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_group', 'admin_priv', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_PAGE (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('home', '首页', '首页', '060', 0, 'seed', NOW()),
  ('system_menu', '菜单', '菜单维护', '060', 0, 'seed', NOW()),
  ('system_parameter', '参数设置', '参数设置', '060', 0, 'seed', NOW()),
  ('system_consts', 'Consts设定', 'Consts设定', '060', 0, 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_PVLT (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_home', 'admin_priv', 'home', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_menu', 'admin_priv', 'system_menu', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_parameter', 'admin_priv', 'system_parameter', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_consts', 'admin_priv', 'system_consts', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());

INSERT INTO cst.SYS_C_APP_MENU (MENU_ID, MENU_NAME, SERVICE_ID, SEQ, LM_USER, LM_TIME, MENU_TYPE)
VALUES
  ('menu_home', '首页', '060', 1, 'seed', NOW(), 'normal'),
  ('menu_system', '系统管理', '060', 2, 'seed', NOW(), 'normal');

INSERT INTO cst.SYS_C_APP_MNLT (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
VALUES
  ('mnlt_home', 'menu_home', 'admin_group', 'home', '首页', NULL, 1, 'Y', 'seed', NOW()),
  ('mnlt_system_menu', 'menu_system', 'admin_group', 'system_menu', '菜单', NULL, 1, 'Y', 'seed', NOW()),
  ('mnlt_system_parameter', 'menu_system', 'admin_group', 'system_parameter', '参数设置', NULL, 2, 'Y', 'seed', NOW()),
  ('mnlt_system_consts', 'menu_system', 'admin_group', 'system_consts', 'Consts设定', NULL, 3, 'Y', 'seed', NOW());

INSERT INTO cst.SYS_C_SET_PARM (PARAM_TYPE, PARAM_NAME, PARAM_ID, PARAM_VALUE, SEQ, LM_USER, LM_TIME)
VALUES ('system', '演示参数', 'demo_flag', 'Y', 1, 'seed', NOW());

INSERT INTO cst.SYS_C_APP_CONSTS (CONST_TYPE, CONST_NAME, CONST_VALUE, DATA_TYPE, CONST_DESCRIPTION, SEQ, LM_USER, LM_TIME)
VALUES ('system', 'demo_limit', '10', 'int', '演示常量', 1, 'seed', NOW());

USE ibs;

DELETE FROM ibs.T5_EMP WHERE EMP_ID='admin';
DELETE FROM ibs.T5_ORG WHERE ORG_ID='1000' AND ORG_TYPE_ID='EO';
DELETE FROM ibs.T99_MIDDLE_INCOME_SWITCH WHERE MEASURE_DT='2026-03-31';

INSERT INTO ibs.T5_ORG (ORG_ID, ORG_TYPE_ID, ORG_IP_ID, ORG_NM, ORG_LEVEL_ID, BRANCH_ORG_ID, BRANCH_ORG_NM, HEAD_ORG_ID, HEAD_ORG_NM)
VALUES ('1000', 'EO', 1000, '演示机构', '01', '1000', '演示机构', '9990', '演示总行');

INSERT INTO ibs.T5_EMP (EMP_ID, EMP_TYPE_ID, EMP_NM, GENDER, BIRTHDAY, ORG_ID, ORG_NM, BRANCH_ORG_ID, BRANCH_ORG_NM, POSITION_ID, POSITION_NM, MOBILE, PSTN_TYPE, PSTN_TYPE_NM, SUB_PSTN_TYPE, SUB_PSTN_TYPE_NM, HR_ORG_NAME)
VALUES ('admin', '01', '管理员', 'M', '1990-01-01', '1000', '演示机构', '1000', '演示机构', 1, '管理员', '13800000000', '0001', '管理员', '0001', '管理员', '信息科技部');

INSERT INTO ibs.T99_MIDDLE_INCOME_SWITCH (MEASURE_DT, SWITCH_F, REMARK)
VALUES ('2026-03-31', '1', 'seed');
```

- [ ] **Step 3: Sanity-check that the seed covers the chosen validation pages**

Run:

```bash
rg -n "home|system_menu|system_parameter|system_consts|admin_group|admin_priv" docker/mysql/init/02-seed.sql
```

Expected: all target page IDs and the admin auth records appear in the seed file.

- [ ] **Step 4: Commit the seed data**

```bash
git add docker/mysql/init/02-seed.sql
git commit -m "feat: seed legacy mysql auth and system data"
```

---

### Task 4: Repoint the App to MySQL and Patch Startup-Critical SQL

**Files:**
- Modify: `legacy/src/reportconfig/wabacus.cfg.xml`
- Modify: `legacy/src/com/customer/security/Login.java`
- Modify: `legacy/src/com/customer/security/GlobalInterceptor.java`
- Test: config grep and compile-oriented grep checks

- [ ] **Step 1: Confirm the datasource config is still DB2-based**

Run:

```bash
rg -n "jdbc:db2|DB2Driver|database.type.DB2" legacy/src/reportconfig/wabacus.cfg.xml
```

Expected: the file still contains DB2 driver, URL, and dbtype references.

- [ ] **Step 2: Replace the active datasource block in `wabacus.cfg.xml` with MySQL-backed settings while keeping the datasource name `ds_db2`**

```xml
<datasources default="ds_db2">
  <datasource
      name="ds_db2"
      type="com.customer.util.DruidDataSourceUtil"
      dbtype="com.wabacus.config.database.type.MySql">
    <property name="driver">com.mysql.jdbc.Driver</property>
    <property name="url"><![CDATA[jdbc:mysql://mysql:3306/cst?useUnicode=true&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai]]></property>
    <property name="user">wabacus</property>
    <property name="password">wabacus</property>
    <property name="initialSize">2</property>
    <property name="minIdle">2</property>
    <property name="maxActive">20</property>
    <property name="maxWait">60000</property>
    <property name="validationQuery">select 1</property>
    <property name="testWhileIdle">true</property>
    <property name="testOnBorrow">false</property>
    <property name="testOnReturn">false</property>
    <property name="poolPreparedStatements">false</property>
  </datasource>
</datasources>
```

- [ ] **Step 3: Make `Login.java` tolerate MySQL-backed seed data without null-pointer failures from left joins**

```java
String sql =
    "SELECT a.user_id, a.user_name, a.org_id AS usr_org_id, " +
    "COALESCE(b.org_nm, a.org_id, '') AS usr_org_nm, " +
    "a.is_enable, a.password, " +
    "COALESCE(b.org_id, a.org_id, '') AS org_id, " +
    "COALESCE(b.branch_org_id, a.org_id, '') AS branch_org_id, " +
    "COALESCE(b.BRANCH_ORG_NM, b.org_nm, '') AS BRANCH_ORG_NM, " +
    "COALESCE(og.HEAD_ORG_ID, a.org_id, '') AS HEAD_ORG_ID, " +
    "COALESCE(og.ORG_LEVEL_ID, '01') AS ORG_LEVEL_ID " +
    "FROM cst.sys_c_sec_user a " +
    "LEFT JOIN ibs.t5_emp b ON a.user_id=b.emp_id " +
    "LEFT JOIN ibs.T5_ORG og ON og.ORG_ID=a.org_id AND og.ORG_TYPE_ID='EO' " +
    "WHERE user_id=?";

private String safeTrim(String value) {
  return value == null ? "" : value.trim();
}

String user_name = safeTrim(rs.getString("user_name"));
String usr_org_nm = safeTrim(rs.getString("usr_org_nm"));
String usr_org_id = safeTrim(rs.getString("usr_org_id"));
String org_id = safeTrim(rs.getString("org_id"));
String branch_id = safeTrim(rs.getString("branch_org_id"));
String branch_idNm = safeTrim(rs.getString("BRANCH_ORG_NM"));
String head_id = safeTrim(rs.getString("HEAD_ORG_ID"));
String org_lev_id = safeTrim(rs.getString("ORG_LEVEL_ID"));
```

- [ ] **Step 4: Rewrite `GlobalInterceptor.createMenu()` to remove the `ROW_NUMBER() OVER(...)` dependency that MySQL 5.7 cannot execute**

```java
String sql =
    "SELECT C.MENU_ID, C.MENU_TYPE, C.MENU_NAME, C.SEQ AS MENU_SEQ, " +
    "B.PAGE_ID, B.PAGE_NAME, B.URL_PARAM, B.SEQ AS MT_SEQ " +
    "FROM CST.SYS_C_SEC_USER A " +
    "LEFT JOIN CST.SYS_C_SEC_USER_GROUP A1 ON A.USER_ID=A1.USER_ID " +
    "LEFT JOIN CST.SYS_C_SEC_GROP A2 ON A1.GROUP_ID=A2.GROUP_ID " +
    "LEFT JOIN CST.SYS_C_APP_MNLT B ON A2.GROUP_ID=B.GROUP_ID " +
    "LEFT JOIN CST.SYS_C_APP_MENU C ON B.MENU_ID=C.MENU_ID " +
    "WHERE A.USER_ID=? AND A.IS_ENABLE='Y' AND C.MENU_TYPE='normal' " +
    "AND B.IS_SHOW='Y' AND C.SERVICE_ID='060' AND A2.SERVICE_ID='060' " +
    "UNION ALL " +
    "SELECT 'FAVOR' AS MENU_ID, 'normal' AS MENU_TYPE, '我的收藏' AS MENU_NAME, 999999 AS MENU_SEQ, " +
    "MT.PAGE_ID, MT.PAGE_NAME, MT.URL_PARAM, MT.SEQ AS MT_SEQ " +
    "FROM CST.SYS_C_APP_MNLT MT " +
    "LEFT JOIN CST.SYS_C_SEC_GROP A ON MT.GROUP_ID=A.GROUP_ID " +
    "LEFT JOIN CST.SYS_C_SEC_USER_GROUP A1 ON MT.GROUP_ID=A1.GROUP_ID " +
    "LEFT JOIN CST.SYS_C_SEC_USER U ON U.USER_ID=A1.USER_ID AND U.IS_ENABLE='Y' " +
    "RIGHT JOIN CST.SYS_C_PER_FVOR F ON MT.PAGE_ID=F.PAGE_ID AND F.USER_ID=U.USER_ID " +
    "WHERE U.USER_ID=? AND MT.IS_SHOW='Y' AND A.SERVICE_ID='060' " +
    "ORDER BY MENU_SEQ, MT_SEQ, PAGE_ID";

String currentMenuId = null;
int menuRowIndex = 0;
int rowIndex = 0;

while (rs.next()) {
  String menuId = rs.getString("MENU_ID");
  String menuType = rs.getString("MENU_TYPE");
  boolean newMenu = currentMenuId == null || !currentMenuId.equals(menuId);

  rowIndex++;
  if (newMenu) {
    menuRowIndex = 1;
  } else {
    menuRowIndex++;
  }

  if ("url".equals(menuType)) {
    sb.append("normal".equals(temp_menu_type) ? "</ul></div></div></li>\\n" : "");
    sb.append("<li class='nav-item no-subnav' id='nav-item_" + menuId + "'><a href='" + rs.getString("PAGE_ID").substring(4) + "'><span class='primary-link'>" + rs.getString("MENU_NAME") + "</span></a></li>\\n");
  } else if (menuRowIndex == 1 && rowIndex == 1) {
    sb.append("<li class='nav-item' id='nav-item_" + menuId + "'><a href='javascript:void(0)'><span class='primary-link'>" + rs.getString("MENU_NAME") + "</span></a>\\n");
    sb.append("<div class='subnav' id='subnav_" + menuId + "'><div class='subnav-inner'><ul class='one'>\\n");
    sb.append("<li class='nav-item-li'><a href='ShowReport.wx?PAGEID=" + rs.getString("PAGE_ID") + (rs.getString("URL_PARAM") == null ? "" : rs.getString("URL_PARAM")) + "'>" + rs.getString("PAGE_NAME") + "</a></li>\\n");
  } else if (menuRowIndex == 1) {
    sb.append("url".equals(temp_menu_type) ? "" : "</ul></div></div></li>\\n");
    sb.append("<li class='nav-item' id='nav-item_" + menuId + "'><a href='javascript:void(0)'><span class='primary-link'>" + rs.getString("MENU_NAME") + "</span></a>\\n");
    sb.append("<div class='subnav' id='subnav_" + menuId + "'><div class='subnav-inner'><ul class='one'>\\n");
    sb.append("<li class='nav-item-li'><a href='ShowReport.wx?PAGEID=" + rs.getString("PAGE_ID") + (rs.getString("URL_PARAM") == null ? "" : rs.getString("URL_PARAM")) + "'>" + rs.getString("PAGE_NAME") + "</a></li>\\n");
  } else {
    sb.append("<li class='nav-item-li'><a href='ShowReport.wx?PAGEID=" + rs.getString("PAGE_ID") + (rs.getString("URL_PARAM") == null ? "" : rs.getString("URL_PARAM")) + "'>" + rs.getString("PAGE_NAME") + "</a></li>\\n");
  }

  currentMenuId = menuId;
  temp_menu_type = menuType;
}
```

- [ ] **Step 5: Verify the DB2 config strings are gone from the active datasource**

Run:

```bash
rg -n "jdbc:db2|DB2Driver|database.type.DB2" legacy/src/reportconfig/wabacus.cfg.xml
```

Expected: no matches in the active datasource block.

- [ ] **Step 6: Verify the MySQL 5.7 window-function blocker is removed from `GlobalInterceptor.java`**

Run:

```bash
rg -n "ROW_NUMBER\\(\\) OVER" legacy/src/com/customer/security/GlobalInterceptor.java
```

Expected: no matches.

- [ ] **Step 7: Commit the MySQL compatibility edits**

```bash
git add legacy/src/reportconfig/wabacus.cfg.xml legacy/src/com/customer/security/Login.java legacy/src/com/customer/security/GlobalInterceptor.java
git commit -m "feat: switch legacy runtime to mysql"
```

---

### Task 5: Add Smoke Verification and Runbook

**Files:**
- Create: `scripts/smoke-check.sh`
- Create: `docs/legacy-docker-runbook.md`
- Test: executable smoke script and documented URLs

- [ ] **Step 1: Add a simple smoke-check script**

```sh
#!/bin/sh
set -eu

base_url="${1:-http://127.0.0.1:18080/LBIBS}"

curl -fsS "${base_url}/jsp/login/login.html" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=home" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=system_menu" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=system_parameter" >/dev/null

echo "smoke check passed for ${base_url}"
```

- [ ] **Step 2: Add the runbook documenting dependency placement, startup, and validation**

~~~md
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
~~~

- [ ] **Step 3: Make the smoke-check script executable and validate its syntax**

Run:

```bash
chmod +x scripts/smoke-check.sh
sh -n scripts/smoke-check.sh
```

Expected: no shell syntax errors.

- [ ] **Step 4: Commit the verification assets**

```bash
git add scripts/smoke-check.sh docs/legacy-docker-runbook.md
git commit -m "docs: add legacy docker verification runbook"
```

---

### Task 6: End-to-End Bring-Up and Evidence Capture

**Files:**
- Modify if needed: `docker/mysql/init/01-schema.sql`
- Modify if needed: `docker/mysql/init/02-seed.sql`
- Modify if needed: `docker/app/lib/README.md`
- Test: `docker compose up --build`, app logs, smoke script

- [ ] **Step 1: Build the current schema file before first bring-up**

Run:

```bash
python3 scripts/convert_db2_schema_to_mysql.py
```

Expected: `docker/mysql/init/01-schema.sql` regenerates successfully.

- [ ] **Step 2: Start the full stack**

Run:

```bash
docker compose up --build
```

Expected: `mysql` becomes healthy, then `app` starts Tomcat and begins compiling/deploying the webapp.

- [ ] **Step 3: Fix the first concrete failure class only**

Run one of these based on the observed failure:

```bash
docker compose logs mysql
```

Expected: use this when DDL fails; patch only the exact invalid statements in `docker/mysql/init/01-schema.sql` or the converter script.

```bash
docker compose logs app
```

Expected: use this when compilation or classpath fails; add only the exact missing jars to `docker/app/lib/`.

- [ ] **Step 4: Run the smoke check once the app is serving HTTP**

Run:

```bash
sh scripts/smoke-check.sh
```

Expected: `smoke check passed for http://127.0.0.1:18080/LBIBS`

- [ ] **Step 5: Capture the known-good state in docs**

Update `docs/legacy-docker-runbook.md` with:

~~~md
## Verified on first successful bring-up

- `docker compose up --build`
- login page HTTP 200
- `PAGEID=home`
- `PAGEID=system_menu`
- `PAGEID=system_parameter`

## Remaining gaps after phase 1

- Business pages outside the seeded auth/menu path are not yet certified
- DB2-specific SQL still exists outside the initial validation targets
- Full runtime dependency inventory is still driven by actual compile/runtime errors
~~~

- [ ] **Step 6: Commit the working bring-up state**

```bash
git add docker/mysql/init/01-schema.sql docker/mysql/init/02-seed.sql docker/app/lib/README.md docs/legacy-docker-runbook.md
git commit -m "feat: bring up legacy wabacus in docker"
```

---

## Self-Review Checklist

- Spec coverage:
  - Docker topology is covered in Tasks 1 and 6.
  - MySQL schema initialization is covered in Tasks 2 and 6.
  - Datasource migration is covered in Task 4.
  - First validated pages are seeded and checked in Tasks 3, 5, and 6.
  - Documentation output is covered in Task 5 and Task 6.

- Placeholder scan:
  - No `TODO`, `TBD`, or unnamed files remain in the task list.
  - Every file path is concrete.
  - Every verification command is concrete.

- Type consistency:
  - The datasource name remains `ds_db2` across config and page SQL references.
  - The validated page IDs are consistently `home`, `system_menu`, `system_parameter`, and `system_consts`.
  - The seeded auth objects consistently use `admin_group` and `admin_priv`.
