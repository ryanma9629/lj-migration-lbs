# Legacy Wabacus Docker Runbook

## Prerequisites

- Docker with Compose support
- `curl`
- Required third-party jars copied into `docker/app/lib/`
- Current Wabacus baseline for this Docker runtime is `wabacus-4.1.jar`
- The source tree includes minimal API-signature compatibility edits needed to compile against `4.1` without changing business flow intent

## Build the MySQL schema file

```bash
cd legacy
python3 scripts/convert_db2_schema_to_mysql.py
```

## Start the stack

```bash
cd legacy
docker compose up --build
```

## Application URL

- Login page: `http://127.0.0.1:18080/LBIBS/jsp/login/login.html`

## Seeded login

- Submit `admin` / `12345` to match the smoke check login flow.
- If authentication is stubbed or permissive in your local environment, this confirms session establishment and protected-page access rather than strong password validation.

## Validated pages

- `home`
- `system_menu`
- `system_parameter`
- `system_consts`
- `system_page_list`
- `system_group`
- `system_privilege`
- `system_user`
- `system_user_account`
- `system_user_account_branch`
- `system_info`
- `system_help`
- `my_claimed`
- `my_claim_info`
- `remark_info`
- `resource_manager_yj`
- `resource_manager_yj_q`
- `emp_certificate`
- `emp_gdq_mod`
- `emp_gdq_ver`
- `claim_fnc_detail`
- `claim_ybdb`
- `claim_ybdb_verify`
- `claim_dfSlry`
- `claim_dfSlry_verify`
- `claim_ln`
- `claim_fnc_txn`
- `claim_fnc_verify`
- `claim_thd`
- `claim_thd_verify`
- `claim_hpf_txn`
- `claim_fund_txn`
- `claim_fund_cst`
- `claim_fund_dt`
- `claim_fund_verify`
- `claim_gold`
- `claim_gold_verify`
- `claim_verify_acc`
- `claim_verify_accfs`
- `claim_verify_exs`
- `claim_verify_exs_fh`
- `claimed_change`
- `claimed_change_fs`
- `claim_dep_FH`

The current Docker profile is still intentionally reduced, but it now includes the restored core system pages plus the first validated business claim chain above.

## Validated business chain

### `system_security`

- The following system-management pages now open cleanly after login:
  - `system_page_list`
  - `system_group`
  - `system_privilege`
  - `system_user`
  - `system_user_account`
  - `system_user_account_branch`
- Current seed data is minimal but sufficient to exercise the original page layout and bindings:
  - `system_page_list` shows 55 page rows
  - `system_group` shows `admin_group`
  - `system_privilege` shows `admin_priv`
  - `system_user` shows seeded user `admin / 管理员 / IT`
  - `system_user_account` shows seeded user `admin / 管理员 / Y / IT`
  - `system_user_account_branch` also opens cleanly in the current admin session
- A real write path is also verified on `system_group`:
  - browser-side save updated `CST.SYS_C_SEC_GROP.group_description`
  - Tomcat logs showed real update SQL against:
    - `cst.sys_c_sec_grop`
    - `cst.sys_c_sec_gppv`
    - `cst.sys_c_app_mnlt`
  - the description was then restored to its original value:
    - `admin_group -> 管理员角色`
- Additional real write paths are now verified on the user-management pages:
  - `system_user` row-level "重置" updated `CST.SYS_C_SEC_USER.password`
  - verification roundtrip:
    - temporary DB value was set to `TEMPRESET123=`
    - browser-side reset restored it to `Due2bkAVWVY=`
  - `system_user_account` popup edit updated `CST.SYS_C_SEC_USER.department`
  - verification roundtrip:
    - browser-side save changed `admin.department` from `IT` to `IT-验证`
    - the field was then restored through the same popup save path back to `IT`

### `system_info` / `system_help`

- `system_info` now opens cleanly after login.
- `system_help` now opens cleanly after login.
- Current seed state for both tables is empty:
  - `IBS.T99_NEW_MEGS` row count is `0`
  - `IBS.T99_HELP` row count is `0`
- This is currently a data-gap observation, not a page-open/runtime blocker.

### `my_claimed`

- `my_claimed` main page now opens cleanly after login.
- Current seeded page output shows usable rows on the "我的存贷款认领" tab, including:
  - `DEPDEMO0001`
  - `DEPFHDEMO0001`
  - `EXSDEMO0001`
