# Legacy Compatibility Backlog

This file records non-blocking compatibility gaps found during the legacy restoration work.
They should not block major module recovery unless explicitly promoted back into the main line.

## Claim Module

- `claim_fnc_detail` is now registered in the current runtime, but the page body still renders only the outer shell and an empty content area.
  - Current status:
    - `PAGEID=claim_fnc_detail` no longer fails with missing page config.
    - returned HTML contains the normal top header and page shell.
    - the inner content area under `common_vpanel` is empty in the current runtime.
    - current MySQL seed does contain matching source rows in `IBS.T1_FNC_TXN_EMP_RELA`.
  - Working interpretation:
    - this is no longer a runtime-registration problem.
    - likely a page-local rendering / component-initialization issue.
  - Suggested later follow-up:
    - inspect why `common_vpanel` children are not rendered for this page after registration.

- `claimed_relationship` is now registered in the current runtime, but still returns only a skeleton page.
  - Current status:
    - `PAGEID=claimed_relationship` no longer fails with missing page config.
    - response body contains only a hidden `claimed_relationship_url_id` span when opened through the normal page URL.
    - direct `DISPLAY_TYPE=1` access is also blank.
    - no clear Tomcat exception is emitted in the current logs during page open.
  - Working interpretation:
    - this is not a simple missing-page registration issue.
    - likely a deeper page-local render/init path problem.
  - Suggested later follow-up:
    - compare this page's component initialization path with a normal registered list page such as `claim_fnc_detail` or `system_info`.

## Page Metadata Gaps

- Some source pages can now be registered in `wabacus.cfg.xml` and still only render the outer shell with an empty content area.
  - Confirmed examples:
    - `claim_fnc_detail`
    - `claim_fnc_change`
    - `ybdb_detail`
  - Current common signal:
    - these pages are present in source and registered into the current runtime
    - but they do not exist in `CST.SYS_C_SEC_PAGE`
    - pages that do render normally, such as `system_info` and `emp_gdq_mod`, do have matching `SYS_C_SEC_PAGE` rows
  - Working interpretation:
    - for this legacy app, restoring the report XML alone is not always sufficient
    - some pages also depend on original page-metadata / permission baseline in `CST.SYS_C_SEC_PAGE` and related menu-link tables
  - Working rule:
    - do not invent missing page metadata rows by guesswork
    - recover original page-metadata exports from the old environment if these pages need to be promoted into the active restoration line

- `claim_ybdb_vfy_no` reject popup save path is not yet fully verified end-to-end.
  - Current status:
    - The popup page loads correctly.
    - The form save request returns `修改成功`.
    - Application logs show the reject update SQL is assembled and executed:
      `UPDATE IBS.T1_YBDB_EMP_RELA SET CLAIM_STATUS_ID='3' ... WHERE CLAIM_STATUS_ID='1' AND INSURE_NO=? AND EMP_ID=? AND INSURE_DATE=?`
    - But replayed HTTP save requests still leave demo row `YBDBDEMO0001` at `CLAIM_STATUS_ID='1'`.
  - Likely scope:
    - Wabacus form-save protocol / parameter binding mismatch in the manually replayed request.
    - Not currently indicating a MySQL SQL syntax problem.
  - Suggested later follow-up:
    - Capture the real browser-side save request for `claim_ybdb_vfy_no`.
    - Compare actual posted payload with the current manual replay.
    - Verify whether additional Wabacus save parameters are required for old-value binding.

- MySQL CLI output still shows Chinese text as `????` in some direct terminal queries.
  - This does not currently indicate a page rendering problem.
  - Browser-rendered pages for the restored claim chain are showing expected Chinese text.

- `claim_dfSlry_vfy_no` reject popup save path is not yet fully verified end-to-end.
  - Current status:
    - `claim_dfSlry` main page is restored.
    - `claim_dfSlry` submit flow is validated.
    - `claim_dfSlry_verify` approve flow is validated.
    - The reject popup branch has not yet been replayed and checked against MySQL state.
  - Suggested later follow-up:
    - Capture one real popup submit request from the browser.
    - Compare the posted payload with the saved form's old-value bindings.
    - Verify whether this branch has the same Wabacus cross-page save quirks seen on `claim_ybdb_vfy_no`.

