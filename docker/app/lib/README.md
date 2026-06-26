# Legacy Runtime Jars

Place third-party runtime jars required by the legacy app in this directory before building the `app` image.

Minimum expected contents:

- Wabacus runtime jars required by `com.wabacus.WabacusServlet`
- MySQL JDBC driver compatible with Java 8, for example `mysql-connector-java-5.1.49.jar`
- Druid connection pool jar used by `com.customer.util.DruidDataSourceUtil`
- Any transitive jars needed for the Wabacus runtime and current source compilation

The Docker entrypoint copies every `.jar` and `.zip` file from this directory into `WEB-INF/lib` before compilation.
