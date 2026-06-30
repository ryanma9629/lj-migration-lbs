USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_verify_acc', 'verify_no_form');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_verify_acc', 'verify_no_form');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_verify_acc', CONVERT(0xE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('verify_no_form', CONVERT(0xE8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_verify_acc', 'admin_priv', 'claim_verify_acc', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_verify_no_form', 'admin_priv', 'verify_no_form', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
