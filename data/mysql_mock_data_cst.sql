-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: cst
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cst`
--

USE `cst`;

--
-- Dumping data for table `sys_c_app_consts`
--

LOCK TABLES `sys_c_app_consts` WRITE;
/*!40000 ALTER TABLE `sys_c_app_consts` DISABLE KEYS */;
INSERT INTO `sys_c_app_consts` (`CONST_TYPE`, `CONST_NAME`, `CONST_VALUE`, `DATA_TYPE`, `CONST_DESCRIPTION`, `SEQ`, `LM_USER`, `LM_TIME`) VALUES ('system','demo_limit','10','int','演示常量',1,'admin','2026-06-27 08:49:36'),('','','','','',NULL,'admin','2026-06-27 09:58:01'),('','','','','',NULL,'admin','2026-06-27 09:59:08');
/*!40000 ALTER TABLE `sys_c_app_consts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_app_menu`
--

LOCK TABLES `sys_c_app_menu` WRITE;
/*!40000 ALTER TABLE `sys_c_app_menu` DISABLE KEYS */;
INSERT INTO `sys_c_app_menu` (`MENU_ID`, `MENU_NAME`, `SERVICE_ID`, `SEQ`, `LM_USER`, `LM_TIME`, `MENU_TYPE`) VALUES ('menu_home','首页','060',1,'seed','2026-06-27 00:44:36','normal'),('menu_system','系统管理','060',2,'seed','2026-06-27 00:44:36','normal');
/*!40000 ALTER TABLE `sys_c_app_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_app_mnlt`
--

LOCK TABLES `sys_c_app_mnlt` WRITE;
/*!40000 ALTER TABLE `sys_c_app_mnlt` DISABLE KEYS */;
INSERT INTO `sys_c_app_mnlt` (`ID`, `MENU_ID`, `GROUP_ID`, `PAGE_ID`, `PAGE_NAME`, `URL_PARAM`, `SEQ`, `IS_SHOW`, `LM_USER`, `LM_TIME`) VALUES ('mnlt_home','menu_home','admin_group','home','首页',NULL,1,'Y','seed','2026-06-27 00:44:36'),('mnlt_system_menu','menu_system','admin_group','system_menu','菜单',NULL,1,'Y','seed','2026-06-27 00:44:36'),('mnlt_system_parameter','menu_system','admin_group','system_parameter','参数设置',NULL,2,'Y','seed','2026-06-27 00:44:36'),('mnlt_system_consts','menu_system','admin_group','system_consts','Consts设定',NULL,3,'Y','seed','2026-06-27 00:44:36'),('mnlt_system_page_list','menu_system','admin_group','system_page_list','页面管理','',4,'Y','seed','2026-06-27 08:02:49'),('mnlt_system_group','menu_system','admin_group','system_group','组权限管理','',5,'Y','seed','2026-06-27 08:02:49'),('mnlt_system_privilege','menu_system','admin_group','system_privilege','权限管理','',6,'Y','seed','2026-06-27 08:02:49'),('mnlt_system_info','menu_system','admin_group','system_info','系统公告','',7,'Y','seed','2026-06-27 08:02:49'),('mnlt_system_help','menu_system','admin_group','system_help','系统帮助','',8,'Y','seed','2026-06-27 08:02:49'),('mnlt_system_user','menu_system','admin_group','system_user','用户管理','',9,'Y','seed','2026-06-27 08:24:31'),('mnlt_system_user_account','menu_system','admin_group','system_user_account','机构帐号管理','',10,'Y','seed','2026-06-27 08:24:31'),('mnlt_system_user_account_branch','menu_system','admin_group','system_user_account_branch','网点帐号管理','',11,'Y','seed','2026-06-27 08:24:31'),('admin_claim_gold','menu_home','admin_group','claim_gold','贵金属认领',NULL,2,'Y','seed','2026-07-02 11:24:07'),('admin_claim_gold_verify','menu_home','admin_group','claim_gold_verify','贵金属认领审核',NULL,3,'Y','seed','2026-07-02 11:24:07'),('gold_claimer_home','menu_home','gold_claimer_group','home','陦页',NULL,1,'Y','seed','2026-07-02 11:24:07'),('gold_claimer_claim','menu_home','gold_claimer_group','claim_gold','贵金属认领',NULL,2,'Y','seed','2026-07-02 11:24:07'),('gold_verifier_home','menu_home','gold_verifier_group','home','陦页',NULL,1,'Y','seed','2026-07-02 11:24:07'),('gold_verifier_verify','menu_home','gold_verifier_group','claim_gold_verify','贵金属认领审核',NULL,2,'Y','seed','2026-07-02 11:24:07'),('admin_my_claimed','menu_home','admin_group','my_claimed','我的认领',NULL,4,'Y','seed','2026-07-02 11:38:31'),('admin_claim_verify_acc','menu_home','admin_group','claim_verify_acc','认领审核',NULL,19,'Y','seed','2026-07-02 11:38:31'),('admin_claim_ybdb','menu_home','admin_group','claim_ybdb','保险认领',NULL,5,'Y','seed','2026-07-02 11:38:31'),('admin_claim_ybdb_verify','menu_home','admin_group','claim_ybdb_verify','保险认领审核',NULL,6,'Y','seed','2026-07-02 11:38:31'),('admin_claim_dfslry','menu_home','admin_group','claim_dfSlry','代发工资认领',NULL,7,'Y','seed','2026-07-02 11:38:31'),('admin_claim_dfslry_verify','menu_home','admin_group','claim_dfSlry_verify','代发工资认领审核',NULL,8,'Y','seed','2026-07-02 11:38:31'),('admin_claim_ln','menu_home','admin_group','claim_ln','贷款认领',NULL,9,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fnc_txn','menu_home','admin_group','claim_fnc_txn','理财交易认领',NULL,10,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fnc_verify','menu_home','admin_group','claim_fnc_verify','理财认领审核',NULL,11,'Y','seed','2026-07-02 11:38:31'),('admin_claim_thd','menu_home','admin_group','claim_thd','第三方认领',NULL,12,'Y','seed','2026-07-02 11:38:31'),('admin_claim_thd_verify','menu_home','admin_group','claim_thd_verify','第三方存管认领审核',NULL,13,'Y','seed','2026-07-02 11:38:31'),('admin_claim_hpf_txn','menu_home','admin_group','claim_hpf_txn','公积金认领',NULL,14,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fund_txn','menu_home','admin_group','claim_fund_txn','基金交易认领',NULL,15,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fund_cst','menu_home','admin_group','claim_fund_cst','基金客户认领',NULL,16,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fund_dt','menu_home','admin_group','claim_fund_dt','基金定投认领',NULL,17,'Y','seed','2026-07-02 11:38:31'),('admin_claim_fund_verify','menu_home','admin_group','claim_fund_verify','基金认领审核',NULL,18,'Y','seed','2026-07-02 11:38:31'),('admin_claim_verify_accfs','menu_home','admin_group','claim_verify_accfs','认领审核',NULL,20,'Y','seed','2026-07-02 11:38:31'),('admin_claim_verify_exs','menu_home','admin_group','claim_verify_exs','存量客户支行认领审核',NULL,21,'Y','seed','2026-07-02 11:38:31'),('admin_claim_verify_exs_fh','menu_home','admin_group','claim_verify_exs_fh','存量客户分行认领审核',NULL,22,'Y','seed','2026-07-02 11:38:31'),('admin_claim_dep','menu_home','admin_group','claim_dep','存款认领',NULL,23,'Y','seed','2026-07-02 11:38:31'),('admin_claim_dep_fh','menu_home','admin_group','claim_dep_FH','存量储蓄存款认领',NULL,24,'Y','seed','2026-07-02 11:38:31'),('admin_claimed_change','menu_home','admin_group','claimed_change','认领调整',NULL,25,'Y','seed','2026-07-02 11:38:31'),('admin_claimed_change_fs','menu_home','admin_group','claimed_change_fs','认领调整审核',NULL,26,'Y','seed','2026-07-02 11:38:31'),('admin_emp_gdq_mod','menu_home','admin_group','emp_gdq_mod','过渡期名单',NULL,27,'Y','seed','2026-07-02 11:38:31'),('admin_emp_gdq_ver','menu_home','admin_group','emp_gdq_ver','过渡期名单审核',NULL,28,'Y','seed','2026-07-02 11:38:31'),('admin_emp_gdq_query','menu_home','admin_group','emp_gdq_query','过渡期名单查询',NULL,29,'Y','seed','2026-07-02 11:38:31');
/*!40000 ALTER TABLE `sys_c_app_mnlt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_gb_t4754`
--

LOCK TABLES `sys_c_gb_t4754` WRITE;
/*!40000 ALTER TABLE `sys_c_gb_t4754` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_c_gb_t4754` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_per_dspl`
--

LOCK TABLES `sys_c_per_dspl` WRITE;
/*!40000 ALTER TABLE `sys_c_per_dspl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_c_per_dspl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_per_fvor`
--

LOCK TABLES `sys_c_per_fvor` WRITE;
/*!40000 ALTER TABLE `sys_c_per_fvor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_c_per_fvor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_gppc`
--

LOCK TABLES `sys_c_sec_gppc` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_gppc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_c_sec_gppc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_gppv`
--

