USE cst;

DELETE FROM sys_c_sec_pvlt
WHERE PAGE_ID IN ('emp_gdq_mod', 'emp_gdq_ver', 'emp_gdq_verNo', 'emp_gdq_query');

DELETE FROM sys_c_sec_page
WHERE PAGE_ID IN ('emp_gdq_mod', 'emp_gdq_ver', 'emp_gdq_verNo', 'emp_gdq_query');

INSERT INTO sys_c_sec_page
  (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('emp_gdq_mod', CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95 USING utf8mb4), CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('emp_gdq_ver', CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E5AEA1E6A0B8 USING utf8mb4), CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E5AEA1E6A0B8 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('emp_gdq_verNo', CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E5AEA1E6A0B8E4B88DE9809AE8BF87 USING utf8mb4), '060', 0, 'seed', NOW()),
  ('emp_gdq_query', CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E69FA5E8AFA2 USING utf8mb4), CONVERT(0xE8BF87E6B8A1E69C9FE5908DE58D95E69FA5E8AFA2 USING utf8mb4), '060', 0, 'seed', NOW());

INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_emp_gdq_mod', 'admin_priv', 'emp_gdq_mod', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_emp_gdq_ver', 'admin_priv', 'emp_gdq_ver', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_emp_gdq_verNo', 'admin_priv', 'emp_gdq_verNo', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_emp_gdq_query', 'admin_priv', 'emp_gdq_query', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
