# Claim Gold Demo Mock Design

**Objective**

Build a runnable `claim_gold` demo chain for the legacy app using mock data, with two business accounts and the existing `admin` account retained for system access. The target is a clickable sample flow, not a faithful recovery of original production behavior.

**Demo Goal**

The demo must support this end-to-end path:

1. `claimer_gold` logs in.
2. `claimer_gold` opens `claim_gold`.
3. `claimer_gold` queries a pending record, opens detail, saves, and submits.
4. `verifier_gold` logs in.
5. `verifier_gold` opens `claim_gold_verify`.
6. `verifier_gold` sees the submitted record and can approve or reject it.

**Non-Goals**

- Do not restore the original full role model.
- Do not restore all business menus.
- Do not redesign page text, page structure, or business flow.
- Do not expand this effort to other claim modules in the same pass.

## Scope

This work is restricted to the original `claim_gold` and `claim_gold_verify` pages already present in source. The preferred approach is to satisfy existing runtime queries through seed/mock data, not through new demo pages or broad code rewrites.

The existing `admin` account remains available for system management and debugging. Two additional demo accounts will be added:

- `claimer_gold`
- `verifier_gold`

## Mock Data Layers

### 1. Security, Menu, and Page Access

Purpose: make the two demo accounts see the required pages with minimal extra navigation.

Expected table set:

- `CST.SYS_C_SEC_USER`
- `CST.SYS_C_SEC_GROP`
- `CST.SYS_C_SEC_USER_GROUP`
- `CST.SYS_C_APP_MENU`
- `CST.SYS_C_APP_MNLT`
- `CST.SYS_C_SEC_GPPV`
- `CST.SYS_C_SEC_PRIV`
- `CST.SYS_C_SEC_PVLT`

Target behavior:

- `claimer_gold` sees `claim_gold`
- `verifier_gold` sees `claim_gold_verify`
- `admin` keeps current system-management access

### 2. Employee and Organization Master Data

Purpose: satisfy login/session context and page filtering logic.

Expected table set:

- `IBS.T5_ORG`
- `IBS.T5_EMP`

Minimum data model:

- one branch org
- one branch-level reviewer scope via parent org data
- if required by existing queries, one head-office org
- one employee row for `claimer_gold`
- one employee row for `verifier_gold`

### 3. Approval Mapping

Purpose: allow submitted records to appear in the verify page under the reviewer account.

Expected table set:

- `IBS.T9_SP_GROUPID`

Minimum rule:

- one mock mapping that lets `verifier_gold` act on the demo branch/org scope for the business type used by `claim_gold`

### 4. Status and Business Dictionaries

Purpose: keep labels and flow state readable and consistent with page SQL.

Expected table set:

- `IBS.T9_CLAIM_STATUS_TYPE`
- `IBS.T9_BIZ_TYPE` if the page path requires it during submit/verify

### 5. Claim Gold Business Data

Purpose: provide records for list, detail, submit, and verify actions.

Expected table set:

- `IBS.GOLD_EMP_RELA`

Minimum sample data:

- one pending claim row for `claimer_gold`
- one submitted row for `verifier_gold` to review directly
- one spare row to keep the demo usable across repeated tests

## Implementation Approaches

### Option 1. Pure Seed/Mock Data

Only add SQL seed scripts and rely on existing Java/XML behavior.

Pros:

- lowest source-code drift
- closest to the original page behavior
- easiest to replace later with better data

Cons:

- may still expose hidden dependencies on other master tables

### Option 2. Seed Data Plus Minimal Filter Relaxation

Seed data first, then make the smallest necessary SQL/interceptor changes only if existing filters are too strict for the demo.

Pros:

- still mostly preserves original pages
- more practical if one or two hard filters block the chain

Cons:

- starts to diverge from original runtime logic

### Option 3. New Demo-Specific Pages

Create dedicated demo pages and simplify logic for them.

Pros:

- fastest path to a stable demo

Cons:

- no longer demonstrates the original pages
- highest long-term cleanup cost

## Recommended Approach

Use **Option 1** as the default. Fall back to **Option 2** only when verification proves that the demo cannot be made to work with seed data alone.

Do not use Option 3 unless the project goal changes from "run original pages with mock data" to "build a separate demo".

## Execution Plan Boundary

Implementation should proceed in this order:

1. add seed data for users, groups, menu bindings, privileges, and page visibility
2. add seed data for org and employee context
3. add one minimal approval mapping for the mock reviewer
4. add dictionary rows required by `claim_gold`
5. add `GOLD_EMP_RELA` demo rows
6. verify submit path with `claimer_gold`
7. verify approve and reject paths with `verifier_gold`
8. only if blocked, apply the smallest code-level filter relaxation and document it explicitly

## Verification Criteria

The design is considered successfully implemented only if all of the following are true:

- `claimer_gold` can log in and reach `claim_gold`
- `claim_gold` list returns at least one demo row
- detail form opens for the selected row
- save and submit complete without runtime error
- `verifier_gold` can log in and reach `claim_gold_verify`
- verify page returns the submitted row
- single-row approve succeeds
- single-row reject popup succeeds
- any temporary fallback logic is documented separately from mock data scripts

## Guardrails

- Keep the work isolated to `claim_gold`.
- Prefer new SQL init/seed scripts over source edits.
- If additional missing tables appear, record them before deciding whether they are demo-critical.
- Keep mock identities and mock rules clearly named so they can be removed or replaced later.
- Do not present mock role/group design as a recovered original model.
