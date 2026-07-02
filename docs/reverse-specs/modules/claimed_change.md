# Module Spec: claimed_change

## Module Goal

`Confirmed`

`claimed_change` is a post-claim adjustment module.
It lets a user select an already claimed business record, inspect the existing attribution situation, edit the attribution ratio, save the proposed adjustment, and submit that adjustment into a separate approval flow.

Its companion pages are:

- `claimed_change`
- `claimed_change_fs`
- `claimedRvs_no_formfs`

## Business Position in Workflow

`Confirmed`

This module is downstream of initial claim approval.
It does not operate on fresh claim candidates.
It operates on rows that have already entered approved or review-complete claim states.

Observed high-level sequence:

1. original claim exists
2. user initiates adjustment
3. adjustment is saved
4. adjustment is submitted for review
5. final adjustment review approves or rejects

## Role Model

### Adjustment Initiator

`Confirmed`

This role can:

- locate already claimed items
- inspect current attribution details
- edit a new ratio
- save a pending adjustment
- submit the adjustment

### Adjustment Reviewer

`Confirmed`

This role uses:

- `claimed_change_fs`

and can:

- view pending adjustments
- approve a single row
- trigger reject popup

## Entry Pages

`Confirmed`

- initiation page:
  - `claimed_change`
- final adjustment-review page:
  - `claimed_change_fs`
- reject popup:
  - `claimedRvs_no_formfs`

## Business Objects

`Confirmed`

Primary tables:

- `IBS.T1_VUCH_EMP_RELA`
- `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG`

Supporting dictionaries and details:

- `IBS.T1_VUCH_DETAIL`
- `IBS.T9_BIZ_TYPE`
- `IBS.T9_CLAIM_STATUS_TYPE`
- `IBS.T9_RVS_STATUS_TYPE`

Important fields:

- `RVS_RATIO`
- `RVS_STATUS_ID`
- `RVS_CLAIM_DT`
- `RVS_CLAIM_EMP_ID`
- `NEW_CLAIM_STATUS_ID`
- `NEW_RATIO`
- `NEW_VERIFY_DT`
- `NEW_FIN_VERIFY_DT`
- `NEW_VERIFY_EMP_ID`
- `NEW_FIN_VERIFY_EMP_ID`

## Page Structure

### `claimed_change`

`Confirmed`

The page is restored as a three-block structure:

- `账户信息`
- `认领信息`
- `我要调整`

#### Block 1: Account / Voucher Selection

`Confirmed`

The first list shows claimable-for-adjustment rows.

It filters for records that:

- belong to current user
- are not in the excluded marketing bucket `2016qq`
- have claim states in:
  - `2`
  - `5`
  - `6`
  - `1`

It also computes:

- remaining adjustable ratio as `100 - other claimed ratio`

#### Block 2: Existing Claim Information

`Confirmed`

The second list shows current attribution records for the selected voucher, including:

- original claimant
- original ratio
- adjusted ratio if present
- claim status
- claim and verify timestamps
- verifier information

#### Block 3: My Adjustment

`Confirmed`

The third block loads already approved claim rows for the selected voucher and allows editing:

- `RATIO`

It exposes actions:

- delete
- save
- submit

## Adjustment Save Behavior

`Confirmed`

Runbook validation shows save:

- writes `RVS_RATIO`
- creates or refreshes `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG`

`Inferred`

Save acts as a draft-adjustment stage before submission, similar to normal claim draft/save behavior.

## Adjustment Submit Behavior

`Confirmed`

Runbook validation shows submit:

- moves `IBS.T1_VUCH_EMP_RELA.RVS_STATUS_ID` from `'0'` to `'1'`
- moves `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID` from `'0'` to `'1'`

`Confirmed`

This means adjustment submission is tracked in both:

- the current claim row
- the separate change log

## Review Behavior

### `claimed_change_fs`

`Confirmed`

This page is the final adjustment-review queue.

It lists rows where:

- `RVS_STATUS_ID='1'`

The reviewer can approve or reject.

### Approve

`Confirmed`

Single-row approval performs:

- `IBS.T1_VUCH_EMP_RELA.RVS_STATUS_ID='2'`
- `IBS.T1_VUCH_EMP_RELA.RATIO = RVS_RATIO`
- `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID='2'`
- final verify metadata written into change log

`Confirmed`

This shows that approval finalizes the ratio by copying the pending adjustment ratio into the main claim row.

### Reject

`Confirmed`

Reject is routed through:

- `claimedRvs_no_formfs`

`Confirmed`

The page exists in source and runtime.

`Open`

Its full end-to-end restored verification remains deferred.

## State Machine

### Observed Adjustment States

`Confirmed`

For the adjustment chain:

- `RVS_STATUS_ID='0'`
  - saved but not submitted adjustment
- `RVS_STATUS_ID='1'`
  - pending adjustment review
- `RVS_STATUS_ID='2'`
  - approved adjustment

Associated change-log states:

- `NEW_CLAIM_STATUS_ID='0'`
  - draft adjustment
- `NEW_CLAIM_STATUS_ID='1'`
  - pending adjustment review
- `NEW_CLAIM_STATUS_ID='2'`
  - approved adjustment

### Transition Rules

`Confirmed`

- save:
  - prepares `RVS_RATIO` / draft change log
- submit:
  - `0 -> 1`
- approve:
  - `1 -> 2`
  - final ratio copied into main claim row

## Scope Rules

### Initiator Scope

`Confirmed`

The initial selection query is tied to current session user id.
Users adjust their own claimed records rather than arbitrary other users' claims.

### Reviewer Scope

`Confirmed`

The review page is organization-scoped and uses:

- employee org
- customer org
- org hierarchy joins

`Inferred`

Adjustment approval scope likely mirrors later-stage claim-approval scope rather than original claimant scope.

## Restored Demo Outcome

`Confirmed`

For demo row `LNDEMO0001 / admin`:

- `claimed_change` loads and shows the original approved row
- save persists draft adjustment state
- submit moves adjustment into pending state
- `claimed_change_fs` shows one pending row
- approve removes it from pending queue
- final result:
  - `RVS_STATUS_ID='2'`
  - main `RATIO` finalized from `RVS_RATIO`
  - change-log `NEW_CLAIM_STATUS_ID='2'`

## New-System Design Implications

`Confirmed`

The new implementation should treat adjustment as a first-class business process, not as a small edit on top of the main claim page.

The new system should preserve:

- original claim vs. proposed adjusted claim separation
- explicit draft/save vs. submit distinction
- dedicated adjustment review queue
- finalization of approved adjusted ratio into the main claim record
- immutable or auditable adjustment log

`Inferred`

A new system should likely model adjustment records as independent workflow entities that reference the original claim rather than overloading many `RVS_*` columns into the main claim table.

## Known Gaps

### Batch Approval

`Confirmed`

Batch approve is patched to the restored data shape but not yet fully re-verified end to end.

### Reject Flow

`Confirmed`

Reject popup exists but has not yet been fully re-verified end to end.

## Source Basis

`Confirmed`

This spec is based on:

- `legacy/src/reportconfig/report/claimed_change.xml`
- `legacy/src/reportconfig/report/claimed_change_fs.xml`
- `legacy/docs/legacy-docker-runbook.md`
- `legacy/docs/compatibility-backlog.md`
