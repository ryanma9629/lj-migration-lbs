USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_fund_txn', 'claim_fund_cst', 'claim_fund_dt', 'claim_fund_verify', 'claim_fund_vfy_no');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_fund_txn', 'claim_fund_cst', 'claim_fund_dt', 'claim_fund_verify', 'claim_fund_vfy_no');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_fund_txn', CONVERT(0xE59FBAE98791E4BAA4E69893E8AEA4E9A286 USING utf8mb4), CONVERT(0xE59FBAE98791E4BAA4E69893E8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_fund_cst', CONVERT(0xE59FBAE98791E5AEA2E688B7E8AEA4E9A286 USING utf8mb4), CONVERT(0xE59FBAE98791E5AEA2E688B7E8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_fund_dt', CONVERT(0xE59FBAE98791E5AE9AE68A95E8AEA4E9A286 USING utf8mb4), CONVERT(0xE59FBAE98791E5AE9AE68A95E8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_fund_verify', CONVERT(0xE59FBAE98791E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE59FBAE98791E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_fund_vfy_no', CONVERT(0xE59FBAE98791E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE59FBAE98791E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_fund_txn', 'admin_priv', 'claim_fund_txn', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_fund_cst', 'admin_priv', 'claim_fund_cst', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_fund_dt', 'admin_priv', 'claim_fund_dt', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_fund_verify', 'admin_priv', 'claim_fund_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_fund_vfy_no', 'admin_priv', 'claim_fund_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
