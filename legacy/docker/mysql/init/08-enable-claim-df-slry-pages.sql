USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_dfSlry','claim_dfSlry_verify','claim_dfSlry_vfy_no');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_dfSlry','claim_dfSlry_verify','claim_dfSlry_vfy_no');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_dfSlry', CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286 USING utf8mb4), CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_dfSlry_verify', CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_dfSlry_vfy_no', CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE4BBA3E58F91E5B7A5E8B584E8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_dfSlry', 'admin_priv', 'claim_dfSlry', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_dfSlry_verify', 'admin_priv', 'claim_dfSlry_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_dfSlry_vfy_no', 'admin_priv', 'claim_dfSlry_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
