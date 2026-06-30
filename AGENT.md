# First Principle

When restoring the legacy application, the primary goal is faithful reproduction of the original system, not refactoring or enhancement.

- If a module is blocked by missing tables or schema drift between the current MySQL database and the source code, do not reverse-engineer or invent the missing schema.
- In that case, stop modifying that module, record the gap in a dedicated markdown file, and wait for the original schema/DDL to be recovered from the old environment.
- Prioritize restoring major functional modules and end-to-end usable paths first.
- Do not get stuck on minor compatibility issues that do not block module recovery; record them in a dedicated markdown todo/backlog and defer them until after larger module restoration.
- For frontend/debugging work, use the cheapest and most stable tool that can answer the question:
  first `curl` for reachability, redirects, returned HTML, session/login state, and server-rendered output;
  then browser automation only when real page interaction, JS behavior, dialogs, or DOM state changes must be verified;
  use Chrome or Computer Use only when a real visible browser environment or existing browser state is required.
- Do not use browser tools by default just because the issue appears on a page; for this legacy JSP/Wabacus system, first assume blank pages or broken flows come from backend config, permissions, session, SQL, datasource differences, or missing data.
- Treat the current restoration target as the original application running again.
- Preserve original names, page layout, visual effects, and displayed text as much as possible.
- Do not proactively rename, translate, redesign, beautify, modernize, or re-implement the application.
- Assume differences are caused first by the datasource change from DB2 to MySQL, then by missing seed/business data.
- Focus changes on runtime environment setup, datasource adaptation, and minimum compatibility handling required to let original paths run.
- Do not add new business logic just to connect flows that may already have been broken in the original system.
- If any behavior, text, UI, or logic must differ from the original system, call it out explicitly before or when making that change.
