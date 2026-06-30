USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID='claim_ln';

DELETE FROM sys_c_sec_page
WHERE PAGE_ID='claim_ln';

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_ln', CONVERT(0xE8B4B7E6ACBEE8AEA4E9A286 USING utf8mb4), CONVERT(0xE8B4B7E6ACBEE8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_ln', 'admin_priv', 'claim_ln', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