- Detail-page routing is also verified:
  - `my_claimed -> 查询详情 -> my_claim_info` opens normally for `DEPDEMO0001 / EMP_ID=admin`
- Auxiliary detail page `remark_info` also returns normal HTML in the current runtime.

### `resource_manager_yj` / `resource_manager_yj_q` / `emp_certificate`

- These pages were present in source but had not been registered in the current reduced `wabacus.cfg.xml`.
- They are now registered back into the runtime and no longer fail with:
  - `没有取到...对应的页面配置`
- Current smoke-check state after registration:
  - `resource_manager_yj` opens normally
  - `resource_manager_yj_q` opens normally
  - `emp_certificate` opens normally
- Current seed-data state is still empty for their core tables:
  - `IBS.T3_RESOURCE_MANAGER_EMP_SMY` row count is `0`
  - `IBS.T5_EMP_RESOURCE_MANAGER` row count is `0`
  - `IBS.T8_DATA_DT` row count is `0`
  - `IBS.T5_EMP_CERTIFICATE` row count is `0`
  - `IBS.T9_CERTIFICATE` row count is `0`
- Working interpretation:
  - the current blocker for meaningful end-to-end verification is missing seed data, not missing source pages or missing runtime registration

### `emp_gdq`

- `emp_gdq_mod` opens normally and shows the current seeded demo row from `IBS.T5_EMP_GDQ_OR_GZ`.
- `emp_gdq_ver` opens normally and shows the submitted row on the verify page.
- `emp_gdq_verNo` reject popup also opens normally from the verify page.
- The current restored runtime now has a verified status roundtrip on the original demo row:
  - starting row:
    - `EXAM_YEAR='2026'`
    - `EXAM_Q='01'`
    - `EMP_ID='admin'`
    - initial restored status had already been `3`
  - for chain verification, the demo row was temporarily reset to `STATUS='0'`
  - browser-side submit on `emp_gdq_mod` moved it from `STATUS='0'` to `STATUS='1'`
  - browser-side approve on `emp_gdq_ver` moved it from `STATUS='1'` back to `STATUS='3'`
  - the current final row is restored to approved state, with:
    - `REMARK='审批通过'`
    - `VERIFY_PEOPLE='admin'`
- The reject branch is now also verified on the same demo row:
  - popup page `emp_gdq_verNo` accepted a reject reason and eventually wrote:
    - `STATUS='2'`
    - `REMARK='页面验证不通过'`
    - `VERIFY_PEOPLE='admin'`
  - after this verification, the demo row was restored through the normal approve path back to:
    - `STATUS='3'`
    - `REMARK='审批通过'`
- A browser-side date edit on `emp_gdq_mod` also persisted to MySQL during this verification cycle:
  - `GDQ_ENDDT` changed from `2026-04-15` to `2026-04-16`

### `claim_fnc_detail`

- This page is now registered back into the current `wabacus.cfg.xml` runtime and no longer fails with missing page config.
- Current runtime state:
  - the page shell opens normally
  - but the inner content area under `common_vpanel` is still empty in the current restored runtime
- Matching source data does exist in MySQL:
  - `IBS.T1_FNC_TXN_EMP_RELA` contains the current demo rows
- This page is therefore only partially restored at the moment.
- The rendering gap is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_ybdb`

- Main list page loads after login.
- Dependent `dtl` form loads for seeded demo rows.
- Save/submit chain is validated for the demo flow:
  - `YBDBDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.
- Review/approve chain is validated for the demo flow:
  - `YBDBDEMO0002` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.

### Known deferred gap

- `claim_ybdb_vfy_no` review-reject popup is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_dfSlry`

- Main list page loads after login.
- Dependent `dtl` form loads for seeded demo rows.
- Save/submit chain is validated for the demo flow:
  - `DFSLRYDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.
- Review/approve chain is validated for the demo flow:
  - `DFSLRYDEMO0002` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.

### Known deferred gap

- `claim_dfSlry_vfy_no` review-reject popup is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_ln`

- Main page loads after login with direct query parameter access:
  - `ShowReport.wx?PAGEID=claim_ln&VUCH_NBR=LNDEMO0001`
- Save flow is validated for the demo row:
  - `LNDEMO0001` can persist `RATIO=80.00` while staying at `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `LNDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### Known deferred gap

- `claim_ln` currently does not persist the edited `REMARK1` textarea content in the restored runtime.
- Approver-related fields remain blank in the demo submit result because the current seed only contains table structure and minimal user/org data, not the original approval dictionary/group business data.
- These are tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_fnc_txn`

