-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: ibs
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
-- Current Database: `ibs`
--

USE `ibs`;

--
-- Dumping data for table `cst_dep_rela`
--

LOCK TABLES `cst_dep_rela` WRITE;
/*!40000 ALTER TABLE `cst_dep_rela` DISABLE KEYS */;
/*!40000 ALTER TABLE `cst_dep_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `emp_lobby_test`
--

LOCK TABLES `emp_lobby_test` WRITE;
/*!40000 ALTER TABLE `emp_lobby_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_lobby_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gold_emp_rela`
--

LOCK TABLES `gold_emp_rela` WRITE;
/*!40000 ALTER TABLE `gold_emp_rela` DISABLE KEYS */;
INSERT INTO `gold_emp_rela` (`TXN_RUN_NBR`, `VUCH_NBR`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `BIZ_TYPE_NM`, `VUCH_STATUS_NM`, `TXN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `MARKETING_NO`, `TXN_AMT`, `PRD_NUM`, `PRD_CD`, `PRD_NM`, `MID_INC`) VALUES ('GOLDDEMO0000001','GOLDVUCH0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','认领时间2026-06-27-14.25.32认领工号admin认领理由审批时间2026-06-27 14:27:12审批工号admin审批理由页面批复通过。',NULL,'1000','演示机构','演示贵金属客户','IDGOLD0001','贵金属业务','正常','2026-03-25','管理员','1000','演示机构','MKTGOLD0001',88000.000,2,'GOLDPRD01','演示贵金属产品',2600.000),('GOLDDEMO0000001','GOLDVUCH0001','000000',0.00,'7','2026-06-27',NULL,NULL,'认领时间2026-06-27-14.25.32认领工号admin认领理由','','1000','演示机构','演示贵金属客户','IDGOLD0001','贵金属业务','正常','2026-03-25','','','','MKTGOLD0001',88000.000,2,'GOLDPRD01','演示贵金属产品',2600.000),('GOLDDEMO1001','GOLDVUCH1001','claimer_gold',40.00,'2','2026-07-02','2026-07-02','verifier_gold','认领时间2026-07-02-11.16.16认领工号claimer_gold认领理由审批时间2026-07-02 11:16:21审批工号verifier_gold审批理由页面批复通过。',NULL,'9001','演示支行','演示贵金属客户一','IDGOLD1001','贵金属业务','正常','2026-03-25','贵金属演示认领员','9001','演示支行','MKTGOLD1001',88000.000,2,'GOLDPRD01','演示贵金产品一',2600.000),('GOLDDEMO1002','GOLDVUCH1002','claimer_gold',60.00,'1','2026-03-26',NULL,NULL,'认领演示已提交','','9001','演示支行','演示贵金属客户二','IDGOLD1002','贵金属业务','正常','2026-03-26','贵金属演示认领员','9001','演示支行','MKTGOLD1002',65000.000,1,'GOLDPRD02','演示贵金产品二',1800.000),('GOLDDEMO1003','GOLDVUCH1003','000000',0.00,'7',NULL,NULL,NULL,NULL,NULL,'9001','演示支行','备用贵金属客户','IDGOLD1003','贵金属业务','正常','2026-03-27','','','','MKTGOLD1003',72000.000,3,'GOLDPRD03','备用贵金产品',2100.000);
/*!40000 ALTER TABLE `gold_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gold_emp_rela_bak20250205`
--

LOCK TABLES `gold_emp_rela_bak20250205` WRITE;
/*!40000 ALTER TABLE `gold_emp_rela_bak20250205` DISABLE KEYS */;
/*!40000 ALTER TABLE `gold_emp_rela_bak20250205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gold_emp_smy`
--

LOCK TABLES `gold_emp_smy` WRITE;
/*!40000 ALTER TABLE `gold_emp_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `gold_emp_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail`
--

LOCK TABLES `t1_acc_profit_detail` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail_20160308`
--

LOCK TABLES `t1_acc_profit_detail_20160308` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail_20160308` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail_20160308` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail_cj`
--

LOCK TABLES `t1_acc_profit_detail_cj` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail_cj` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail_d20161207`
--

LOCK TABLES `t1_acc_profit_detail_d20161207` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail_d20161207` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail_d20161207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail_oldto20201231`
--

LOCK TABLES `t1_acc_profit_detail_oldto20201231` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail_oldto20201231` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail_oldto20201231` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_acc_profit_detail_tmp`
--

LOCK TABLES `t1_acc_profit_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t1_acc_profit_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_acc_profit_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_core_bckyx`
--

LOCK TABLES `t1_core_bckyx` WRITE;
/*!40000 ALTER TABLE `t1_core_bckyx` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_core_bckyx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_df_slry_emp_rela`
--

LOCK TABLES `t1_df_slry_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_df_slry_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_df_slry_emp_rela` (`AGENT_NO`, `ENT_ID`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NO`, `ENT_NM`, `BIZ_TYPE_NM`, `BIZ_STS_ID`, `BIZ_STS_NM`, `RGST_DT`, `OPEN_DT`, `CNL_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `DEP_LINE_NM`) VALUES ('DFSLRYDEMO0001','ENT00001','admin',100.00,'1','2026-06-27',NULL,NULL,'认领时间2026-06-27-10.39.01认领工号admin认领理由演示代发工资认领','','1000','演示网点','CSTDF0001','演示企业A','代发工资','A',NULL,'2026-01-10','2026-01-15',NULL,'管理员','1000','演示机构','对公业务'),('DFSLRYDEMO0002','ENT00002','admin',60.00,'2','2026-06-27','2026-06-27','admin','审批时间2026-06-27 10:39:15审批工号admin审批理由页面批复通过。',NULL,'1000','演示网点','CSTDF0002','演示企业B','代发工资','A',NULL,'2026-02-18','2026-02-20',NULL,'管理员','1000','演示机构','对公业务');
/*!40000 ALTER TABLE `t1_df_slry_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fnc_pd_smy_q`
--

LOCK TABLES `t1_fnc_pd_smy_q` WRITE;
/*!40000 ALTER TABLE `t1_fnc_pd_smy_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_fnc_pd_smy_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fnc_pd_smy_q_cj`
--

LOCK TABLES `t1_fnc_pd_smy_q_cj` WRITE;
/*!40000 ALTER TABLE `t1_fnc_pd_smy_q_cj` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_fnc_pd_smy_q_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fnc_txn_emp_rela`
--

LOCK TABLES `t1_fnc_txn_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_fnc_txn_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_fnc_txn_emp_rela` (`TXN_NO`, `VUCH_NBR`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `BIZ_TYPE_CD`, `BIZ_TYPE_NM`, `TXN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `TXN_AMT`, `PRD_CD`, `PRD_NM`, `MID_INC`, `SERIAL_NO`, `CLIENT_NO`, `FNC_TYP`, `ORG_RATIO`, `ORG_EMP_ID`) VALUES ('FNCDEMO0001','FNCVUCH0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','认领时间2026-06-27-13.45.55认领工号admin认领理由审批时间2026-06-27 13:55:41审批工号admin审批理由页面批复通过。',NULL,'1000','演示机构','演示理财客户','IDFNC0001','FNC','理财业务','2026-03-15','管理员','1000','演示机构',88000.000,'PRDFNC01','理财产品',2600.000,'FNC-SERIAL-1','FNC-CLIENT-1','01',NULL,NULL),('HPFDEMO0001','HPFVUCH0001','admin',80.00,'1','2026-06-27',NULL,NULL,'认领时间2026-06-27-13.52.47认领工号admin认领理由','','1000','演示机构','演示公积金客户','IDHPF0001','HPF','公积金业务','2026-03-16','管理员','1000','演示机构',66000.000,'PRDHPF01','公积金产品',1800.000,'HPF-SERIAL-1','HPF-CLIENT-1','01',NULL,NULL);
/*!40000 ALTER TABLE `t1_fnc_txn_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fund_cst_emp_rela`
--

LOCK TABLES `t1_fund_cst_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_fund_cst_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_fund_cst_emp_rela` (`CUS_NO`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `TXN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`) VALUES ('FUNDCUS0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','认领时间2026-06-27-14.19.45认领工号admin认领理由审批时间2026-06-27 14:20:40审批工号admin审批理由页面批复通过。','','1000','演示机构',NULL,'FUNDCSTDEMO0001','2026-03-21','管理员','1000','演示机构');
/*!40000 ALTER TABLE `t1_fund_cst_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fund_cst_fee`
--

LOCK TABLES `t1_fund_cst_fee` WRITE;
/*!40000 ALTER TABLE `t1_fund_cst_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_fund_cst_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fund_dt_emp_rela`
--

LOCK TABLES `t1_fund_dt_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_fund_dt_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_fund_dt_emp_rela` (`SERIAL_NO`, `VUCH_NBR`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `TXN_DT`, `PRD_CD`, `PRD_NM`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `TXN_AMT`) VALUES ('FUNDDTDEMO0001','FUNDDTVUCH0001','admin',80.00,'1','2026-06-27',NULL,NULL,'认领时间2026-06-27-14.19.54认领工号admin认领理由','','1000','演示机构','演示定投客户','IDFUNDDT0001','2026-03-22','FUNDPRD02','演示定投产品','管理员','1000','演示机构',3600.000);
/*!40000 ALTER TABLE `t1_fund_dt_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_fund_txn_emp_rela`
--

LOCK TABLES `t1_fund_txn_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_fund_txn_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_fund_txn_emp_rela` (`TXN_NO`, `VUCH_NBR`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `BIZ_TYPE_CD`, `BIZ_TYPE_NM`, `TXN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `TXN_AMT`, `PRD_CD`, `PRD_NM`, `MID_INC`, `SERIAL_NO`) VALUES ('FUNDTXNDEMO0001','FUNDVUCH0001','admin',80.00,'1','2026-06-27',NULL,NULL,'认领时间2026-06-27-14.19.00认领工号admin认领理由','','1000','演示机构','演示基金客户','IDFUND0001','FUND','基金交易','2026-03-20','管理员','1000','演示机构',52000.000,'FUNDPRD01','演示基金产品',1200.000,'FUND-DT-LINK-1');
/*!40000 ALTER TABLE `t1_fund_txn_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_ln_lobby_manager_rela`
--

LOCK TABLES `t1_ln_lobby_manager_rela` WRITE;
/*!40000 ALTER TABLE `t1_ln_lobby_manager_rela` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_ln_lobby_manager_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj`
--

LOCK TABLES `t1_middle_busi_sbj` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20221110`
--

LOCK TABLES `t1_middle_busi_sbj_20221110` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20221110` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20221110` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20230425`
--

LOCK TABLES `t1_middle_busi_sbj_20230425` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20230425` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20230425` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20231031`
--

LOCK TABLES `t1_middle_busi_sbj_20231031` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20231031` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20231031` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20240326`
--

LOCK TABLES `t1_middle_busi_sbj_20240326` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20240326` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20240326` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20250116`
--

LOCK TABLES `t1_middle_busi_sbj_20250116` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20250116` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20250116` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20250124`
--

LOCK TABLES `t1_middle_busi_sbj_20250124` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20250124` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20250124` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_20260210`
--

LOCK TABLES `t1_middle_busi_sbj_20260210` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20260210` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_20260210` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_bkp_20260316`
--

LOCK TABLES `t1_middle_busi_sbj_bkp_20260316` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_bkp_20260316` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_bkp_20260316` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco`
--

LOCK TABLES `t1_middle_busi_sbj_inco` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco_20210811`
--

LOCK TABLES `t1_middle_busi_sbj_inco_20210811` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20210811` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20210811` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco_20230425`
--

LOCK TABLES `t1_middle_busi_sbj_inco_20230425` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20230425` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20230425` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco_20231018`
--

LOCK TABLES `t1_middle_busi_sbj_inco_20231018` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20231018` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20231018` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco_20231031`
--

LOCK TABLES `t1_middle_busi_sbj_inco_20231031` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20231031` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20231031` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_busi_sbj_inco_20240307`
--

LOCK TABLES `t1_middle_busi_sbj_inco_20240307` WRITE;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20240307` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_busi_sbj_inco_20240307` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_middle_business_income`
--

LOCK TABLES `t1_middle_business_income` WRITE;
/*!40000 ALTER TABLE `t1_middle_business_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_middle_business_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_mobile_bank_emp_detail`
--

LOCK TABLES `t1_mobile_bank_emp_detail` WRITE;
/*!40000 ALTER TABLE `t1_mobile_bank_emp_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_mobile_bank_emp_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_org_acc_dep_inc_dtl`
--

LOCK TABLES `t1_org_acc_dep_inc_dtl` WRITE;
/*!40000 ALTER TABLE `t1_org_acc_dep_inc_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_org_acc_dep_inc_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_org_acc_ln_inc_dtl`
--

LOCK TABLES `t1_org_acc_ln_inc_dtl` WRITE;
/*!40000 ALTER TABLE `t1_org_acc_ln_inc_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_org_acc_ln_inc_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_sales_detail`
--

LOCK TABLES `t1_sales_detail` WRITE;
/*!40000 ALTER TABLE `t1_sales_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_sales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_sales_detail_q`
--

LOCK TABLES `t1_sales_detail_q` WRITE;
/*!40000 ALTER TABLE `t1_sales_detail_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_sales_detail_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_thd_emp_rela`
--

LOCK TABLES `t1_thd_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_thd_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_thd_emp_rela` (`TXN_RUN_NBR`, `VUCH_NBR`, `SCURT_AC`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `IDENTN_NO`, `BIZ_TYPE_NM`, `VUCH_STATUS_NM`, `OPEN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `MARKETING_NO`) VALUES ('THD000000001','THDVUCH0001','SCURTDEMO0001','admin',100.00,'2','2026-06-27','2026-06-27','admin','认领时间2026-06-27-13.48.58认领工号admin认领理由审批时间2026-06-27 13:58:30审批工号admin审批理由页面批复通过。',NULL,'1000','演示机构','演示第三方客户','IDTHD0001','第三方业务','有效','2026-03-20','管理员','1000','演示机构',NULL);
/*!40000 ALTER TABLE `t1_thd_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_acc_rela`
--

LOCK TABLES `t1_vuch_acc_rela` WRITE;
/*!40000 ALTER TABLE `t1_vuch_acc_rela` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_acc_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_acc_rela_tmp`
--

LOCK TABLES `t1_vuch_acc_rela_tmp` WRITE;
/*!40000 ALTER TABLE `t1_vuch_acc_rela_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_acc_rela_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_detail`
--

LOCK TABLES `t1_vuch_detail` WRITE;
/*!40000 ALTER TABLE `t1_vuch_detail` DISABLE KEYS */;
INSERT INTO `t1_vuch_detail` (`VUCH_NBR`, `VUCH_TYPE_ID`, `VUCH_TYPE_NM`, `WITH_CARD_F`, `CST_ID`, `CST_NM`, `ORG_ID`, `ORG_NM`, `BRANCH_ORG_NM`, `BRANCH_ORG_ID`, `OPEN_DT`, `CLOSE_DT`, `VUCH_STATUS_ID`, `VUCH_STATUS_NM`, `PROD_ID`, `PROD_NM`, `BIZ_TYPE_ID`, `BIZ_TYPE_NM`, `DEPT_ID`, `LN_AMT`, `MARKETING_NO`, `EMP_ID`, `CST_OPEN_DT`) VALUES ('QQDEMO0001','10','存折','0','CSTQQ0001','蛐蛐网客户','1000','演示机构','演示机构','1000','2026-01-15',NULL,1,'有效','DEPQQ001','蛐蛐网存欢','01',NULL,100,NULL,'2016qq','admin','2026-01-15'),('LNDEMO0001','21',NULL,'0','CSTLN0001','贷款客户','1000','演示机构','演示机构','1000','2026-02-18',NULL,1,'有效','LN000001',NULL,'CC','个人贷款工作',100,500000.000,NULL,'admin','2026-02-18'),('DEPDEMO0001','10','存折','0','CSTQQ0001','蛐蛐网客户','1000','演示机构','演示机构','1000','2026-01-15',NULL,1,'有效','DEPQQ001','蛐蛐网存欢','SD','储蓄存款',100,NULL,NULL,'admin','2026-01-15'),('DEPFHDEMO0001','10','存折','0','CSTQQ0001','蛐蛐网客户','1000','演示机构','演示机构','1000','2026-01-15',NULL,1,'有效','DEPQQ001','蛐蛐网存欢','SD','储蓄存款',100,NULL,NULL,'admin','2026-01-15');
/*!40000 ALTER TABLE `t1_vuch_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_detail_20251204`
--

LOCK TABLES `t1_vuch_detail_20251204` WRITE;
/*!40000 ALTER TABLE `t1_vuch_detail_20251204` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_detail_20251204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_detail_tmp`
--

LOCK TABLES `t1_vuch_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t1_vuch_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela`
--

LOCK TABLES `t1_vuch_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_vuch_emp_rela` (`VUCH_NBR`, `EMP_ID`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `ORG_ID`, `ORG_NM`, `CST_NM`, `BIZ_TYPE_NM`, `VUCH_STATUS_NM`, `OPEN_DT`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`, `MARKETING_NO`, `FH_VERIFY_DT`, `FH_VERIFY_EMP_ID`, `CST_OPEN_DT`, `CST_ID`, `BIZ_TP_CD`, `BIZ_TP_NM`, `ST_LINE_TP_ID`, `PROD_ID`, `CTR_NBR`, `CTR_BAL`, `LN_DRDN_DT`, `LN_END_DT`, `LN_TP_ID`, `MIN_DRDN_DT_BY_CST`, `ADD_CST_FLAG`, `ADD_CTR_FLAG`, `ADD_FLAG`, `MNG_LINE_TP_ID`, `ACT_INT_INCM`, `ACR_INT_INCM`, `RISK_FLAG`, `RVS_EMP_ID`, `RVS_DT`, `RVS_CLAIM_EMP_ID`, `RVS_CLAIM_DT`, `RVS_RATIO`, `FH_VERIFY_EMP_NM`, `RVS_EMP_NM`, `RVS_CLAIM_EMP_NM`, `RVS_STATUS_ID`) VALUES ('QQDEMO0001','admin',100.00,'6','2026-06-27','2026-06-27','admin','2026-06-27 20:39:00有权人:admin蛐蛐网活动认领输入界面修改存款联系人。',NULL,'1000','演示机构','蛐蛐网客户',NULL,'有效','2026-01-15','管理员','1000','演示机构','2016qq',NULL,NULL,'2026-01-15','CSTQQ0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('LNDEMO0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','认领工号admin 姓名 管理员 认领时间2026-06-27-13.32.33 备注 初审工号admin 姓名管理员 时间2026-06-27 14:35:41 备注初审通过。 终审工号admin 姓名管理员 时间2026-06-27 15:18:56 备注终审通过。调整审批通过。调整审批通过。调整审批未通过理由fs-reject-test','','1000','演示机构','贷款客户','个人贷款工作','有效','2026-02-18','管理员','1000','演示机构','','2026-06-27','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','2026-06-27','admin','2026-06-27',70.00,'管理员','管理员','','3'),('EXSDEMO0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','审批时间2026-06-27 14:50:40审批工号admin审批理由页面批复存量客户支行审核通过。审批时间2026-06-27 14:54:10审批工号admin审批理由页面批复存量客户分行行审核通过。',NULL,'1000','演示机构','存量客户','储蓄存款','有效','2017-12-31','管理员','1000','演示机构',NULL,NULL,NULL,'2017-12-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('DEPDEMO0001','admin',80.00,'1','2026-06-27',NULL,'','认领工号admin 姓名 管理员 认领时间2026-06-27-20.41.35 备注','','1000','演示机构','蛐蛐网客户','储蓄存款','有效','2026-01-15','管理员','1000','演示机构','',NULL,'','2026-01-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,''),('DEPFHDEMO0001','admin',100.00,'2','2026-06-27','2026-06-27','admin','2026-06-27 20:48:14分行管理员admin登录claim_dep_FH页面，对业绩直接分配','fh-save-test','1000','演示机构','蛐蛐网客户','储蓄存款','有效','2026-01-15','管理员','1000','演示机构','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `t1_vuch_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_20160407_baseline`
--

LOCK TABLES `t1_vuch_emp_rela_20160407_baseline` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20160407_baseline` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20160407_baseline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_20250806`
--

LOCK TABLES `t1_vuch_emp_rela_20250806` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20250806` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20250806` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_20250812`
--

LOCK TABLES `t1_vuch_emp_rela_20250812` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20250812` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_20250812` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_bak`
--

LOCK TABLES `t1_vuch_emp_rela_bak` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q`
--

LOCK TABLES `t1_vuch_emp_rela_q` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_20220831`
--

LOCK TABLES `t1_vuch_emp_rela_q_20220831` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20220831` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20220831` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_20231231less`
--

LOCK TABLES `t1_vuch_emp_rela_q_20231231less` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20231231less` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20231231less` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_20250528`
--

LOCK TABLES `t1_vuch_emp_rela_q_20250528` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20250528` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_20250528` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_bak_20260331`
--

LOCK TABLES `t1_vuch_emp_rela_q_bak_20260331` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_bak_20260331` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_bak_20260331` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_test`
--

LOCK TABLES `t1_vuch_emp_rela_q_test` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_tmp`
--

LOCK TABLES `t1_vuch_emp_rela_q_tmp` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_q_tmp_20231201`
--

LOCK TABLES `t1_vuch_emp_rela_q_tmp_20231201` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_tmp_20231201` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_q_tmp_20231201` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_vuch_emp_rela_tmp`
--

LOCK TABLES `t1_vuch_emp_rela_tmp` WRITE;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_vuch_emp_rela_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t1_ybdb_emp_rela`
--

LOCK TABLES `t1_ybdb_emp_rela` WRITE;
/*!40000 ALTER TABLE `t1_ybdb_emp_rela` DISABLE KEYS */;
INSERT INTO `t1_ybdb_emp_rela` (`INSURE_NO`, `EMP_ID`, `TA_CODE`, `TA_NAME`, `PRD_CODE`, `PRD_NAME`, `CLIENT_NO`, `HOLDER_NAME`, `HOLDER_ID_TYPE`, `HOLDER_ID_CODE`, `RELATION`, `INSURED_NAME`, `INSURED_ID_TYPE`, `INSURED_ID_CODE`, `BRANCH_NO`, `BRANCH_NO_CH`, `OPER_NO`, `TRANS_DATE`, `SERIAL_NO`, `INSURE_DATE`, `CFM_DATE`, `PAY_YEAR`, `INSURE_YEAR_TYPE`, `INSURE_YEAR`, `EFFECT_DATE`, `PAY_TYPE`, `PAY_TYPE_CH`, `PAY_YEAR_TYPE`, `AMT`, `INSURE_FEE`, `BANK_ACC`, `VOL`, `STATUS`, `STATUS_CH`, `RECOMMENDER`, `RESERVE1`, `RATIO`, `CLAIM_STATUS_ID`, `CLAIM_DT`, `VERIFY_DT`, `VERIFY_EMP_ID`, `FH_VERIFY_DT`, `FH_VERIFY_EMP_ID`, `REMARK`, `REMARK1`, `EMP_NM`, `EMP_ORG_ID`, `EMP_ORG_NM`) VALUES ('YBDBDEMO0001','admin','TA001','演示保险公司','PRD001','演示寿健产品','CST0001','张三','01','310101199001011234','1','李四','1','310101199202023456','1000','演示网点','admin',20260627,'SER0001',20260115,20260116,'10','Y','10',20260120,1,'年缴','Y',100000.00,12000.00,'6222000000000001',1.00,'A','有效','REC0001',NULL,100.00,'1','2026-06-27',NULL,NULL,NULL,NULL,'认领时间2026-06-27-10.28.50认领工号admin认领理由演示可保单','','管理员','1000','演示机构'),('YBDBDEMO0002','admin','TA001','演示保险公司','PRD002','演示卓红产品','CST0002','王五','01','310101198805058888','2','赵六','1','310101199505056666','1000','演示网点','admin',20260627,'SER0002',20260218,20260220,'5','Y','5',20260221,1,'年缴','Y',80000.00,8600.00,'6222000000000002',1.00,'A','有效','REC0002',NULL,60.00,'2','2026-06-27','2026-06-27','admin',NULL,NULL,'审批时间2026-06-27 10:26:36审批工号admin审批理由页面批复通过。',NULL,'管理员','1000','演示机构');
/*!40000 ALTER TABLE `t1_ybdb_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_bonus_detail`
--

LOCK TABLES `t2_bonus_detail` WRITE;
/*!40000 ALTER TABLE `t2_bonus_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_bonus_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_cst_asset_score`
--

LOCK TABLES `t2_cst_asset_score` WRITE;
/*!40000 ALTER TABLE `t2_cst_asset_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_cst_asset_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_bill_income`
--

LOCK TABLES `t2_emp_bill_income` WRITE;
/*!40000 ALTER TABLE `t2_emp_bill_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_bill_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_bonus_smy`
--

LOCK TABLES `t2_emp_bonus_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_bonus_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_bonus_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_chg_profit`
--

LOCK TABLES `t2_emp_chg_profit` WRITE;
/*!40000 ALTER TABLE `t2_emp_chg_profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_chg_profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_20220823`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_20220823` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_20220823` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_20220823` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_20230331`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_20230331` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_20230331` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_20230331` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_oldto20210818`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_oldto20210818` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_oldto20210818` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_oldto20210818` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_tmp`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_tmp_bak`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_tmp_bak` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_tmp_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_tmp_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_acc_profit_detail_zrzz`
--

LOCK TABLES `t2_emp_dep_ln_acc_profit_detail_zrzz` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_zrzz` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_acc_profit_detail_zrzz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy_20220823`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy_20220823` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20220823` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20220823` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy_20230331`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy_20230331` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20230331` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20230331` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy_20250528`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy_20250528` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20250528` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_20250528` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy_tmp`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy_tmp` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_profit_smy_tmp_bak`
--

LOCK TABLES `t2_emp_dep_ln_profit_smy_tmp_bak` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_tmp_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_profit_smy_tmp_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_20220823`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_20220823` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20220823` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20220823` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_20230331`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_20230331` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20230331` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20230331` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_20250528`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_20250528` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20250528` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_20250528` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_bak`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_bak` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_oldto20210818`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_oldto20210818` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_oldto20210818` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_oldto20210818` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_tmp`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_tmp_bak`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_tmp_bak` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dep_ln_vuch_profit_detail_tmp_ts`
--

LOCK TABLES `t2_emp_dep_ln_vuch_profit_detail_tmp_ts` WRITE;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dep_ln_vuch_profit_detail_tmp_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dfslry_smy`
--

LOCK TABLES `t2_emp_dfslry_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_dfslry_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dfslry_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dfslry_vuch_detail`
--

LOCK TABLES `t2_emp_dfslry_vuch_detail` WRITE;
/*!40000 ALTER TABLE `t2_emp_dfslry_vuch_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dfslry_vuch_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_dx_score`
--

LOCK TABLES `t2_emp_dx_score` WRITE;
/*!40000 ALTER TABLE `t2_emp_dx_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_dx_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_fnc_pd_bonus_smy`
--

LOCK TABLES `t2_emp_fnc_pd_bonus_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_fnc_pd_bonus_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_fnc_pd_bonus_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_fund_smy`
--

LOCK TABLES `t2_emp_fund_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_fund_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_fund_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_fund_smy_20240730`
--

LOCK TABLES `t2_emp_fund_smy_20240730` WRITE;
/*!40000 ALTER TABLE `t2_emp_fund_smy_20240730` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_fund_smy_20240730` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_insur_bonus_smy`
--

LOCK TABLES `t2_emp_insur_bonus_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_insur_bonus_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_insur_bonus_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_ln_profit_bl_chg`
--

LOCK TABLES `t2_emp_ln_profit_bl_chg` WRITE;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_ln_profit_bl_chg_20211122`
--

LOCK TABLES `t2_emp_ln_profit_bl_chg_20211122` WRITE;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg_20211122` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg_20211122` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_ln_profit_bl_chg_tmp`
--

LOCK TABLES `t2_emp_ln_profit_bl_chg_tmp` WRITE;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_ln_profit_bl_chg_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_other_biz`
--

LOCK TABLES `t2_emp_other_biz` WRITE;
/*!40000 ALTER TABLE `t2_emp_other_biz` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_other_biz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_other_biz20190513`
--

LOCK TABLES `t2_emp_other_biz20190513` WRITE;
/*!40000 ALTER TABLE `t2_emp_other_biz20190513` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_other_biz20190513` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_emp_thd_smy`
--

LOCK TABLES `t2_emp_thd_smy` WRITE;
/*!40000 ALTER TABLE `t2_emp_thd_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_emp_thd_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_ent_cst_dep_ln_profit`
--

LOCK TABLES `t2_ent_cst_dep_ln_profit` WRITE;
/*!40000 ALTER TABLE `t2_ent_cst_dep_ln_profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_ent_cst_dep_ln_profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_fnc_pd_bonus_detail`
--

LOCK TABLES `t2_fnc_pd_bonus_detail` WRITE;
/*!40000 ALTER TABLE `t2_fnc_pd_bonus_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_fnc_pd_bonus_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_fnc_pd_bonus_detail_tmp`
--

LOCK TABLES `t2_fnc_pd_bonus_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t2_fnc_pd_bonus_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_fnc_pd_bonus_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_ibs_cst_asset`
--

LOCK TABLES `t2_ibs_cst_asset` WRITE;
/*!40000 ALTER TABLE `t2_ibs_cst_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_ibs_cst_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_insur_bonus_detail`
--

LOCK TABLES `t2_insur_bonus_detail` WRITE;
/*!40000 ALTER TABLE `t2_insur_bonus_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_insur_bonus_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_ln_lobby_manager_bonus_detail`
--

LOCK TABLES `t2_ln_lobby_manager_bonus_detail` WRITE;
/*!40000 ALTER TABLE `t2_ln_lobby_manager_bonus_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_ln_lobby_manager_bonus_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_ou_dfslry_smy`
--

LOCK TABLES `t2_ou_dfslry_smy` WRITE;
/*!40000 ALTER TABLE `t2_ou_dfslry_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_ou_dfslry_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t2_ybdb_ins_detail`
--

LOCK TABLES `t2_ybdb_ins_detail` WRITE;
/*!40000 ALTER TABLE `t2_ybdb_ins_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_ybdb_ins_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_banus_share_ratio`
--

LOCK TABLES `t3_banus_share_ratio` WRITE;
/*!40000 ALTER TABLE `t3_banus_share_ratio` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_banus_share_ratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_commission_ratio`
--

LOCK TABLES `t3_commission_ratio` WRITE;
/*!40000 ALTER TABLE `t3_commission_ratio` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_commission_ratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_credit_card_price`
--

LOCK TABLES `t3_credit_card_price` WRITE;
/*!40000 ALTER TABLE `t3_credit_card_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_credit_card_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_fnc_price`
--

LOCK TABLES `t3_fnc_price` WRITE;
/*!40000 ALTER TABLE `t3_fnc_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_fnc_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_fnc_prod_price`
--

LOCK TABLES `t3_fnc_prod_price` WRITE;
/*!40000 ALTER TABLE `t3_fnc_prod_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_fnc_prod_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_insur_prod_price`
--

LOCK TABLES `t3_insur_prod_price` WRITE;
/*!40000 ALTER TABLE `t3_insur_prod_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_insur_prod_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_per_fnc_qual`
--

LOCK TABLES `t3_per_fnc_qual` WRITE;
/*!40000 ALTER TABLE `t3_per_fnc_qual` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_per_fnc_qual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_personal_ln_price`
--

LOCK TABLES `t3_personal_ln_price` WRITE;
/*!40000 ALTER TABLE `t3_personal_ln_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_personal_ln_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_emp_smy`
--

LOCK TABLES `t3_resource_manager_emp_smy` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_emp_smy20210120`
--

LOCK TABLES `t3_resource_manager_emp_smy20210120` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy20210120` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy20210120` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_emp_smy20211011`
--

LOCK TABLES `t3_resource_manager_emp_smy20211011` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy20211011` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy20211011` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_emp_smy_bak`
--

LOCK TABLES `t3_resource_manager_emp_smy_bak` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_emp_smy_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_smy`
--

LOCK TABLES `t3_resource_manager_smy` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_smy20211203`
--

LOCK TABLES `t3_resource_manager_smy20211203` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_smy20211203` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_smy20211203` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_smy_tmp`
--

LOCK TABLES `t3_resource_manager_smy_tmp` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_smy_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_smy_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_vuch_detail`
--

LOCK TABLES `t3_resource_manager_vuch_detail` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_vuch_detail20210120`
--

LOCK TABLES `t3_resource_manager_vuch_detail20210120` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail20210120` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail20210120` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_vuch_detail_bak`
--

LOCK TABLES `t3_resource_manager_vuch_detail_bak` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_vuch_detail_tmp`
--

LOCK TABLES `t3_resource_manager_vuch_detail_tmp` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_resource_manager_vuch_detail_tmp20211013`
--

LOCK TABLES `t3_resource_manager_vuch_detail_tmp20211013` WRITE;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_tmp20211013` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_resource_manager_vuch_detail_tmp20211013` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_sign_prod_price`
--

LOCK TABLES `t3_sign_prod_price` WRITE;
/*!40000 ALTER TABLE `t3_sign_prod_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_sign_prod_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t3_small_business_ln_prod_price`
--

LOCK TABLES `t3_small_business_ln_prod_price` WRITE;
/*!40000 ALTER TABLE `t3_small_business_ln_prod_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_small_business_ln_prod_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_banus_share_ratio_h`
--

LOCK TABLES `t4_banus_share_ratio_h` WRITE;
/*!40000 ALTER TABLE `t4_banus_share_ratio_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_banus_share_ratio_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_credit_card_price_h`
--

LOCK TABLES `t4_credit_card_price_h` WRITE;
/*!40000 ALTER TABLE `t4_credit_card_price_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_credit_card_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_fnc_prod_price_h`
--

LOCK TABLES `t4_fnc_prod_price_h` WRITE;
/*!40000 ALTER TABLE `t4_fnc_prod_price_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_fnc_prod_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_personal_ln_price_h`
--

LOCK TABLES `t4_personal_ln_price_h` WRITE;
/*!40000 ALTER TABLE `t4_personal_ln_price_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_personal_ln_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_sign_prod_price_h`
--

LOCK TABLES `t4_sign_prod_price_h` WRITE;
/*!40000 ALTER TABLE `t4_sign_prod_price_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_sign_prod_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t4_small_business_ln_prod_price_h`
--

LOCK TABLES `t4_small_business_ln_prod_price_h` WRITE;
/*!40000 ALTER TABLE `t4_small_business_ln_prod_price_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `t4_small_business_ln_prod_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp`
--

LOCK TABLES `t5_emp` WRITE;
/*!40000 ALTER TABLE `t5_emp` DISABLE KEYS */;
INSERT INTO `t5_emp` (`EMP_ID`, `EMP_TYPE_ID`, `EMP_NM`, `GENDER`, `BIRTHDAY`, `ORG_ID`, `ORG_NM`, `BRANCH_ORG_ID`, `BRANCH_ORG_NM`, `POSITION_ID`, `POSITION_NM`, `MOBILE`, `PSTN_TYPE`, `PSTN_TYPE_NM`, `SUB_PSTN_TYPE`, `SUB_PSTN_TYPE_NM`, `HR_ORG_NAME`) VALUES ('admin','01','管理员','M','1990-01-01','1000','演示机构','1000','演示机构',1,'管理员','13800000000','0001','管理员','0001','管理员','信息科技部'),('10001','01','演示员工',NULL,NULL,'1000','演示机构','1000','演示机构',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('claimer_gold','01','贵金属演示认领员',NULL,NULL,'9001','演示支行','9002','演示分行',1,'认领员','13800009001','0001','认领岗','0001','认领岗','贵金演示部'),('verifier_gold','01','贵金属演示审核员',NULL,NULL,'9002','演示分行','9002','演示分行',2,'审核员','13800009002','0002','审核岗','0002','审核岗','贵金演示部');
/*!40000 ALTER TABLE `t5_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_assessment_q`
--

LOCK TABLES `t5_emp_assessment_q` WRITE;
/*!40000 ALTER TABLE `t5_emp_assessment_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_assessment_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_bzjx`
--

LOCK TABLES `t5_emp_bzjx` WRITE;
/*!40000 ALTER TABLE `t5_emp_bzjx` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_bzjx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate`
--

LOCK TABLES `t5_emp_certificate` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20211022`
--

LOCK TABLES `t5_emp_certificate_20211022` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20211022` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20211022` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20211122`
--

LOCK TABLES `t5_emp_certificate_20211122` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20211122` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20211122` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20211228`
--

LOCK TABLES `t5_emp_certificate_20211228` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20211228` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20211228` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20220822`
--

LOCK TABLES `t5_emp_certificate_20220822` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20220822` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20220822` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20230601`
--

LOCK TABLES `t5_emp_certificate_20230601` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20230601` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20230601` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20231228`
--

LOCK TABLES `t5_emp_certificate_20231228` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20231228` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20231228` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20240220`
--

LOCK TABLES `t5_emp_certificate_20240220` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20240220` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20240220` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20240513`
--

LOCK TABLES `t5_emp_certificate_20240513` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20240513` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20240513` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_20240919`
--

LOCK TABLES `t5_emp_certificate_20240919` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_20240919` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_20240919` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_certificate_bak`
--

LOCK TABLES `t5_emp_certificate_bak` WRITE;
/*!40000 ALTER TABLE `t5_emp_certificate_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_certificate_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_gdq_or_gz`
--

LOCK TABLES `t5_emp_gdq_or_gz` WRITE;
/*!40000 ALTER TABLE `t5_emp_gdq_or_gz` DISABLE KEYS */;
INSERT INTO `t5_emp_gdq_or_gz` (`EXAM_YEAR`, `EXAM_Q`, `EMP_TYPE`, `EMP_ID`, `EMP_NM`, `ORG_ID`, `ORG_NM`, `BRANCH_ORG_ID`, `BRANCH_ORG_NM`, `POSITION_DT`, `PSTN_TYPE`, `PSTN_TYPE_NM`, `SUB_PSTN_TYPE`, `SUB_PSTN_TYPE_NM`, `STATUS`, `GDQ_STDT`, `GDQ_ENDDT`, `CERT_GRADE`, `DX_SCORE`, `SJ_BZ_JX`, `YF_JX`, `IS_EXAM`, `REMARK`, `MODIFY_PEOPLE`, `MODIFY_TIME`, `MODIFY_IP`, `DEL_FLAG`, `VERIFY_PEOPLE`, `VERIFY_TIME`, `VERIFY_IP`, `MEASURE_DT`) VALUES ('2026','01','过渡期','admin','管理员','1000','演示机构','1000','演示机构',NULL,'0001','管理员','0001','管理员','3','2026-01-01','2026-04-16',NULL,NULL,NULL,NULL,NULL,'审批通过','admin','2026-06-27 21:15:00','192.168.65.1',0,'admin','2026-06-27 21:26:09','192.168.65.1','2026-03-31');
/*!40000 ALTER TABLE `t5_emp_gdq_or_gz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_q`
--

LOCK TABLES `t5_emp_q` WRITE;
/*!40000 ALTER TABLE `t5_emp_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_emp_resource_manager`
--

LOCK TABLES `t5_emp_resource_manager` WRITE;
/*!40000 ALTER TABLE `t5_emp_resource_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_emp_resource_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_lobby_manager_score_q`
--

LOCK TABLES `t5_lobby_manager_score_q` WRITE;
/*!40000 ALTER TABLE `t5_lobby_manager_score_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_lobby_manager_score_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_manager_y_score`
--

LOCK TABLES `t5_manager_y_score` WRITE;
/*!40000 ALTER TABLE `t5_manager_y_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_manager_y_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_org`
--

LOCK TABLES `t5_org` WRITE;
/*!40000 ALTER TABLE `t5_org` DISABLE KEYS */;
INSERT INTO `t5_org` (`ORG_ID`, `ORG_TYPE_ID`, `ORG_IP_ID`, `ORG_NM`, `ORG_LEVEL_ID`, `BRANCH_ORG_ID`, `BRANCH_ORG_NM`, `HEAD_ORG_ID`, `HEAD_ORG_NM`) VALUES ('1000','EO',1000,'演示机构','1','1000','演示机构','9990','演示总行'),('1000','AO',1000,'演示网点','1','1000','演示网点','9990','演示总行'),('9000','EO',9000,'演示总行','3','9002','演示分行','9000','演示总行'),('9002','EO',9002,'演示分行','2','9002','演示分行','9000','演示总行'),('9001','EO',9001,'演示支行','1','9002','演示分行','9000','演示总行'),('9000','AO',9000,'演示总行','3','9002','演示分行','9000','演示总行'),('9002','AO',9002,'演示分行','2','9002','演示分行','9000','演示总行'),('9001','AO',9001,'演示支行','1','9002','演示分行','9000','演示总行');
/*!40000 ALTER TABLE `t5_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_org_meg`
--

LOCK TABLES `t5_org_meg` WRITE;
/*!40000 ALTER TABLE `t5_org_meg` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_org_meg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t5_ybdb_per_fee_ration`
--

LOCK TABLES `t5_ybdb_per_fee_ration` WRITE;
/*!40000 ALTER TABLE `t5_ybdb_per_fee_ration` DISABLE KEYS */;
/*!40000 ALTER TABLE `t5_ybdb_per_fee_ration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t6_sales_distribute_log`
--

LOCK TABLES `t6_sales_distribute_log` WRITE;
/*!40000 ALTER TABLE `t6_sales_distribute_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t6_sales_distribute_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t6_sales_distribute_log_cj`
--

LOCK TABLES `t6_sales_distribute_log_cj` WRITE;
/*!40000 ALTER TABLE `t6_sales_distribute_log_cj` DISABLE KEYS */;
/*!40000 ALTER TABLE `t6_sales_distribute_log_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t6_vuch_emp_rela_change_log`
--

LOCK TABLES `t6_vuch_emp_rela_change_log` WRITE;
/*!40000 ALTER TABLE `t6_vuch_emp_rela_change_log` DISABLE KEYS */;
INSERT INTO `t6_vuch_emp_rela_change_log` (`VUCH_NBR`, `OLD_EMP_ID`, `OLD_RATIO`, `OLD_CLAIM_STATUS_ID`, `OLD_CLAIM_DT`, `OLD_VERIFY_DT`, `OLD_VERIFY_EMP_ID`, `OLD_REMARK`, `NEW_EMP_ID`, `NEW_RATIO`, `NEW_CLAIM_STATUS_ID`, `NEW_CLAIM_DT`, `NEW_VERIFY_DT`, `NEW_VERIFY_EMP_ID`, `NEW_REMARK`, `CHANGE_TYPE`, `NEW_FIN_VERIFY_DT`, `NEW_FIN_VERIFY_EMP_ID`, `CHANGE_FLAG`, `NEW_VERIFY_EMP_NM`, `NEW_FIN_VERIFY_EMP_NM`, `CST_NM`, `ORG_ID`, `EMP_NM`, `OLD_FH_VERIFY_DT`, `OLD_FH_VERIFY_EMP_ID`, `OLD_FH_VERIFY_EMP_NM`, `BIZ_TYPE_NM`) VALUES ('','',100.00,'6',NULL,NULL,'','','admin',100.00,'6','2026-06-27 11:23:14','2026-06-27 11:23:14','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','admin',100.00,'6','2026-06-27 11:24:37','2026-06-27 11:24:37','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','admin',100.00,'6','2026-06-27 11:27:20','2026-06-27 11:27:20','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','admin',100.00,'6','2026-06-27 11:28:50','2026-06-27 11:28:50','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','10001',100.00,'6','2026-06-27 11:30:09','2026-06-27 11:30:09','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：10001','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','10001',100.00,'6','2026-06-27 11:33:35','2026-06-27 11:33:35','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：10001','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','10001',100.00,'6','2026-06-27 11:35:13','2026-06-27 11:35:13','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：10001','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','',100.00,'6',NULL,NULL,'','','10001',100.00,'6','2026-06-27 11:36:09','2026-06-27 11:36:09','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：调整后认领人为：10001','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('QQDEMO0001','admin',100.00,'6','2026-06-27','2026-06-27','admin','æ¼”ç¤ºè›è›ç½‘æ´»åŠ¨è®¤é¢†','10001',100.00,'6','2026-06-27 11:38:01','2026-06-27 11:38:01','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：admin调整后认领人为：10001','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('LNDEMO0001','admin',80.00,'2','2026-06-27','2026-06-27','admin','认领工号admin 姓名 管理员 认领时间2026-06-27-13.32.33 备注 初审工号admin 姓名管理员 时间2026-06-27 14:35:41 备注初审通过。 终审工号admin 姓名管理员 时间2026-06-27 15:18:56 备注终审通过。','admin',70.00,'3','2026-06-27 00:00:00',NULL,'',' 调整人工号admin 姓名管理员 时间2026-06-27 19:49:43 备注认领调整。调整审批通过。调整审批未通过理由fs-reject-test','U','2026-06-27 20:05:46','admin','0','','管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('QQDEMO0001','10001',100.00,'6','2026-06-27','2026-06-27','admin','2026-06-27 11:38:01有权人:admin蛐蛐网活动认领输入界面修改存款联系人。','admin',100.00,'6','2026-06-27 20:38:15','2026-06-27 20:38:15','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：10001调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('QQDEMO0001','admin',100.00,'6','2026-06-27','2026-06-27','admin','2026-06-27 20:38:15有权人:admin蛐蛐网活动认领输入界面修改存款联系人。','admin',100.00,'6','2026-06-27 20:39:00','2026-06-27 20:39:00','admin','2026-06-27 00:00:00有权人:admin通过蛐蛐网认领页面调整认领,调整前认领人为：admin调整后认领人为：admin','U',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t6_vuch_emp_rela_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t6_vuch_emp_rela_change_log_20250812`
--

LOCK TABLES `t6_vuch_emp_rela_change_log_20250812` WRITE;
/*!40000 ALTER TABLE `t6_vuch_emp_rela_change_log_20250812` DISABLE KEYS */;
/*!40000 ALTER TABLE `t6_vuch_emp_rela_change_log_20250812` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_cst_marketing_detail`
--

LOCK TABLES `t7_cst_marketing_detail` WRITE;
/*!40000 ALTER TABLE `t7_cst_marketing_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_cst_marketing_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy`
--

LOCK TABLES `t7_emp_smy` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy20220331`
--

LOCK TABLES `t7_emp_smy20220331` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy20220331` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy20220331` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy20221114`
--

LOCK TABLES `t7_emp_smy20221114` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy20221114` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy20221114` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_20240606`
--

LOCK TABLES `t7_emp_smy_20240606` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_20240606` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_20240606` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_20241125`
--

LOCK TABLES `t7_emp_smy_20241125` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_20241125` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_20241125` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_bak`
--

LOCK TABLES `t7_emp_smy_bak` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_tmp`
--

LOCK TABLES `t7_emp_smy_tmp` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_tmp20231205`
--

LOCK TABLES `t7_emp_smy_tmp20231205` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_tmp20231205` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_tmp20231205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_emp_smy_tmp_result`
--

LOCK TABLES `t7_emp_smy_tmp_result` WRITE;
/*!40000 ALTER TABLE `t7_emp_smy_tmp_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_emp_smy_tmp_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_lobby_manager_smy`
--

LOCK TABLES `t7_lobby_manager_smy` WRITE;
/*!40000 ALTER TABLE `t7_lobby_manager_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_lobby_manager_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t7_tmp`
--

LOCK TABLES `t7_tmp` WRITE;
/*!40000 ALTER TABLE `t7_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t8_data_dt`
--

LOCK TABLES `t8_data_dt` WRITE;
/*!40000 ALTER TABLE `t8_data_dt` DISABLE KEYS */;
/*!40000 ALTER TABLE `t8_data_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t8_tbp`
--

LOCK TABLES `t8_tbp` WRITE;
/*!40000 ALTER TABLE `t8_tbp` DISABLE KEYS */;
/*!40000 ALTER TABLE `t8_tbp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_emp_rela_q_switch`
--

LOCK TABLES `t99_emp_rela_q_switch` WRITE;
/*!40000 ALTER TABLE `t99_emp_rela_q_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_emp_rela_q_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_help`
--

LOCK TABLES `t99_help` WRITE;
/*!40000 ALTER TABLE `t99_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_middle_income_switch`
--

LOCK TABLES `t99_middle_income_switch` WRITE;
/*!40000 ALTER TABLE `t99_middle_income_switch` DISABLE KEYS */;
INSERT INTO `t99_middle_income_switch` (`MEASURE_DT`, `SWITCH_F`, `REMARK`) VALUES ('2026-03-31','1','seed');
/*!40000 ALTER TABLE `t99_middle_income_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_new_megs`
--

LOCK TABLES `t99_new_megs` WRITE;
/*!40000 ALTER TABLE `t99_new_megs` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_new_megs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_resource_manager_profit`
--

LOCK TABLES `t99_resource_manager_profit` WRITE;
/*!40000 ALTER TABLE `t99_resource_manager_profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_resource_manager_profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_resource_manager_profit_detail`
--

LOCK TABLES `t99_resource_manager_profit_detail` WRITE;
/*!40000 ALTER TABLE `t99_resource_manager_profit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_resource_manager_profit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t99_vuch_bal`
--

LOCK TABLES `t99_vuch_bal` WRITE;
/*!40000 ALTER TABLE `t99_vuch_bal` DISABLE KEYS */;
/*!40000 ALTER TABLE `t99_vuch_bal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_amt_interval_type`
--

LOCK TABLES `t9_amt_interval_type` WRITE;
/*!40000 ALTER TABLE `t9_amt_interval_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_amt_interval_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_biz_type`
--

LOCK TABLES `t9_biz_type` WRITE;
/*!40000 ALTER TABLE `t9_biz_type` DISABLE KEYS */;
INSERT INTO `t9_biz_type` (`BIZ_TYPE_ID`, `BIZ_TYPE_NM`, `BIZ_TYPE_NM_NEW`, `BIZ_TYPE_CGY`) VALUES ('CC','个人贷款工作','个人贷款工作',NULL),('SD','储蓄存款','储蓄存款',NULL);
/*!40000 ALTER TABLE `t9_biz_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_bonus_status`
--

LOCK TABLES `t9_bonus_status` WRITE;
/*!40000 ALTER TABLE `t9_bonus_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_bonus_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_bonus_type`
--

LOCK TABLES `t9_bonus_type` WRITE;
/*!40000 ALTER TABLE `t9_bonus_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_bonus_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_certificate`
--

LOCK TABLES `t9_certificate` WRITE;
/*!40000 ALTER TABLE `t9_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_channel`
--

LOCK TABLES `t9_channel` WRITE;
/*!40000 ALTER TABLE `t9_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_claim_status_type`
--

LOCK TABLES `t9_claim_status_type` WRITE;
/*!40000 ALTER TABLE `t9_claim_status_type` DISABLE KEYS */;
INSERT INTO `t9_claim_status_type` (`CLAIM_STATUS_ID`, `CLAIM_STATUS_NM`) VALUES ('0','待提交'),('1','待审核'),('2','审核通过'),('3','审核不通过'),('7','飀回修改');
/*!40000 ALTER TABLE `t9_claim_status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_fnc_txn_cd`
--

LOCK TABLES `t9_fnc_txn_cd` WRITE;
/*!40000 ALTER TABLE `t9_fnc_txn_cd` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_fnc_txn_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_fund_txn_cd`
--

LOCK TABLES `t9_fund_txn_cd` WRITE;
/*!40000 ALTER TABLE `t9_fund_txn_cd` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_fund_txn_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_manager_y_score_type`
--

LOCK TABLES `t9_manager_y_score_type` WRITE;
/*!40000 ALTER TABLE `t9_manager_y_score_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_manager_y_score_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_marketing_type`
--

LOCK TABLES `t9_marketing_type` WRITE;
/*!40000 ALTER TABLE `t9_marketing_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_marketing_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_org_level`
--

LOCK TABLES `t9_org_level` WRITE;
/*!40000 ALTER TABLE `t9_org_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_org_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_org_type`
--

LOCK TABLES `t9_org_type` WRITE;
/*!40000 ALTER TABLE `t9_org_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_org_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_per_type`
--

LOCK TABLES `t9_per_type` WRITE;
/*!40000 ALTER TABLE `t9_per_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_per_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_pstn_type`
--

LOCK TABLES `t9_pstn_type` WRITE;
/*!40000 ALTER TABLE `t9_pstn_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_pstn_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_recommend_type`
--

LOCK TABLES `t9_recommend_type` WRITE;
/*!40000 ALTER TABLE `t9_recommend_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_recommend_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_rvs_status_type`
--

LOCK TABLES `t9_rvs_status_type` WRITE;
/*!40000 ALTER TABLE `t9_rvs_status_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_rvs_status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_sp_groupid`
--

LOCK TABLES `t9_sp_groupid` WRITE;
/*!40000 ALTER TABLE `t9_sp_groupid` DISABLE KEYS */;
INSERT INTO `t9_sp_groupid` (`GROUP_ID`, `GROUP_NM`, `BIZ_TYP`, `IS_CS`, `IS_FS`, `SP_TYP`) VALUES ('gold_verifier_group','贵金属演示审核组','贵金属业务','1','0','按部门');
/*!40000 ALTER TABLE `t9_sp_groupid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_term_interval_type`
--

LOCK TABLES `t9_term_interval_type` WRITE;
/*!40000 ALTER TABLE `t9_term_interval_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_term_interval_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_vuch_type`
--

LOCK TABLES `t9_vuch_type` WRITE;
/*!40000 ALTER TABLE `t9_vuch_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_vuch_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t9_year_q`
--

LOCK TABLES `t9_year_q` WRITE;
/*!40000 ALTER TABLE `t9_year_q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t9_year_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tler_acc`
--

LOCK TABLES `tler_acc` WRITE;
/*!40000 ALTER TABLE `tler_acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tler_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp`
--

LOCK TABLES `tmp` WRITE;
/*!40000 ALTER TABLE `tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_emp_certificate`
--

LOCK TABLES `tmp_emp_certificate` WRITE;
/*!40000 ALTER TABLE `tmp_emp_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_emp_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_emp_rela`
--

LOCK TABLES `tmp_emp_rela` WRITE;
/*!40000 ALTER TABLE `tmp_emp_rela` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_emp_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t1_vuch_detail_ggpz`
--

LOCK TABLES `tmp_t1_vuch_detail_ggpz` WRITE;
/*!40000 ALTER TABLE `tmp_t1_vuch_detail_ggpz` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t1_vuch_detail_ggpz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t2_bonus_detail1`
--

LOCK TABLES `tmp_t2_bonus_detail1` WRITE;
/*!40000 ALTER TABLE `tmp_t2_bonus_detail1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t2_bonus_detail1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t2_emp_dep_ln_acc_profit_detail`
--

LOCK TABLES `tmp_t2_emp_dep_ln_acc_profit_detail` WRITE;
/*!40000 ALTER TABLE `tmp_t2_emp_dep_ln_acc_profit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t2_emp_dep_ln_acc_profit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t2_emp_dep_ln_profit_smy`
--

LOCK TABLES `tmp_t2_emp_dep_ln_profit_smy` WRITE;
/*!40000 ALTER TABLE `tmp_t2_emp_dep_ln_profit_smy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t2_emp_dep_ln_profit_smy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t2_emp_other_biz_cst_dep`
--

LOCK TABLES `tmp_t2_emp_other_biz_cst_dep` WRITE;
/*!40000 ALTER TABLE `tmp_t2_emp_other_biz_cst_dep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t2_emp_other_biz_cst_dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_t2_emp_other_biz_cst_emp_dep`
--

LOCK TABLES `tmp_t2_emp_other_biz_cst_emp_dep` WRITE;
/*!40000 ALTER TABLE `tmp_t2_emp_other_biz_cst_emp_dep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_t2_emp_other_biz_cst_emp_dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_corp_cst_dept_rela`
--

LOCK TABLES `ts_corp_cst_dept_rela` WRITE;
/*!40000 ALTER TABLE `ts_corp_cst_dept_rela` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_corp_cst_dept_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_corp_cst_dept_rela1`
--

LOCK TABLES `ts_corp_cst_dept_rela1` WRITE;
/*!40000 ALTER TABLE `ts_corp_cst_dept_rela1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_corp_cst_dept_rela1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_corp_cst_fx`
--

LOCK TABLES `ts_corp_cst_fx` WRITE;
/*!40000 ALTER TABLE `ts_corp_cst_fx` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_corp_cst_fx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_dep_ar_smy_zyl`
--

LOCK TABLES `ts_dep_ar_smy_zyl` WRITE;
/*!40000 ALTER TABLE `ts_dep_ar_smy_zyl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_dep_ar_smy_zyl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_dep_ar_zyl`
--

LOCK TABLES `ts_dep_ar_zyl` WRITE;
/*!40000 ALTER TABLE `ts_dep_ar_zyl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_dep_ar_zyl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_t1_acc_profit_detail_zyl`
--

LOCK TABLES `ts_t1_acc_profit_detail_zyl` WRITE;
/*!40000 ALTER TABLE `ts_t1_acc_profit_detail_zyl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_t1_acc_profit_detail_zyl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ts_vuch_bal`
--

LOCK TABLES `ts_vuch_bal` WRITE;
/*!40000 ALTER TABLE `ts_vuch_bal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_vuch_bal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `xnb_cst`
--

LOCK TABLES `xnb_cst` WRITE;
/*!40000 ALTER TABLE `xnb_cst` DISABLE KEYS */;
/*!40000 ALTER TABLE `xnb_cst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `xnb_vuch`
--

LOCK TABLES `xnb_vuch` WRITE;
/*!40000 ALTER TABLE `xnb_vuch` DISABLE KEYS */;
/*!40000 ALTER TABLE `xnb_vuch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02 16:39:27
