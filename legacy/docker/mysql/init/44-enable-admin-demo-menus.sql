SET NAMES utf8mb4;

USE cst;

DELETE FROM SYS_C_APP_MNLT
WHERE ID IN (
  'admin_my_claimed',
  'admin_claim_ybdb',
  'admin_claim_ybdb_verify',
  'admin_claim_dfslry',
  'admin_claim_dfslry_verify',
  'admin_claim_ln',
  'admin_claim_fnc_txn',
  'admin_claim_fnc_verify',
  'admin_claim_thd',
  'admin_claim_thd_verify',
  'admin_claim_hpf_txn',
  'admin_claim_fund_txn',
  'admin_claim_fund_cst',
  'admin_claim_fund_dt',
  'admin_claim_fund_verify',
  'admin_claim_verify_acc',
  'admin_claim_verify_accfs',
  'admin_claim_verify_exs',
  'admin_claim_verify_exs_fh',
  'admin_claim_dep',
  'admin_claim_dep_fh',
  'admin_claimed_change',
  'admin_claimed_change_fs',
  'admin_emp_gdq_mod',
  'admin_emp_gdq_ver',
  'admin_emp_gdq_query'
);

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
VALUES
  ('admin_my_claimed', 'menu_home', 'admin_group', 'my_claimed', CONVERT(0xE68891E79A84E8AEA4E9A286 USING utf8mb4), NULL, 4, 'Y', 'seed', NOW()),
  ('admin_claim_verify_acc', 'menu_home', 'admin_group', 'claim_verify_acc', CONVERT(0xE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), NULL, 19, 'Y', 'seed', NOW());

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_ybdb', 'menu_home', 'admin_group', 'claim_ybdb', PAGE_NAME, NULL, 5, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_ybdb';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_ybdb_verify', 'menu_home', 'admin_group', 'claim_ybdb_verify', PAGE_NAME, NULL, 6, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_ybdb_verify';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_dfslry', 'menu_home', 'admin_group', 'claim_dfSlry', PAGE_NAME, NULL, 7, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_dfSlry';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_dfslry_verify', 'menu_home', 'admin_group', 'claim_dfSlry_verify', PAGE_NAME, NULL, 8, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_dfSlry_verify';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_ln', 'menu_home', 'admin_group', 'claim_ln', PAGE_NAME, NULL, 9, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_ln';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fnc_txn', 'menu_home', 'admin_group', 'claim_fnc_txn', PAGE_NAME, NULL, 10, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fnc_txn';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fnc_verify', 'menu_home', 'admin_group', 'claim_fnc_verify', PAGE_NAME, NULL, 11, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fnc_verify';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_thd', 'menu_home', 'admin_group', 'claim_thd', PAGE_NAME, NULL, 12, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_thd';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_thd_verify', 'menu_home', 'admin_group', 'claim_thd_verify', PAGE_NAME, NULL, 13, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_thd_verify';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_hpf_txn', 'menu_home', 'admin_group', 'claim_hpf_txn', PAGE_NAME, NULL, 14, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_hpf_txn';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fund_txn', 'menu_home', 'admin_group', 'claim_fund_txn', PAGE_NAME, NULL, 15, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fund_txn';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fund_cst', 'menu_home', 'admin_group', 'claim_fund_cst', PAGE_NAME, NULL, 16, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fund_cst';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fund_dt', 'menu_home', 'admin_group', 'claim_fund_dt', PAGE_NAME, NULL, 17, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fund_dt';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_fund_verify', 'menu_home', 'admin_group', 'claim_fund_verify', PAGE_NAME, NULL, 18, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_fund_verify';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_verify_accfs', 'menu_home', 'admin_group', 'claim_verify_accfs', PAGE_NAME, NULL, 20, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_verify_accfs';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_verify_exs', 'menu_home', 'admin_group', 'claim_verify_exs', PAGE_NAME, NULL, 21, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_verify_exs';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_verify_exs_fh', 'menu_home', 'admin_group', 'claim_verify_exs_fh', PAGE_NAME, NULL, 22, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_verify_exs_fh';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_dep', 'menu_home', 'admin_group', 'claim_dep', PAGE_NAME, NULL, 23, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_dep';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claim_dep_fh', 'menu_home', 'admin_group', 'claim_dep_FH', PAGE_NAME, NULL, 24, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claim_dep_FH';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claimed_change', 'menu_home', 'admin_group', 'claimed_change', PAGE_NAME, NULL, 25, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claimed_change';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_claimed_change_fs', 'menu_home', 'admin_group', 'claimed_change_fs', PAGE_NAME, NULL, 26, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='claimed_change_fs';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_emp_gdq_mod', 'menu_home', 'admin_group', 'emp_gdq_mod', PAGE_NAME, NULL, 27, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='emp_gdq_mod';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_emp_gdq_ver', 'menu_home', 'admin_group', 'emp_gdq_ver', PAGE_NAME, NULL, 28, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='emp_gdq_ver';

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
SELECT 'admin_emp_gdq_query', 'menu_home', 'admin_group', 'emp_gdq_query', PAGE_NAME, NULL, 29, 'Y', 'seed', NOW()
FROM SYS_C_SEC_PAGE WHERE PAGE_ID='emp_gdq_query';
