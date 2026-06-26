USE cst;

DELETE FROM cst.SYS_C_SEC_USER WHERE USER_ID='admin';
DELETE FROM cst.SYS_C_SEC_USER_GROUP WHERE USER_ID='admin';
DELETE FROM cst.SYS_C_SEC_GPPV WHERE GROUP_ID='admin_group';
DELETE FROM cst.SYS_C_SEC_PVLT WHERE PRIVILEGE_ID='admin_priv';
DELETE FROM cst.SYS_C_SEC_PRIV WHERE PRIVILEGE_ID='admin_priv';
DELETE FROM cst.SYS_C_APP_MNLT WHERE GROUP_ID='admin_group' AND PAGE_ID IN ('home','system_menu','system_parameter','system_consts');
DELETE FROM cst.SYS_C_APP_MENU WHERE MENU_ID IN ('menu_home','menu_system');
DELETE FROM cst.SYS_C_SEC_PAGE WHERE PAGE_ID IN ('home','system_menu','system_parameter','system_consts');
DELETE FROM cst.SYS_C_SET_PARM WHERE PARAM_TYPE='system' AND PARAM_ID='demo_flag';
DELETE FROM cst.SYS_C_APP_CONSTS WHERE CONST_TYPE='system' AND CONST_NAME='demo_limit';
DELETE FROM cst.SYS_C_SEC_GROP WHERE GROUP_ID='admin_group';

INSERT INTO cst.SYS_C_SEC_USER (USER_ID, USER_NAME, ORG_ID, IS_ENABLE, SKIN, LM_USER, LM_TIME, PASSWORD, DEPARTMENT, DEPT_ID)
VALUES ('admin', '管理员', '1000', 'Y', 'vista', 'seed', NOW(), 'Due2bkAVWVY=', 'IT', 'IT');

INSERT INTO cst.SYS_C_SEC_GROP (GROUP_ID, GROUP_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_group', '管理员角色', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_USER_GROUP (USER_ID, GROUP_ID, LM_USER, LM_TIME, UR_NO)
VALUES ('admin', 'admin_group', 'seed', NOW(), 'admin-admin_group');

INSERT INTO cst.SYS_C_SEC_PRIV (PRIVILEGE_ID, PRIORITY, PRIVILEGE_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_priv', 1, '管理员首页和系统页', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_GPPV (GROUP_ID, PRIVILEGE_ID, SERVICE_ID, LM_USER, LM_TIME)
VALUES ('admin_group', 'admin_priv', '060', 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_PAGE (PAGE_ID, PAGE_NAME, PAGE_DESCRIPTION, SERVICE_ID, HITS, LM_USER, LM_TIME)
VALUES
  ('home', '首页', '首页', '060', 0, 'seed', NOW()),
  ('system_menu', '菜单', '菜单维护', '060', 0, 'seed', NOW()),
  ('system_parameter', '参数设置', '参数设置', '060', 0, 'seed', NOW()),
  ('system_consts', 'Consts设定', 'Consts设定', '060', 0, 'seed', NOW());

INSERT INTO cst.SYS_C_SEC_PVLT (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_home', 'admin_priv', 'home', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_menu', 'admin_priv', 'system_menu', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_parameter', 'admin_priv', 'system_parameter', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_system_consts', 'admin_priv', 'system_consts', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());

INSERT INTO cst.SYS_C_APP_MENU (MENU_ID, MENU_NAME, SERVICE_ID, SEQ, LM_USER, LM_TIME, MENU_TYPE)
VALUES
  ('menu_home', '首页', '060', 1, 'seed', NOW(), 'normal'),
  ('menu_system', '系统管理', '060', 2, 'seed', NOW(), 'normal');

INSERT INTO cst.SYS_C_APP_MNLT (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
VALUES
  ('mnlt_home', 'menu_home', 'admin_group', 'home', '首页', NULL, 1, 'Y', 'seed', NOW()),
  ('mnlt_system_menu', 'menu_system', 'admin_group', 'system_menu', '菜单', NULL, 1, 'Y', 'seed', NOW()),
  ('mnlt_system_parameter', 'menu_system', 'admin_group', 'system_parameter', '参数设置', NULL, 2, 'Y', 'seed', NOW()),
  ('mnlt_system_consts', 'menu_system', 'admin_group', 'system_consts', 'Consts设定', NULL, 3, 'Y', 'seed', NOW());

INSERT INTO cst.SYS_C_SET_PARM (PARAM_TYPE, PARAM_NAME, PARAM_ID, PARAM_VALUE, SEQ, LM_USER, LM_TIME)
VALUES ('system', '演示参数', 'demo_flag', 'Y', 1, 'seed', NOW());

INSERT INTO cst.SYS_C_APP_CONSTS (CONST_TYPE, CONST_NAME, CONST_VALUE, DATA_TYPE, CONST_DESCRIPTION, SEQ, LM_USER, LM_TIME)
VALUES ('system', 'demo_limit', '10', 'int', '演示常量', 1, 'seed', NOW());

USE ibs;

DELETE FROM ibs.T5_EMP WHERE EMP_ID='admin';
DELETE FROM ibs.T5_ORG WHERE ORG_ID='1000' AND ORG_TYPE_ID='EO';
DELETE FROM ibs.T99_MIDDLE_INCOME_SWITCH WHERE MEASURE_DT='2026-03-31';

INSERT INTO ibs.T5_ORG (ORG_ID, ORG_TYPE_ID, ORG_IP_ID, ORG_NM, ORG_LEVEL_ID, BRANCH_ORG_ID, BRANCH_ORG_NM, HEAD_ORG_ID, HEAD_ORG_NM)
VALUES ('1000', 'EO', 1000, '演示机构', '01', '1000', '演示机构', '9990', '演示总行');

INSERT INTO ibs.T5_EMP (EMP_ID, EMP_TYPE_ID, EMP_NM, GENDER, BIRTHDAY, ORG_ID, ORG_NM, BRANCH_ORG_ID, BRANCH_ORG_NM, POSITION_ID, POSITION_NM, MOBILE, PSTN_TYPE, PSTN_TYPE_NM, SUB_PSTN_TYPE, SUB_PSTN_TYPE_NM, HR_ORG_NAME)
VALUES ('admin', '01', '管理员', 'M', '1990-01-01', '1000', '演示机构', '1000', '演示机构', 1, '管理员', '13800000000', '0001', '管理员', '0001', '管理员', '信息科技部');

INSERT INTO ibs.T99_MIDDLE_INCOME_SWITCH (MEASURE_DT, SWITCH_F, REMARK)
VALUES ('2026-03-31', '1', 'seed');
