# Module Spec: my_claimed

## Module Goal

`Confirmed`

`my_claimed` is a personal claim-and-adjustment query workspace.
It lets the current user review their own claimed records, their own adjustment history, and at least some business-line specific claim subsets from one consolidated entry point.

Its related detail pages include:

- `my_claim_info`
- `remark_info`

## Business Position in Workflow

`Confirmed`

This module is not a claim-entry page and not an approval page.
It is a user-facing query and history console for already created claim and adjustment records.

## Role Model

### Current User

`Confirmed`

The page uses current session user id to scope its main query results.

This role can:

- view their claimed records
- view their adjustment records
- open detail pages

## Entry Pages

`Confirmed`

- consolidated page:
  - `my_claimed`
- detail page:
  - `my_claim_info`
- auxiliary note/detail page:
  - `remark_info`

## Page Structure

`Confirmed`

`my_claimed` is a tabbed page.

Observed restored tabs / panels include:

- `我的存贷款认领`
- `我的调整`
- `我的贵金属认领`
- `我的第三方存管认领`
- `我的基金认领`
- `我的代发工资认领`
- `我的保险销售认领`

`Inferred`

This page acts as a cross-business-line personal workbench, aggregating claim results from multiple modules into a user-centered view.

## Main Claim Query Behavior

### Personal Claims Tab

`Confirmed`

The main claim tab reads from:

- `IBS.T1_VUCH_EMP_RELA`

with joins to:

- `IBS.T9_BIZ_TYPE`
- `IBS.T5_EMP`
- `IBS.T9_CLAIM_STATUS_TYPE`

It filters by:

- current session user id as `EMP_ID`
- non-empty ratio
- non-adjustment rows where `RVS_STATUS_ID` is empty
- exclusion of marketing bucket `2016qq`

It shows:

- voucher number
- claim status
- business type
- customer name
- organization
- ratio
- claim date
- verify user / verify date
- detail link

### Detail Link

`Confirmed`

The page generates a `查询详情` link to:

- `my_claim_info&VUCH_NBR=...&EMP_ID=...`

## Adjustment Query Behavior

### Personal Adjustment Tab

`Confirmed`

The adjustment tab reads from:

- `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG`

joined with:

- `IBS.T1_VUCH_DETAIL`
- `IBS.T5_EMP`
- `IBS.T9_BIZ_TYPE`
- `IBS.T9_RVS_STATUS_TYPE`

It shows:

- voucher number
- adjustment status
- business type
- customer name
- original ratio
- adjustment ratio
- adjustment dates
- verifier names
- adjustment remark

`Confirmed`

This means `my_claimed` is also the personal view of the adjustment workflow, not only of normal claims.

## Business-Line Aggregation

`Confirmed`

The page contains dedicated panels for several business lines instead of a single mixed list.

Observed examples:

- gold
- third-party custody
- fund
- payroll
- insurance

`Inferred`

The original product likely used this page as a personal dashboard for post-submission follow-up across business lines.

## Restored Runtime State

`Confirmed`

The main page now opens after login.

Observed restored state:

- the main page shell renders normally
- the "我的存贷款认领" tab shows usable rows
- "我的调整" also shows restored demo data after detail-shape fixes
- `my_claim_info` and `remark_info` return normal HTML

Validated examples mentioned in the restoration record include:

- `DEPDEMO0001`
- `DEPFHDEMO0001`
- `EXSDEMO0001`
- adjustment row for `LNDEMO0001`

## Known Data Gaps

`Confirmed`

Some rows still display `无数据` because the current demo seed is incomplete rather than because the page shell is broken.

Examples from restoration notes:

- some detail pages for `EXSDEMO0001` need matching voucher-detail data shape

`Confirmed`

An earlier root cause for missing adjustment data was:

- matching change-log row existed
- but the linked demo voucher detail row had lost business-type data required by an inner join

This confirms that `my_claimed` depends strongly on full cross-table business detail shape, not only on claim rows.

## Scope Rules

### Personal Scope

`Confirmed`

The main claim query is explicitly filtered by:

- current session user id

This is a strict personal workspace, not a managerial team view.

### Status Scope

`Confirmed`

The page is intended for already-created claim history and adjustment history.
It is not restricted only to final-approved rows; it displays workflow state names and dates.

## New-System Design Implications

`Confirmed`

A new system should preserve a personal query workspace that combines:

- personal claim history
- personal adjustment history
- cross-business-line detail access

The new system should preserve:

- current-user scoping
- business-line segmentation or filtering
- drill-down into claim details
- adjustment history visibility

`Inferred`

The new system may choose a cleaner UX than many tab panels, but it should keep the underlying product capability:

- one user-centric place to inspect the user's own attribution records across modules

## Known Gaps

### Incomplete Demo Detail Shapes

`Confirmed`

Some records still need more complete supporting voucher-detail data to behave consistently across all detail views.

### Exact Panel Coverage

`Open`

The full original intended behavior of every business-line tab is not yet equally verified end to end.

## Source Basis

`Confirmed`

This spec is based on:

- `legacy/src/reportconfig/report/my_claimed.xml`
- `legacy/docs/legacy-docker-runbook.md`
- `legacy/docs/compatibility-backlog.md`
