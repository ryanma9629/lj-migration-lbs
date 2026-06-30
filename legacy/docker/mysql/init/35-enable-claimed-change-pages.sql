USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claimed_change', 'claimed_change_fs', 'claimedRvs_no_formfs');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claimed_change', 'claimed_change_fs', 'claimedRvs_no_formfs');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claimed_change', CONVERT(0xE8AEA4E9A286E8B083E695B4 USING utf8mb4), CONVERT(0xE8AEA4E9A286E8B083E695B4 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claimed_change_fs', CONVERT(0xE8AEA4E9A286E8B083E695B4E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE8AEA4E9A286E8B083E695B4E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claimedRvs_no_formfs', CONVERT(0xE8AEA4E9A286E8B083E695B4E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE8AEA4E9A286E8B083E695B4E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claimed_change', 'admin_priv', 'claimed_change', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claimed_change_fs', 'admin_priv', 'claimed_change_fs', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claimedRvs_no_formfs', 'admin_priv', 'claimedRvs_no_formfs', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