## Deferred DB2 -> MySQL Dialect Work

- The claim main chain has been normalized for MySQL in the currently restored path:
  - `WITH UR` was removed from the source tree.
  - Claim submit/verify SQL string concatenation was converted from `||` to `CONCAT(...)`.
  - Verified pages after rebuild: `home`, `system_menu`, `system_parameter`, `system_consts`, `claim_ybdb`, `claim_dfSlry`, `claim_ybdb_verify`, `claim_dfSlry_verify`.

- Remaining non-blocking dialect hotspots are intentionally deferred until their parent modules are promoted into the main recovery line.
  - Branch scoring / approval pages:
    - `reportconfig/report/branch_dx.xml`
    - `reportconfig/report/branch_ratio.xml`
    - `reportconfig/report/branch_exs_ratio.xml`
    - `reportconfig/report/branch_comRatio.xml`
    - `com/customer/interceptor/BrachDxVerPassServerCallBack.java`
  - Employee / summary / reporting pages:
    - `reportconfig/report/emp_dxxz.xml`
    - `reportconfig/report/emp_profit_smy.xml`
    - `reportconfig/report/emp_sum_smy.xml`
    - `reportconfig/report/emp_dep_ln_profit_smy.xml`
    - `reportconfig/report/emp_certificate.xml`
    - `reportconfig/report/emp_gdq.xml`
  - Miscellaneous business/report pages:
    - `reportconfig/report/my_claimed.xml`
    - `reportconfig/report/commission_ratio.xml`
    - `reportconfig/report/resource_manager_yj.xml`
    - `reportconfig/report/resource_manager_yj_q.xml`

- Typical deferred patterns:
  - SQL string concatenation with `||`
  - DB2-style date/text assembly such as `TO_CHAR(...)`
  - MySQL rewrite candidates embedded in report SQL expressions and approval remarks

- Working rule:
  - Do not bulk-rewrite all remaining dialect points in advance.
  - Fix them module-by-module when that module becomes part of the active recovery target.

## My Claimed Module

- `my_claimed` has been brought into the active runtime and now loads together with:
  - `my_claim_info`
  - `remark_info`

- Current restored state:
  - `my_claimed` main page loads after login.
  - The "我的调整" tab now also shows restored demo data after fixing the demo-detail shape for `LNDEMO0001`.
  - `my_claim_info` and `remark_info` detail pages return normal HTML.
  - Current validated adjustment row:
    - `LNDEMO0001 / OLD_EMP_ID='admin' / NEW_RATIO=70.00`
  - Root cause for the earlier `无数据` state:
    - `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG` already contained adjustment rows
    - but the matching demo row in `IBS.T1_VUCH_DETAIL` had lost `BIZ_TYPE_NM`
    - which caused the `inner join IBS.T9_BIZ_TYPE` in `my_claimed.xml` to filter the row out

- Deferred detail restoration:
  - The "我的调整" tab no longer renders the original "查询详情" generated link from the Wabacus `<format/>` block.
  - It currently shows the raw `NEW_REMARK` field instead.
  - Reason:
    - The original format script triggered Wabacus/Javassist POJO generation failure during startup in the current runtime.
  - Suggested later follow-up:
    - Reintroduce the detail-link behavior with a lower-risk implementation path, preferably avoiding the failing `<format/>` code path.

## Branch Assessment Modules

- `branch_exs_ratio` is currently blocked before page-level migration work can start.
  - Current status:
    - `reportconfig/report/branch_exs_ratio.xml` is present and still references the original mod / verify / reject pages.
    - the current MySQL runtime does not contain the required core tables:
      - `IBS.T3_BRANCH_EXS_RATIO`
      - `IBS.T3_BRANCH_RATIO`
      - `IBS.T3_BRANCH_SEC_DISTRIBUTION`
  - Scope assessment:
    - this is a missing schema baseline problem, not a page-local SQL dialect issue
  - Working rule:
    - defer this module until the original branch-assessment table set can be restored into the Docker seed