- Main page loads after login with the seeded demo row:
  - `TXN_NO=FNCDEMO0001`
- Save flow is validated for the demo row:
  - `FNCDEMO0001` can persist `RATIO=80.00` while staying at `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `FNCDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### Known deferred gap

- `claim_fnc_txn` currently does not persist the edited `REMARK1` textarea content in the restored runtime.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_fnc_verify`

- Main verify page loads after login and shows seeded pending rows.
- Review/approve chain is validated for the demo flow:
  - `FNCDEMO0001` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.
- Shared verify-page routing is now confirmed for the HPF claim chain:
  - There is no standalone `claim_hpf_verify` page in the restored source/config.
  - Pending HPF row `HPFDEMO0001` appears on `claim_fnc_verify`, which matches the original shared-table design around `IBS.T1_FNC_TXN_EMP_RELA`.

### Known deferred gap

- `claim_fnc_vfy_no` review-reject popup is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_thd`

- Main page loads after login with the seeded demo row:
  - `SCURT_AC=SCURTDEMO0001`
- Save flow is validated for the demo row:
  - `THD000000001` can move from `CLAIM_STATUS_ID='7'` to `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `THD000000001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### `claim_thd_verify`

- Main verify page loads after login and shows seeded pending rows.
- Review/approve chain is validated for the demo flow:
  - `THD000000001` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.

### Known deferred gap

- `claim_thd_vfy_no` review-reject popup is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_hpf_txn`

- Main page loads after login with the seeded demo row:
  - `TXN_NO=HPFDEMO0001`
- Save flow is validated for the demo row:
  - `HPFDEMO0001` can persist `RATIO=80.00` while staying at `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `HPFDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.
- Verify-page routing is validated:
  - Submitted HPF demo row `HPFDEMO0001` is visible on shared page `claim_fnc_verify`.
  - No separate `claim_hpf_verify` recovery work is required unless later evidence shows the original deployment had a different menu entry.

### Known deferred gap

- `claim_hpf_txn` currently does not persist the edited `REMARK1` textarea content in the restored runtime.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_fund_txn`

- Main page loads after login with the seeded demo row:
  - `TXN_NO=FUNDTXNDEMO0001`
- Save flow is validated for the demo row:
  - `FUNDTXNDEMO0001` can persist `RATIO=80.00` while moving to `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `FUNDTXNDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### `claim_fund_cst`

- Main page loads after login with the seeded demo row:
  - `IDENTN_NO=FUNDCSTDEMO0001`
- Save flow is validated for the demo row:
  - `FUNDCSTDEMO0001` can persist `RATIO=80.00` while moving to `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `FUNDCSTDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### `claim_fund_dt`

- Main page loads after login with the seeded demo row:
  - `SERIAL_NO=FUNDDTDEMO0001`
- Save flow is validated for the demo row:
  - `FUNDDTDEMO0001` can persist `RATIO=80.00` while moving to `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `FUNDDTDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`.

### `claim_fund_verify`

- Main verify page loads after login and shows all three seeded pending fund rows together:
  - `FUNDTXNDEMO0001`
  - `FUNDCSTDEMO0001`
  - `FUNDDTDEMO0001`
- Review/approve chain is validated for the demo flow:
  - `FUNDCSTDEMO0001` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'` with `VERIFY_DT='2026-06-27'` and `VERIFY_EMP_ID='admin'`.

### Known deferred gap

- `claim_fund_vfy_no` review-reject popup is not yet fully verified end-to-end.
- `claim_fund_txn`, `claim_fund_cst`, and `claim_fund_dt` still do not persist edited `REMARK1` textarea content in the restored runtime.
- These are tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_gold`

- Main page loads after login with the seeded demo row:
  - `VUCH_NBR=GOLDVUCH1001`
- Save flow is validated for the demo row:
  - `claimer_gold` can persist `RATIO=40.00` for `GOLDDEMO1001` while moving it to `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `claimer_gold` can move `GOLDDEMO1001` through the original page flow and hand it off for review.
  - In the current demo verification, the original partial-share remainder row is not materialized by the restored runtime, so this behavior remains deferred rather than patched.

### `claim_gold_verify`

