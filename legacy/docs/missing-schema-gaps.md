# Missing Schema Gaps

This file records database-structure gaps discovered while restoring the legacy app.
These are different from “missing runtime components” such as jars or JS assets:
the application source clearly expects these tables/columns, but the current MySQL baseline does not provide them.

Per project policy, these gaps should be documented first, not papered over by inventing new business schema.

## Summary

### Missing tables in current MySQL

- `IBS.T3_BRANCH_EXS_RATIO`
- `IBS.T3_BRANCH_RATIO`
- `IBS.T3_BRANCH_SEC_DISTRIBUTION`
- `IBS.T3_BRANCH_EXS_XZ_VAL`
- `IBS.T5_EMP_DXJX_MX`

### Tables present but structurally inconsistent with source code

- `IBS.T2_EMP_DX_SCORE`

## Branch Assessment Family

### `branch_exs_ratio`

Source depends on:

- `IBS.T3_BRANCH_EXS_RATIO`
- `IBS.T3_BRANCH_RATIO`
- `IBS.T3_BRANCH_SEC_DISTRIBUTION`

Current MySQL state:

- none of the three tables above exist

Why this matters:

- `branch_exs_ratio.xml` still references the original mod / verify / reject chain
- without these tables, this module family is blocked before page-level SQL adaptation is meaningful

Needed from original environment:

- full DDL for:
  - `IBS.T3_BRANCH_EXS_RATIO`
  - `IBS.T3_BRANCH_RATIO`
  - `IBS.T3_BRANCH_SEC_DISTRIBUTION`
- if possible, one representative row set covering:
  - draft
  - submitted
  - approved / rejected

## Employee Assessment Family

### `emp_exsXz`

Source depends on:

- `IBS.T5_EMP_BZJX`
- `IBS.T3_BRANCH_EXS_XZ_VAL`
- `IBS.T9_YEAR_Q`

Current MySQL state:

- `T5_EMP_BZJX` exists but is empty
- `T9_YEAR_Q` exists but is empty
- `T3_BRANCH_EXS_XZ_VAL` does not exist

Why this matters:

- `EmpExsXzSubmitServerCallBack.java` validates branch totals with:
  - `select EXS_BZJX_SUM,EXS_XZ from IBS.T3_BRANCH_EXS_XZ_VAL where MEASURE_DT=? and BRANCH_ORG_ID=?`
- Without that table, the original submit chain cannot be reproduced faithfully.

Needed from original environment:

- full DDL for `IBS.T3_BRANCH_EXS_XZ_VAL`
- one representative row shape for a valid branch total record

### `emp_dxxz`

Source depends on:

- `IBS.T5_EMP_DXJX_MX`

Current MySQL state:

- `T5_EMP_DXJX_MX` does not exist

Why this matters:

- main query page `emp_dxxz` selects from `ibs.T5_EMP_DXJX_MX mx`
- without this table, the module is blocked before any page-level MySQL adaptation is meaningful

Needed from original environment:

- full DDL for `IBS.T5_EMP_DXJX_MX`
- optional sample rows for one employee / one quarter

### `emp_dx` family

Affected pages:

- `emp_dx`
- `emp_dx_zh_list`
- `emp_dx_zh_scoring`
- `emp_dx_fh_list`
- `emp_dx_fh_scoring`
- `emp_dx_fhver_list`
- `emp_dx_fhver_dtl`
- `emp_dx_fhver_no`

Source expects `IBS.T2_EMP_DX_SCORE` to contain fields including:

- `EXAM_YEAR`
- `EXAM_Q`
- `PROJCT_NM`
- `ZB_NM`
- `ZB_SCORE`
- `STUS`
- `VER_REMARK`
- `VERIFY_PEOPLE`
- `VERIFY_TIME`
- `VERIFY_IP`
- `OU_MOD_PEOPLE`
- `OU_MOD_TIME`
- `OU_MOD_IP`

Current MySQL table `T2_EMP_DX_SCORE` only contains:

- `MSR_PRD_DT`
- `EMP_ID`
- `EMP_NM`
- `ORG_ID`
- `ORG_NM`
- `PSTN_TYPE`
- `PSTN_TYPE_NM`
- `SUB_PSTN_TYPE`
- `SUB_PSTN_TYPE_NM`
- `SCORE`
- `RMARK`

Additional source-side evidence:

- page SQL references columns such as:
  - `EXAM_YEAR`
  - `EXAM_Q`
  - `PROJCT_NM`
  - `ZB_NM`
  - `ZB_SCORE`
  - `STUS`
- server callbacks update fields such as:
  - `OU_MOD_PEOPLE`
  - `OU_MOD_TIME`
  - `OU_MOD_IP`
  - `VERIFY_PEOPLE`
  - `VERIFY_TIME`
  - `VERIFY_IP`
  - `VER_REMARK`

Why this matters:

- page SQL and server callbacks rely on the missing fields for:
  - quarter grouping
  - scoring item identity
  - submit/review status
  - review remark persistence
  - auditor / modifier audit fields
- this is schema drift, not merely missing demo data

Needed from original environment:

- deployed DDL for `IBS.T2_EMP_DX_SCORE`
- if possible, one representative row set covering:
  - branch scoring draft
  - branch submitted
  - branch approved / rejected

## Shared Runtime Note

`legacy/src/com/customer/security/Login.java` computes an assessment date from `IBS.T99_MIDDLE_INCOME_SWITCH`, but currently stores `session.exam_msr_dt` as current day.

This likely affects several employee assessment pages, but it should be validated only after the missing schema above is recovered enough to make those modules executable.