## Employee Assessment Modules

- `emp_exsXz` is currently blocked by missing schema support, not by page-local MySQL syntax.
  - Current status:
    - source pages and callbacks are present:
      - `emp_exsXz_mod`
      - `emp_exsXz_ver`
      - `emp_exsXz_verNo`
      - `emp_exsXz_query`
    - main business table `IBS.T5_EMP_BZJX` exists, but is empty in the current Docker seed.
    - submit callback `EmpExsXzSubmitServerCallBack` depends on `IBS.T3_BRANCH_EXS_XZ_VAL`.
    - `IBS.T3_BRANCH_EXS_XZ_VAL` does not exist in the current MySQL schema.
    - `IBS.T9_YEAR_Q` also exists but is empty in the current Docker seed.
  - Working interpretation:
    - this module is not yet a clean “missing data only” case.
    - at least one required support table is absent from the imported schema baseline.
  - Suggested later follow-up:
    - recover the original `T3_BRANCH_EXS_XZ_VAL` table definition from the source environment or deployment DB.
    - only after that, add minimal demo rows for `T5_EMP_BZJX` and `T9_YEAR_Q`.

- `emp_dxxz` is currently blocked by missing core table `IBS.T5_EMP_DXJX_MX`.
  - Current status:
    - source pages are present:
      - `emp_dxxz`
      - `emp_dxxz_secMod`
      - `emp_dxxz_secVer`
      - `emp_dxxz_query`
    - the current MySQL schema does not contain `IBS.T5_EMP_DXJX_MX`.
  - Working interpretation:
    - this is a hard schema-baseline gap, not a report XML or MySQL dialect issue.
  - Suggested later follow-up:
    - recover the original `T5_EMP_DXJX_MX` table definition before promoting this module back into the active migration line.

- `emp_dx / emp_dx_fh / emp_dx_fh_ver / emp_dx_zh` are blocked by schema drift in `IBS.T2_EMP_DX_SCORE`.
  - Current status:
    - the current source expects `T2_EMP_DX_SCORE` to contain fields such as:
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
    - the imported MySQL table currently only contains the shorter structure from available DDL:
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
    - this means the current schema and the shipped report/callback code are from different structural baselines.
  - Working interpretation:
    - this module family cannot be restored faithfully by adding demo data alone.
    - blindly extending the table in MySQL would amount to inventing schema beyond the supplied baseline.
  - Suggested later follow-up:
    - recover the original deployed definition of `T2_EMP_DX_SCORE` from the old environment before attempting this module family.

- Shared session/runtime blocker for employee assessment pages:
  - Current status:
    - `Login.java` calculates `exam_msr_dt` from `IBS.T99_MIDDLE_INCOME_SWITCH`, but then stores `session.exam_msr_dt` as current day instead of the fetched assessment date.
    - several employee modules consume `session{exam_msr_dt}` directly in page conditions and callbacks.
  - Working interpretation:
    - this is a real runtime inconsistency worth fixing, but it should be addressed only after the missing-table / schema-drift blockers above are cleared enough to verify affected modules end-to-end.

## Claim Ln Module

- `claim_ln` main save/submit chain is now restored for demo row `LNDEMO0001`, but `REMARK1` textarea content is still not persisted in the current runtime.
  - Current status:
    - `RATIO` save works after page-scoped Wabacus cache sync.
    - Submit works and moves `CLAIM_STATUS_ID` from `0` to `1`.
    - `REMARK1` remains blank after save even when the page input is edited.
  - Likely scope:
    - Wabacus textarea save-state caching/path mismatch specific to this page.
  - Suggested later follow-up:
    - Capture the exact textarea save payload and compare it with the textbox/textarea metadata Wabacus generates for `claim_ln`.

- `claim_ln` demo submit currently leaves `FH_VERIFY_EMP_ID`, `FH_VERIFY_EMP_NM`, and `VERIFY_EMP_ID` blank.
  - Current status:
    - This does not block the transition to `CLAIM_STATUS_ID='1'`.
    - The current Docker seed has no `T9_BIZ_TYPE` or `T9_SP_GROUPID` business approval data.