- Main verify page loads after login and shows the seeded pending gold row.
- Review/approve chain is validated for the demo flow:
  - `verifier_gold` can approve `GOLDDEMO1001` after `claimer_gold` submits it.
  - `VERIFY_EMP_ID='verifier_gold'` is written as expected.

### Known deferred gap

- `claim_gold_vfy_no` review-reject popup is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_verify_acc`

- Main verify page loads after login and shows the seeded pending demo row:
  - `VUCH_NBR=LNDEMO0001`
- Review/approve chain is validated for the demo flow:
  - `LNDEMO0001` / `EMP_ID='admin'` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='21'`.
  - `FH_VERIFY_DT='2026-06-27'` and `FH_VERIFY_EMP_ID='admin'` are written as expected.
- To restore this page faithfully under the “schema only, no original business data” constraint, the Docker seed now includes a minimal `T9_BIZ_TYPE` demo row required by the page's original inner join.

### Known deferred gap

- `verify_no_form` reject popup for `claim_verify_acc` is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_verify_accfs`

- Main verify page loads after login and shows the seeded pending demo row:
  - `VUCH_NBR=LNDEMO0001`
- Final-approval chain is validated for the demo flow:
  - `LNDEMO0001` / `EMP_ID='admin'` can move from `CLAIM_STATUS_ID='21'` to `CLAIM_STATUS_ID='2'`.
  - `VERIFY_DT='2026-06-27 00:00:00'` and `VERIFY_EMP_ID='admin'` are written as expected.
- Browser-side verification captured the original row-level action path end-to-end:
  - clicking `通过` raises the original confirm dialog
  - the page issues `POST /LBIBS/ShowReport.wx?...`
  - the pending row disappears from the `待审批` tab after success

### Known deferred gap

- `verify_no_formfs` reject popup for `claim_verify_accfs` is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_verify_exs`

- Main verify page loads after login and shows the seeded pending demo row:
  - `VUCH_NBR=EXSDEMO0001`
- Review/approve chain is validated for the demo flow:
  - `EXSDEMO0001` / `EMP_ID='admin'` can move from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='21'`.
  - `VERIFY_DT='2026-06-27'` and `VERIFY_EMP_ID='admin'` are written as expected.
- To restore this page faithfully under the “schema only, no original business data” constraint, the Docker seed now includes one minimal pending row that matches the original filter:
  - `CST_OPEN_DT<'2018-01-01'`
  - `BIZ_TYPE_NM='储蓄存款'`

### Known deferred gap

- `verify_no_exs` reject popup for `claim_verify_exs` is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_verify_exs_fh`

- Main verify page loads after login and shows branch-level pending demo rows now including:
  - `VUCH_NBR=EXSDEMO0001`
- Review/approve chain is validated for the demo flow:
  - `EXSDEMO0001` / `EMP_ID='admin'` can move from `CLAIM_STATUS_ID='21'` to `CLAIM_STATUS_ID='2'`.
  - `VERIFY_DT='2026-06-27'` and `VERIFY_EMP_ID='admin'` are written as expected.
- This page was restored without new business-row seeding by reusing the branch-approved row produced by the `claim_verify_exs` chain.

### Known deferred gap

