USE cst;

DELETE FROM sys_c_app_mnlt
WHERE group_id='admin_group'
  AND page_id IN ('system_page_list','system_group','system_privilege','system_info','system_help');

DELETE FROM sys_c_sec_pvlt
WHERE privilege_id='admin_priv'
  AND page_id IN ('system_page_list','system_group','system_privilege','system_info','system_help');

DELETE FROM sys_c_sec_page
WHERE page_id IN ('system_page_list','system_group','system_privilege','system_info','system_help');

INSERT INTO sys_c_sec_page(page_id,page_name,page_description,service_id,hits,lm_user,lm_time) VALUES
('system_page_list',CONVERT(0xE9A1B5E99DA2E7AEA1E79086 USING utf8mb4),CONVERT(0xE7B3BBE7BB9FE58A9FE883BDE9A1B5E99DA2E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW()),
('system_group',CONVERT(0xE7BB84E69D83E99990E7AEA1E79086 USING utf8mb4),CONVERT(0xE7BB84E69D83E99990E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW()),
('system_privilege',CONVERT(0xE69D83E99990E7AEA1E79086 USING utf8mb4),CONVERT(0xE69D83E99990E7AEA1E79086 USING utf8mb4),'060',0,'seed',NOW()),
('system_info',CONVERT(0xE7B3BBE7BB9FE585ACE5918A USING utf8mb4),CONVERT(0xE7B3BBE7BB9FE585ACE5918A USING utf8mb4),'060',0,'seed',NOW()),
('system_help',CONVERT(0xE7B3BBE7BB9FE5B8AEE58AA9 USING utf8mb4),CONVERT(0xE7B3BBE7BB9FE5B8AEE58AA9 USING utf8mb4),'060',0,'seed',NOW());

INSERT INTO sys_c_sec_pvlt(id,privilege_id,page_id,component_id,part_type,part_id,permission_type,permission_value,lm_user,lm_time) VALUES
('pvlt_system_page_list','admin_priv','system_page_list','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_group','admin_priv','system_group','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_privilege','admin_priv','system_privilege','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_info','admin_priv','system_info','common_vpanel',NULL,NULL,'display','true','seed',NOW()),
('pvlt_system_help','admin_priv','system_help','common_vpanel',NULL,NULL,'display','true','seed',NOW());

INSERT INTO sys_c_app_mnlt(id,menu_id,group_id,page_id,page_name,url_param,seq,is_show,lm_user,lm_time) VALUES
('mnlt_system_page_list','menu_system','admin_group','system_page_list',CONVERT(0xE9A1B5E99DA2E7AEA1E79086 USING utf8mb4),'',4,'Y','seed',NOW()),
('mnlt_system_group','menu_system','admin_group','system_group',CONVERT(0xE7BB84E69D83E99990E7AEA1E79086 USING utf8mb4),'',5,'Y','seed',NOW()),
('mnlt_system_privilege','menu_system','admin_group','system_privilege',CONVERT(0xE69D83E99990E7AEA1E79086 USING utf8mb4),'',6,'Y','seed',NOW()),
('mnlt_system_info','menu_system','admin_group','system_info',CONVERT(0xE7B3BBE7BB9FE585ACE5918A USING utf8mb4),'',7,'Y','seed',NOW()),
('mnlt_system_help','menu_system','admin_group','system_help',CONVERT(0xE7B3BBE7BB9FE5B8AEE58AA9 USING utf8mb4),'',8,'Y','seed',NOW());