- Working interpretation:
  - This is a data-gap consequence of “only schema, no original business data”, not evidence of a broken submit code path.

## Claim Fnc Txn Module

- `claim_fnc_txn` main save/submit chain is now restored for demo row `FNCDEMO0001`, but `REMARK1` textarea content is still not persisted in the current runtime.
  - Current status:
    - Save works and persists `RATIO=80.00`.
    - Submit works and moves `CLAIM_STATUS_ID` from `0` to `1`.
    - `REMARK1` remains blank after save even when the page input is edited.
  - Likely scope:
    - Same class of Wabacus textarea save-state caching mismatch seen on other restored claim pages.
  - Suggested later follow-up:
    - Capture the exact textarea save payload for `claim_fnc_txn` and compare it with the generated field metadata in the restored page JS.

## Claim Hpf Txn Module

- `claim_hpf_txn` main save/submit chain is now restored for demo row `HPFDEMO0001`, but `REMARK1` textarea content is still not persisted in the current runtime.
  - Current status:
    - Save works and persists `RATIO=80.00`.
    - Submit works and moves `CLAIM_STATUS_ID` from `0` to `1`.
    - `REMARK1` remains blank after save even when the page input is edited.
  - Likely scope:
    - Same class of Wabacus textarea save-state caching mismatch seen on `claim_fnc_txn`.
  - Suggested later follow-up:
    - Capture the exact textarea save payload for `claim_hpf_txn` and compare it with the generated field metadata in the restored page JS.

## Claim Fund Module

- `claim_fund_txn`, `claim_fund_cst`, and `claim_fund_dt` main save/submit chains are now restored, but `REMARK1` textarea content is still not persisted in the current runtime.
  - Current status:
    - Save/submit works for demo rows `FUNDTXNDEMO0001`, `FUNDCSTDEMO0001`, and `FUNDDTDEMO0001`.
    - All three demo rows can move to `CLAIM_STATUS_ID='1'`.
    - `REMARK1` remains blank after save/submit in the current runtime.
  - Likely scope:
    - Same class of Wabacus textarea save-state caching mismatch seen on other restored claim pages.
  - Suggested later follow-up:
    - Capture the exact textarea save payload for the three fund claim pages and compare it with the generated field metadata in the restored page JS.

- `claim_fund_verify` approve path is restored, but `claim_fund_vfy_no` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page loads and shows pending rows from `T1_FUND_TXN_EMP_RELA`, `T1_FUND_CST_EMP_RELA`, and `T1_FUND_DT_EMP_RELA`.
    - Single-row approve action works for demo row `FUNDCSTDEMO0001`, moving it from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `claim_fund_vfy_no` from the verify page.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still depends on old-value binding or other Wabacus cross-page save adaptation.

## Claim Gold Module

- `claim_gold_verify` approve path is restored, but `claim_gold_vfy_no` reject popup is not yet fully verified end-to-end.
  - Current status:
    - `claimer_gold` can open `claim_gold`, save demo row `GOLDDEMO1001`, and submit it.
    - `verifier_gold` can open `claim_gold_verify` and approve `GOLDDEMO1001`, moving it from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
    - Partial-ratio submit currently does not materialize the expected remainder split row in MySQL demo verification; this was observed during the restored flow and is deferred rather than patched in the application code.
  - Suggested later follow-up:
    - Open `claim_gold_vfy_no` from the verify page.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still needs current-value binding or popup-specific Wabacus save adaptation.
    - Recheck the original `SubmitClaimGold` remainder-row behavior only when we shift from demo chain recovery back to business-rule fidelity work.

## Claim Verify Acc Module

