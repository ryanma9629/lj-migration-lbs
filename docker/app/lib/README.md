# Legacy Runtime Jars

Place third-party runtime jars required by the legacy app in this directory before building the `app` image.

Minimum expected contents:

- Wabacus runtime jars required by `com.wabacus.WabacusServlet`
- MySQL JDBC driver compatible with Java 8, for example `mysql-connector-java-5.1.49.jar`
- Druid connection pool jar used by `com.customer.util.DruidDataSourceUtil`
- Any transitive jars needed for the Wabacus runtime and current source compilation

The Docker entrypoint copies every `.jar` and `.zip` file from this directory into `WEB-INF/lib` before compilation.

## Observed blocker on 2026-06-27

`docker compose up --build` advanced past MySQL startup and then the app container failed to compile because this directory contained no runtime jars. At the time of the failure, the only file under `docker/app/lib/` was this `README.md`.

The first unresolved packages/classes reported by the compiler were:

- Wabacus runtime packages:
  - `com.wabacus.config.Config`
  - `com.wabacus.config.component.IComponentConfigBean`
  - `com.wabacus.config.component.application.report.ColBean`
  - `com.wabacus.config.component.application.report.ReportBean`
  - `com.wabacus.config.component.application.report.ReportDataSetValueBean`
  - `com.wabacus.system.CacheDataBean`
  - `com.wabacus.system.ReportRequest`
  - `com.wabacus.system.assistant.WabacusAssistant`
  - `com.wabacus.system.component.application.report.abstractreport.AbsReportType`
  - `com.wabacus.system.component.application.report.configbean.editablereport.AbsJavaEditActionBean`
  - `com.wabacus.system.dataset.IReportDataSet`
  - `com.wabacus.system.intercept.AbsInterceptorDefaultAdapter`
  - `com.wabacus.system.serveraction.IServerAction`
- Additional third-party class:
  - `com.lenovo.ebank.pub.SopIntf`

Before the app can compile inside Docker, the jar set copied into this directory must provide those packages/classes, plus the JDBC and pool jars already listed above.
