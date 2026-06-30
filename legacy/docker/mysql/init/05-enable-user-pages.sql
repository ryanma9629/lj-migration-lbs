USE cst;

DELETE FROM sys_c_app_mnlt
WHERE group_id='admin_group'
  AND page_id IN ('system_user','system_user_account','system_user_account_branch');

DELETE FROM sys_c_sec_pvlt
WHERE privilege_id='admin_priv'
  AND page_id IN ('system_user','system_user_account_form','system_user_account','system_user_account_form_branch','system_user_account_branch');

DELETE FROM sys_c_sec_page
WHERE page_id IN ('system_user','system_user_account_form','system_user_account','system_user_account_form_branch','system_user_account_branch');

INSERT INTO sys_c_sec_page(page_id,page_name,page_description,service_id,hits,lm_user,lm_time) VALUES
('system_user',CONVERT(0xE794A8E688B7E7AEA1E79086 USING utf8mb4),CONVERT(0xE794A8E688B7E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW()),
('system_user_account_form',CONVERT(0xE4BABAE59198E5B890E58FB7 USING utf8mb4),CONVERT(0xE4BABAE59198E5B890E58FB7 USING utf8mb4),'060',0,'seed',NOW()),
('system_user_account',CONVERT(0xE69CBAE69E84E5B890E58FB7E7AEA1E79086 USING utf8mb4),CONVERT(0xE69CBAE69E84E5B890E58FB7E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW()),
('system_user_account_form_branch',CONVERT(0xE4BABAE59198E5B890E58FB7 USING utf8mb4),CONVERT(0xE4BABAE59198E5B890E58FB7 USING utf8mb4),'060',0,'seed',NOW()),
('system_user_account_branch',CONVERT(0xE7BD91E782B9E5B890E58FB7E7AEA1E79086 USING utf8mb4),CONVERT(0xE7BD91E782B9E5B890E58FB7E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW());

INSERT INTO sys_c_sec_pvlt(id,privilege_id,page_id,component_id,part_type,part_id,permission_type,permission_value,lm_user,lm_time) VALUES
('pvlt_system_user','admin_priv','system_user','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_user_account_form','admin_priv','system_user_account_form','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_user_account','admin_priv','system_user_account','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_user_account_form_branch','admin_priv','system_user_account_form_branch','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_user_account_branch','admin_priv','system_user_account_branch','common_vpanel',NULL,NULL,'display','true','seed',NOW());

INSERT INTO sys_c_app_mnlt(id,menu_id,group_id,page_id,page_name,url_param,seq,is_show,lm_user,lm_time) VALUES
('mnlt_system_user','menu_system','admin_group','system_user',CONVERT(0xE794A8E688B7E7AEA1E79086 USING utf8mb4),'',9,'Y','seed',NOW()),
('mnlt_system_user_account','menu_system','admin_group','system_user_account',CONVERT(0xE69CBAE69E84E5B890E58FB7E7AEA1E79086 USING utf8mb4),'',10,'Y','seed',NOW()),
('mnlt_system_user_account_branch','menu_system','admin_group','system_user_account_branch',CONVERT(0xE7BD91E782B9E5B890E58FB7E7AEA1E79086 USING utf8mb4),'',11,'Y','seed',NOW());