- `claim_verify_acc` approve path is restored, but `verify_no_form` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows pending row `LNDEMO0001`.
    - Single-row approve action works and moves `LNDEMO0001` / `EMP_ID='admin'` from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='21'`.
    - The current Docker seed had no original `T9_BIZ_TYPE` business dictionary data, so this module now relies on one minimal demo lookup row required by the original page join.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `verify_no_form` from `claim_verify_acc`.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still depends on old-value binding or popup-specific Wabacus save adaptation.

## Claim Verify Accfs Module

- `claim_verify_accfs` final-approval path is restored, but `verify_no_formfs` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows pending row `LNDEMO0001`.
    - Single-row approve action works and moves `LNDEMO0001` / `EMP_ID='admin'` from `CLAIM_STATUS_ID='21'` to `CLAIM_STATUS_ID='2'`.
    - Browser-side verification confirms the original confirm dialog and `POST /ShowReport.wx` action both execute normally in the restored runtime.
    - The current Docker seed continues to rely on minimal lookup/demo data rather than original production business data.
  - Suggested later follow-up:
    - Open `verify_no_formfs` from `claim_verify_accfs`.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still depends on old-value binding or popup-specific Wabacus save adaptation.

## Claim Verify Exs Module

- `claim_verify_exs` approve path is restored, but `verify_no_exs` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows pending row `EXSDEMO0001`.
    - Single-row approve action works and moves `EXSDEMO0001` / `EMP_ID='admin'` from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='21'`.
    - This module depends on the original filter `coalesce(CST_OPEN_DT,'2018-01-01')<'2018-01-01' and BIZ_TYPE_NM='储蓄存款'`, so the restored Docker seed now includes one minimal demo row and one minimal `T9_BIZ_TYPE` lookup row to satisfy that original data shape.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `verify_no_exs` from `claim_verify_exs`.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still depends on old-value binding or popup-specific Wabacus save adaptation.

## Claim Verify Exs Fh Module

- `claim_verify_exs_fh` approve path is restored, but `verify_no_exs_fh` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows branch-level pending rows at `CLAIM_STATUS_ID='21'`.
    - Single-row approve action works and moves `EXSDEMO0001` / `EMP_ID='admin'` from `CLAIM_STATUS_ID='21'` to `CLAIM_STATUS_ID='2'`.
    - This module now reuses the row produced by the restored `claim_verify_exs` chain and does not require its own extra demo business-row seed.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `verify_no_exs_fh` from `claim_verify_exs_fh`.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still depends on old-value binding or popup-specific Wabacus save adaptation.

## Claim Fnc Verify Module

- `claim_fnc_verify` approve path is restored, but `claim_fnc_vfy_no` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows pending rows.
    - Single-row approve action works and moves `FNCDEMO0001` from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `claim_fnc_vfy_no` from the verify page.
    - Submit one reject case through the real popup save flow.
    - Verify whether the popup now works with current-value bindings or still needs page-specific Wabacus save adaptation.

## Claim Thd Verify Module

- `claim_thd_verify` approve path is restored, but `claim_thd_vfy_no` reject popup is not yet fully verified end-to-end.
  - Current status:
    - Main verify page now loads and shows pending rows.
    - Single-row approve action works and moves `THD000000001` from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.
    - Reject popup branch has not yet been replayed through a full browser-side save and DB state verification cycle.
  - Suggested later follow-up:
    - Open `claim_thd_vfy_no` from the verify page.
    - Submit one reject case through the real popup save flow.
    - Verify whether this popup still needs current-value binding or popup-specific Wabacus save adaptation.

## Claim Dep Module

- `claim_dep` main save/submit chain is now restored for demo row `DEPDEMO0001`.
  - Current status:
    - Save works and persists the edited ratio and note.
    - Submit works and moves `CLAIM_STATUS_ID` from `0` to `1`.
    - The earlier apparent `claim_dep` blocker was caused by demo-data interference from `claim_dep_FH`, not by a remaining page-local runtime bug.
  - Working interpretation:
    - `claim_dep` and `claim_dep_FH` should not share the same demo voucher in the restored Docker profile.
    - `claim_dep_FH` now uses its own dedicated demo voucher `DEPFHDEMO0001`.

