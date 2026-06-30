USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_fnc_verify', 'claim_fnc_vfy_no');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_fnc_verify', 'claim_fnc_vfy_no');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_fnc_verify', CONVERT(0xE79086E8B4A2E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE79086E8B4A2E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_fnc_vfy_no', CONVERT(0xE79086E8B4A2E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE79086E8B4A2E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_fnc_verify', 'admin_priv', 'claim_fnc_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_fnc_vfy_no', 'admin_priv', 'claim_fnc_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