LOCK TABLES `sys_c_sec_gppv` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_gppv` DISABLE KEYS */;
INSERT INTO `sys_c_sec_gppv` (`GROUP_ID`, `PRIVILEGE_ID`, `SERVICE_ID`, `LM_USER`, `LM_TIME`) VALUES ('admin_group','admin_priv','060','seed','2026-06-27 00:44:36'),('gold_claimer_group','gold_claimer_priv','060','seed','2026-07-02 11:24:07'),('gold_verifier_group','gold_verifier_priv','060','seed','2026-07-02 11:24:07');
/*!40000 ALTER TABLE `sys_c_sec_gppv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_grop`
--

LOCK TABLES `sys_c_sec_grop` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_grop` DISABLE KEYS */;
INSERT INTO `sys_c_sec_grop` (`GROUP_ID`, `GROUP_DESCRIPTION`, `SERVICE_ID`, `LM_USER`, `LM_TIME`) VALUES ('admin_group','管理员角色','060','admin','2026-06-27 21:00:49'),('gold_claimer_group','贵金属演示认领组','060','seed','2026-07-02 11:24:07'),('gold_verifier_group','贵金属演示审核组','060','seed','2026-07-02 11:24:07');
/*!40000 ALTER TABLE `sys_c_sec_grop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_page`
--

LOCK TABLES `sys_c_sec_page` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_page` DISABLE KEYS */;
INSERT INTO `sys_c_sec_page` (`PAGE_ID`, `PAGE_NAME`, `PAGE_DESCRIPTION`, `SERVICE_ID`, `HITS`, `LM_USER`, `LM_TIME`) VALUES ('home','首页','首页','060',424,'seed','2026-06-27 00:44:36'),('system_menu','菜单','菜单维护','060',6,'seed','2026-06-27 00:44:36'),('system_parameter','参数设置','参数设置','060',49,'seed','2026-06-27 00:44:36'),('system_consts','Consts设定','Consts设定','060',51,'seed','2026-06-27 00:44:36'),('system_page_list','页面管理','系统功能页面管理','060',5,'seed','2026-06-27 08:02:49'),('system_group','组权限管理','组权限管理','060',13,'seed','2026-06-27 08:02:49'),('system_privilege','权限管理','权限管理','060',7,'seed','2026-06-27 08:02:49'),('system_info','系统公告','系统公告','060',5,'seed','2026-06-27 08:02:49'),('system_help','系统帮助','系统帮助','060',2,'seed','2026-06-27 08:02:49'),('system_user','用户管理','用户管理','060',9,'seed','2026-06-27 08:24:31'),('system_user_account_form','人员帐号','人员帐号','060',12,'seed','2026-06-27 08:24:31'),('system_user_account','机构帐号管理','机构帐号管理','060',10,'seed','2026-06-27 08:24:31'),('system_user_account_form_branch','人员帐号','人员帐号','060',2,'seed','2026-06-27 08:24:31'),('system_user_account_branch','网点帐号管理','网点帐号管理','060',4,'seed','2026-06-27 08:24:31'),('claim_ybdb','保险认领','保险认领','060',12,'seed','2026-06-27 10:10:49'),('claim_ybdb_verify','保险认领审核','保险认领审核','060',12,'seed','2026-06-27 10:10:49'),('claim_ybdb_vfy_no','保险认领审核不通过','保险认领审核不通过','060',2,'seed','2026-06-27 10:10:49'),('claim_dfSlry','代发工资认领','代发工资认领','060',6,'seed','2026-06-27 10:36:00'),('claim_dfSlry_verify','代发工资认领审核','代发工资认领审核','060',5,'seed','2026-06-27 10:36:00'),('claim_dfSlry_vfy_no','代发工资认领审核不通过','代发工资认领审核不通过','060',0,'seed','2026-06-27 10:36:00'),('claim_dep_2016qq','蛐蛐网活动存款认领','蛐蛐网活动存款认领','060',27,'seed','2026-06-27 11:11:14'),('claim_ln','贷款认领','贷款认领','060',12,'seed','2026-06-27 13:22:51'),('claim_fnc_txn','理财交易认领','理财交易认领','060',4,'seed','2026-06-27 13:44:50'),('claim_thd','第三方认领','第三方认领','060',4,'seed','2026-06-27 13:48:02'),('claim_hpf_txn','公积金认领','公积金认领','060',5,'seed','2026-06-27 13:50:26'),('claim_fnc_verify','理财认领审核','理财认领审核','060',5,'seed','2026-06-27 13:55:07'),('claim_fnc_vfy_no','理财认领审核不通过','理财认领审核不通过','060',0,'seed','2026-06-27 13:55:07'),('claim_thd_verify','第三方存管认领审核','第三方存管认领审核','060',2,'seed','2026-06-27 13:57:52'),('claim_thd_vfy_no','第三方存管认领审核不通过','第三方存管认领审核不通过','060',0,'seed','2026-06-27 13:57:52'),('claim_fund_txn','基金交易认领','基金交易认领','060',16,'seed','2026-06-27 14:06:56'),('claim_fund_cst','基金客户认领','基金客户认领','060',3,'seed','2026-06-27 14:06:56'),('claim_fund_dt','基金定投认领','基金定投认领','060',3,'seed','2026-06-27 14:06:56'),('claim_fund_verify','基金认领审核','基金认领审核','060',4,'seed','2026-06-27 14:06:56'),('claim_fund_vfy_no','基金认领审核不通过','基金认领审核不通过','060',0,'seed','2026-06-27 14:06:56'),('claim_verify_exs','存量客户支行认领审核','存量客户支行认领审核','060',6,'seed','2026-06-27 14:50:06'),('verify_no_exs','存量客户支行认领审核不通过','存量客户支行认领审核不通过','060',0,'seed','2026-06-27 14:50:06'),('claim_verify_exs_fh','存量客户分行认领审核','存量客户分行认领审核','060',5,'seed','2026-06-27 14:53:10'),('verify_no_exs_fh','存量客户分行认领审核不通过','存量客户分行认领审核不通过','060',0,'seed','2026-06-27 14:53:10'),('claim_dep','存款认领','存款认领','060',29,'seed','2026-06-27 14:59:08'),('claim_info','认领详细','认领详细','060',2,'seed','2026-06-27 15:14:05'),('my_claim_info','我的认领详细','我的认领详细','060',5,'seed','2026-06-27 15:14:05'),('claimed_info','认领查询','认领查询','060',1,'seed','2026-06-27 15:14:05'),('claim_verify_accfs','认领审核','认领审核','060',4,'seed','2026-06-27 15:16:38'),('verify_no_formfs','认领审核不通过','认领审核不通过','060',0,'seed','2026-06-27 15:16:38'),('claimed_change','认领调整','认领调整','060',10,'seed','2026-06-27 15:21:49'),('claimed_change_fs','认领调整审核','认领调整审核','060',11,'seed','2026-06-27 15:21:49'),('claimedRvs_no_formfs','认领调整审核不通过','认领调整审核不通过','060',4,'seed','2026-06-27 15:21:49'),('claim_dep_FH','存量储蓄存款认领','存量储蓄存款认领','060',21,'seed','2026-06-27 15:25:49'),('emp_gdq_mod','过渡期名单','过渡期名单','060',28,'seed','2026-06-27 20:20:24'),('emp_gdq_ver','过渡期名单审核','过渡期名单审核','060',11,'seed','2026-06-27 20:20:24'),('emp_gdq_verNo','过渡期名单审核不通过','过渡期名单审核不通过','060',2,'seed','2026-06-27 20:20:24'),('emp_gdq_query','过渡期名单查询','过渡期名单查询','060',0,'seed','2026-06-27 20:20:24'),('claim_gold','贵金属认领','贵金属认领','060',12,'seed','2026-06-30 10:00:06'),('claim_gold_verify','贵金属认领审核','贵金属认领审核','060',7,'seed','2026-06-30 10:00:06'),('claim_gold_vfy_no','贵金属认领审核不通过','贵金属认领审核不通过','060',0,'seed','2026-06-30 10:00:06'),('claim_verify_acc','认领审核','认领审核','060',0,'seed','2026-07-02 11:36:35'),('verify_no_form','认领审核不通过','认领审核不通过','060',0,'seed','2026-07-02 11:36:35');
/*!40000 ALTER TABLE `sys_c_sec_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_priv`
--

LOCK TABLES `sys_c_sec_priv` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_priv` DISABLE KEYS */;
INSERT INTO `sys_c_sec_priv` (`PRIVILEGE_ID`, `PRIORITY`, `PRIVILEGE_DESCRIPTION`, `SERVICE_ID`, `LM_USER`, `LM_TIME`) VALUES ('admin_priv',1,'管理员首页和系统页','060','seed','2026-06-27 00:44:36'),('gold_claimer_priv',1,'gold_claimer_priv','060','seed','2026-06-30 09:33:56'),('gold_verifier_priv',1,'gold_verifier_priv','060','seed','2026-06-30 09:33:56');
/*!40000 ALTER TABLE `sys_c_sec_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_pvlt`
--

LOCK TABLES `sys_c_sec_pvlt` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_pvlt` DISABLE KEYS */;
INSERT INTO `sys_c_sec_pvlt` (`ID`, `PRIVILEGE_ID`, `PAGE_ID`, `COMPONENT_ID`, `PART_TYPE`, `PART_ID`, `PERMISSION_TYPE`, `PERMISSION_VALUE`, `LM_USER`, `LM_TIME`) VALUES ('pvlt_home','admin_priv','home','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 00:44:36'),('pvlt_system_menu','admin_priv','system_menu','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 00:44:36'),('pvlt_system_parameter','admin_priv','system_parameter','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 00:44:36'),('pvlt_system_consts','admin_priv','system_consts','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 00:44:36'),('pvlt_system_page_list','admin_priv','system_page_list','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:02:49'),('pvlt_system_group','admin_priv','system_group','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:02:49'),('pvlt_system_privilege','admin_priv','system_privilege','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:02:49'),('pvlt_system_info','admin_priv','system_info','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:02:49'),('pvlt_system_help','admin_priv','system_help','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:02:49'),('pvlt_system_user','admin_priv','system_user','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:24:31'),('pvlt_system_user_account_form','admin_priv','system_user_account_form','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:24:31'),('pvlt_system_user_account','admin_priv','system_user_account','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:24:31'),('pvlt_system_user_account_form_branch','admin_priv','system_user_account_form_branch','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:24:31'),('pvlt_system_user_account_branch','admin_priv','system_user_account_branch','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 08:24:31'),('pvlt_claim_ybdb','admin_priv','claim_ybdb','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:10:49'),('pvlt_claim_ybdb_verify','admin_priv','claim_ybdb_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:10:49'),('pvlt_claim_ybdb_vfy_no','admin_priv','claim_ybdb_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:10:49'),('pvlt_claim_dfSlry','admin_priv','claim_dfSlry','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:36:00'),('pvlt_claim_dfSlry_verify','admin_priv','claim_dfSlry_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:36:00'),('pvlt_claim_dfSlry_vfy_no','admin_priv','claim_dfSlry_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 10:36:00'),('pvlt_claim_dep_2016qq','admin_priv','claim_dep_2016qq','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 11:11:14'),('pvlt_claim_ln','admin_priv','claim_ln','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:22:51'),('pvlt_claim_fnc_txn','admin_priv','claim_fnc_txn','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:44:50'),('pvlt_claim_thd','admin_priv','claim_thd','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:48:02'),('pvlt_claim_hpf_txn','admin_priv','claim_hpf_txn','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:50:26'),('pvlt_claim_fnc_verify','admin_priv','claim_fnc_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:55:07'),('pvlt_claim_fnc_vfy_no','admin_priv','claim_fnc_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:55:07'),('pvlt_claim_thd_verify','admin_priv','claim_thd_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:57:52'),('pvlt_claim_thd_vfy_no','admin_priv','claim_thd_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 13:57:52'),('pvlt_claim_fund_txn','admin_priv','claim_fund_txn','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:06:56'),('pvlt_claim_fund_cst','admin_priv','claim_fund_cst','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:06:56'),('pvlt_claim_fund_dt','admin_priv','claim_fund_dt','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:06:56'),('pvlt_claim_fund_verify','admin_priv','claim_fund_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:06:56'),('pvlt_claim_fund_vfy_no','admin_priv','claim_fund_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:06:56'),('pvlt_claim_verify_exs','admin_priv','claim_verify_exs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:50:06'),('pvlt_verify_no_exs','admin_priv','verify_no_exs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:50:06'),('pvlt_claim_verify_exs_fh','admin_priv','claim_verify_exs_fh','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:53:10'),('pvlt_verify_no_exs_fh','admin_priv','verify_no_exs_fh','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:53:10'),('pvlt_claim_dep','admin_priv','claim_dep','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 14:59:08'),('pvlt_claim_info','admin_priv','claim_info','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:14:05'),('pvlt_my_claim_info','admin_priv','my_claim_info','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:14:05'),('pvlt_claimed_info','admin_priv','claimed_info','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:14:05'),('pvlt_claim_verify_accfs','admin_priv','claim_verify_accfs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:16:38'),('pvlt_verify_no_formfs','admin_priv','verify_no_formfs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:16:38'),('pvlt_claimed_change','admin_priv','claimed_change','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:21:49'),('pvlt_claimed_change_fs','admin_priv','claimed_change_fs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:21:49'),('pvlt_claimedRvs_no_formfs','admin_priv','claimedRvs_no_formfs','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:21:49'),('pvlt_claim_dep_fh','admin_priv','claim_dep_FH','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 15:25:49'),('pvlt_emp_gdq_mod','admin_priv','emp_gdq_mod','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 20:20:24'),('pvlt_emp_gdq_ver','admin_priv','emp_gdq_ver','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 20:20:24'),('pvlt_emp_gdq_verNo','admin_priv','emp_gdq_verNo','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 20:20:24'),('pvlt_emp_gdq_query','admin_priv','emp_gdq_query','common_vpanel',NULL,NULL,'display','true','seed','2026-06-27 20:20:24'),('pvlt_claim_gold','admin_priv','claim_gold','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_claim_gold_verify','admin_priv','claim_gold_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_claim_gold_vfy_no','admin_priv','claim_gold_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_gold_claimer_home','gold_claimer_priv','home','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_gold_claimer_claim_gold','gold_claimer_priv','claim_gold','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_gold_verifier_home','gold_verifier_priv','home','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_gold_verifier_claim_gold_verify','gold_verifier_priv','claim_gold_verify','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_gold_verifier_claim_gold_vfy_no','gold_verifier_priv','claim_gold_vfy_no','common_vpanel',NULL,NULL,'display','true','seed','2026-06-30 10:00:06'),('pvlt_claim_verify_acc','admin_priv','claim_verify_acc','common_vpanel',NULL,NULL,'display','true','seed','2026-07-02 11:36:35'),('pvlt_verify_no_form','admin_priv','verify_no_form','common_vpanel',NULL,NULL,'display','true','seed','2026-07-02 11:36:35');
/*!40000 ALTER TABLE `sys_c_sec_pvlt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_user`
--

LOCK TABLES `sys_c_sec_user` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_user` DISABLE KEYS */;
INSERT INTO `sys_c_sec_user` (`USER_ID`, `USER_NAME`, `ORG_ID`, `IS_ENABLE`, `SKIN`, `LM_USER`, `LM_TIME`, `PASSWORD`, `DEPARTMENT`, `DEPT_ID`) VALUES ('admin','管理员','1000','Y','vista','admin','2026-06-27 21:07:46','Due2bkAVWVY=','IT','IT'),('claimer_gold','贵金属演示认领员','9001','Y','vista','seed','2026-07-02 11:24:07','Due2bkAVWVY=','GOLD-DEMO',NULL),('verifier_gold','贵金属演示审核员','9002','Y','vista','seed','2026-07-02 11:24:07','Due2bkAVWVY=','GOLD-DEMO',NULL);
/*!40000 ALTER TABLE `sys_c_sec_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_sec_user_group`
--

LOCK TABLES `sys_c_sec_user_group` WRITE;
/*!40000 ALTER TABLE `sys_c_sec_user_group` DISABLE KEYS */;
INSERT INTO `sys_c_sec_user_group` (`USER_ID`, `GROUP_ID`, `LM_USER`, `LM_TIME`, `UR_NO`) VALUES ('admin','admin_group','seed','2026-06-27 00:44:36','admin-admin_group'),('claimer_gold','gold_claimer_group','seed','2026-07-02 11:24:07','claimer_gold-gold_claimer_group'),('verifier_gold','gold_verifier_group','seed','2026-07-02 11:24:07','verifier_gold-gold_verifier_group');
/*!40000 ALTER TABLE `sys_c_sec_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_c_set_parm`
--

LOCK TABLES `sys_c_set_parm` WRITE;
/*!40000 ALTER TABLE `sys_c_set_parm` DISABLE KEYS */;
INSERT INTO `sys_c_set_parm` (`PARAM_TYPE`, `PARAM_NAME`, `PARAM_ID`, `PARAM_VALUE`, `SEQ`, `LM_USER`, `LM_TIME`) VALUES ('system','演示参数','demo_flag','Y',1,'seed','2026-06-27 00:44:36');
/*!40000 ALTER TABLE `sys_c_set_parm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `update_log`
--

LOCK TABLES `update_log` WRITE;
/*!40000 ALTER TABLE `update_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02 16:39:26
