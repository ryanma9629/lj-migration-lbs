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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cst` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `cst`;

--
-- Table structure for table `sys_c_app_consts`
--

DROP TABLE IF EXISTS `sys_c_app_consts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_app_consts` (
  `CONST_TYPE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONST_NAME` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CONST_VALUE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DATA_TYPE` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONST_DESCRIPTION` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_app_menu`
--

DROP TABLE IF EXISTS `sys_c_app_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_app_menu` (
  `MENU_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MENU_NAME` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL,
  `MENU_TYPE` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_app_mnlt`
--

DROP TABLE IF EXISTS `sys_c_app_mnlt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_app_mnlt` (
  `ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MENU_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URL_PARAM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `IS_SHOW` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色与页面关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_gb_t4754`
--

DROP TABLE IF EXISTS `sys_c_gb_t4754`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_gb_t4754` (
  `GBT4754_FST_CD` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_FST_NM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_SEC_CD` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_SEC_NM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_TRD_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UGBT4754_TRD_NM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_CD` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_NM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_NM_PY` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GBT4754_NM_DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GBT4754_VSN` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_per_dspl`
--

DROP TABLE IF EXISTS `sys_c_per_dspl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_per_dspl` (
  `USER_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPORT_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PERSONALIZE_TYPE` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PERSONALIZE_VALUE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户报表个性化配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_per_fvor`
--

DROP TABLE IF EXISTS `sys_c_per_fvor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_per_fvor` (
  `USER_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URL_PARAM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_gppc`
--

DROP TABLE IF EXISTS `sys_c_sec_gppc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_gppc` (
  `GROUP_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHLID_GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='组页面权限控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_gppv`
--

DROP TABLE IF EXISTS `sys_c_sec_gppv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_gppv` (
  `GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRIVILEGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_grop`
--

DROP TABLE IF EXISTS `sys_c_sec_grop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_grop` (
  `GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_DESCRIPTION` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_page`
--

DROP TABLE IF EXISTS `sys_c_sec_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_page` (
  `PAGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAGE_DESCRIPTION` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='页面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_priv`
--

DROP TABLE IF EXISTS `sys_c_sec_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_priv` (
  `PRIVILEGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PRIVILEGE_DESCRIPTION` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SERVICE_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_pvlt`
--

DROP TABLE IF EXISTS `sys_c_sec_pvlt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_pvlt` (
  `ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRIVILEGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PAGE_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PART_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PART_ID` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PERMISSION_TYPE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PERMISSION_VALUE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限页面组件关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_user`
--

DROP TABLE IF EXISTS `sys_c_sec_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_user` (
  `USER_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_ENABLE` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SKIN` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL,
  `PASSWORD` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPARTMENT` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_sec_user_group`
--

DROP TABLE IF EXISTS `sys_c_sec_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_sec_user_group` (
  `USER_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL,
  `UR_NO` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_c_set_parm`
--

DROP TABLE IF EXISTS `sys_c_set_parm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_c_set_parm` (
  `PARAM_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PARAM_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARAM_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `LM_USER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `update_log`
--

DROP TABLE IF EXISTS `update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_log` (
  `KEHHAO` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KAZLCS` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZONGED` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZHU1YE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SHULNG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CKLXRM` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_USER` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LM_TIME` datetime DEFAULT NULL,
  `BEIYZF` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GNGZDW` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LXDIAH` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `XINYDJ` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DSDJZH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GSDJZH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cst'
--

--
-- Dumping routines for database 'cst'
--

--
-- Current Database: `ibs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ibs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `ibs`;

--
-- Table structure for table `cst_dep_rela`
--

DROP TABLE IF EXISTS `cst_dep_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cst_dep_rela` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `OLD_DEP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '旧部门',
  `NEW_DEP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新部门',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `REMARK1` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '重要说明',
  `REMARK2` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '特殊说明',
  `REMARK3` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '6月末说明',
  `REMARK4` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注/说明',
  `REMARK5` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简要依据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户分部门-截至20160630';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_lobby_test`
--

DROP TABLE IF EXISTS `emp_lobby_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_lobby_test` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='(测试)大堂经员工名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gold_emp_rela`
--

DROP TABLE IF EXISTS `gold_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_emp_rela` (
  `TXN_RUN_NBR` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水号',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '交易金额',
  `PRD_NUM` int(11) DEFAULT NULL COMMENT '产品数',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `MID_INC` decimal(20,3) DEFAULT NULL COMMENT '中间业务收'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（贵金属）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gold_emp_rela_bak20250205`
--

DROP TABLE IF EXISTS `gold_emp_rela_bak20250205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_emp_rela_bak20250205` (
  `TXN_RUN_NBR` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水号',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '交易金额',
  `PRD_NUM` int(11) DEFAULT NULL COMMENT '产品数',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `MID_INC` decimal(20,3) DEFAULT NULL COMMENT '中间业务收'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（贵金属）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gold_emp_smy`
--

DROP TABLE IF EXISTS `gold_emp_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_emp_smy` (
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '交易金额',
  `PRD_NUM` int(11) DEFAULT NULL COMMENT '产品数',
  `YJ_INC` decimal(20,3) DEFAULT NULL COMMENT '应计收入',
  `CST_CNT` int(11) DEFAULT '0' COMMENT '客户数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='贵金属员工销售业绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail` (
  `ACC_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(存款账户/贷款借据)',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码（CK-存款；DK-贷款）',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `PROFIT` decimal(18,3) DEFAULT NULL COMMENT '利润',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `PROFIT_OLD` decimal(18,3) DEFAULT NULL COMMENT '利润(不区分不良类)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户利润明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail_20160308`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail_20160308`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail_20160308` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACC_STATUS_ID` int(11) DEFAULT NULL,
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL,
  `FTP` decimal(10,6) DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `BAL` decimal(18,3) DEFAULT NULL,
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_AMT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail_cj`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail_cj` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACC_STATUS_ID` int(11) DEFAULT NULL,
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL,
  `FTP` decimal(10,6) DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `BAL` decimal(18,3) DEFAULT NULL,
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_AMT` decimal(18,3) DEFAULT NULL,
  `PROFIT_OLD` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail_d20161207`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail_d20161207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail_d20161207` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACC_STATUS_ID` int(11) DEFAULT NULL,
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL,
  `FTP` decimal(10,6) DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `BAL` decimal(18,3) DEFAULT NULL,
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_AMT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail_oldto20201231`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail_oldto20201231`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail_oldto20201231` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(存款账户/贷款借据)',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码（CK-存款；DK-贷款）',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `PROFIT` decimal(18,3) DEFAULT NULL COMMENT '利润',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `PROFIT_OLD` decimal(18,3) DEFAULT NULL COMMENT '利润(不区分不良类)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户利润明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_acc_profit_detail_tmp`
--

DROP TABLE IF EXISTS `t1_acc_profit_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_acc_profit_detail_tmp` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(存款账户/贷款借据)',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码（CK-存款；DK-贷款）',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `PROFIT` decimal(18,3) DEFAULT NULL COMMENT '利润',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `PROFIT_OLD` decimal(18,3) DEFAULT NULL COMMENT '利润(不区分不良类)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户利润明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_core_bckyx`
--

DROP TABLE IF EXISTS `t1_core_bckyx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_core_bckyx` (
  `KEHUZH` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KHZHLX` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KEMUCC` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZHANGH` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KAIHRQ` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CPBH03` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DSYHBH` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DSQTXX` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZHYODM` char(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEIYZF` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEIY40` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JILUZT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SHJNCH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_df_slry_emp_rela`
--

DROP TABLE IF EXISTS `t1_df_slry_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_df_slry_emp_rela` (
  `AGENT_NO` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理号',
  `ENT_ID` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业编号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构名',
  `CST_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `ENT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `BIZ_STS_ID` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务状态ID',
  `BIZ_STS_NM` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务状态',
  `RGST_DT` date DEFAULT NULL COMMENT '注册日期',
  `OPEN_DT` date DEFAULT NULL COMMENT '开通日期',
  `CNL_DT` date DEFAULT NULL COMMENT '取消日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `DEP_LINE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代发工资认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fnc_pd_smy_q`
--

DROP TABLE IF EXISTS `t1_fnc_pd_smy_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fnc_pd_smy_q` (
  `OFF_BST_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '理财表外账号',
  `MSR_PRD_ID` int(11) NOT NULL COMMENT '统计日期',
  `VIRT_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户账号',
  `VIRT_AR_TP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户账号类型',
  `AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户账号的活期账号',
  `OU_IP_ID` int(11) DEFAULT NULL COMMENT '机构号代理键',
  `OU_CODE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `OU_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `TXN_CNL` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '整合后客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `TML_TP_ID` int(11) DEFAULT NULL COMMENT '终止类型',
  `AR_LCS_TP_ID` int(11) DEFAULT NULL COMMENT '记录状态',
  `BUY_PTRN_TP_ID` int(11) DEFAULT NULL COMMENT '购买方式',
  `BIZ_SBJ_ID` int(11) DEFAULT NULL COMMENT '业务代号',
  `ACG_SBJ_ID` int(11) DEFAULT NULL COMMENT '科目号',
  `FNC_PD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品名称',
  `PD_RISK_TP_ID` int(11) DEFAULT NULL COMMENT '理财产品风险类型',
  `RATE_PRD_TP_ID` int(11) DEFAULT NULL COMMENT '年月利率标志',
  `CST_ECPT_YLD_RATE` decimal(9,6) DEFAULT NULL COMMENT '最高预期收益率',
  `RAISE_EFF_DAY` date DEFAULT NULL COMMENT '募集开始日期',
  `EFF_DT` date DEFAULT NULL COMMENT '开户日期',
  `INT_CLCN_EFF_DT` date DEFAULT NULL COMMENT '起息日期',
  `MAT_DT` date DEFAULT NULL COMMENT '到期日期',
  `END_DT` date DEFAULT NULL COMMENT '销户日期',
  `OPEN_TLR_ID` int(11) DEFAULT NULL COMMENT '开户柜员',
  `CLS_TLR_ID` int(11) DEFAULT NULL COMMENT '销户柜员',
  `RECOMMEND_PEOPLE` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `SALES_PEOPLE` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `SRC_CCY_OPN_AMT` decimal(20,3) DEFAULT NULL COMMENT '源币开户金额',
  `SRC_CCY_CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '源币余额',
  `SRC_CCY_MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '源币月日均',
  `SRC_CCY_QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '源币季日均',
  `SRC_CCY_YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '源币年日均',
  `OPN_AMT` decimal(20,3) DEFAULT NULL COMMENT '开户金额',
  `CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '年日均'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财汇总表_季末（供考核用）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fnc_pd_smy_q_cj`
--

DROP TABLE IF EXISTS `t1_fnc_pd_smy_q_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fnc_pd_smy_q_cj` (
  `OFF_BST_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MSR_PRD_ID` int(11) NOT NULL,
  `VIRT_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VIRT_AR_TP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OU_IP_ID` int(11) DEFAULT NULL,
  `OU_CODE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OU_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TXN_CNL` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TML_TP_ID` int(11) DEFAULT NULL,
  `AR_LCS_TP_ID` int(11) DEFAULT NULL,
  `BUY_PTRN_TP_ID` int(11) DEFAULT NULL,
  `BIZ_SBJ_ID` int(11) DEFAULT NULL,
  `ACG_SBJ_ID` int(11) DEFAULT NULL,
  `FNC_PD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PD_RISK_TP_ID` int(11) DEFAULT NULL,
  `RATE_PRD_TP_ID` int(11) DEFAULT NULL,
  `CST_ECPT_YLD_RATE` decimal(9,6) DEFAULT NULL,
  `RAISE_EFF_DAY` date DEFAULT NULL,
  `EFF_DT` date DEFAULT NULL,
  `INT_CLCN_EFF_DT` date DEFAULT NULL,
  `MAT_DT` date DEFAULT NULL,
  `END_DT` date DEFAULT NULL,
  `OPEN_TLR_ID` int(11) DEFAULT NULL,
  `CLS_TLR_ID` int(11) DEFAULT NULL,
  `RECOMMEND_PEOPLE` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SALES_PEOPLE` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `SRC_CCY_OPN_AMT` decimal(20,3) DEFAULT NULL,
  `SRC_CCY_CLS_BAL` decimal(20,3) DEFAULT NULL,
  `SRC_CCY_MTD_AVG_BAL` decimal(20,3) DEFAULT NULL,
  `SRC_CCY_QTD_AVG_BAL` decimal(20,3) DEFAULT NULL,
  `SRC_CCY_YTD_AVG_BAL` decimal(20,3) DEFAULT NULL,
  `OPN_AMT` decimal(20,3) DEFAULT NULL,
  `CLS_BAL` decimal(20,3) DEFAULT NULL,
  `MTD_AVG_BAL` decimal(20,3) DEFAULT NULL,
  `QTD_AVG_BAL` decimal(20,3) DEFAULT NULL,
  `YTD_AVG_BAL` decimal(20,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fnc_txn_emp_rela`
--

DROP TABLE IF EXISTS `t1_fnc_txn_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fnc_txn_emp_rela` (
  `TXN_NO` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易流水号',
  `VUCH_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) NOT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `BIZ_TYPE_CD` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `TXN_DT` date NOT NULL COMMENT '交易日期（CFM_DATE）确认日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '交易金额（CFM_AMT确认金额）',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `MID_INC` decimal(20,3) DEFAULT NULL COMMENT '中间业务收',
  `SERIAL_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '定投协议号',
  `CLIENT_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `FNC_TYP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财类型',
  `ORG_RATIO` decimal(6,2) DEFAULT NULL COMMENT '原调整比例',
  `ORG_EMP_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原认领人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财交易认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fund_cst_emp_rela`
--

DROP TABLE IF EXISTS `t1_fund_cst_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fund_cst_emp_rela` (
  `CUS_NO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证件号',
  `TXN_DT` date DEFAULT NULL COMMENT '签约日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='基金客户认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fund_cst_fee`
--

DROP TABLE IF EXISTS `t1_fund_cst_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fund_cst_fee` (
  `MSR_PRD_DT` date NOT NULL COMMENT '数据日期',
  `IN_CUS_NO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内部客户号',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `SUM_VOL` decimal(20,3) DEFAULT NULL COMMENT '总份额',
  `TRA_FEE` decimal(20,2) DEFAULT NULL COMMENT '客户服务费',
  `SL_FEE` decimal(20,2) DEFAULT NULL COMMENT '客户销售费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户手续费';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fund_dt_emp_rela`
--

DROP TABLE IF EXISTS `t1_fund_dt_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fund_dt_emp_rela` (
  `SERIAL_NO` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '定投协议号',
  `VUCH_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `TXN_DT` date NOT NULL COMMENT '签约日期',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '签约金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='基金定投认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_fund_txn_emp_rela`
--

DROP TABLE IF EXISTS `t1_fund_txn_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_fund_txn_emp_rela` (
  `TXN_NO` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易流水号',
  `VUCH_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `BIZ_TYPE_CD` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `TXN_AMT` decimal(20,3) DEFAULT NULL COMMENT '交易金额',
  `PRD_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `MID_INC` decimal(20,3) DEFAULT NULL COMMENT '中间业务收',
  `SERIAL_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '定投协议号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='基金交易认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_ln_lobby_manager_rela`
--

DROP TABLE IF EXISTS `t1_ln_lobby_manager_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_ln_lobby_manager_rela` (
  `BIZ_DIL_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借据号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工号（大堂经理）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `MANAGER_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理员工号',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='大堂经理与贷款关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷',
  `MNG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20221110`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20221110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20221110` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20230425`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20230425`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20230425` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20231031`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20231031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20231031` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20240326`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20240326`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20240326` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20250116`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20250116`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20250116` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷',
  `MNG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20250124`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20250124`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20250124` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷',
  `MNG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_20260210`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_20260210`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_20260210` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目号',
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NC科目ID',
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号',
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL COMMENT '核心业务ID',
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心业务代号名称',
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科目种类名称',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `DR` int(11) DEFAULT NULL COMMENT '借',
  `CR` int(11) DEFAULT NULL COMMENT '贷',
  `MNG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_bkp_20260316`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_bkp_20260316`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_bkp_20260316` (
  `FNC_ACG_SBJ_CD` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FNC_ACG_SBJ_ID` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CORE_BIZ_SBJ_CD` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CORE_BIZ_SBJ_ID` int(11) NOT NULL,
  `DSC` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SBJ_CGY_NM` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `DR` int(11) DEFAULT NULL,
  `CR` int(11) DEFAULT NULL,
  `MNG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco_20210811`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco_20210811`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco_20210811` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco_20230425`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco_20230425`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco_20230425` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco_20231018`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco_20231018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco_20231018` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco_20231031`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco_20231031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco_20231031` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_busi_sbj_inco_20240307`
--

DROP TABLE IF EXISTS `t1_middle_busi_sbj_inco_20240307`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_busi_sbj_inco_20240307` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `BIZ_SBJ_ID` int(11) NOT NULL COMMENT '业务代号ID',
  `CLS_BAL` decimal(18,2) DEFAULT NULL COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中间业务科目收入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_middle_business_income`
--

DROP TABLE IF EXISTS `t1_middle_business_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_middle_business_income` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `INCOME` decimal(18,2) DEFAULT NULL COMMENT '中间业务收入',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中收业绩维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_mobile_bank_emp_detail`
--

DROP TABLE IF EXISTS `t1_mobile_bank_emp_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_mobile_bank_emp_detail` (
  `MB_CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机银行客户号',
  `CORE_CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '核心客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `SIGN_DT` date DEFAULT NULL COMMENT '签约日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构',
  `RECOMMEND_PEOPLE_1` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '柜面录入推荐人',
  `RECOMMEND_PEOPLE_2` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自助录入推荐人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='手机银行签约员工推荐明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_org_acc_dep_inc_dtl`
--

DROP TABLE IF EXISTS `t1_org_acc_dep_inc_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_org_acc_dep_inc_dtl` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `OU_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构',
  `CCY_ID` int(11) NOT NULL COMMENT '币种',
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门ID',
  `MNG_LINE_TP_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理部门NM',
  `DEP_BAL` decimal(20,2) DEFAULT '0.00' COMMENT '时点余额',
  `CUR_RATE` decimal(16,8) DEFAULT '0.00000000' COMMENT '实际利率',
  `FTP_RATE` decimal(16,8) DEFAULT '0.00000000' COMMENT 'FTP利率',
  `DAY_INCOME` decimal(18,3) DEFAULT '0.000' COMMENT '本日收益',
  `MTD_INCOME` decimal(18,3) DEFAULT '0.000' COMMENT '本月累计收益',
  `QAR_INCOME` decimal(18,3) DEFAULT '0.000' COMMENT '本季度累计收益',
  `YTD_INCOME` decimal(18,3) DEFAULT '0.000' COMMENT '本年累计收益'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公司和机构存款收益明细表)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_org_acc_ln_inc_dtl`
--

DROP TABLE IF EXISTS `t1_org_acc_ln_inc_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_org_acc_ln_inc_dtl` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `OU_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构',
  `CCY_ID` int(11) NOT NULL COMMENT '币种',
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `BIZ_DIL_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借据号',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `LN_FIVE_ID` int(11) NOT NULL COMMENT '五级分类ID',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门ID',
  `MNG_LINE_TP_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理部门名称',
  `LN_BAL` decimal(20,2) DEFAULT '0.00' COMMENT '时点余额',
  `CUR_RATE` decimal(16,8) DEFAULT '0.00000000' COMMENT '实际利率',
  `FTP_RATE` decimal(16,8) DEFAULT '0.00000000' COMMENT 'FTP利率',
  `DAY_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本日收益',
  `MTD_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本月累计收益',
  `QAR_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本季度累计收益',
  `YTD_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本年累计收益',
  `DAY_EXC_BL_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本日收益',
  `MTD_EXC_BL_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本月累计收益',
  `QAR_EXC_BL_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本季度累计收益',
  `YTD_EXC_BL_INC` decimal(18,3) DEFAULT '0.000' COMMENT '本年累计收益'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公司和机构贷款账户收益明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_sales_detail`
--

DROP TABLE IF EXISTS `t1_sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_sales_detail` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售编码',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道代码',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `TXN_DT` date DEFAULT NULL COMMENT '交易日期/信用卡发卡日期',
  `VALUE_DT` date DEFAULT NULL COMMENT '起息日/信用卡激活日期',
  `MATURITY_DT` date DEFAULT NULL COMMENT '到期日',
  `TERM_DAY_CNT` int(11) DEFAULT NULL COMMENT '期限天数',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `AMT` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人类型代码',
  `RECOMMEND_PEOPLE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `RECOMMEND_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人名称',
  `RECOMMEND_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人手机号',
  `RECOMMEND_RATIO` int(11) DEFAULT NULL COMMENT '推荐人比例',
  `SALES_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人',
  `SALES_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人名称',
  `SALES_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人手机号',
  `SALES_RATIO` int(11) DEFAULT NULL COMMENT '销售人比例',
  `SALE_PROD_STATUS_ID` int(11) DEFAULT NULL COMMENT '销售产品状态代码',
  `SALE_PROD_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售产品状态名称',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `REMARK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `CLS_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财年日均',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNC_PD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财员工营销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_sales_detail_q`
--

DROP TABLE IF EXISTS `t1_sales_detail_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_sales_detail_q` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售编码',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道代码',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `TXN_DT` date DEFAULT NULL COMMENT '交易日期/信用卡发卡日期',
  `VALUE_DT` date DEFAULT NULL COMMENT '起息日/信用卡激活日期',
  `MATURITY_DT` date DEFAULT NULL COMMENT '到期日',
  `TERM_DAY_CNT` int(11) DEFAULT NULL COMMENT '期限天数',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `AMT` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人类型代码',
  `RECOMMEND_PEOPLE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `RECOMMEND_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人名称',
  `RECOMMEND_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人手机号',
  `RECOMMEND_RATIO` int(11) DEFAULT NULL COMMENT '推荐人比例',
  `SALES_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人',
  `SALES_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人名称',
  `SALES_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人手机号',
  `SALES_RATIO` int(11) DEFAULT NULL COMMENT '销售人比例',
  `SALE_PROD_STATUS_ID` int(11) DEFAULT NULL COMMENT '销售产品状态代码',
  `SALE_PROD_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售产品状态名称',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `REMARK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `CLS_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '理财年日均',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNC_PD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEASURE_DT` date DEFAULT NULL COMMENT '统计日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财员工营销_季末（供考核用）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_thd_emp_rela`
--

DROP TABLE IF EXISTS `t1_thd_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_thd_emp_rela` (
  `TXN_RUN_NBR` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水号',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `SCURT_AC` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证券账号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT '100.00' COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签约机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `IDENTN_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '签约日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（贵金属）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_acc_rela`
--

DROP TABLE IF EXISTS `t1_vuch_acc_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_acc_rela` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `IS_CD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存款凭证与账户关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_acc_rela_tmp`
--

DROP TABLE IF EXISTS `t1_vuch_acc_rela_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_acc_rela_tmp` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `IS_CD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为存单0或空否，1是，220200401日后开户的存单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存款凭证与账户关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_detail`
--

DROP TABLE IF EXISTS `t1_vuch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_detail` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `WITH_CARD_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配卡标志（1-配卡；0-不配卡）--配卡的储蓄存折不允许认领',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CLOSE_DT` date DEFAULT NULL COMMENT '销户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营销活动编号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存贷款凭证明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_detail_20251204`
--

DROP TABLE IF EXISTS `t1_vuch_detail_20251204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_detail_20251204` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WITH_CARD_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `CLOSE_DT` date DEFAULT NULL,
  `VUCH_STATUS_ID` int(11) DEFAULT NULL,
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `LN_AMT` decimal(18,3) DEFAULT NULL,
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_OPEN_DT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_detail_tmp`
--

DROP TABLE IF EXISTS `t1_vuch_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_detail_tmp` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `WITH_CARD_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配卡标志（1-配卡；0-不配卡）--配卡的储蓄存折不允许认领',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CLOSE_DT` date DEFAULT NULL COMMENT '销户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营销活动编号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='开发临时表-存贷款凭证明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '终审日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '初审日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识',
  `RVS_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人',
  `RVS_DT` date DEFAULT NULL COMMENT '调整日期',
  `RVS_CLAIM_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人',
  `RVS_CLAIM_DT` date DEFAULT NULL COMMENT '调整审批日期',
  `RVS_RATIO` decimal(6,2) DEFAULT NULL COMMENT '调整比例',
  `FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `RVS_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人姓名',
  `RVS_CLAIM_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人姓名',
  `RVS_STATUS_ID` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '调整状态1调整待审2调整已通过3调整未通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_20160407_baseline`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_20160407_baseline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_20160407_baseline` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RATIO` int(11) DEFAULT NULL,
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLAIM_DT` date DEFAULT NULL,
  `VERIFY_DT` date DEFAULT NULL,
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_20250806`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_20250806`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_20250806` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '终审日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '初审日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识',
  `RVS_STATUS_ID` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整状态1调整待审2调整已通过3调整未通过',
  `RVS_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人',
  `RVS_DT` date DEFAULT NULL COMMENT '调整日期',
  `RVS_CLAIM_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人',
  `RVS_CLAIM_DT` date DEFAULT NULL COMMENT '调整审批日期',
  `RVS_RATIO` decimal(6,2) DEFAULT NULL COMMENT '调整比例',
  `FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `RVS_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人姓名',
  `RVS_CLAIM_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人姓名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_20250812`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_20250812`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_20250812` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '终审日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '初审日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识',
  `RVS_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人',
  `RVS_DT` date DEFAULT NULL COMMENT '调整日期',
  `RVS_CLAIM_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人',
  `RVS_CLAIM_DT` date DEFAULT NULL COMMENT '调整审批日期',
  `RVS_RATIO` decimal(6,2) DEFAULT NULL COMMENT '调整比例',
  `FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `RVS_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人姓名',
  `RVS_CLAIM_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人姓名',
  `RVS_STATUS_ID` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '调整状态1调整待审2调整已通过3调整未通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_bak`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_bak` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '终审日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '初审日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识',
  `RVS_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人',
  `RVS_DT` date DEFAULT NULL COMMENT '调整日期',
  `RVS_CLAIM_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人',
  `RVS_CLAIM_DT` date DEFAULT NULL COMMENT '调整审批日期',
  `RVS_RATIO` decimal(6,2) DEFAULT NULL COMMENT '调整比例',
  `FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `RVS_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整人姓名',
  `RVS_CLAIM_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整审批人姓名',
  `RVS_STATUS_ID` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '调整状态1调整待审2调整已通过3调整未通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_20220831`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_20220831`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_20220831` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_20231231less`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_20231231less`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_20231231less` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_20250528`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_20250528`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_20250528` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_bak_20260331`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_bak_20260331`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_bak_20260331` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `RATIO` decimal(6,3) DEFAULT NULL,
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLAIM_DT` date DEFAULT NULL,
  `VERIFY_DT` date DEFAULT NULL,
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ST_LINE_TP_ID` int(11) DEFAULT NULL,
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CTR_BAL` decimal(15,2) DEFAULT NULL,
  `LN_DRDN_DT` date DEFAULT NULL,
  `LN_END_DT` date DEFAULT NULL,
  `LN_TP_ID` int(11) DEFAULT NULL,
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL,
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL,
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL,
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL,
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_test`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_test` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ST_LINE_TP_ID` int(11) DEFAULT NULL,
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CTR_AMT` decimal(15,2) DEFAULT NULL,
  `CTR_BAL` decimal(15,2) DEFAULT NULL,
  `LN_DRDN_DT` date DEFAULT NULL,
  `LN_END_DT` date DEFAULT NULL,
  `LN_TP_ID` int(11) DEFAULT NULL,
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL,
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL,
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL,
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL,
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_tmp`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_tmp` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_q_tmp_20231201`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_q_tmp_20231201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_q_tmp_20231201` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末存贷款认领关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_vuch_emp_rela_tmp`
--

DROP TABLE IF EXISTS `t1_vuch_emp_rela_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_vuch_emp_rela_tmp` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '支行审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证机构名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动编码',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '分行审批日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行审批人',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称',
  `ST_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '统计口径',
  `PROD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `CTR_NBR` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `CTR_BAL` decimal(15,2) DEFAULT NULL COMMENT '合同余额',
  `LN_DRDN_DT` date DEFAULT NULL COMMENT '发放日期',
  `LN_END_DT` date DEFAULT NULL COMMENT '终止日期',
  `LN_TP_ID` int(11) DEFAULT NULL COMMENT '贷款类型',
  `MIN_DRDN_DT_BY_CST` date DEFAULT NULL COMMENT '客户首次放款日期',
  `ADD_CST_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按客户首次放款日期',
  `ADD_CTR_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按非循环贷款',
  `ADD_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按循环贷款',
  `MNG_LINE_TP_ID` int(11) DEFAULT NULL COMMENT '管理部门',
  `ACT_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '实收利息',
  `ACR_INT_INCM` decimal(15,2) DEFAULT NULL COMMENT '应收利息',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1_ybdb_emp_rela`
--

DROP TABLE IF EXISTS `t1_ybdb_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_ybdb_emp_rela` (
  `INSURE_NO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保单号',
  `EMP_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认领员工号',
  `TA_CODE` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司代码',
  `TA_NAME` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `PRD_CODE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NAME` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品铝箔',
  `CLIENT_NO` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户编号',
  `HOLDER_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保人名称',
  `HOLDER_ID_TYPE` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保人证件类型',
  `HOLDER_ID_CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保人证件号码',
  `RELATION` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保人被保人关系',
  `INSURED_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被保人名称',
  `INSURED_ID_TYPE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被保人证件类型',
  `INSURED_ID_CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被保人证件号码',
  `BRANCH_NO` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构编号',
  `BRANCH_NO_CH` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `OPER_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员号',
  `TRANS_DATE` int(11) DEFAULT NULL COMMENT '受理日期',
  `SERIAL_NO` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '受理流水号',
  `INSURE_DATE` int(11) DEFAULT NULL COMMENT '投保日期',
  `CFM_DATE` int(11) DEFAULT NULL COMMENT '承保日期',
  `PAY_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缴费年限',
  `INSURE_YEAR_TYPE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保障年期类型',
  `INSURE_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保障年期',
  `EFFECT_DATE` int(11) DEFAULT NULL COMMENT '生效日期',
  `PAY_TYPE` int(11) DEFAULT NULL COMMENT '缴费方式',
  `PAY_TYPE_CH` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缴费方式名称',
  `PAY_YEAR_TYPE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缴费年期类型',
  `AMT` decimal(18,2) DEFAULT NULL COMMENT '保险金额',
  `INSURE_FEE` decimal(18,2) DEFAULT NULL COMMENT '保险费用',
  `BANK_ACC` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易帐号',
  `VOL` decimal(18,2) DEFAULT NULL COMMENT '投保份数',
  `STATUS` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保单状态',
  `STATUS_CH` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保单状态名称',
  `RECOMMENDER` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `RESERVE1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备用字段1',
  `RATIO` decimal(6,2) DEFAULT NULL COMMENT '认领比例',
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '支行审批日期',
  `VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行审批人',
  `FH_VERIFY_DT` date DEFAULT NULL COMMENT '分行审批日期',
  `FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行审批人',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领员工姓名',
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构',
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险保单认领关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_bonus_detail`
--

DROP TABLE IF EXISTS `t2_bonus_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_bonus_detail` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售编码',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型',
  `BONUS_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型名称',
  `MEASURE_DT` date DEFAULT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道代码',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `TXN_DT` date DEFAULT NULL COMMENT '交易日期/信用卡发卡日期',
  `VALUE_DT` date DEFAULT NULL COMMENT '起息日/信用卡激活日期',
  `MATURITY_DT` date DEFAULT NULL COMMENT '到期日',
  `TERM_DAY_CNT` int(11) DEFAULT NULL COMMENT '期限天数',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `AMT` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人类型代码',
  `RECOMMEND_PEOPLE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `RECOMMEND_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人名称',
  `RECOMMEND_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人手机号',
  `RECOMMEND_RATIO` int(11) DEFAULT NULL COMMENT '推荐人比例',
  `RECOMMEND_BONUS` decimal(18,2) DEFAULT NULL COMMENT '推荐人奖金',
  `SALES_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人',
  `SALES_PEOPLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人名称',
  `SALES_PEOPLE_MOBILE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人手机号',
  `SALES_RATIO` int(11) DEFAULT NULL COMMENT '销售人比例',
  `SALES_BONUS` decimal(18,2) DEFAULT NULL COMMENT '销售人奖金',
  `SALE_PROD_STATUS_ID` int(11) DEFAULT NULL COMMENT '销售产品状态代码',
  `SALE_PROD_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售产品状态名称',
  `BONUS_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金状态代码',
  `BONUS_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金状态名称',
  `BONUS_EFF_DT` date DEFAULT NULL COMMENT '奖金计提日期',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖金明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_cst_asset_score`
--

DROP TABLE IF EXISTS `t2_cst_asset_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_cst_asset_score` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_OPEN_DT` date DEFAULT NULL COMMENT '客户开户日期',
  `EMP_ASSET` decimal(18,2) DEFAULT NULL COMMENT '员工认领资产余额：存款+理财',
  `CST_ASSET` decimal(18,2) DEFAULT NULL COMMENT '客户资产余额：存款+理财',
  `EMP_CNT` int(11) DEFAULT NULL COMMENT '客户的客户经理数：只统计存款凭证',
  `SCORE` decimal(10,2) DEFAULT NULL COMMENT '积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户资产得分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_bill_income`
--

DROP TABLE IF EXISTS `t2_emp_bill_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_bill_income` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `BILL_INC` decimal(18,2) DEFAULT NULL COMMENT '票据收入',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `CHG_DT` date DEFAULT NULL COMMENT '调整期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公司类中间业务收入_java界面添加';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_bonus_smy`
--

DROP TABLE IF EXISTS `t2_emp_bonus_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_bonus_smy` (
  `EMP_ID` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工类型代码',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `M_FNC_PROD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月理财奖金',
  `Q_FNC_PROD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季理财奖金',
  `Y_FNC_PROD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年理财奖金',
  `M_EBANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月网银奖金',
  `Q_EBANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季网银奖金',
  `Y_EBANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年网银奖金',
  `M_MOBILE_BANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月手机银行奖金',
  `Q_MOBILE_BANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季手机银行奖金',
  `Y_MOBILE_BANK_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年手机银行奖金',
  `M_THIRD_PARTY_CUSTODY_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月第三方存管奖金',
  `Q_THIRD_PARTY_CUSTODY_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季第三方存管奖金',
  `Y_THIRD_PARTY_CUSTODY_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年第三方存管奖金',
  `M_FUND_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月基金奖金',
  `Q_FUND_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季基金奖金',
  `Y_FUND_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年基金奖金',
  `M_INSURANCE_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月保险奖金',
  `Q_INSURANCE_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季保险奖金',
  `Y_INSURANCE_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年保险奖金',
  `M_CREDIT_CARD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本月信用卡奖金',
  `Q_CREDIT_CARD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本季信用卡奖金',
  `Y_CREDIT_CARD_BONUS` decimal(18,2) DEFAULT NULL COMMENT '本年信用卡奖金',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖金汇总表.存当日、月底';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_chg_profit`
--

DROP TABLE IF EXISTS `t2_emp_chg_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_chg_profit` (
  `MSR_PRD_DT` date NOT NULL COMMENT '数据日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `PROFIT` decimal(20,2) DEFAULT '0.00' COMMENT '调整后利润',
  `RMARK` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MODIFY_PEOPLE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='其他调整';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail` (
  `ACC_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_20220823`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_20220823`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_20220823` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份20220630日数据员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_20230331`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_20230331`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_20230331` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='（临时提数用的表）员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_oldto20210818`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_oldto20210818`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_oldto20210818` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_tmp`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_tmp` (
  `ACC_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='（临时提数用的表）员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_tmp_bak`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_tmp_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_tmp_bak` (
  `ACC_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='（临时提数用的表）员工存贷款账户业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_acc_profit_detail_zrzz`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_acc_profit_detail_zrzz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_acc_profit_detail_zrzz` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（存款账户/贷款借据）',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `BONUS_TYPE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型代码',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `ACC_STATUS_ID` int(11) DEFAULT NULL COMMENT '账户状态',
  `ACC_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户状态名称',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `EXERCISE_RATE` decimal(10,6) DEFAULT NULL COMMENT '执行利率',
  `FTP` decimal(10,6) DEFAULT NULL COMMENT 'FTP',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款账户业绩明细_自然增长';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'æ— '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy_20220823`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy_20220823`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy_20220823` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份20220630日数据 员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy_20230331`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy_20230331`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy_20230331` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy_20250528`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy_20250528`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy_20250528` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'æ— '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy_tmp`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy_tmp` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'æ— ' COMMENT '新增/存量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='（临时提数）员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_profit_smy_tmp_bak`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_profit_smy_tmp_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_profit_smy_tmp_bak` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款余额',
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款月日均',
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季日均',
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年日均',
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款季利润',
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '储蓄存款年利润',
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款余额',
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款月日均',
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款季日均',
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '对公存款年日均',
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款季利润',
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '对公存款年利润',
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款余额',
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款月日均',
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款季日均',
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '同业存款年日均',
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款季利润',
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '同业存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润',
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款余额',
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款月日均',
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季日均',
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年日均',
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款季利润',
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '个人贷款年利润',
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款余额',
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款月日均',
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季日均',
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年日均',
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款季利润',
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '公司贷款年利润',
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款余额',
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款月日均',
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季日均',
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年日均',
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款季利润',
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '三农贷款年利润',
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款余额',
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款月日均',
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季日均',
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年日均',
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款季利润',
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '小企业贷款年利润',
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '存款年日均排名',
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL COMMENT '贷款年日均排名',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '加载时间',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL COMMENT '贷款季利润调整',
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款季利润调整员工',
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL COMMENT '贷款季利润调整日期',
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL COMMENT '本季公司类中间业务收入',
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL COMMENT '本年公司类中间业务收入',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'æ— ' COMMENT '新增/存量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='（临时提数）员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款业务品种代码',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新增/存量 贷款',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为风险资产',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_20220823`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_20220823`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_20220823` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份20220630日数据员工存贷款凭证业绩明细（处理小规则)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_20230331`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_20230331`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_20230331` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_20250528`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_20250528`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_20250528` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款业务品种代码',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新增/存量 贷款',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为风险资产',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_bak`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_bak` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20160331至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_oldto20210818`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_oldto20210818`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_oldto20210818` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_tmp`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款业务品种代码',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新增/存量',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为风险资产',
  `BIZ_TP_NM` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务品种名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_tmp_bak`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_tmp_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_bak` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `BIZ_TP_CD` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贷款业务品种代码',
  `NEW_OR_EXIST` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新增/存量',
  `RISK_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为风险资产'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dep_ln_vuch_profit_detail_tmp_ts`
--

DROP TABLE IF EXISTS `t2_emp_dep_ln_vuch_profit_detail_tmp_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_ts` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `BAL` decimal(18,3) DEFAULT NULL COMMENT '余额',
  `MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '月日均',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '季日均',
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '年日均',
  `VUCH_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '凭证年日均',
  `Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '季利润（兑付给客户经理的）',
  `Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '年利润（兑付给客户经理的）',
  `ACT_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际季利润',
  `ACT_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '实际年利润',
  `HQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期余额',
  `HQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '活期年日均',
  `DQ_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期余额',
  `DQ_YTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '定期年日均'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dfslry_smy`
--

DROP TABLE IF EXISTS `t2_emp_dfslry_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dfslry_smy` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行名称',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `DEP_LINE_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门',
  `QTD_TXN_AMT` decimal(20,2) DEFAULT NULL COMMENT '本季累计金额',
  `QTD_TXN_CNT` int(11) DEFAULT NULL COMMENT '本季累计笔数',
  `QTD_VUCH_CNT` int(11) DEFAULT NULL COMMENT '本季账户数',
  `QTD_ENT_CNT` int(11) DEFAULT NULL COMMENT '本季企业数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工认领的代发工资业绩代发明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dfslry_vuch_detail`
--

DROP TABLE IF EXISTS `t2_emp_dfslry_vuch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dfslry_vuch_detail` (
  `MEASURE_DT` date NOT NULL COMMENT '交易日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ENT_ID` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业编号',
  `ENT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `CST_VUCH_NBR` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户凭证号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `RATIO` decimal(20,2) DEFAULT NULL COMMENT '认领比例',
  `TXN_AMT` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `TXN_CNT` int(11) DEFAULT NULL COMMENT '笔数',
  `DEP_LINE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工认领的代发工资业绩代发明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_dx_score`
--

DROP TABLE IF EXISTS `t2_emp_dx_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_dx_score` (
  `MSR_PRD_DT` date NOT NULL COMMENT '数据日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SCORE` decimal(20,2) DEFAULT '0.00' COMMENT '分数',
  `RMARK` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工定性打分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_fnc_pd_bonus_smy`
--

DROP TABLE IF EXISTS `t2_emp_fnc_pd_bonus_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_fnc_pd_bonus_smy` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `MTD_AMT` decimal(20,3) DEFAULT NULL COMMENT '理财月销量',
  `QTD_AMT` decimal(20,3) DEFAULT NULL COMMENT '理财季销量',
  `YTD_AMT` decimal(20,3) DEFAULT NULL COMMENT '理财年销量',
  `CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财余额',
  `MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财余额日均',
  `QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财季日均',
  `YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财年日均',
  `MTD_BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财月收益',
  `QTD_BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财季收益',
  `YTD_BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财年收益',
  `RNK` int(11) DEFAULT NULL COMMENT '员工理财季销量排名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工销售理财产品排名表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_fund_smy`
--

DROP TABLE IF EXISTS `t2_emp_fund_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_fund_smy` (
  `MSR_PRD_DT` date NOT NULL COMMENT '数据日期',
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `TRA_FEE` decimal(20,2) DEFAULT NULL COMMENT '客户服务费',
  `SL_FEE` decimal(20,2) DEFAULT NULL COMMENT '销售服务费',
  `TXN_FEE` decimal(20,2) DEFAULT NULL COMMENT '销售手续费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工基金客户认领smy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_fund_smy_20240730`
--

DROP TABLE IF EXISTS `t2_emp_fund_smy_20240730`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_fund_smy_20240730` (
  `MSR_PRD_DT` date NOT NULL COMMENT '数据日期',
  `TXN_DT` date NOT NULL COMMENT '交易日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `TRA_FEE` decimal(20,2) DEFAULT NULL COMMENT '客户服务费',
  `SL_FEE` decimal(20,2) DEFAULT NULL COMMENT '销售服务费',
  `TXN_FEE` decimal(20,2) DEFAULT NULL COMMENT '销售手续费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工基金客户认领smy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_insur_bonus_smy`
--

DROP TABLE IF EXISTS `t2_emp_insur_bonus_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_insur_bonus_smy` (
  `EMP_ID` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `HR_ORG_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属部门',
  `INSUR_PREMIUM_M` decimal(18,2) DEFAULT NULL COMMENT '月保费',
  `INSUR_PREMIUM_Q` decimal(18,2) DEFAULT NULL COMMENT '季保费',
  `INSUR_PREMIUM_Y` decimal(18,2) DEFAULT NULL COMMENT '年保费',
  `INSUR_BONUS_M` decimal(18,2) DEFAULT NULL COMMENT '月保险奖金'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工销售保险汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_ln_profit_bl_chg`
--

DROP TABLE IF EXISTS `t2_emp_ln_profit_bl_chg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_ln_profit_bl_chg` (
  `MEASURE_DT` date NOT NULL COMMENT '考核期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `ORG_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证所属机构CD',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证所属机构',
  `VUCH_STS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态',
  `RATIO` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '认领比例',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '季日均',
  `QTD_PROFIT` decimal(18,3) DEFAULT '0.000' COMMENT '季利润',
  `QTD_PROFIT_OLD` decimal(18,3) DEFAULT '0.000' COMMENT '季利润（应计）',
  `PERF_STS_TP_ID` int(11) DEFAULT NULL COMMENT '正常/不良分类ID',
  `PERF_STS_TP_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正常/不良分类NM',
  `ACG_SBJ_ID` int(11) DEFAULT NULL COMMENT '科目业务代号ID',
  `MODIFY_PEOPLE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改IP',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改时间',
  `CHG_DT` date DEFAULT NULL COMMENT '调整期',
  `QTR_FST_DT` date DEFAULT NULL COMMENT '季初'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款不良业绩调整java页面录入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_ln_profit_bl_chg_20211122`
--

DROP TABLE IF EXISTS `t2_emp_ln_profit_bl_chg_20211122`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_ln_profit_bl_chg_20211122` (
  `MEASURE_DT` date NOT NULL COMMENT '考核期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `ORG_CD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证所属机构CD',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证所属机构',
  `VUCH_STS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态',
  `RATIO` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '认领比例',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '季日均',
  `QTD_PROFIT` decimal(18,3) DEFAULT '0.000' COMMENT '季利润',
  `QTD_PROFIT_OLD` decimal(18,3) DEFAULT '0.000' COMMENT '季利润（应计）',
  `PERF_STS_TP_ID` int(11) DEFAULT NULL COMMENT '正常/不良分类ID',
  `PERF_STS_TP_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正常/不良分类NM',
  `ACG_SBJ_ID` int(11) DEFAULT NULL COMMENT '科目业务代号ID',
  `MODIFY_PEOPLE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改IP',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改时间',
  `CHG_DT` date DEFAULT NULL COMMENT '调整期',
  `QTR_FST_DT` date DEFAULT NULL COMMENT '季初'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款不良业绩调整java页面录入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_ln_profit_bl_chg_tmp`
--

DROP TABLE IF EXISTS `t2_emp_ln_profit_bl_chg_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_ln_profit_bl_chg_tmp` (
  `MEASURE_DT` date NOT NULL COMMENT '考核期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `ORG_CD` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证所属机构CD',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证所属机构',
  `VUCH_STS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态',
  `RATIO` decimal(6,2) DEFAULT '0.00' COMMENT '认领比例',
  `QTD_AVG_BAL` decimal(18,3) DEFAULT '0.000' COMMENT '季日均',
  `QTD_PROFIT` decimal(18,3) DEFAULT '0.000' COMMENT '季利润',
  `QTD_PROFIT_OLD` decimal(18,3) DEFAULT '0.000' COMMENT '季利润（应计）手工调整后的利润',
  `PERF_STS_TP_ID` int(11) DEFAULT NULL COMMENT '正常/不良分类ID',
  `PERF_STS_TP_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正常/不良分类NM',
  `ACG_SBJ_ID` int(11) DEFAULT NULL COMMENT '科目业务代号ID',
  `MODIFY_PEOPLE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改IP',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改时间',
  `CHG_DT` date DEFAULT NULL COMMENT '调整期',
  `QTR_FST_DT` date DEFAULT NULL COMMENT '季初'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工存贷款不良业绩调整-手工调整表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_other_biz`
--

DROP TABLE IF EXISTS `t2_emp_other_biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_other_biz` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `BIZ_TYPE_ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '其它业务编号',
  `BIZ_TYPE_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它业务名称',
  `SCORE` decimal(10,2) DEFAULT NULL COMMENT '得分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工其它业务得分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_other_biz20190513`
--

DROP TABLE IF EXISTS `t2_emp_other_biz20190513`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_other_biz20190513` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `BIZ_TYPE_ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '其它业务编号',
  `BIZ_TYPE_NM` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它业务名称',
  `SCORE` decimal(10,2) DEFAULT NULL COMMENT '得分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工其它业务得分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_emp_thd_smy`
--

DROP TABLE IF EXISTS `t2_emp_thd_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_emp_thd_smy` (
  `OPEN_DT` date NOT NULL COMMENT '签约日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工机构名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别代码',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别代码',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SIG_CNT` decimal(20,3) DEFAULT NULL COMMENT '签约数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='第三方存管员工销售业绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_ent_cst_dep_ln_profit`
--

DROP TABLE IF EXISTS `t2_ent_cst_dep_ln_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_ent_cst_dep_ln_profit` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款余额',
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款月日均',
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款季日均',
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存款年日均',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款季利润',
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款年利润',
  `LN_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款余额贷款余额',
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款月日均',
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款季日均',
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '贷款年日均',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款季利润',
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款年利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工业绩汇总（存款+贷款+公司类中收）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_fnc_pd_bonus_detail`
--

DROP TABLE IF EXISTS `t2_fnc_pd_bonus_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_fnc_pd_bonus_detail` (
  `OFF_BST_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '理财表外账号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表外账号归属凭证',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属分行名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属机构名',
  `FNC_PD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品号',
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品名',
  `EFF_DT` date DEFAULT NULL COMMENT '销售日期',
  `INT_CLCN_EFF_DT` date DEFAULT NULL COMMENT '上划日期',
  `MAT_DT` date DEFAULT NULL COMMENT '到期日',
  `AR_LCS_TP_ID` int(11) DEFAULT NULL COMMENT '理财产品状态',
  `AR_LCS_TP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品状态名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `PRICE` decimal(10,6) DEFAULT NULL COMMENT '价格--行内收益',
  `OPN_AMT` decimal(20,3) DEFAULT NULL COMMENT '理财销售金额',
  `EMP_AMT` decimal(20,3) DEFAULT NULL COMMENT '归属员工理财销售金额',
  `RATIO` int(11) DEFAULT NULL COMMENT '认领比例',
  `CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财余额',
  `MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财月日均',
  `QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财季日均',
  `YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财年日均',
  `EMP_CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财余额',
  `EMP_MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财月日均',
  `EMP_QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财季日均',
  `EMP_YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财年日均',
  `BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财收益',
  `EMP_BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财收益',
  `BONUS_EFF_DT` date DEFAULT NULL COMMENT '理财收益生效日期',
  `BONUS_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财收益状态-未计提;已计提'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财产品奖金明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_fnc_pd_bonus_detail_tmp`
--

DROP TABLE IF EXISTS `t2_fnc_pd_bonus_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_fnc_pd_bonus_detail_tmp` (
  `OFF_BST_AR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '理财表外账号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表外账号归属凭证',
  `CST_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属分行名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财归属机构名',
  `FNC_PD_CD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品号',
  `FNC_PD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品名',
  `EFF_DT` date DEFAULT NULL COMMENT '销售日期',
  `INT_CLCN_EFF_DT` date DEFAULT NULL COMMENT '上划日期',
  `MAT_DT` date DEFAULT NULL COMMENT '到期日',
  `AR_LCS_TP_ID` int(11) DEFAULT NULL COMMENT '理财产品状态',
  `AR_LCS_TP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财产品状态名称',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `PRICE` decimal(10,6) DEFAULT NULL COMMENT '价格--行内收益',
  `OPN_AMT` decimal(20,3) DEFAULT NULL COMMENT '归属员工理财销售金额',
  `EMP_AMT` decimal(20,3) DEFAULT NULL,
  `RATIO` int(11) DEFAULT NULL COMMENT '认领比例',
  `CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财余额',
  `MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财月日均',
  `QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财季日均',
  `YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '理财年日均',
  `EMP_CLS_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财余额',
  `EMP_MTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财月日均',
  `EMP_QTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财季日均',
  `EMP_YTD_AVG_BAL` decimal(20,3) DEFAULT NULL COMMENT '归属员工的理财年日均',
  `BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财收益',
  `EMP_BONUS` decimal(20,3) DEFAULT NULL COMMENT '理财收益',
  `BONUS_EFF_DT` date DEFAULT NULL COMMENT '理财收益生效日期',
  `BONUS_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '理财收益状态-未计提;已计提'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财产品奖金明细临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_ibs_cst_asset`
--

DROP TABLE IF EXISTS `t2_ibs_cst_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_ibs_cst_asset` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `DEP_BAL` decimal(18,2) DEFAULT NULL COMMENT '客户存款余额',
  `FNC_BAL` decimal(18,2) DEFAULT NULL COMMENT '客户理财余额',
  `FUND_BAL` decimal(18,2) DEFAULT NULL COMMENT '客户基金余额',
  `INSUR_BAL` decimal(18,2) DEFAULT NULL COMMENT '客户基金余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户资产合计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_insur_bonus_detail`
--

DROP TABLE IF EXISTS `t2_insur_bonus_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_insur_bonus_detail` (
  `INSUR_PRINT_ID` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保单印刷号',
  `EMP_ID` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `TLR_OR_SALE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '柜员或销售员工',
  `MEASURE_DT` date DEFAULT NULL COMMENT '统计日期(考核日期)',
  `TXN_DT` date DEFAULT NULL COMMENT '销售日期',
  `EFF_DT` date DEFAULT NULL COMMENT '生效日期--过了犹豫期（销售日期+16天）',
  `EFF_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保单状态：1-犹豫期内退保,null-犹豫期内没有退保',
  `CST_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `INSUR_CORP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险公司名称',
  `INSUR_PROD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险产品编号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名称',
  `INSUR_PREMIUM` decimal(18,2) DEFAULT NULL COMMENT '保费',
  `PRICE` decimal(10,4) DEFAULT NULL COMMENT '保险手续费率',
  `RATIO` decimal(10,4) DEFAULT NULL COMMENT '认领比例：经办柜员20%;销售员工80%',
  `BONUS` decimal(18,2) DEFAULT NULL COMMENT '收入(未乘提成比例)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险产品奖励明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_ln_lobby_manager_bonus_detail`
--

DROP TABLE IF EXISTS `t2_ln_lobby_manager_bonus_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_ln_lobby_manager_bonus_detail` (
  `BIZ_DIL_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借据号',
  `LOBBY_MANAGER` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '大堂经理员工号',
  `LOBBY_MANAGER_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理姓名',
  `LOBBY_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理归属机构',
  `LOBBY_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理归属机构名称',
  `LOBBY_BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理归属分行',
  `LOBBY_BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理归属分行名称',
  `LOBBY_SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大堂经理子考核类别名称',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户经理员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理姓名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理归属机构',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理归属机构名称',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理归属分行',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理归属分行名称',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户经理子考核类别名称',
  `CLAIM_DT` date DEFAULT NULL COMMENT '认领日期',
  `VERIFY_DT` date DEFAULT NULL COMMENT '审批日期',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `VUCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证归属机构',
  `VUCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证归属机构名称',
  `VUCH_BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证归属分行',
  `VUCH_BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证归属分行名称',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品编号',
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `LN_AMT` decimal(18,3) DEFAULT NULL COMMENT '贷款金额',
  `PRICE` decimal(18,2) DEFAULT NULL COMMENT '价格',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `BONUS` decimal(18,3) DEFAULT NULL COMMENT '奖金',
  `BONUS_EFF_DT` date DEFAULT NULL COMMENT '奖金计提日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='大堂经理推荐贷款奖金明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_ou_dfslry_smy`
--

DROP TABLE IF EXISTS `t2_ou_dfslry_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_ou_dfslry_smy` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `DEP_LINE_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QTD_TXN_AMT` decimal(20,2) DEFAULT NULL COMMENT '本季金额',
  `QTD_TXN_CNT` int(11) DEFAULT NULL COMMENT '本季笔数',
  `QTD_VUCH_CNT` int(11) DEFAULT NULL COMMENT '本季账户数',
  `QTD_ENT_CNT` int(11) DEFAULT NULL COMMENT '本季企业数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代发工资机构汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t2_ybdb_ins_detail`
--

DROP TABLE IF EXISTS `t2_ybdb_ins_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2_ybdb_ins_detail` (
  `INSURE_NO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保单号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `PRD_CD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `PRD_NM` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `COM_CD` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司代码',
  `COM_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `PAY_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缴费年限',
  `PAY_TYPE_CH` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缴费方式名称',
  `ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保单状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保单状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `TXN_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '交易金额',
  `MID_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '中收金额',
  `PER_FEE` decimal(20,2) DEFAULT '0.00' COMMENT '人力费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险保单交易明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_banus_share_ratio`
--

DROP TABLE IF EXISTS `t3_banus_share_ratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_banus_share_ratio` (
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道代码',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `RECOMMEND_RATIO` int(11) DEFAULT NULL COMMENT '推荐人比例',
  `SALES_RATIO` int(11) DEFAULT NULL COMMENT '销售人比例',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分润比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_commission_ratio`
--

DROP TABLE IF EXISTS `t3_commission_ratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_commission_ratio` (
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '年度',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '子考核类别',
  `COMMISSION` decimal(18,10) DEFAULT NULL COMMENT '提成比例',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提成比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_credit_card_price`
--

DROP TABLE IF EXISTS `t3_credit_card_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_credit_card_price` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `NEW_CARD_PRICE` decimal(18,10) DEFAULT NULL COMMENT '新卡价格',
  `OLD_CARD_PRICE` decimal(18,10) DEFAULT NULL COMMENT '旧卡价格',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生效标志',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='信用卡价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_fnc_price`
--

DROP TABLE IF EXISTS `t3_fnc_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_fnc_price` (
  `EFF_DT` date NOT NULL COMMENT '生效日期',
  `PRICE` decimal(8,6) DEFAULT NULL COMMENT '理财产品我行收益率',
  `EFF_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记录生效标志（生效的记录只能有一条）：1-生效；0-失效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='当前员工员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_fnc_prod_price`
--

DROP TABLE IF EXISTS `t3_fnc_prod_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_fnc_prod_price` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道代码',
  `TERM_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '期限区间代码',
  `AMT_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额区间代码',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_insur_prod_price`
--

DROP TABLE IF EXISTS `t3_insur_prod_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_insur_prod_price` (
  `INSUR_PROD_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保险产品编号',
  `INSUR_PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险产品名称',
  `INSUR_CORP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险公司编号',
  `INSUR_CORP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险公司名称',
  `PAY_TYPE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交费类型：5-趸交;1-期交',
  `PAY_PERIOD` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交费年期',
  `PRICE` decimal(10,4) DEFAULT NULL COMMENT '手续费率'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险产品手续费率';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_per_fnc_qual`
--

DROP TABLE IF EXISTS `t3_per_fnc_qual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_per_fnc_qual` (
  `PER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `PER_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工姓名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `PER_IDENT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `PER_POSTITION_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `QUAL_BANK_PUB_NUMBER` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公共基础证书号',
  `QUAL_BANK_OLD_FNC_NUMBER` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '旧个人理财证书号',
  `QUAL_BANK_NEW_FNC_NUMBER` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新个人理财证书号',
  `QUAL_AFP_NUMBER` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'AFP证书号',
  `QUAL_CFP_NUMBER` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CFP证书号',
  `REMARK` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '填写人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '填写时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '填写IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工理财资格统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_personal_ln_price`
--

DROP TABLE IF EXISTS `t3_personal_ln_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_personal_ln_price` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编号',
  `AMT_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额区间代码',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='个人贷款价格表(大堂经理)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_emp_smy`
--

DROP TABLE IF EXISTS `t3_resource_manager_emp_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_emp_smy` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理(未正式入职)业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_emp_smy20210120`
--

DROP TABLE IF EXISTS `t3_resource_manager_emp_smy20210120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_emp_smy20210120` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='由于要修改员工100135的考核基期先备份 资源型客户经理(未正式入职)业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_emp_smy20211011`
--

DROP TABLE IF EXISTS `t3_resource_manager_emp_smy20211011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_emp_smy20211011` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理(未正式入职)业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_emp_smy_bak`
--

DROP TABLE IF EXISTS `t3_resource_manager_emp_smy_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_emp_smy_bak` (
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份表to20201130资源型客户经理(未正式入职)业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_smy`
--

DROP TABLE IF EXISTS `t3_resource_manager_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_smy` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID_OLD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转正前员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行名',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `ASSESSMENT` decimal(18,2) DEFAULT NULL COMMENT '考核标准',
  `DAY_DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '考核基期存量日均',
  `DEP_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款余额',
  `DEP_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款季日均',
  `DEP_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '存款季模拟利润',
  `LN_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款余额',
  `LN_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款季日均',
  `LN_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '贷款模拟利润',
  `DEP_QTD_AVG_BAL_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增=存款季日均-考核基期存量日均',
  `ASSESSMENT_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增较考核标准=日均新增-考核标准',
  `TOTAL_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '季实际利润(20191025不用了)',
  `DEP_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '存款季实际利润',
  `LN_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '贷款季实际利润 存量',
  `LN_QTD_PROFIT_SJ_ADD` decimal(18,2) DEFAULT '0.00' COMMENT '贷款季实际利润 新增'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源类客户经理业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_smy20211203`
--

DROP TABLE IF EXISTS `t3_resource_manager_smy20211203`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_smy20211203` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID_OLD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转正前员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行名',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `ASSESSMENT` decimal(18,2) DEFAULT NULL COMMENT '考核标准',
  `DAY_DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '考核基期存量日均',
  `DEP_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款余额',
  `DEP_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款季日均',
  `DEP_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '存款季模拟利润',
  `LN_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款余额',
  `LN_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款季日均',
  `LN_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '贷款模拟利润',
  `DEP_QTD_AVG_BAL_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增=存款季日均-考核基期存量日均',
  `ASSESSMENT_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增较考核标准=日均新增-考核标准',
  `TOTAL_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '季实际利润(20191025不用了)',
  `DEP_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '存款季实际利润',
  `LN_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '贷款季实际利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份20210930以后的数据资源类客户经理业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_smy_tmp`
--

DROP TABLE IF EXISTS `t3_resource_manager_smy_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_smy_tmp` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_ID_OLD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转正前员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行名',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `ASSESSMENT` decimal(18,2) DEFAULT NULL COMMENT '考核标准',
  `DAY_DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '考核基期存量日均',
  `DEP_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款余额',
  `DEP_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款季日均',
  `DEP_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '存款季模拟利润',
  `LN_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款余额',
  `LN_QTD_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '贷款季日均',
  `LN_QTD_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '贷款模拟利润',
  `DEP_QTD_AVG_BAL_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增=存款季日均-考核基期存量日均',
  `ASSESSMENT_INCREASE` decimal(18,2) DEFAULT NULL COMMENT '日均新增较考核标准=日均新增-考核标准',
  `TOTAL_PROFIT` decimal(18,2) DEFAULT NULL COMMENT '季实际利润(20191025不用了)',
  `DEP_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '存款季实际利润',
  `LN_QTD_PROFIT_SJ` decimal(18,2) DEFAULT '0.00' COMMENT '贷款季实际利润 存量',
  `LN_QTD_PROFIT_SJ_ADD` decimal(18,2) DEFAULT '0.00' COMMENT '贷款季实际利润 新增'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源类客户经理业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_vuch_detail`
--

DROP TABLE IF EXISTS `t3_resource_manager_vuch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_vuch_detail` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理凭证明细（未正式入职）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_vuch_detail20210120`
--

DROP TABLE IF EXISTS `t3_resource_manager_vuch_detail20210120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_vuch_detail20210120` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='由于要修改员工100135的考核基期先备份 资源型客户经理凭证明细（未正式入职）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_vuch_detail_bak`
--

DROP TABLE IF EXISTS `t3_resource_manager_vuch_detail_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_vuch_detail_bak` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份表to20201130 资源型客户经理凭证明细（未正式入职）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_vuch_detail_tmp`
--

DROP TABLE IF EXISTS `t3_resource_manager_vuch_detail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_vuch_detail_tmp` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理凭证明细（未正式入职）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_resource_manager_vuch_detail_tmp20211013`
--

DROP TABLE IF EXISTS `t3_resource_manager_vuch_detail_tmp20211013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_resource_manager_vuch_detail_tmp20211013` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称',
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态代码',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RATIO` decimal(6,3) DEFAULT NULL COMMENT '认领比例',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CL_KHJQ_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户考核基期日均',
  `CL_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '存量客户月日均',
  `XZ_MTH_AVG_BAL` decimal(18,3) DEFAULT NULL COMMENT '新增客户月日均',
  `M_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '月利润',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理凭证明细（未正式入职）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_sign_prod_price`
--

DROP TABLE IF EXISTS `t3_sign_prod_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_sign_prod_price` (
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='签约价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3_small_business_ln_prod_price`
--

DROP TABLE IF EXISTS `t3_small_business_ln_prod_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3_small_business_ln_prod_price` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编号',
  `EFF_FLAG` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生效标志',
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小企业贷款价格表(大堂经理)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_banus_share_ratio_h`
--

DROP TABLE IF EXISTS `t4_banus_share_ratio_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_banus_share_ratio_h` (
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道代码',
  `RECOMMEND_RATIO` int(11) NOT NULL COMMENT '推荐人比例',
  `SALES_RATIO` int(11) NOT NULL COMMENT '销售人比例',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分润比例历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_credit_card_price_h`
--

DROP TABLE IF EXISTS `t4_credit_card_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_credit_card_price_h` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `NEW_CARD_PRICE` decimal(18,10) NOT NULL COMMENT '新卡价格',
  `OLD_CARD_PRICE` decimal(18,10) NOT NULL COMMENT '旧卡价格',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='信用卡价格历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_fnc_prod_price_h`
--

DROP TABLE IF EXISTS `t4_fnc_prod_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_fnc_prod_price_h` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道代码',
  `TERM_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '期限区间代码',
  `AMT_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额区间代码',
  `PRICE` decimal(18,10) NOT NULL COMMENT '价格',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财价格历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_personal_ln_price_h`
--

DROP TABLE IF EXISTS `t4_personal_ln_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_personal_ln_price_h` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编号',
  `AMT_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额区间代码',
  `PRICE` decimal(18,10) NOT NULL COMMENT '价格',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='个人贷款价格历史(大堂经理)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_sign_prod_price_h`
--

DROP TABLE IF EXISTS `t4_sign_prod_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_sign_prod_price_h` (
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道号',
  `PRICE` decimal(18,2) NOT NULL COMMENT '价格',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='签约价格历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t4_small_business_ln_prod_price_h`
--

DROP TABLE IF EXISTS `t4_small_business_ln_prod_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t4_small_business_ln_prod_price_h` (
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分行机构号',
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编号',
  `PRICE` decimal(18,10) DEFAULT NULL COMMENT '价格',
  `START_DT` date NOT NULL COMMENT '开始日期',
  `END_DT` date DEFAULT NULL COMMENT '结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小企业贷款价格历史(大堂经理)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp`
--

DROP TABLE IF EXISTS `t5_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工类型代码',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `GENDER` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `MOBILE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `HR_ORG_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='当前员工员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_assessment_q`
--

DROP TABLE IF EXISTS `t5_emp_assessment_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_assessment_q` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_ID_OLD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转正前员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `ASSESSMENT` decimal(18,2) DEFAULT NULL COMMENT '考核标准',
  `DAY_DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '考核基期存量日均',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理季度考核参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_bzjx`
--

DROP TABLE IF EXISTS `t5_emp_bzjx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_bzjx` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EXAM_YEAR` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考核年',
  `EXAM_Q` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '季度',
  `EMP_TYPE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位状态',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行cd',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行名称',
  `BRANCH_ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行cd',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行名称',
  `BZJX` decimal(20,2) DEFAULT '0.00' COMMENT '季度标准绩效薪酬',
  `HEAD_ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行机构',
  `HEAD_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行名称',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `EXS_XZ` decimal(20,2) DEFAULT '0.00' COMMENT '存量维护薪酬',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存量维护薪酬修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '存量维护薪酬修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存量维护薪酬修改IP',
  `VERIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存量维护薪酬审核人',
  `VERIFY_TIME` datetime DEFAULT NULL COMMENT '存量维护薪酬审核时间',
  `VERIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存量维护薪酬审核人IP',
  `VERIFY_REMARK` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存量维护薪酬审核备注',
  `STUS` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态0保存1提交2审核不通3审核通过',
  `IS_EXAM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否参加考核：1是0否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工季度标准绩效薪酬';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate`
--

DROP TABLE IF EXISTS `t5_emp_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20211022`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20211022`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20211022` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20211122`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20211122`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20211122` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20211228`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20211228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20211228` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20220822`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20220822`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20220822` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20230601`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20230601`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20230601` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20231228`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20231228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20231228` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20240220`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20240220`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20240220` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20240513`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20240513`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20240513` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_20240919`
--

DROP TABLE IF EXISTS `t5_emp_certificate_20240919`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_20240919` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_certificate_bak`
--

DROP TABLE IF EXISTS `t5_emp_certificate_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_certificate_bak` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证年份',
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户经理上岗资格持证标示表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_gdq_or_gz`
--

DROP TABLE IF EXISTS `t5_emp_gdq_or_gz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_gdq_or_gz` (
  `EXAM_YEAR` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '考核年',
  `EXAM_Q` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '考核季度',
  `EMP_TYPE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工类型：过渡期/借调挂职人员',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_DT` date DEFAULT NULL COMMENT '岗位开始日期',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `STATUS` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态：0保存1提交2审核未通过3审核通过',
  `GDQ_STDT` date DEFAULT NULL COMMENT '过渡期：开始日期',
  `GDQ_ENDDT` date DEFAULT NULL COMMENT '过渡期：结束日期',
  `CERT_GRADE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资格证',
  `DX_SCORE` decimal(20,2) DEFAULT NULL COMMENT '定性打分',
  `SJ_BZ_JX` decimal(20,2) DEFAULT NULL COMMENT '实际季度标准绩效薪酬',
  `YF_JX` decimal(20,2) DEFAULT NULL COMMENT '应发季度绩效薪酬',
  `IS_EXAM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否参加考核：1是0否',
  `REMARK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `MODIFY_PEOPLE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人IP',
  `DEL_FLAG` int(11) NOT NULL COMMENT '删除标识：1删除',
  `VERIFY_PEOPLE` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人',
  `VERIFY_TIME` datetime DEFAULT NULL COMMENT '审核时间',
  `VERIFY_IP` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人IP',
  `MEASURE_DT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='过渡期/借调挂职名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_q`
--

DROP TABLE IF EXISTS `t5_emp_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_q` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工类型代码',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `GENDER` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `MOBILE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `HR_ORG_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '人力机构',
  `ACTION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位状态',
  `EFFDT` date DEFAULT NULL COMMENT '岗位生效日期',
  `PROBATION_DT` date DEFAULT NULL COMMENT '试用期结束日期',
  `COMPRATE` decimal(20,2) DEFAULT NULL COMMENT '季度标准绩效薪酬'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_emp_resource_manager`
--

DROP TABLE IF EXISTS `t5_emp_resource_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_emp_resource_manager` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_ID_OLD` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转正前员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `KHJQ_ST_DT` date NOT NULL COMMENT '考核基期开始日期',
  `KHJQ_ED_DT` date NOT NULL COMMENT '考核基期结束日期',
  `KHQ_ST_DT` date NOT NULL COMMENT '考核期开始日期',
  `KHQ_ED_DT` date NOT NULL COMMENT '考核期开始日期',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源型客户经理(未正式入职)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_lobby_manager_score_q`
--

DROP TABLE IF EXISTS `t5_lobby_manager_score_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_lobby_manager_score_q` (
  `MEASURE_DT` date NOT NULL COMMENT '数据日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SCORE` decimal(18,2) DEFAULT NULL COMMENT '服务质量得分',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `EXAM_Y` decimal(4,0) NOT NULL COMMENT '考核年',
  `EXAM_Q` char(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '考核季度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='大堂经理服务质量打分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_manager_y_score`
--

DROP TABLE IF EXISTS `t5_manager_y_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_manager_y_score` (
  `MEASURE_DT` date NOT NULL COMMENT '数据日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `POSITION_ID` int(11) DEFAULT NULL COMMENT '岗位代码',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称',
  `SCORE_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年度绩效表现评定类型',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='年度绩效表现评定结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_org`
--

DROP TABLE IF EXISTS `t5_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_org` (
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支行机构号',
  `ORG_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构类别代码',
  `ORG_IP_ID` int(11) DEFAULT NULL COMMENT '机构号代理键',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行机构名',
  `ORG_LEVEL_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构级别',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `HEAD_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行机构号',
  `HEAD_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行机构名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_org_meg`
--

DROP TABLE IF EXISTS `t5_org_meg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_org_meg` (
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支行机构号',
  `ORG_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构类别代码',
  `ORG_IP_ID` int(11) DEFAULT NULL COMMENT '机构号代理键',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支行机构名',
  `ORG_LEVEL_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构级别',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `HEAD_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行机构号',
  `HEAD_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总行机构名',
  `ORG_ID_MEG` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合并后的机构CD',
  `ORG_IP_ID_MEG` int(11) DEFAULT NULL COMMENT '合并后的机构ID',
  `ORG_NM_MEG` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的机构名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合并机构表-手工维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t5_ybdb_per_fee_ration`
--

DROP TABLE IF EXISTS `t5_ybdb_per_fee_ration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5_ybdb_per_fee_ration` (
  `PER_FEE_RATION` decimal(20,2) NOT NULL COMMENT '人力费用系数',
  `ST_DT` date NOT NULL COMMENT '生效日期',
  `ED_DT` date NOT NULL COMMENT '结束日期',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险人力费用系数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t6_sales_distribute_log`
--

DROP TABLE IF EXISTS `t6_sales_distribute_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t6_sales_distribute_log` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售编码',
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道代码',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `TXN_DT` date DEFAULT NULL COMMENT '交易日期',
  `AMT` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人类型代码',
  `RECOMMEND_PEOPLE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `SALES_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售人',
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改IP',
  `REMARK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售分配日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t6_sales_distribute_log_cj`
--

DROP TABLE IF EXISTS `t6_sales_distribute_log_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t6_sales_distribute_log_cj` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TXN_DT` date DEFAULT NULL,
  `AMT` decimal(18,2) DEFAULT NULL,
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECOMMEND_PEOPLE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SALES_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MODIFY_PEOPLE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MODIFY_IP` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t6_vuch_emp_rela_change_log`
--

DROP TABLE IF EXISTS `t6_vuch_emp_rela_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t6_vuch_emp_rela_change_log` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `OLD_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原认领人工号',
  `OLD_RATIO` decimal(6,2) DEFAULT NULL COMMENT '原认领比例',
  `OLD_CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）',
  `OLD_CLAIM_DT` date DEFAULT NULL COMMENT '原认领日期',
  `OLD_VERIFY_DT` date DEFAULT NULL COMMENT '原审批日期',
  `OLD_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原审批人',
  `OLD_REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原备注',
  `NEW_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新认领人工号',
  `NEW_RATIO` decimal(6,2) DEFAULT NULL COMMENT '新认领比例',
  `NEW_CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）',
  `NEW_CLAIM_DT` datetime DEFAULT NULL COMMENT '新认领日期',
  `NEW_VERIFY_DT` datetime DEFAULT NULL COMMENT '初审日期',
  `NEW_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `NEW_REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新备注',
  `CHANGE_TYPE` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改方式（U-修改认领；I-新增认领；D-撤销认领）',
  `NEW_FIN_VERIFY_DT` datetime DEFAULT NULL COMMENT '终审日期',
  `NEW_FIN_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `CHANGE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '1非当前调整0当前调整',
  `NEW_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `NEW_FIN_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人姓名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工姓名',
  `OLD_FH_VERIFY_DT` date DEFAULT NULL COMMENT '原初审日期',
  `OLD_FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原初审人',
  `OLD_FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原初审人名称',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系调整日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t6_vuch_emp_rela_change_log_20250812`
--

DROP TABLE IF EXISTS `t6_vuch_emp_rela_change_log_20250812`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t6_vuch_emp_rela_change_log_20250812` (
  `VUCH_NBR` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `OLD_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原认领人工号',
  `OLD_RATIO` decimal(6,2) DEFAULT NULL COMMENT '原认领比例',
  `OLD_CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）',
  `OLD_CLAIM_DT` date DEFAULT NULL COMMENT '原认领日期',
  `OLD_VERIFY_DT` date DEFAULT NULL COMMENT '原审批日期',
  `OLD_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原审批人',
  `OLD_REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原备注',
  `NEW_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新认领人工号',
  `NEW_RATIO` decimal(6,2) DEFAULT NULL COMMENT '新认领比例',
  `NEW_CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）',
  `NEW_CLAIM_DT` datetime DEFAULT NULL COMMENT '新认领日期',
  `NEW_VERIFY_DT` datetime DEFAULT NULL COMMENT '初审日期',
  `NEW_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `NEW_REMARK` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新备注',
  `CHANGE_TYPE` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改方式（U-修改认领；I-新增认领；D-撤销认领）',
  `NEW_FIN_VERIFY_DT` datetime DEFAULT NULL COMMENT '终审日期',
  `NEW_FIN_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人',
  `CHANGE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '1非当前调整0当前调整',
  `NEW_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人姓名',
  `NEW_FIN_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终审人姓名',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `ORG_ID` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工姓名',
  `OLD_FH_VERIFY_DT` date DEFAULT NULL COMMENT '原初审日期',
  `OLD_FH_VERIFY_EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原初审人',
  `OLD_FH_VERIFY_EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原初审人名称',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系调整日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_cst_marketing_detail`
--

DROP TABLE IF EXISTS `t7_cst_marketing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_cst_marketing_detail` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐人（客户推荐客户）',
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动编码',
  `CCY_ID` int(11) DEFAULT NULL COMMENT '币种',
  `CURRENT_PERSONNEL_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '活期储蓄存款',
  `FIXED_PERSONNEL_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '定期储蓄存款',
  `TOTAL_PERSONNEL_DEP_BAL` decimal(18,3) DEFAULT NULL COMMENT '合计储蓄存款'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户活动统计明细-给蛐蛐网';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy`
--

DROP TABLE IF EXISTS `t7_emp_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy20220331`
--

DROP TABLE IF EXISTS `t7_emp_smy20220331`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy20220331` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='备份20220331日变更前考核结果员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy20221114`
--

DROP TABLE IF EXISTS `t7_emp_smy20221114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy20221114` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_20240606`
--

DROP TABLE IF EXISTS `t7_emp_smy_20240606`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_20240606` (
  `MEASURE_DT` date NOT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL,
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL,
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL,
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_20241125`
--

DROP TABLE IF EXISTS `t7_emp_smy_20241125`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_20241125` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_bak`
--

DROP TABLE IF EXISTS `t7_emp_smy_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_bak` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统(调整数据前的备份)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_tmp`
--

DROP TABLE IF EXISTS `t7_emp_smy_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_tmp` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_tmp20231205`
--

DROP TABLE IF EXISTS `t7_emp_smy_tmp20231205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_tmp20231205` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工奖励汇总-给人力系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_emp_smy_tmp_result`
--

DROP TABLE IF EXISTS `t7_emp_smy_tmp_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_emp_smy_tmp_result` (
  `MEASURE_DT` date NOT NULL COMMENT '日期',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '存款本季度净利息收入',
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '贷款本季度净利息收入',
  `IB_Q_BONUS` decimal(18,3) DEFAULT NULL COMMENT '中间本季度业务奖金',
  `RECOMMEND_BONUS1` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（大堂经理）',
  `RECOMMEND_BONUS2` decimal(18,3) DEFAULT NULL COMMENT '本季度推荐贷款奖金（客户经理扣减）',
  `FNC_Q_PROFIT` decimal(18,3) DEFAULT NULL COMMENT '理财本季度收入',
  `GRADE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证等级',
  `RESOURCE_MANAGER_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类客户经理标志（1-资源类客户经理）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='给人力的新方案的最终结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_lobby_manager_smy`
--

DROP TABLE IF EXISTS `t7_lobby_manager_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_lobby_manager_smy` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `MEASURE_DT` date NOT NULL COMMENT '统计日期',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `DEP_BONUS` decimal(18,2) DEFAULT NULL COMMENT '存款奖励',
  `FNC_BONUS` decimal(18,2) DEFAULT NULL COMMENT '理财奖励',
  `FUND_BONUS` decimal(18,2) DEFAULT NULL COMMENT '基金奖励',
  `INSUR_BONUS` decimal(18,2) DEFAULT NULL COMMENT '保险奖励',
  `OTHER_SCORE` decimal(18,2) DEFAULT NULL COMMENT '其它业务得分',
  `SERVICE_SCORE` decimal(18,2) DEFAULT NULL COMMENT '服务得分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='大堂经理业绩汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t7_tmp`
--

DROP TABLE IF EXISTS `t7_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7_tmp` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t8_data_dt`
--

DROP TABLE IF EXISTS `t8_data_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t8_data_dt` (
  `DATA_DT` date NOT NULL COMMENT '数据日期',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '记录添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存贷款数据日期_WEB前端使用,报表的最新数据日期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t8_tbp`
--

DROP TABLE IF EXISTS `t8_tbp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t8_tbp` (
  `TBSPC_NAME` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOTAL_P` bigint(20) DEFAULT NULL,
  `USED_P` bigint(20) DEFAULT NULL,
  `FREE_P` bigint(20) DEFAULT NULL,
  `TOTAL_G` bigint(20) DEFAULT NULL,
  `USED_G` bigint(20) DEFAULT NULL,
  `FREE_G` bigint(20) DEFAULT NULL,
  `PERCENT` bigint(20) DEFAULT NULL,
  `HIGH_WATER_MARK` bigint(20) DEFAULT NULL,
  `CUR_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='空间使用情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_emp_rela_q_switch`
--

DROP TABLE IF EXISTS `t99_emp_rela_q_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_emp_rela_q_switch` (
  `MEASURE_DT` date NOT NULL COMMENT '数据日期',
  `SWITCH_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开关（1-考核开始；0-开始结束）',
  `REMARK` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='季末认领关系开关表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_help`
--

DROP TABLE IF EXISTS `t99_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_help` (
  `ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题序号',
  `MSG_DT` date NOT NULL COMMENT '时间',
  `MSE_STATE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `MSG_PER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `QUESTION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '问题',
  `ANSWER` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='常见问题帮助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_middle_income_switch`
--

DROP TABLE IF EXISTS `t99_middle_income_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_middle_income_switch` (
  `MEASURE_DT` date NOT NULL COMMENT '数据日期',
  `SWITCH_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开关（1-考核开始；0-开始结束）',
  `REMARK` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='手动录入开关表(中间业务收入/季度利润调整等报表控制)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_new_megs`
--

DROP TABLE IF EXISTS `t99_new_megs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_new_megs` (
  `MSG_DT` date NOT NULL COMMENT '消息日期',
  `MSE_STATE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息状态（1-新发布状态，有效；0-历史消息，无效）',
  `MSG_PER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息发布人',
  `MSG_INFO` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统提示消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_resource_manager_profit`
--

DROP TABLE IF EXISTS `t99_resource_manager_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_resource_manager_profit` (
  `WORK_DT` datetime NOT NULL COMMENT '取数时间',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属机构名',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工归属分行名',
  `POSITION_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '统计区间存款日均',
  `VUCH_CNT` int(11) DEFAULT NULL COMMENT '认领的凭证个数',
  `REMARK1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `REMARK2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源类客户经理绩效统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_resource_manager_profit_detail`
--

DROP TABLE IF EXISTS `t99_resource_manager_profit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_resource_manager_profit_detail` (
  `ACC_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工号',
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '员工名',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CCY_NM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '币种',
  `DEP_AVG_BAL` decimal(18,2) DEFAULT NULL COMMENT '存款动态日均',
  `REMARK1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `WORK_DT` datetime DEFAULT NULL COMMENT '取数日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源类客户经理业绩明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t99_vuch_bal`
--

DROP TABLE IF EXISTS `t99_vuch_bal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t99_vuch_bal` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `BAL` decimal(18,2) DEFAULT NULL,
  `AVG_BAL` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_amt_interval_type`
--

DROP TABLE IF EXISTS `t9_amt_interval_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_amt_interval_type` (
  `AMT_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额区间代码',
  `AMT_INTERVAL_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '金额区间名称',
  `UPPER_LIMIT` decimal(18,0) DEFAULT NULL COMMENT '上限',
  `LOWER_LIMIT` decimal(18,0) DEFAULT NULL COMMENT '下限',
  `REMARK` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='金额区间代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_biz_type`
--

DROP TABLE IF EXISTS `t9_biz_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_biz_type` (
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务类型代码',
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型名称',
  `BIZ_TYPE_NM_NEW` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类别统一名称',
  `BIZ_TYPE_CGY` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='业务类型代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_bonus_status`
--

DROP TABLE IF EXISTS `t9_bonus_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_bonus_status` (
  `BONUS_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金状态代码',
  `BONUS_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖金状态代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_bonus_type`
--

DROP TABLE IF EXISTS `t9_bonus_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_bonus_type` (
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖金类型代码',
  `BONUS_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖金类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='奖金类型代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_certificate`
--

DROP TABLE IF EXISTS `t9_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_certificate` (
  `TYPE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取得资格证维度(Y-年份，G-等级)',
  `VALUE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取得资格证类别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='取得资格证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_channel`
--

DROP TABLE IF EXISTS `t9_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_channel` (
  `CHANNLE_ID` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道代码',
  `CHANNLE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='渠道代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_claim_status_type`
--

DROP TABLE IF EXISTS `t9_claim_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_claim_status_type` (
  `CLAIM_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认领状态代码',
  `CLAIM_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领状态代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_fnc_txn_cd`
--

DROP TABLE IF EXISTS `t9_fnc_txn_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_fnc_txn_cd` (
  `TXN_CD` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易类型',
  `TXN_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易类型名称',
  `TXN_CGY_CD` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易分类',
  `TXN_CGY_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易分类名称',
  `STA_FLAG` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否统计'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='理财交易类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_fund_txn_cd`
--

DROP TABLE IF EXISTS `t9_fund_txn_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_fund_txn_cd` (
  `TXN_CD` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易类型',
  `TXN_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易类型名称',
  `TXN_CGY_CD` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易分类',
  `TXN_CGY_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易分类名称',
  `STA_FLAG` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否统计'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='基金手交易类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_manager_y_score_type`
--

DROP TABLE IF EXISTS `t9_manager_y_score_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_manager_y_score_type` (
  `SCORE_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '年度绩效表现评定类型代码',
  `SCORE_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年度绩效表现评定类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='年度绩效表现评定代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_marketing_type`
--

DROP TABLE IF EXISTS `t9_marketing_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_marketing_type` (
  `MARKETING_NO` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动编码',
  `MARKETING_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动编码类型代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_org_level`
--

DROP TABLE IF EXISTS `t9_org_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_org_level` (
  `ORG_LEVEL_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构级别代码',
  `ORG_LEVEL_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构级别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='机构级别代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_org_type`
--

DROP TABLE IF EXISTS `t9_org_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_org_type` (
  `ORG_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构类别代码',
  `ORG_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构类别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='机构类别代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_per_type`
--

DROP TABLE IF EXISTS `t9_per_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_per_type` (
  `PER_TYPE` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态代码',
  `PER_TYPE_NAME` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_pstn_type`
--

DROP TABLE IF EXISTS `t9_pstn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_pstn_type` (
  `PSTN_TYPE` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别',
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主考核类别名称',
  `SUB_PSTN_TYPE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别',
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子考核类别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='考核类别分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_recommend_type`
--

DROP TABLE IF EXISTS `t9_recommend_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_recommend_type` (
  `RECOMMEND_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐人类型代码',
  `RECOMMEND_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐人类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='推荐人类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_rvs_status_type`
--

DROP TABLE IF EXISTS `t9_rvs_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_rvs_status_type` (
  `RVS_STATUS_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调整状态代码',
  `RVS_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='调整状态代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_sp_groupid`
--

DROP TABLE IF EXISTS `t9_sp_groupid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_sp_groupid` (
  `GROUP_ID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色ID',
  `GROUP_NM` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `BIZ_TYP` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务类型',
  `IS_CS` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否初审1是0否',
  `IS_FS` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否终审1是0否',
  `SP_TYP` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审批类别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='审批权限配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_term_interval_type`
--

DROP TABLE IF EXISTS `t9_term_interval_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_term_interval_type` (
  `TERM_INTERVAL_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '期限区间代码',
  `TERM_INTERVAL_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '期限区间名称',
  `UPPER_LIMIT` decimal(18,0) DEFAULT NULL COMMENT '上限',
  `LOWER_LIMIT` decimal(18,0) DEFAULT NULL COMMENT '下限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='期限区间代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_vuch_type`
--

DROP TABLE IF EXISTS `t9_vuch_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_vuch_type` (
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证类型代码',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='凭证类型代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t9_year_q`
--

DROP TABLE IF EXISTS `t9_year_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9_year_q` (
  `QTD` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '季度',
  `QTD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '季度名称',
  `QTD_CD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='考核季度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tler_acc`
--

DROP TABLE IF EXISTS `tler_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tler_acc` (
  `TLER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户经理编号',
  `ACC_ID` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账户编号',
  `TA_DATE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领时间',
  `TA_SCO` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领比例',
  `S_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '本月最大日期',
  `E_DATE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '截至日期',
  `DT_STUS` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0-暂存 1-未通过 2-已提交待审核，2.1-分行已审核 3-通过',
  `ACC_TYP` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户类型',
  `ACC_KIND` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领类型',
  `ORG_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认领人机构号',
  `ACC_ORG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帐号开户机构',
  `ACC_AGREE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核机构(一次审核)',
  `ACC_AGREET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核机构(二次审核)',
  `ACC_FLAG` bigint(20) DEFAULT NULL COMMENT 'FLAG(是否为跨行机构)',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  `PRO_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属介质号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系-给资产负债的接口';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp`
--

DROP TABLE IF EXISTS `tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_emp_certificate`
--

DROP TABLE IF EXISTS `tmp_emp_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_emp_certificate` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_emp_rela`
--

DROP TABLE IF EXISTS `tmp_emp_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_emp_rela` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RATIO` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='认领关系（存贷款）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t1_vuch_detail_ggpz`
--

DROP TABLE IF EXISTS `tmp_t1_vuch_detail_ggpz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t1_vuch_detail_ggpz` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证号',
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证种类',
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证种类名称',
  `CST_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '源客户号',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构名',
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行机构号',
  `OPEN_DT` date DEFAULT NULL COMMENT '开户日期',
  `CLOSE_DT` date DEFAULT NULL COMMENT '销户日期',
  `VUCH_STATUS_ID` int(11) DEFAULT NULL COMMENT '凭证状态',
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证状态名称',
  `RANK` int(11) DEFAULT NULL COMMENT '排序--去重复用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='临时表-存储公共凭证信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t2_bonus_detail1`
--

DROP TABLE IF EXISTS `tmp_t2_bonus_detail1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t2_bonus_detail1` (
  `SALE_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BONUS_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `BONUS` decimal(18,2) DEFAULT NULL,
  `BONUS_EFF_DT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t2_emp_dep_ln_acc_profit_detail`
--

DROP TABLE IF EXISTS `tmp_t2_emp_dep_ln_acc_profit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t2_emp_dep_ln_acc_profit_detail` (
  `ACC_ID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEASURE_DT` date DEFAULT NULL,
  `Q_PROFIT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t2_emp_dep_ln_profit_smy`
--

DROP TABLE IF EXISTS `tmp_t2_emp_dep_ln_profit_smy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t2_emp_dep_ln_profit_smy` (
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_PSTN_TYPE` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_PSTN_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CCY_ID` int(11) DEFAULT NULL,
  `DEP_BAL` decimal(18,3) DEFAULT NULL,
  `DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `IDV_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `ORG_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_BAL` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `INTERBANK_DEP_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_BAL` decimal(18,3) DEFAULT NULL,
  `LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `LN_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `IDV_LN_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `IDV_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `IDV_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `ORG_LN_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `ORG_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `ORG_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_BAL` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `AGRICULTURE_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_BAL` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_MTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_QTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_Q_PROFIT` decimal(18,3) DEFAULT NULL,
  `SMALL_BIZ_LN_Y_PROFIT` decimal(18,3) DEFAULT NULL,
  `DEP_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL,
  `LN_YTD_AVG_BAL_RANK` int(11) DEFAULT NULL,
  `ADD_TIME` datetime DEFAULT NULL,
  `GRADE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LN_Q_PROFIT_MODIFY` decimal(18,2) DEFAULT NULL,
  `LN_Q_PROFIT_MODIFY_EMP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LN_Q_PROFIT_MODIFY_DT` date DEFAULT NULL,
  `CORP_MIDDLE_BONUS_Q` decimal(18,2) DEFAULT NULL,
  `CORP_MIDDLE_BONUS_Y` decimal(18,2) DEFAULT NULL,
  `YEAR` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t2_emp_other_biz_cst_dep`
--

DROP TABLE IF EXISTS `tmp_t2_emp_other_biz_cst_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t2_emp_other_biz_cst_dep` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEASURE_DT` date NOT NULL,
  `DEP_BAL` decimal(18,2) DEFAULT NULL,
  `FNC_BAL` decimal(18,2) DEFAULT NULL,
  `EMP_CNT` int(11) DEFAULT NULL COMMENT '客户被多少个员工瓜分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户存款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_t2_emp_other_biz_cst_emp_dep`
--

DROP TABLE IF EXISTS `tmp_t2_emp_other_biz_cst_emp_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_t2_emp_other_biz_cst_emp_dep` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEASURE_DT` date NOT NULL,
  `CST_OPEN_DT` date DEFAULT NULL,
  `EMP_DEP_BAL` decimal(18,2) DEFAULT NULL,
  `EMP_FNC_BAL` decimal(18,2) DEFAULT NULL,
  `EMP_CNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工分了客户存款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_corp_cst_dept_rela`
--

DROP TABLE IF EXISTS `ts_corp_cst_dept_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_corp_cst_dept_rela` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名',
  `DEPT_NM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `REMARK1` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `REMARK2` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='对公客户归属部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_corp_cst_dept_rela1`
--

DROP TABLE IF EXISTS `ts_corp_cst_dept_rela1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_corp_cst_dept_rela1` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名',
  `DEPT_NM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_NM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `REMARK1` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注1',
  `REMARK2` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='对公客户归属部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_corp_cst_fx`
--

DROP TABLE IF EXISTS `ts_corp_cst_fx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_corp_cst_fx` (
  `WORK_DT` datetime NOT NULL COMMENT '提数时间',
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户号',
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户名',
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构号',
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
  `BRANCH_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分行',
  `DEPT_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门',
  `DEP_BAL_2014` decimal(18,2) DEFAULT NULL COMMENT '存款余额2014年',
  `DEP_BAL_2015` decimal(18,2) DEFAULT NULL COMMENT '存款余额2015年',
  `DEP_BAL_2016` decimal(18,2) DEFAULT NULL COMMENT '存款余额2016年',
  `DEP_AVG_BAL_2014` decimal(18,2) DEFAULT NULL COMMENT '存款日均2014年',
  `DEP_AVG_BAL_2015` decimal(18,2) DEFAULT NULL COMMENT '存款日均2015年',
  `DEP_AVG_BAL_2016` decimal(18,2) DEFAULT NULL COMMENT '存款日均2016年',
  `JF_CNT_2014` int(11) DEFAULT NULL COMMENT '借方笔数2014年',
  `JF_CNT_2015` int(11) DEFAULT NULL COMMENT '借方笔数2015年',
  `JF_CNT_2016` int(11) DEFAULT NULL COMMENT '借方笔数2016年',
  `DF_CNT_2014` int(11) DEFAULT NULL COMMENT '贷方笔数2014年',
  `DF_CNT_2015` int(11) DEFAULT NULL COMMENT '贷方笔数2015年',
  `DF_CNT_2016` int(11) DEFAULT NULL COMMENT '贷方笔数2016年',
  `JF_AMT_2014` decimal(18,2) DEFAULT NULL COMMENT '借方金额2014年',
  `JF_AMT_2015` decimal(18,2) DEFAULT NULL COMMENT '借方金额2015年',
  `JF_AMT_2016` decimal(18,2) DEFAULT NULL COMMENT '借方金额2016年',
  `DF_AMT_2014` decimal(18,2) DEFAULT NULL COMMENT '贷方金额2014年',
  `DF_AMT_2015` decimal(18,2) DEFAULT NULL COMMENT '贷方金额2015年',
  `DF_AMT_2016` decimal(18,2) DEFAULT NULL COMMENT '贷方金额2016年',
  `LN_BAL_2014` decimal(18,2) DEFAULT NULL COMMENT '贷款余额2014年',
  `LN_BAL_2015` decimal(18,2) DEFAULT NULL COMMENT '贷款余额2015年',
  `LN_BAL_2016` decimal(18,2) DEFAULT NULL COMMENT '贷款余额2016年',
  `LN_AVG_BAL_2014` decimal(18,2) DEFAULT NULL COMMENT '贷款日均2014年',
  `LN_AVG_BAL_2015` decimal(18,2) DEFAULT NULL COMMENT '贷款日均2015年',
  `LN_AVG_BAL_2016` decimal(18,2) DEFAULT NULL COMMENT '贷款日均2016年'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户按部门分析';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_dep_ar_smy_zyl`
--

DROP TABLE IF EXISTS `ts_dep_ar_smy_zyl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_dep_ar_smy_zyl` (
  `AR_ID` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MSR_PRD_ID` int(11) NOT NULL,
  `ORIG_CCY_ID` int(11) DEFAULT NULL,
  `CCY_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLS_BAL` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源类客户经理每日存款账户明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_dep_ar_zyl`
--

DROP TABLE IF EXISTS `ts_dep_ar_zyl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_dep_ar_zyl` (
  `AR_ID` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `RATIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_t1_acc_profit_detail_zyl`
--

DROP TABLE IF EXISTS `ts_t1_acc_profit_detail_zyl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_t1_acc_profit_detail_zyl` (
  `AR_ID` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MSR_PRD_ID` date DEFAULT NULL,
  `ORIG_CCY_ID` int(11) DEFAULT NULL,
  `CLS_BAL` decimal(18,3) DEFAULT NULL,
  `YTD_AVG_BAL` decimal(18,3) DEFAULT NULL,
  `PROFIT` decimal(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ts_vuch_bal`
--

DROP TABLE IF EXISTS `ts_vuch_bal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_vuch_bal` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VUCH_TYPE_NM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEASURE_DT` date DEFAULT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `RATIO` decimal(5,2) DEFAULT NULL,
  `DEP_BAL` decimal(18,2) DEFAULT NULL,
  `DEP_AVG_BAL` decimal(18,2) DEFAULT NULL,
  `REMARK1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xnb_cst`
--

DROP TABLE IF EXISTS `xnb_cst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xnb_cst` (
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIRTH_DT` date DEFAULT NULL,
  `GENDER` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEP_BAL` decimal(18,2) DEFAULT NULL,
  `DEP_AVG_BAL` decimal(18,2) DEFAULT NULL,
  `LN_BAL` decimal(18,2) DEFAULT NULL,
  `LN_AVG_BAL` decimal(18,2) DEFAULT NULL,
  `FNC_AVG` decimal(18,2) DEFAULT NULL,
  `FNC_AVG_BAL` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xnb_vuch`
--

DROP TABLE IF EXISTS `xnb_vuch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xnb_vuch` (
  `VUCH_NBR` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VUCH_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VUCH_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WITH_CARD_F` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRANCH_ORG_ID` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPEN_DT` date DEFAULT NULL,
  `CLOSE_DT` date DEFAULT NULL,
  `VUCH_STATUS_ID` int(11) DEFAULT NULL,
  `VUCH_STATUS_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_ID` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_ID` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BIZ_TYPE_NM` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `LN_AMT` decimal(18,3) DEFAULT NULL,
  `MARKETING_NO` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CST_OPEN_DT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ibs'
--

--
-- Dumping routines for database 'ibs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02 16:39:06