- `verify_no_exs_fh` reject popup for `claim_verify_exs_fh` is not yet fully verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claimed_change`

- Main adjustment page loads after login and shows the approved demo row:
  - `VUCH_NBR=LNDEMO0001`
  - `EMP_ID='admin'`
- The original three-block page structure is restored:
  - `账户信息`
  - `认领信息`
  - `我要调整`
- The page binds the existing approved row as expected and exposes the original action buttons:
  - `删除`
  - `保存`
  - `提交`

### `claimed_change_fs`

- Final adjustment-review page loads after login for:
  - `VUCH_NBR=LNDEMO0001`
  - `EMP_ID='admin'`
- Single-row approve action is now restored end-to-end:
  - the page shows one pending row when `RVS_STATUS_ID='1'`
  - clicking `通过` removes the row from the pending list
  - `IBS.T1_VUCH_EMP_RELA` moves from `RVS_STATUS_ID='1'` to `RVS_STATUS_ID='2'`
  - `IBS.T1_VUCH_EMP_RELA.RATIO` is finalized from `RVS_RATIO` and remains `70.00`
  - `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID` moves from `'1'` to `'2'`

### Known deferred gap

- `claimed_change_fs` batch approve and reject popup are patched to the same data shape, but are not yet re-verified end-to-end.
- This is tracked in [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md).

### `claim_dep_FH`

- Branch-level deposit allocation page now loads after login for:
  - `VUCH_NBR=DEPFHDEMO0001`
- The original page sections are restored:
  - `账户信息`
  - `凭证已有认领信息`
  - `认领信息`
- The original interceptor path is also active:
  - on first load it inserts one placeholder `IBS.T1_VUCH_EMP_RELA` row with `EMP_ID=''` for `DEPFHDEMO0001`
  - the editable form then binds that placeholder row with `CLAIM_STATUS_ID='0-暂存'`
- Under the `wabacus-4.1.jar` baseline, the page-local broken `onload` generation is removed after deleting the manual `page onload=...` config from this page.
- The MySQL-specific autocomplete dialect issue on this page is now fixed:
  - `claim_dep_FH.xml` adds the required derived-table alias for the employee autocomplete dataset
  - typing `admin` now restores the original auto-fill behavior for:
    - `姓名=管理员`
    - `人员机构=演示机构`
- Save flow is now operational for the demo path:
  - editing `EMP_ID='admin'`, `RATIO='100'`, and `REMARK1='fh-save-test'` issues `POST /ShowReport.wx?...`
  - the write reaches MySQL and updates the placeholder row for `VUCH_NBR=DEPFHDEMO0001`
  - final persisted state is:
    - `EMP_ID='admin'`
    - `EMP_NM='管理员'`
    - `EMP_ORG_NM='演示机构'`
    - `RATIO=100.00`
    - `CLAIM_STATUS_ID='2'`
    - `VERIFY_EMP_ID='admin'`

### `claim_dep`

- Main page loads after login with the seeded demo row:
  - `VUCH_NBR=DEPDEMO0001`
- Save flow is validated for the demo row:
  - `DEPDEMO0001` can persist `RATIO=80.00` and keep the edited note while staying at `CLAIM_STATUS_ID='0'`.
- Submit flow is validated for the demo row:
  - `DEPDEMO0001` can move from `CLAIM_STATUS_ID='0'` to `CLAIM_STATUS_ID='1'`
  - the final verified DB state is:
    - `EMP_ID='admin'`
    - `RATIO=80.00`
    - `CLAIM_STATUS_ID='1'`
    - `CLAIM_DT='2026-06-27'`
- `claim_dep_2016qq` write path is also verified for the demo row:
  - `VUCH_NBR=QQDEMO0001`
  - querying the row restores the original page content
  - saving changes the contact claim employee from `EMP_ID='10001'` to `EMP_ID='admin'`
  - MySQL final state is:
    - `IBS.T1_VUCH_EMP_RELA.VUCH_NBR='QQDEMO0001'`
    - `EMP_ID='admin'`
    - `CLAIM_STATUS_ID='6'`
    - `VERIFY_EMP_ID='admin'`
  - `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG` also records the adjustment from `10001` to `admin`
- To keep the restored demo chain stable, `claim_dep_FH` now uses its own separate demo voucher:
  - `DEPFHDEMO0001`
  - This avoids cross-page demo-data interference between branch-direct allocation and the normal personal-claim chain.

## Smoke check

```bash
./scripts/smoke-check.sh
```

## Browser Automation

Project-local Playwright tooling is pinned under `legacy/` and defaults to system Chrome:

```bash
cd legacy
npm install
npm run pw:check
```

See [playwright-toolchain.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/playwright-toolchain.md) for overrides and codegen usage.

If your local environment cannot reach Docker-published localhost ports from the current shell, you can verify the same flow inside the app container:

```bash
docker compose exec app sh -lc 'cookie=$(mktemp); body=$(mktemp); base=http://127.0.0.1:8080/LBIBS; curl -fsS -c "$cookie" "$base/jsp/login/login.html" >/dev/null && curl -fsS -L -c "$cookie" -b "$cookie" -d "TxtUserID=admin" -d "TxtPassword=12345" "$base/jsp/login/login.jsp" >/dev/null && for page in home system_menu system_parameter system_consts; do curl -fsS -b "$cookie" "$base/ShowReport.wx?PAGEID=$page" > "$body"; done; rm -f "$cookie" "$body"'
```

## Expected first troubleshooting areas

- Missing Wabacus jars in `docker/app/lib/`
- Java compilation failures from unresolved third-party classes
- MySQL DDL statements that still contain DB2-only syntax
- Page-specific SQL incompatibilities outside the initial validation set

## Bring-up Evidence

### 2026-06-26 attempt

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy`:

