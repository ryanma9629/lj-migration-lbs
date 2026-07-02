# Module Spec: claim_gold

## Module Goal

`Confirmed`

`claim_gold` is a gold-business attribution module.
It lets a claimant find a gold-related business record, fill in claim information such as attribution ratio, and submit the claim for approval.

Its companion approval pages are:

- `claim_gold_verify`
- `claim_gold_vfy_no`

## Role Model

### Claimer

`Confirmed`

The restored demo uses:

- `claimer_gold`

This role can:

- open `claim_gold`
- search claimable gold voucher records
- save claim data
- submit a claim

### Approver

`Confirmed`

The restored demo uses:

- `verifier_gold`

This role can:

- open `claim_gold_verify`
- view pending claims within organization scope
- approve
- reject through `claim_gold_vfy_no`

## Entry Pages

`Confirmed`

- claim page:
  - `claim_gold`
- approval page:
  - `claim_gold_verify`
- reject popup:
  - `claim_gold_vfy_no`

## Business Object

`Confirmed`

The main business record for this module is stored in:

- `IBS.GOLD_EMP_RELA`

Important business identifiers seen in the source:

- `TXN_RUN_NBR`
- `VUCH_NBR`
- `TXN_DT`

Important attribution fields:

- `EMP_ID`
- `EMP_NM`
- `EMP_ORG_ID`
- `EMP_ORG_NM`
- `RATIO`
- `CLAIM_STATUS_ID`
- `CLAIM_DT`
- `VERIFY_DT`
- `VERIFY_EMP_ID`
- `REMARK`
- `REMARK1`

## User Journey

### Claim Flow

`Confirmed`

1. user opens `claim_gold`
2. user searches by `VUCH_NBR`
3. list page shows matching voucher rows
4. selecting a row loads the dependent detail form
5. user enters claim ratio and optional note
6. save writes claimant identity and moves record into temporary claimed state
7. submit runs server-side validation and moves the row into pending approval

### Approval Flow

`Confirmed`

1. approver opens `claim_gold_verify`
2. page lists rows with pending status visible to current organization scope
3. approver can approve directly
4. approver can reject through popup page `claim_gold_vfy_no`

## Page Behavior

### `claim_gold`

`Confirmed`

The list report:

- queries `IBS.GOLD_EMP_RELA`
- requires a `VUCH_NBR` condition
- is voucher-oriented rather than auto-loading all data

The dependent detail form:

- loads only rows with `CLAIM_STATUS_ID in ('0','7')`
- depends on the selected `TXN_RUN_NBR` and `EMP_ID`
- allows editing `RATIO`
- allows editing `REMARK1`

Save behavior:

- writes `RATIO`
- sets `CLAIM_STATUS_ID='0'`
- stamps claimant identity from session
- stamps claim date

Submit behavior:

- is implemented in `SubmitClaimGold.java`
- validates duplicate claiming by current user
- validates remaining claimable ratio
- updates row to `CLAIM_STATUS_ID='1'`
- writes claim remark audit text into `REMARK`
- clears `REMARK1`

### `claim_gold_verify`

`Confirmed`

The approval list:

- loads only rows where `CLAIM_STATUS_ID='1'`
- joins `IBS.T5_ORG` using `ORG_TYPE_ID='AO'`
- filters visible rows by current org / branch org / head org
- exposes row-level `通过` and `不通过` actions

Approve behavior:

- sets `CLAIM_STATUS_ID='2'`
- sets `VERIFY_DT`
- sets `VERIFY_EMP_ID`
- optionally writes `REMARK1`
- appends approval audit text into `REMARK`

### `claim_gold_vfy_no`

`Confirmed`

The reject popup:

- loads only rows where `CLAIM_STATUS_ID='1'`
- requires reject reason input through `REMARK1`
- writes reject result with status `3`

## State Machine

### Observed States

`Confirmed`

For this module, the following status meanings are observed:

- `7`
  - unclaimed / claimable source row
- `0`
  - saved but not yet submitted
- `1`
  - submitted / pending approval
- `2`
  - approved
- `3`
  - rejected

### Transition Rules

`Confirmed`

- `7 -> 0`
  - claimant saves claim information
- `0 -> 1`
  - claimant submits
- `1 -> 2`
  - approver approves
- `1 -> 3`
  - approver rejects

## Validation Rules

### Claimer Identity

`Confirmed`

The page footer and form logic indicate the intended rule:

- claimant should only fill in their own claim information

### Duplicate Claim Protection

`Confirmed`

Submit checks whether the same `TXN_RUN_NBR` has already been claimed by the same `user_id` with a non-zero ratio and a status in:

- `1`
- `2`
- `5`
- `6`

If yes, submit fails.

### Ratio Ceiling

`Confirmed`

Submit computes remaining claimable ratio as:

- `100 - sum(ratio of non-000000 rows in submitted/approved-like states)`

If entered ratio exceeds remaining ratio, submit fails.

## Scope Rules

### Claimer Scope

`Confirmed`

The claim page itself is voucher-search based.
The claimant reaches editable detail only through rows matching selected voucher data and claimable statuses.

### Approver Scope

`Confirmed`

Approver visibility uses current session organization:

- exact org
- branch org
- head org

This is implemented in `claim_gold_verify.xml` through SQL conditions on:

- `re.ORG_ID`
- `ou.BRANCH_ORG_ID`
- `ou.HEAD_ORG_ID`

## Restored Demo Data

`Confirmed`

Current restored demo identities:

- `claimer_gold / 12345`
- `verifier_gold / 12345`

Current main demo rows:

- `GOLDDEMO1001 / GOLDVUCH1001`
  - used for claim then approval chain
- `GOLDDEMO1002 / GOLDVUCH1002`
  - seeded pending approval row
- `GOLDDEMO1003 / GOLDVUCH1003`
  - spare unclaimed row

Supporting demo org structure:

- `9000`
- `9001`
- `9002`

## Confirmed Demo Outcome

`Confirmed`

The restored chain has been validated as:

1. `claimer_gold` saves `GOLDDEMO1001`
2. `claimer_gold` submits `GOLDDEMO1001`
3. `verifier_gold` approves `GOLDDEMO1001`
4. final row reaches:
   - `CLAIM_STATUS_ID='2'`
   - `VERIFY_EMP_ID='verifier_gold'`

## Known Gaps

### Reject Flow Verification

`Confirmed`

The reject popup page exists in source and runtime, but its full end-to-end browser verification is still deferred.

### Partial-Ratio Remainder Behavior

`Confirmed`

The original submit logic attempts to insert a remainder row with:

- `EMP_ID='000000'`
- `CLAIM_STATUS_ID='7'`

when only part of the voucher is claimed.

In the current restored MySQL demo verification, this remainder-row behavior was observed as not materializing as expected and is therefore not yet treated as fully reconstructed business truth.

## New-System Design Implications

`Confirmed`

A new implementation should preserve these business concepts:

- voucher-based search entry
- editable draft state before submit
- claim ratio validation against remaining available percentage
- organization-scoped approval visibility
- explicit approve / reject actions
- auditable state transitions

`Inferred`

The new system should model this module with:

- a claim record aggregate
- a clear state enum
- explicit claim and approval commands
- audit trail fields separated from page-local legacy text assembly

## Source Basis

`Confirmed`

This spec is based on:

- `legacy/src/reportconfig/report/claim_gold.xml`
- `legacy/src/reportconfig/report/claim_gold_verify.xml`
- `legacy/src/com/customer/util/SubmitClaimGold.java`
- `legacy/docs/legacy-docker-runbook.md`
- `legacy/docs/compatibility-backlog.md`
