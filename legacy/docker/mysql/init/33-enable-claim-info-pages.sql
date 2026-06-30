USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_info', 'my_claim_info', 'claimed_info');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_info', 'my_claim_info', 'claimed_info');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_info', CONVERT(0xE8AEA4E9A286E8AFA6E7BB86 USING utf8mb4), CONVERT(0xE8AEA4E9A286E8AFA6E7BB86 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('my_claim_info', CONVERT(0xE68891E79A84E8AEA4E9A286E8AFA6E7BB86 USING utf8mb4), CONVERT(0xE68891E79A84E8AEA4E9A286E8AFA6E7BB86 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claimed_info', CONVERT(0xE8AEA4E9A286E69FA5E8AFA2 USING utf8mb4), CONVERT(0xE8AEA4E9A286E69FA5E8AFA2 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_info', 'admin_priv', 'claim_info', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_my_claim_info', 'admin_priv', 'my_claim_info', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claimed_info', 'admin_priv', 'claimed_info', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