```bash
python3 scripts/convert_db2_schema_to_mysql.py
docker compose up --build
docker compose logs mysql
docker compose logs app
```

Observed results:

- `python3 scripts/convert_db2_schema_to_mysql.py` exited successfully and regenerated `docker/mysql/init/01-schema.sql`.
- `docker compose up --build` failed before either service started with:

```text
Image mysql:5.7 Pulling
Image mysql:5.7 Error no matching manifest for linux/arm64/v8 in the manifest list entries: no match for platform in manifest: not found
Error response from daemon: no matching manifest for linux/arm64/v8 in the manifest list entries: no match for platform in manifest: not found
```

- `docker compose logs mysql` produced no output.
- `docker compose logs app` produced no output.

Interpretation:

- The first concrete blocker is platform-level, not schema-level or application-level: the configured `mysql:5.7` image could not be pulled for `linux/arm64/v8` on this machine.
- Because the failure occurs before container creation, there is no MySQL startup log, no app startup log, and no basis to run `./scripts/smoke-check.sh`.
- This blocker is outside the allowed file scope for Task 6. Resolving it would require changing compose/image platform strategy or using a compatible MySQL image, neither of which is permitted in this task.

### 2026-06-27 continuation

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy` after adding `platform: linux/amd64` to the `mysql` service in `docker-compose.yml`:

```bash
docker compose up --build
docker compose logs mysql
docker compose logs app
```

Observed results:

- The previous arm64 manifest blocker was cleared. `mysql:5.7` pulled successfully under emulated `linux/amd64`.
- The MySQL container completed initialization, ran:
  - `/docker-entrypoint-initdb.d/00-create-databases.sql`
  - `/docker-entrypoint-initdb.d/01-schema.sql`
  - `/docker-entrypoint-initdb.d/02-seed.sql`
- MySQL then reached `mysqld: ready for connections.` on port `3306`.
- The app image built, but the app container exited during Java compilation with unresolved external classes.

Representative app errors:

```text
/workspace/legacy/src/com/customer/CustomerSelect.java:10: error: package com.wabacus.config does not exist
import com.wabacus.config.Config;
/workspace/legacy/src/com/customer/CustomerSelect.java:17: error: package com.wabacus.system.dataset does not exist
import com.wabacus.system.dataset.IReportDataSet;
/workspace/legacy/src/com/customer/CustomerSelect.java:23: error: package com.lenovo.ebank.pub does not exist
import com.lenovo.ebank.pub.SopIntf;
/workspace/legacy/src/com/customer/CustomerUpdate.java:32: error: cannot find symbol
public class CustomerUpdate extends AbsJavaEditActionBean
...
100 errors
```

Interpretation:

- The minimal compose change was sufficient to preserve MySQL 5.7 and get past the platform blocker.
- The next concrete blocker is missing third-party runtime jars under `docker/app/lib/`, not MySQL schema or seed data.
- `docker compose logs mysql` confirms database initialization succeeded.
- `docker compose logs app` confirms the app cannot compile because classes from Wabacus and at least one Lenovo package are absent from the runtime jar set.
- `./scripts/smoke-check.sh` could not be run because the app container never reached a serving state.

Exact dependency evidence recorded in `docker/app/lib/README.md`:

- Wabacus packages rooted at `com.wabacus.*`
- `com.lenovo.ebank.pub.SopIntf`

### 2026-06-27 core-page bring-up

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy` after vendoring Wabacus jars, replacing the Druid datasource implementation, stubbing Lenovo SSO/SOP integration points, and reducing Wabacus startup to the core system pages:

```bash
docker compose up --build -d
docker compose logs app --tail=120
docker compose exec app sh -lc 'cookie=$(mktemp); body=$(mktemp); base=http://127.0.0.1:8080/LBIBS; curl -fsS -c "$cookie" "$base/jsp/login/login.html" >/dev/null && curl -fsS -L -c "$cookie" -b "$cookie" -d "TxtUserID=admin" -d "TxtPassword=12345" "$base/jsp/login/login.jsp" >/dev/null && for page in home system_menu system_parameter system_consts; do curl -fsS -b "$cookie" "$base/ShowReport.wx?PAGEID=$page" > "$body"; done; rm -f "$cookie" "$body"'
```

Observed results:

