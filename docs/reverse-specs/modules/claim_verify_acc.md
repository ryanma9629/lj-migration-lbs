# Module Spec: claim_verify_acc

## Module Goal

`Confirmed`

`claim_verify_acc` is a claim-approval module for first-stage review.
It receives already submitted claim rows, lets an approver review them, and moves them into a later approval state rather than final completion.

Its companion pages are:

- `claim_verify_acc`
- `verify_no_form`
- downstream final-approval companion:
  - `claim_verify_accfs`

## Business Position in Workflow

`Confirmed`

This module does not start a claim.
It sits after claimant submission and before final approval.

Observed lifecycle segment:

- submitted claim
- first-stage approval in `claim_verify_acc`
- final approval in `claim_verify_accfs`

## Role Model

### First-Stage Approver

`Confirmed`

The current restored demo verifies this module with an admin-style user.
This role can:

- open pending review list
- approve a single row
- trigger reject popup
- view already approved rows

### Final Approver

`Confirmed`

This module hands approved rows to:

- `claim_verify_accfs`

`Inferred`

The original system likely separated first-stage and final-stage reviewers by organizational level or approval responsibility rather than only by page access.

## Entry Pages

`Confirmed`

- first-stage approval page:
  - `claim_verify_acc`
- reject popup:
  - `verify_no_form`
- next-stage page:
  - `claim_verify_accfs`

## Business Object

`Confirmed`

The core business record for this module is:

- `IBS.T1_VUCH_EMP_RELA`

Supporting joins used by the page:

- `IBS.T5_EMP`
- `IBS.T5_ORG`
- `IBS.T9_BIZ_TYPE`
- `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG`

Important business fields observed:

- `VUCH_NBR`
- `EMP_ID`
- `EMP_NM`
- `ORG_ID`
- `ORG_NM`
- `RATIO`
- `CLAIM_STATUS_ID`
- `RVS_STATUS_ID`
- `CLAIM_DT`
- `FH_VERIFY_DT`
- `FH_VERIFY_EMP_ID`
- `FH_VERIFY_EMP_NM`
- `REMARK`

## Page Structure

### Pending Tab

`Confirmed`

`claim_verify_acc` has a tab panel whose first tab is:

- `待审批`

The pending list shows:

- business type
- voucher number
- customer name
- voucher organization
- claim date
- claimant identity
- claim ratio
- adjustment ratio
- claimant organization
- detail link
- approval actions

The list only includes rows where either:

- `CLAIM_STATUS_ID='1'`
- or `RVS_STATUS_ID='1'`

### Approved Tab

`Confirmed`

The second tab is:

- `已审批`

`Inferred`

This tab is intended to provide first-stage review history rather than final global completion history.

## Approval Behavior

### Approve

`Confirmed`

Single-row approve updates the claim row as follows:

- `CLAIM_STATUS_ID='21'`
- `FH_VERIFY_DT=current date`
- `FH_VERIFY_EMP_ID=current user`
- `FH_VERIFY_EMP_NM=current user name`
- append first-stage approval audit text into `REMARK`

It also updates related adjustment state if present:

- `RVS_STATUS_ID='21'`
- `RVS_CLAIM_EMP_ID=current user`
- `RVS_CLAIM_DT=current date`

And writes to change-log records:

- `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID='21'`
- first-stage verify metadata fields

### Reject

`Confirmed`

Reject is routed through:

- `verify_no_form`

`Confirmed`

The popup exists in source and runtime.

`Open`

Its full end-to-end restored browser verification is not yet complete.

## State Machine

### Observed State Semantics

`Confirmed`

For this review chain:

- `1`
  - submitted / pending first-stage approval
- `21`
  - first-stage approved / waiting for later-stage approval
- `2`
  - final approved in downstream module

`Inferred`

`21` acts as an intermediate approved state rather than final completion.

### Transition Rules

`Confirmed`

- `1 -> 21`
  - first-stage approve in `claim_verify_acc`
- `21 -> 2`
  - final approve in `claim_verify_accfs`

### Adjustment-Coupled Transitions

`Confirmed`

When an adjustment is also in play, the same first-stage approval operation updates:

- `RVS_STATUS_ID`
- `NEW_CLAIM_STATUS_ID`

This shows that normal claim approval and adjustment approval share related workflow semantics.

## Scope Rules

### Visibility

`Confirmed`

The SQL joins employee org and customer org tables and includes extension placeholders:

- `%sqlinner%`
- `%sqlcon%`

These are likely expanded by the interceptor:

- `com.customer.interceptor.InterceptorVerifyAcc`

`Confirmed`

The page is organization-scoped, not globally open to all submitted rows.

`Open`

The exact first-stage scope logic depends partly on interceptor-generated SQL and is not fully reconstructed from static XML alone.

## Query Capabilities

`Confirmed`

The page supports filtering by:

- voucher number
- customer name
- claimant employee id
- claimant employee name
- business type
- claim date range

## Related Detail Access

`Confirmed`

The pending list exposes:

- `claim_info`

through a generated `查询详情` link.

This indicates first-stage reviewers are expected to inspect claim details before approving.

## Restored Demo Outcome

`Confirmed`

The restored demo shows:

- pending row:
  - `LNDEMO0001 / EMP_ID='admin'`
- first-stage approval works
- result becomes:
  - `CLAIM_STATUS_ID='21'`
  - `FH_VERIFY_DT` populated
  - `FH_VERIFY_EMP_ID='admin'`

## Dependency Notes

`Confirmed`

This module required a minimal `T9_BIZ_TYPE` demo lookup row in the restored environment because the original page uses:

- inner join on business-type dictionary

That means this page depends on business dictionary integrity, not only claim-row presence.

## New-System Design Implications

`Confirmed`

A new implementation should model this module as an explicit approval stage, not as a generic approve button on top of raw claim rows.

The new system should preserve:

- multi-stage approval states
- separation between submitted, first-stage approved, and final approved
- review-time audit stamping
- queryable review queues
- detail inspection before approval

`Inferred`

The new system should likely represent approval as workflow events or approval tasks instead of embedding all stage semantics directly in one wide claim table.

## Known Gaps

### Reject Flow

`Confirmed`

The reject popup exists, but complete end-to-end validation is still deferred.

### Exact Scope Expansion

`Open`

Some organization-scope logic is likely interceptor-generated and should be confirmed further when writing generalized approval rules for the new system.

## Source Basis

`Confirmed`

This spec is based on:

- `legacy/src/reportconfig/report/claim_verify_acc.xml`
- `legacy/docs/legacy-docker-runbook.md`
- `legacy/docs/compatibility-backlog.md`
