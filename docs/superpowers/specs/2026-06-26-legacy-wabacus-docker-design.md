# Legacy Wabacus Docker Design

## Background

The `legacy` directory contains an older JSP/Servlet + Wabacus application. The immediate goal is not full modernization. The goal is to make the application run inside Docker with MySQL replacing the original DB2 data source, and to get a small number of core pages working end to end.

The current repository state shows several constraints:

- `legacy/WebContent/WEB-INF/web.xml` defines a classic Servlet 2.4 style webapp with `com.wabacus.WabacusServlet`.
- `legacy/src/reportconfig/wabacus.cfg.xml` still points at a remote DB2 database and declares the default datasource as DB2.
- `legacy/src/com/customer/util/DruidDataSourceUtil.java` already provides a configurable datasource implementation suitable for MySQL.
- The repository does not currently include an obvious build file such as `pom.xml`, `build.gradle`, or `build.xml`.
- `legacy/WebContent/WEB-INF/lib` is not a complete runtime dependency set, so startup will require supplying missing jars.
- The original DB2 table DDL is stored in `data/table_structures_utf8_db2.sql`.
- Existing report XML and Java code contain DB2-specific SQL syntax such as `with ur` and `fetch first 1 row only`.

## Goal

Create a Docker-based runtime environment for the legacy application using MySQL in place of DB2, and validate the setup by running the app plus 1 to 3 system-oriented pages that successfully read from the database.

## Non-Goals

- Full migration of all business pages in the first phase
- Refactoring the application into a modern framework
- Eliminating every DB2 compatibility issue up front
- Building a perfect production deployment pipeline before basic runtime validation exists

## Recommended Approach

Use a staged "containerization + minimal compatibility layer" approach:

1. Build a stable Docker runtime around `mysql` and `tomcat`.
2. Convert and load the provided DDL into MySQL.
3. Switch the application datasource from DB2 to MySQL using the existing custom datasource path where practical.
4. Fix only the compatibility issues required to boot the application and run the first validated pages.
5. Document the remaining gaps so later phases can expand coverage page by page.

This approach deliberately avoids large-scale automated SQL rewriting before the app can even boot. It prioritizes feedback from real runtime errors.

## Architecture

### 1. MySQL Container

Responsibilities:

- Run a MySQL version with good compatibility for older Java applications
- Initialize a dedicated database for the app
- Execute a MySQL-adjusted form of `data/table_structures_utf8_db2.sql`
- Optionally load minimal seed data required for system page validation

Version choice:

- Prefer `MySQL 5.7` for the first phase

Rationale:

- Older JDBC integrations and legacy SQL often behave more predictably against MySQL 5.7 than against MySQL 8
- This reduces the initial surface area of authentication, collation, and SQL mode differences

### 2. Application Container

Responsibilities:

- Run the legacy web application under Tomcat
- Package or mount the application web root and classes
- Provide all required third-party jars, including Wabacus runtime jars and MySQL JDBC driver
- Expose an HTTP port for manual validation

Assumed base runtime:

- Tomcat 8.5 or another compatible Tomcat version that can still run older JSP/Servlet applications without introducing unnecessary migration work
- A JDK version compatible with the available Wabacus runtime jars, likely Java 8 as the first attempt

### 3. MySQL Compatibility Layer

Responsibilities:

- Replace the default DB2 datasource configuration with a MySQL datasource
- Resolve only the SQL incompatibilities that block startup or the first validated pages

Expected first-wave compatibility edits:

- Remove `with ur`
- Replace `fetch first 1 row only` with `limit 1`
- Change datasource `dbtype` and JDBC driver configuration
- Adjust DB2-specific schema/table references where needed
- Fix string concatenation, date functions, and pagination syntax if these appear in the validated pages

Scope boundary:

- No broad search-and-replace across every report unless runtime evidence shows it is necessary
- Prioritize system pages and shared login/navigation paths first

### 4. Validation and Expansion Loop

Responsibilities:

- Prove the environment works beyond basic HTTP startup
- Select 1 to 3 system-oriented pages as the first acceptance targets
- Expand by tracing each runtime error back to its specific XML, SQL, or Java source

Default first-page strategy:

- If no user-prioritized page list exists, start with low-dependency system pages such as account, menu, or parameter pages

## Planned Deliverables

### Docker and Infra Files

- `docker-compose.yml`
- `docker/mysql/` for initialization SQL and related assets
- `docker/app/` for application image definition and startup logic

Possible file set:

- `docker-compose.yml`
- `docker/mysql/init/01-schema.sql`
- `docker/mysql/init/02-seed.sql` if needed
- `docker/app/Dockerfile`
- `docker/app/entrypoint.sh` or another small bootstrap script if deployment assembly needs one

### Application Configuration and Compatibility Changes

Primary target files:

- `legacy/src/reportconfig/wabacus.cfg.xml`
- Specific report XML files under `legacy/src/reportconfig/report/`
- Specific Java classes under `legacy/src/com/...` only where datasource or SQL behavior cannot be solved in config alone

Expected config changes:

- Switch default datasource away from DB2
- Point the datasource at MySQL
- Use `com.customer.util.DruidDataSourceUtil` if that proves to be the most direct path
- Supply MySQL driver, URL, username, password, and validation query

### Documentation

- A runtime guide explaining setup, startup, access URL, validated pages, and known limitations

## Acceptance Criteria

Phase 1 is considered successful when all of the following are true:

1. `docker compose up` starts both the database and application containers reliably.
2. MySQL successfully initializes the application schema from the converted DDL.
3. The app serves at least the login page or home entry point without a startup failure such as 404 or 500 caused by missing runtime pieces.
4. At least 1 to 3 system-oriented pages successfully execute against MySQL and return usable results.
5. Documentation clearly lists what was validated and what known compatibility gaps remain.

## Risks and Mitigations

### Missing Runtime Dependencies

Risk:

- The repository does not currently contain a complete dependency set.

Mitigation:

- Inventory startup failures quickly
- Add the minimum required jars to the application image or repo-managed dependency location
- Document each added runtime dependency and why it is needed

### DB2 to MySQL SQL Differences

Risk:

- Existing XML and Java contain DB2-specific SQL syntax and behavior.

Mitigation:

- Start with the smallest validated page set
- Fix shared patterns first only after they are confirmed by runtime errors
- Keep a growing compatibility checklist as errors appear

### Insufficient Seed Data

Risk:

- Successful table creation may still leave system pages unusable if required baseline rows are missing.

Mitigation:

- Identify the minimum rows required by the first validated system pages
- Add a targeted seed script only for those needs

### Wabacus Version Uncertainty

Risk:

- Runtime jar versions may not match the expectations of the existing configuration or code.

Mitigation:

- Begin with the smallest viable runtime set
- Prefer versions compatible with the app's current XML and Java signatures
- Capture any version-specific startup errors early during container boot

## Execution Order

1. Inventory missing runtime dependencies and identify the likely Tomcat/JDK/Wabacus baseline.
2. Create Docker directory structure and compose definition.
3. Convert `data/table_structures_utf8_db2.sql` into an executable MySQL initialization script.
4. Switch datasource configuration from DB2 to MySQL.
5. Boot containers and fix startup-level dependency and configuration failures.
6. Validate 1 to 3 system pages and fix the first wave of SQL compatibility issues.
7. Write and refine runtime documentation.

## Testing Strategy

The first phase will rely on environment and integration validation rather than unit testing:

- Container startup checks
- Database initialization checks
- HTTP access checks
- Manual verification of selected system pages
- Log-driven troubleshooting for datasource, classpath, and SQL failures

Where simple command-based smoke tests are possible, add them to the documentation or container workflow.

## Open Assumptions

These assumptions are now explicit and drive the first implementation plan:

- The user accepts limited source/config changes in Wabacus XML, Java datasource code, and targeted SQL.
- The first phase target is "run core path," not "all pages available."
- No specific must-have page list was provided, so system-oriented pages will be used as the first validation target.
- Downloading or otherwise supplying missing runtime jars is in scope for implementation.

## Definition of Done for This Design

This design is complete when it can guide an implementation plan that covers:

- Docker topology
- Runtime dependency recovery
- MySQL schema initialization
- Datasource migration
- First-wave SQL compatibility fixes
- Validation workflow
- Documentation output