- `docker compose logs app --tail=120` included `wabacus应用启动完成!`.
- Tomcat stayed up with `0.0.0.0:18080->8080/tcp`.
- An authenticated in-container smoke check reached all four target pages and validated:
  - `home` contains `所有功能`
  - `system_menu` contains `菜单名称`
  - `system_parameter` contains `通用参数设置`
  - `system_consts` contains `Consts设定`

Interpretation:

- The Dockerized legacy runtime is now operational for the agreed core validation set.
- Remaining unported business pages are intentionally outside the startup scope and still need incremental compatibility work if you want them loaded in this environment.

### 2026-06-27 claim_dep partial recovery

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy`:

```bash
docker cp docker/mysql/init/31-enable-claim-dep-pages.sql lbs-legacy-mysql-1:/tmp/31-enable-claim-dep-pages.sql
docker cp docker/mysql/init/32-seed-claim-dep-demo.sql lbs-legacy-mysql-1:/tmp/32-seed-claim-dep-demo.sql
docker exec lbs-legacy-mysql-1 sh -lc 'mysql -uwabacus -pwabacus cst < /tmp/31-enable-claim-dep-pages.sql && mysql -uwabacus -pwabacus cst < /tmp/32-seed-claim-dep-demo.sql'
docker compose up -d --build app
PAGEID=claim_dep npm run pw:check
node --input-type=module  # Playwright checks against /ShowReport.wx?PAGEID=claim_dep&VUCH_NBR=DEPDEMO0001
```

Observed results:

- `claim_dep` is now registered in Wabacus and enabled in page permissions.
- Direct page load works at:
  - `http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=claim_dep&VUCH_NBR=DEPDEMO0001`
- Minimal demo row `DEPDEMO0001` now loads through the original interceptor and shows:
  - account info
  - editable `dtl` form
  - buttons `删除 / 保存 / 重置 / 提交`
- The restored demo row intentionally reuses the original `claim_dep` path constraints:
  - eligible `VUCH_TYPE_ID in ('10'..'18')`
  - non-`2016qq` marketing flag
  - user row `EMP_ID='admin'`, `CLAIM_STATUS_ID='0'`

Write-path evidence:

- Playwright could open the page and edit `RATIO` / `REMARK1`, but clicking `保存` did not emit any update request and no update SQL appeared in Tomcat logs.
- Browser-side runtime errors were captured:
  - `boxMetadataObj.getAttribute is not a function`
- The page also requests missing legacy assets that currently return `404`:
  - `/LBIBS/webresources/component/wabacus_component.js`

Interpretation:

- `claim_dep` is restored to the point of page load and original data binding.
- Its main write path is currently blocked by a legacy Wabacus frontend/runtime asset problem, not by MySQL dialect, page SQL, or business Java logic.
- This blocker should be treated as a shared frontend-runtime issue before spending more time on page-specific save/submit debugging for `claim_dep`.

### 2026-06-27 claim-info query pages

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy`:

```bash
docker cp docker/mysql/init/33-enable-claim-info-pages.sql lbs-legacy-mysql-1:/tmp/33-enable-claim-info-pages.sql
docker exec lbs-legacy-mysql-1 sh -lc 'mysql -uwabacus -pwabacus cst < /tmp/33-enable-claim-info-pages.sql'
PAGE_URL='http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=claim_info&VUCH_NBR=LNDEMO0001&EMP_ID=admin' npm run pw:check
PAGE_URL='http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=my_claim_info&VUCH_NBR=LNDEMO0001&EMP_ID=admin' npm run pw:check
PAGEID=claimed_info npm run pw:check
```

Observed results:

- Query-page permissions are now enabled for:
  - `claim_info`
  - `my_claim_info`
  - `claimed_info`
- `claimed_info` now loads successfully and shows approved claim rows.
  - Current validated row:
    - `EXSDEMO0001 / admin / CLAIM_STATUS_ID='2'`
- `claim_info` now loads successfully for rows that have both:
  - a `T1_VUCH_EMP_RELA` claim row
  - a matching `T1_VUCH_DETAIL` voucher-detail row
  - Current validated row:
    - `LNDEMO0001 / admin`
- `my_claim_info` also loads successfully for the same validated row:
  - `LNDEMO0001 / admin`

Interpretation:

- The `claimed_info` query module is restored.
- `claim_info` and `my_claim_info` are structurally restored and usable.
- Some demo rows, such as `EXSDEMO0001`, still show `无数据` on detail pages because the current Docker demo seed only created the claim-relation row and did not provide a matching full voucher-detail row in `T1_VUCH_DETAIL`.
- That is a demo-data completeness gap, not a page runtime or MySQL compatibility blocker.

