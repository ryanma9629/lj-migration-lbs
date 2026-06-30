# Legacy Runtime Jars

This directory now vendors the runtime jars needed so the legacy app can compile and boot inside Docker.

Current contents intentionally include:

- `wabacus-4.1.jar`
- Supporting Wabacus transitive jars copied from `hilltop`
- `mysql-connector-java-5.1.49.jar` as the MySQL 5.7-compatible JDBC driver

The Docker entrypoint copies every `.jar` and `.zip` file from this directory into `WEB-INF/lib` before compilation.

## Compatibility Notes

- The Docker bring-up is currently tuned for a core validation subset: `home`, `system_menu`, `system_parameter`, and `system_consts`.
- `DruidDataSourceUtil` has been replaced with a lightweight JDBC-backed implementation, so no Druid jar is required.
- `com.lenovo.ebank.pub.SopIntf` is satisfied by a local stub class for non-core legacy flows.
- `CustomerSelect` and `CustomerUpdate` are excluded from the Docker compile list because the available `wabacus-4.1.jar` does not expose the legacy extension APIs they require.
