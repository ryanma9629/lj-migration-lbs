SET NAMES utf8mb4;

USE cst;

DELETE FROM SYS_C_APP_MNLT
WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group')
   OR ID IN ('admin_claim_gold','admin_claim_gold_verify');
DELETE FROM SYS_C_SEC_GPPV WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group');
DELETE FROM SYS_C_SEC_USER_GROUP
WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group')
   OR USER_ID IN ('claimer_gold','verifier_gold');
DELETE FROM SYS_C_SEC_USER WHERE USER_ID IN ('claimer_gold','verifier_gold');
DELETE FROM SYS_C_SEC_GROP WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group');

INSERT INTO SYS_C_SEC_USER
  (USER_ID, USER_NAME, ORG_ID, IS_ENABLE, SKIN, LM_USER, LM_TIME, PASSWORD, DEPARTMENT, DEPT_ID)
VALUES
  ('claimer_gold', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E59198 USING utf8mb4), '9001', 'Y', 'vista', 'seed', NOW(), 'Due2bkAVWVY=', 'GOLD-DEMO', NULL),
  ('verifier_gold', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE5AEA1E6A0B8E59198 USING utf8mb4), '9002', 'Y', 'vista', 'seed', NOW(), 'Due2bkAVWVY=', 'GOLD-DEMO', NULL);

INSERT INTO SYS_C_SEC_GROP
  (GROUP_ID, GROUP_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_group', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E7BB84 USING utf8mb4), '060', 'seed', NOW()),
  ('gold_verifier_group', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE5AEA1E6A0B8E7BB84 USING utf8mb4), '060', 'seed', NOW());

INSERT INTO SYS_C_SEC_USER_GROUP
  (USER_ID, GROUP_ID, LM_USER, LM_TIME, UR_NO)
VALUES
  ('claimer_gold', 'gold_claimer_group', 'seed', NOW(), 'claimer_gold-gold_claimer_group'),
  ('verifier_gold', 'gold_verifier_group', 'seed', NOW(), 'verifier_gold-gold_verifier_group');

INSERT INTO SYS_C_SEC_PRIV
  (PRIVILEGE_ID, PRIORITY, PRIVILEGE_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
SELECT 'gold_claimer_priv', 1, 'gold_claimer_priv', '060', 'seed', NOW()
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM SYS_C_SEC_PRIV WHERE PRIVILEGE_ID='gold_claimer_priv'
);

INSERT INTO SYS_C_SEC_PRIV
  (PRIVILEGE_ID, PRIORITY, PRIVILEGE_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
SELECT 'gold_verifier_priv', 1, 'gold_verifier_priv', '060', 'seed', NOW()
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM SYS_C_SEC_PRIV WHERE PRIVILEGE_ID='gold_verifier_priv'
);

INSERT INTO SYS_C_SEC_GPPV
  (GROUP_ID, PRIVILEGE_ID, SERVICE_ID, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_group', 'gold_claimer_priv', '060', 'seed', NOW()),
  ('gold_verifier_group', 'gold_verifier_priv', '060', 'seed', NOW());

INSERT INTO SYS_C_APP_MNLT
  (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
VALUES
  ('admin_claim_gold', 'menu_home', 'admin_group', 'claim_gold', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286 USING utf8mb4), NULL, 2, 'Y', 'seed', NOW()),
  ('admin_claim_gold_verify', 'menu_home', 'admin_group', 'claim_gold_verify', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), NULL, 3, 'Y', 'seed', NOW()),
  ('gold_claimer_home', 'menu_home', 'gold_claimer_group', 'home', CONVERT(0xE999A6E9A1B5 USING utf8mb4), NULL, 1, 'Y', 'seed', NOW()),
  ('gold_claimer_claim', 'menu_home', 'gold_claimer_group', 'claim_gold', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286 USING utf8mb4), NULL, 2, 'Y', 'seed', NOW()),
  ('gold_verifier_home', 'menu_home', 'gold_verifier_group', 'home', CONVERT(0xE999A6E9A1B5 USING utf8mb4), NULL, 1, 'Y', 'seed', NOW()),
  ('gold_verifier_verify', 'menu_home', 'gold_verifier_group', 'claim_gold_verify', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), NULL, 2, 'Y', 'seed', NOW());