- `claim_dep_FH` main save chain is now restored for demo row `DEPFHDEMO0001`.
  - Current status:
    - `claim_dep_FH` is registered in `wabacus.cfg.xml` and enabled in page permissions.
    - Direct page load now uses its dedicated demo voucher:
      - `ShowReport.wx?PAGEID=claim_dep_FH&VUCH_NBR=DEPFHDEMO0001`
    - The original interceptor runs and inserts one placeholder row with `EMP_ID=''`, allowing the editable `认领信息` form to bind.
    - After switching to `wabacus-4.1.jar`, the previous `refreshComponentDisplay(...) is not a function` / `getAttribute` startup break no longer reproduces on this page.
    - Root cause for that startup break was page-local:
      - `claim_dep_FH.xml` was the only page still using manual `page onload="refreshComponentDisplay('claim_dep_FH',null)"`
      - under `wabacus-4.1.jar`, this generated a broken `claim_dep_FH_onload()` function
      - removing that page-level `onload` restored normal page startup
    - Browser-side save now emits real `POST /ShowReport.wx?...` requests after editing values.
    - MySQL now updates the placeholder row in place and persists:
      - `EMP_ID='admin'`
      - `EMP_NM='管理员'`
      - `EMP_ORG_NM='演示机构'`
      - `RATIO=100.00`
      - `CLAIM_STATUS_ID='2'`
  - Migration note:
    - This page needed one MySQL-only derived-table alias fix in its employee autocomplete SQL before the original auto-fill behavior could recover.

- Shared DB2->MySQL autocomplete pattern still exists outside the current restored main chain.
  - Current status:
    - `claim_dep_FH` is fixed, but the same `select * from (select ...)` without an alias still exists in several untouched pages such as:
      - `emp_certificate.xml`
      - `acc_rltz.xml`
      - `ln_profit_other_chg.xml`
      - `bill_inc_chg.xml`
      - `claimed_relationship.xml`
      - `middle_business_income.xml`
      - `ln_profit_bl_chg.xml`
  - Working interpretation:
    - This is a repeatable MySQL dialect gap, but it is not a reason to pause the current business-module recovery sequence.
  - Suggested later follow-up:
    - Sweep these pages only when they become active migration targets.

## Claimed Change Modules

- `claimed_change` main save/submit chain is restored.
  - Validated result:
    - save writes `RVS_RATIO` and creates/refreshes `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG`
    - submit moves `IBS.T1_VUCH_EMP_RELA.RVS_STATUS_ID` from `'0'` to `'1'`
    - submit also moves `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID` from `'0'` to `'1'`
- `claimed_change_fs` single-row approve chain is restored.
  - Validated result on `LNDEMO0001 / admin`:
    - page shows one pending row when `RVS_STATUS_ID='1'`
    - clicking `通过` removes the row from the pending list
    - `IBS.T1_VUCH_EMP_RELA` moves from `RVS_STATUS_ID='1'` to `'2'`
    - `IBS.T1_VUCH_EMP_RELA.RATIO` is finalized from `RVS_RATIO` and stays at `70.00`
    - `IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID` moves from `'1'` to `'2'`
- Remaining deferred gap:
  - `claimed_change_fs` batch approve and reject popup are patched to the same `T1/T6` update shape, but have not yet been re-verified end-to-end.

## Claim Info Query Pages

- `claim_info` and `my_claim_info` are structurally restored, but some demo rows still display `无数据` because current seed data is incomplete.
  - Current status:
    - `claim_info` works for `LNDEMO0001 / admin`.
    - `my_claim_info` works for `LNDEMO0001 / admin`.
    - `claimed_info` is restored and shows approved rows such as `EXSDEMO0001 / admin`.
    - `claim_info` and `my_claim_info` show `无数据` for `EXSDEMO0001 / admin` in the current Docker seed.
  - Likely scope:
    - demo data shape mismatch
    - `T1_VUCH_EMP_RELA` contains the claim row, but `T1_VUCH_DETAIL` does not contain the corresponding full voucher-detail row for that sample
  - Suggested later follow-up:
    - when needed for detail-page replay, add a minimal matching `T1_VUCH_DETAIL` demo row for `EXSDEMO0001` instead of changing page logic
