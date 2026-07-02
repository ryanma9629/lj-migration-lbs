USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('claim_gold', 'claim_gold_verify', 'claim_gold_vfy_no')
   OR ID IN ('pvlt_gold_claimer_home', 'pvlt_gold_verifier_home');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('claim_gold', 'claim_gold_verify', 'claim_gold_vfy_no');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('claim_gold', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286 USING utf8mb4), CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_gold_verify', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('claim_gold_vfy_no', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_claim_gold', 'admin_priv', 'claim_gold', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_gold_verify', 'admin_priv', 'claim_gold_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_claim_gold_vfy_no', 'admin_priv', 'claim_gold_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_claimer_home', 'gold_claimer_priv', 'home', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_claimer_claim_gold', 'gold_claimer_priv', 'claim_gold', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_verifier_home', 'gold_verifier_priv', 'home', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_verifier_claim_gold_verify', 'gold_verifier_priv', 'claim_gold_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_verifier_claim_gold_vfy_no', 'gold_verifier_priv', 'claim_gold_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