### 2026-06-27 my-claimed adjustment tab

Executed from `/Users/ryanma/work/lj-migration-lbs/legacy`:

```bash
docker cp docker/mysql/init/38-fix-my-claimed-demo-detail.sql lbs-legacy-mysql-1:/tmp/38-fix-my-claimed-demo-detail.sql
docker exec lbs-legacy-mysql-1 sh -lc 'mysql -uwabacus -pwabacus cst < /tmp/38-fix-my-claimed-demo-detail.sql'
PAGEID=my_claimed npm run pw:check
```

Observed results:

- `my_claimed` main page still loads after login.
- The `我的调整` tab now shows a restored adjustment row:
  - `LNDEMO0001 / OLD_EMP_ID='admin' / NEW_RATIO=70.00`
- Root cause of the earlier `无数据` state was demo-detail shape mismatch:
  - `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG` already had adjustment rows
  - but `IBS.T1_VUCH_DETAIL.VUCH_NBR='LNDEMO0001'` had lost `BIZ_TYPE_NM`
  - so `inner join IBS.T9_BIZ_TYPE` in `my_claimed.xml` filtered the row out

Known deferred gap:

- The original `remark_info` style "查询详情" link in the `我的调整` tab is still not restored.
- The tab currently shows raw remark text in that column.
## 2026-06-27 emp_gdq module

- `legacy/src/reportconfig/wabacus.cfg.xml` 已注册 `report/emp_gdq.xml`
- `legacy/src/reportconfig/report/basic.xml` 补回原始公共标题模板 `title.report1` / `title2.report1`
- `legacy/src/reportconfig/report/emp_gdq.xml` 已修正当前模块内的 MySQL 方言问题：
  - `emp_gdq_mod` 主查询错误的 `order by em.*`
  - `BRANCH_ORG_NM||'机关'` 改为 `CONCAT(...)`
  - `MEASURE_DT` 拼接改为 `CONCAT(...)`
- `legacy/docker/mysql/init/39-enable-emp-gdq-pages.sql` 为 `admin` 开通了 `emp_gdq_*` 页面权限
- `legacy/docker/mysql/init/40-seed-emp-gdq-demo.sql` 加入了 1 条 `emp_gdq_mod` 演示记录

### Important charset note

- 直接通过 `mysql < file.sql` 导入含中文字面量的 SQL 时，可能把中文写成错误字节
- 本次 `EMP_TYPE='过渡期'` 就曾被写成乱码，导致：
  - `mysql` CLI 查询看似有数据
  - 同一条 SQL 通过应用 JDBC(`mysql-connector-java-5.1.49`) 却返回 `0`
- 对这类种子 SQL，优先使用：
  - `mysql --default-character-set=utf8mb4 ...`
  - 或在 SQL 中使用 `CONVERT(0x... USING utf8mb4)` 十六进制字面量

### Verified state

- `emp_gdq_mod` 页面可打开
- 默认条件下可显示 1 条 `2026 / 一季度` 演示记录
- 当前状态显示为 `已保存`

### 2026-06-27 write-path verification

- `emp_gdq_mod`
  - 修改 `GDQ_ENDDT` 为 `2026-04-15` 后点击“保存”，库表已更新：
    - `T5_EMP_GDQ_OR_GZ.GDQ_ENDDT='2026-04-15'`
    - `MODIFY_TIME` 已刷新
  - 选中后点击“选中提交”，状态已从 `0` 推进到 `1`
- `emp_gdq_ver`
  - 审核页可看到同一条 `等待审核` 记录
  - 点击“通过”后，前端显示 `审核通过`
  - 库表已更新：
    - `T5_EMP_GDQ_OR_GZ.STATUS='3'`
    - `REMARK='审批通过'`
    - `VERIFY_TIME/VERIFY_PEOPLE/VERIFY_IP` 已写入

### Current data gap

- `emp_gdq_ver` 的通过动作还会执行：
  - `UPDATE IBS.T5_EMP_BZJX SET EMP_TYPE='过渡期' ...`
- 但当前 Docker 演示库中没有 `admin / 2026 / 01` 对应的 `T5_EMP_BZJX` 业务行
- 因此这一联动 SQL 已执行，但没有匹配到记录
- 这属于“缺真实业务数据”，不是当前模块链路代码阻断
