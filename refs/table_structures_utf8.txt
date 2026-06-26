--------------------------------------------------
-- Create Table CST.UPDATE_LOG
--------------------------------------------------
Create table CST.UPDATE_LOG (
    KEHHAO                         VARCHAR(10)         NOT NULL    ,
    KAZLCS                         VARCHAR(5)                      ,
    ZONGED                         VARCHAR(20)                     ,
    ZHU1YE                         VARCHAR(20)                     ,
    SHULNG                         VARCHAR(10)                     ,
    CKLXRM                         VARCHAR(8)                      ,
    LM_USER                        VARCHAR(6)                      ,
    LM_TIME                        TIMESTAMP                       ,
    BEIYZF                         VARCHAR(20)                     ,
    GNGZDW                         VARCHAR(100)                    ,
    LXDIAH                         VARCHAR(20)                     ,
    XINYDJ                         VARCHAR(2)                      ,
    DSDJZH                         VARCHAR(100)                    ,
    GSDJZH                         VARCHAR(100)                    ) 
in TS_FACT   
Partitioning Key (KEHHAO) Using Hashing;

--------------------------------------------------
-- Create Table CST.SYS_C_APP_CONSTS
--------------------------------------------------
Create table CST.SYS_C_APP_CONSTS (
    CONST_TYPE                     VARCHAR(32)                     ,
    CONST_NAME                     VARCHAR(32)         NOT NULL    ,
    CONST_VALUE                    VARCHAR(32)                     ,
    DATA_TYPE                      VARCHAR(16)                     ,
    CONST_DESCRIPTION              VARCHAR(64)                     ,
    SEQ                            INTEGER                         ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (CONST_NAME) Using Hashing;

--------------------------------------------------
-- Create Table CST.SYS_C_APP_MENU
--------------------------------------------------
Create table CST.SYS_C_APP_MENU (
    MENU_ID                        VARCHAR(64)         NOT NULL    ,
    MENU_NAME                      VARCHAR(64)         NOT NULL    ,
    SERVICE_ID                     VARCHAR(64)                     ,
    SEQ                            INTEGER                         ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ,
    MENU_TYPE                      VARCHAR(128)                    ) 
in TS_FACT   
Partitioning Key (MENU_ID) Using Hashing;
Comment on Table CST.SYS_C_APP_MENU is '菜单';

--------------------------------------------------
-- Create Table CST.SYS_C_APP_MNLT
--------------------------------------------------
Create table CST.SYS_C_APP_MNLT (
    ID                             VARCHAR(64)         NOT NULL    ,
    MENU_ID                        VARCHAR(64)         NOT NULL    ,
    GROUP_ID                       VARCHAR(64)         NOT NULL    ,
    PAGE_ID                        VARCHAR(64)         NOT NULL    ,
    PAGE_NAME                      VARCHAR(64)                     ,
    URL_PARAM                      VARCHAR(100)                    ,
    SEQ                            INTEGER                         ,
    IS_SHOW                        VARCHAR(8)          NOT NULL    ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (ID) Using Hashing;
Comment on Table CST.SYS_C_APP_MNLT is '角色与页面关系';

Create table CST.SYS_C_GB_T4754 (
    GBT4754_FST_CD                             char(1)   NOT NULL    ,
    GBT4754_FST_NM                        VARCHAR(100)         NOT NULL    ,
    GBT4754_SEC_CD                       VARCHAR(100)         NOT NULL    ,
    GBT4754_SEC_NM                        VARCHAR(100)         NOT NULL    ,
   GBT4754_TRD_CD                      char(4)                   NOT NULL    ,
    UGBT4754_TRD_NM                      VARCHAR(100)                  NOT NULL    ,
    GBT4754_CD                            char(5)   NOT NULL    ,
    GBT4754_NM                        VARCHAR(100)          NOT NULL    ,
    GBT4754_NM_PY                      VARCHAR(50)          NOT NULL    ,
     GBT4754_NM_DESC                      VARCHAR(500)              ,
 GBT4754_VSN                     VARCHAR(4)          NOT NULL                  ) 
in TS_FACT   ;
--------------------------------------------------
-- Create Table CST.SYS_C_PER_DSPL
--------------------------------------------------
Create table CST.SYS_C_PER_DSPL (
    USER_ID                        VARCHAR(32)         NOT NULL    ,
    PAGE_ID                        VARCHAR(64)         NOT NULL    ,
    REPORT_ID                      VARCHAR(64)         NOT NULL    ,
    PERSONALIZE_TYPE               VARCHAR(32)         NOT NULL    ,
    PERSONALIZE_VALUE              VARCHAR(1000)                   ) 
in TS_FACT   
Partitioning Key (USER_ID) Using Hashing;
Comment on Table CST.SYS_C_PER_DSPL is '用户报表个性化配置';
--------------------------------------------------
-- Create Table CST.SYS_C_PER_FVOR
--------------------------------------------------
Create table CST.SYS_C_PER_FVOR (
    USER_ID                        VARCHAR(32)         NOT NULL    ,
    PAGE_ID                        VARCHAR(64)         NOT NULL    ,
    SERVICE_ID                     VARCHAR(64)                     ,
    URL_PARAM                      VARCHAR(64)                     ,
    SEQ                            INTEGER                         ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (USER_ID) Using Hashing;
Comment on Table CST.SYS_C_PER_FVOR is '用户收藏';

Create table CST.SYS_C_SEC_GPPC (
    GROUP_ID                        VARCHAR(32)         NOT NULL    ,
    CHLID_GROUP_ID                        VARCHAR(64)         NOT NULL    ,
    SEQ                            INTEGER                         ,
        LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                                    ) 
in TS_FACT   
Partitioning Key (GROUP_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_GPPC is '组页面权限控制';



--------------------------------------------------
-- Create Table CST.SYS_C_SEC_GPPV
--------------------------------------------------
Create table CST.SYS_C_SEC_GPPV (
    GROUP_ID                       VARCHAR(64)         NOT NULL    ,
    PRIVILEGE_ID                   VARCHAR(64)         NOT NULL    ,
    SERVICE_ID                     VARCHAR(64)                     ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (GROUP_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_GPPV is '角色权限关系';


--------------------------------------------------
-- Create Table CST.SYS_C_SEC_GROP
--------------------------------------------------
Create table CST.SYS_C_SEC_GROP (
    GROUP_ID                       VARCHAR(64)         NOT NULL    ,
    GROUP_DESCRIPTION              VARCHAR(64)                     ,
    SERVICE_ID                     VARCHAR(64)                     ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (GROUP_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_GROP is '角色表';



--------------------------------------------------
-- Create Table CST.SYS_C_SEC_PAGE
--------------------------------------------------
Create table CST.SYS_C_SEC_PAGE (
    PAGE_ID                        VARCHAR(64)         NOT NULL    ,
    PAGE_NAME                      VARCHAR(64)                     ,
    PAGE_DESCRIPTION               VARCHAR(64)                     ,
    SERVICE_ID                     VARCHAR(64)                     ,
    HITS                           INTEGER                         ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (PAGE_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_PAGE is '页面';



--------------------------------------------------
-- Create Table CST.SYS_C_SEC_PRIV
--------------------------------------------------
Create table CST.SYS_C_SEC_PRIV (
    PRIVILEGE_ID                   VARCHAR(64)         NOT NULL    ,
    PRIORITY                       INTEGER                         ,
    PRIVILEGE_DESCRIPTION          VARCHAR(64)                     ,
    SERVICE_ID                     VARCHAR(64)                     ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (PRIVILEGE_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_PRIV is '权限表';

--------------------------------------------------
-- Create Table CST.SYS_C_SEC_PVLT
--------------------------------------------------
Create table CST.SYS_C_SEC_PVLT (
    ID                             VARCHAR(64)         NOT NULL    ,
    PRIVILEGE_ID                   VARCHAR(64)         NOT NULL    ,
    PAGE_ID                        VARCHAR(64)         NOT NULL    ,
    COMPONENT_ID                   VARCHAR(64)                     ,
    PART_TYPE                      VARCHAR(64)                     ,
    PART_ID                        VARCHAR(64)                     ,
    PERMISSION_TYPE                VARCHAR(32)                     ,
    PERMISSION_VALUE               VARCHAR(32)                     ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_PVLT is '权限页面组件关系';


--------------------------------------------------
-- Create Table CST.SYS_C_SEC_USER
--------------------------------------------------
Create table CST.SYS_C_SEC_USER (
    USER_ID                        VARCHAR(32)         NOT NULL    ,
    USER_NAME                      VARCHAR(64)                     ,
    ORG_ID                         VARCHAR(20)                     ,
    IS_ENABLE                      VARCHAR(8)                      ,
    SKIN                           VARCHAR(32)                     ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ,
    PASSWORD                       VARCHAR(64)                     ,
    DEPARTMENT                     VARCHAR(64)                     ,
    DEPT_ID                        VARCHAR(20)                     ) 
in TS_FACT   
Partitioning Key (USER_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_USER is '用户表';


--------------------------------------------------
-- Create Table CST.SYS_C_SEC_USER_GROUP
--------------------------------------------------
Create table CST.SYS_C_SEC_USER_GROUP (
    USER_ID                        VARCHAR(32)         NOT NULL    ,
    GROUP_ID                       VARCHAR(64)         NOT NULL    ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ,
    UR_NO                          VARCHAR(64)                     ) 
in TS_FACT   
Partitioning Key (USER_ID) Using Hashing;
Comment on Table CST.SYS_C_SEC_USER_GROUP is '用户角色关系';


--------------------------------------------------
-- Create Table CST.SYS_C_SET_PARM
--------------------------------------------------
Create table CST.SYS_C_SET_PARM (
    PARAM_TYPE                     VARCHAR(64)         NOT NULL    ,
    PARAM_NAME                     VARCHAR(64)                     ,
    PARAM_ID                       VARCHAR(64)         NOT NULL    ,
    PARAM_VALUE                    VARCHAR(64)                     ,
    SEQ                            INTEGER                         ,
    LM_USER                        VARCHAR(32)                     ,
    LM_TIME                        TIMESTAMP                       ) 
in TS_FACT   
Partitioning Key (PARAM_TYPE) Using Hashing;

--------------------------------------------------
-- Create Table IBS.CST_DEP_RELA
--------------------------------------------------
Create table IBS.CST_DEP_RELA (
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    OLD_DEP_NM                     VARCHAR(64)                     ,
    NEW_DEP_NM                     VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_NM                      VARCHAR(64)                     ,
    REMARK1                        VARCHAR(256)                    ,
    REMARK2                        VARCHAR(256)                    ,
    REMARK3                        VARCHAR(256)                    ,
    REMARK4                        VARCHAR(256)                    ,
    REMARK5                        VARCHAR(256)                    ) 
in TS_PUB   
Partitioning Key (CST_ID) Using Hashing;
Comment on Table IBS.CST_DEP_RELA is '客户分部门-截至20160630';
Comment on Column IBS.CST_DEP_RELA.CST_ID        is '客户号';
Comment on Column IBS.CST_DEP_RELA.CST_NM        is '客户名';
Comment on Column IBS.CST_DEP_RELA.OLD_DEP_NM    is '旧部门';
Comment on Column IBS.CST_DEP_RELA.NEW_DEP_NM    is '新部门';
Comment on Column IBS.CST_DEP_RELA.ORG_ID        is '机构号';
Comment on Column IBS.CST_DEP_RELA.ORG_NM        is '机构名';
Comment on Column IBS.CST_DEP_RELA.BRANCH_NM     is '分行';
Comment on Column IBS.CST_DEP_RELA.REMARK1       is '重要说明';
Comment on Column IBS.CST_DEP_RELA.REMARK2       is '特殊说明';
Comment on Column IBS.CST_DEP_RELA.REMARK3       is '6月末说明';
Comment on Column IBS.CST_DEP_RELA.REMARK4       is '备注/说明';
Comment on Column IBS.CST_DEP_RELA.REMARK5       is '简要依据';

--------------------------------------------------
-- Create Table IBS.EMP_LOBBY_TEST
--------------------------------------------------
Create table IBS.EMP_LOBBY_TEST (
    EMP_ID                         VARCHAR(20)         NOT NULL    ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.EMP_LOBBY_TEST is '(测试)大堂经员工名单';
Comment on Column IBS.EMP_LOBBY_TEST.EMP_ID      is '员工号';

--------------------------------------------------
-- Create Table IBS.GOLD_EMP_RELA
--------------------------------------------------
Create table IBS.GOLD_EMP_RELA (
    TXN_RUN_NBR                    VARCHAR(16)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ,
    PRD_NUM                        INTEGER                         ,
    PRD_CD                         VARCHAR(32)                     ,
    PRD_NM                         VARCHAR(64)                     ,
    MID_INC                        DECIMAL(20,3)                   ) 
in TS_IBS   
Partitioning Key (TXN_DT,TXN_RUN_NBR,EMP_ID) Using Hashing;
Comment on Table IBS.GOLD_EMP_RELA is '认领关系（贵金属）';
Comment on Column IBS.GOLD_EMP_RELA.TXN_RUN_NBR  is '流水号';
Comment on Column IBS.GOLD_EMP_RELA.VUCH_NBR     is '凭证号';
Comment on Column IBS.GOLD_EMP_RELA.EMP_ID       is '员工号';
Comment on Column IBS.GOLD_EMP_RELA.RATIO        is '认领比例';
Comment on Column IBS.GOLD_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.GOLD_EMP_RELA.CLAIM_DT     is '认领日期';
Comment on Column IBS.GOLD_EMP_RELA.VERIFY_DT    is '审批日期';
Comment on Column IBS.GOLD_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.GOLD_EMP_RELA.REMARK       is '备注';
Comment on Column IBS.GOLD_EMP_RELA.REMARK1      is '备注1';
Comment on Column IBS.GOLD_EMP_RELA.ORG_ID       is '凭证机构号';
Comment on Column IBS.GOLD_EMP_RELA.ORG_NM       is '凭证机构名';
Comment on Column IBS.GOLD_EMP_RELA.CST_NM       is '客户名';
Comment on Column IBS.GOLD_EMP_RELA.IDENTN_NO    is '证件号';
Comment on Column IBS.GOLD_EMP_RELA.BIZ_TYPE_NM  is '业务类型名称';
Comment on Column IBS.GOLD_EMP_RELA.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.GOLD_EMP_RELA.TXN_DT       is '交易日期';
Comment on Column IBS.GOLD_EMP_RELA.EMP_NM       is '员工名';
Comment on Column IBS.GOLD_EMP_RELA.EMP_ORG_ID   is '员工机构号';
Comment on Column IBS.GOLD_EMP_RELA.EMP_ORG_NM   is '员工机构名';
Comment on Column IBS.GOLD_EMP_RELA.MARKETING_NO is '活动编码';
Comment on Column IBS.GOLD_EMP_RELA.TXN_AMT      is '交易金额';
Comment on Column IBS.GOLD_EMP_RELA.PRD_NUM      is '产品数';
Comment on Column IBS.GOLD_EMP_RELA.PRD_CD       is '产品代码';
Comment on Column IBS.GOLD_EMP_RELA.PRD_NM       is '产品名称';
Comment on Column IBS.GOLD_EMP_RELA.MID_INC      is '中间业务收';

--------------------------------------------------
-- Create Table IBS.GOLD_EMP_RELA_BAK20250205
--------------------------------------------------
Create table IBS.GOLD_EMP_RELA_BAK20250205 (
    TXN_RUN_NBR                    VARCHAR(16)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ,
    PRD_NUM                        INTEGER                         ,
    PRD_CD                         VARCHAR(32)                     ,
    PRD_NM                         VARCHAR(64)                     ,
    MID_INC                        DECIMAL(20,3)                   ) 
in TS_IBS   
Partitioning Key (TXN_DT,TXN_RUN_NBR,EMP_ID) Using Hashing;
Comment on Table IBS.GOLD_EMP_RELA_BAK20250205 is '认领关系（贵金属）';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.TXN_RUN_NBR is '流水号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.VUCH_NBR is '凭证号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.EMP_ID is '员工号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.RATIO is '认领比例';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.CLAIM_DT is '认领日期';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.VERIFY_DT is '审批日期';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.REMARK is '备注';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.REMARK1 is '备注1';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.ORG_ID is '凭证机构号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.ORG_NM is '凭证机构名';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.CST_NM is '客户名';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.IDENTN_NO is '证件号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.TXN_DT is '交易日期';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.EMP_NM is '员工名';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.MARKETING_NO is '活动编码';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.TXN_AMT is '交易金额';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.PRD_NUM is '产品数';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.PRD_CD is '产品代码';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.PRD_NM is '产品名称';
Comment on Column IBS.GOLD_EMP_RELA_BAK20250205.MID_INC is '中间业务收';

--------------------------------------------------
-- Create Table IBS.GOLD_EMP_SMY
--------------------------------------------------
Create table IBS.GOLD_EMP_SMY (
    TXN_DT                         DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ,
    PRD_NUM                        INTEGER                         ,
    YJ_INC                         DECIMAL(20,3)                   ,
    CST_CNT                        INTEGER                       With Default 0  ) 
in TS_IBS   
Partitioning Key (TXN_DT,EMP_ID) Using Hashing;
Comment on Table IBS.GOLD_EMP_SMY is '贵金属员工销售业绩表';
Comment on Column IBS.GOLD_EMP_SMY.TXN_DT        is '交易日期';
Comment on Column IBS.GOLD_EMP_SMY.EMP_ID        is '员工号';
Comment on Column IBS.GOLD_EMP_SMY.EMP_NM        is '员工名';
Comment on Column IBS.GOLD_EMP_SMY.ORG_ID        is '员工机构号';
Comment on Column IBS.GOLD_EMP_SMY.ORG_NM        is '员工机构名';
Comment on Column IBS.GOLD_EMP_SMY.PSTN_TYPE     is '主考核类别代码';
Comment on Column IBS.GOLD_EMP_SMY.PSTN_TYPE_NM  is '主考核类别';
Comment on Column IBS.GOLD_EMP_SMY.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.GOLD_EMP_SMY.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.GOLD_EMP_SMY.TXN_AMT       is '交易金额';
Comment on Column IBS.GOLD_EMP_SMY.PRD_NUM       is '产品数';
Comment on Column IBS.GOLD_EMP_SMY.YJ_INC        is '应计收入';
Comment on Column IBS.GOLD_EMP_SMY.CST_CNT       is '客户数';

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL (
    ACC_ID                         VARCHAR(64)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(64)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ,
    PROFIT_OLD                     DECIMAL(18,3)                   )    
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T1_ACC_PROFIT_DETAIL is '账户利润明细';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.ACC_ID is '账号(存款账户/贷款借据)';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.BONUS_TYPE_ID is '奖金类型代码（CK-存款；DK-贷款）';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.PROD_ID is '产品编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.PROD_NM is '产品名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.DEPT_ID is '部门编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.DEPT_NM is '部门名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.FTP   is 'FTP';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.BAL   is '余额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.PROFIT is '利润';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.LN_AMT is '贷款金额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL.PROFIT_OLD is '利润(不区分不良类)';

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL_20160308
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL_20160308 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL_CJ
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL_CJ (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ,
    PROFIT_OLD                     DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL_D20161207
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL_D20161207 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ,
    PROFIT_OLD                     DECIMAL(18,3)                   )    
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231 is '账户利润明细';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.ACC_ID is '账号(存款账户/贷款借据)';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.BONUS_TYPE_ID is '奖金类型代码（CK-存款；DK-贷款）';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.CST_ID is '客户号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.CST_NM is '客户名';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.ORG_ID is '机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.PROD_ID is '产品编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.PROD_NM is '产品名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.DEPT_ID is '部门编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.DEPT_NM is '部门名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.OPEN_DT is '开户日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.FTP is 'FTP';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.CCY_ID is '币种';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.BAL is '余额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.PROFIT is '利润';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.LN_AMT is '贷款金额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_OLDTO20201231.PROFIT_OLD is '利润(不区分不良类)';

--------------------------------------------------
-- Create Table IBS.T1_ACC_PROFIT_DETAIL_TMP
--------------------------------------------------
Create table IBS.T1_ACC_PROFIT_DETAIL_TMP (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    CCY_ID                         INTEGER                         ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ,
    LN_AMT                         DECIMAL(18,3)                   ,
    PROFIT_OLD                     DECIMAL(18,3)                   ) 
in TS_REP   
Partitioning Key (ACC_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T1_ACC_PROFIT_DETAIL_TMP is '账户利润明细';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.ACC_ID is '账号(存款账户/贷款借据)';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.BONUS_TYPE_ID is '奖金类型代码（CK-存款；DK-贷款）';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.CST_ID is '客户号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.CST_NM is '客户名';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.ORG_ID is '机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.PROD_ID is '产品编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.PROD_NM is '产品名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.DEPT_ID is '部门编号';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.DEPT_NM is '部门名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.FTP is 'FTP';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.CCY_ID is '币种';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.BAL is '余额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.PROFIT is '利润';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.LN_AMT is '贷款金额';
Comment on Column IBS.T1_ACC_PROFIT_DETAIL_TMP.PROFIT_OLD is '利润(不区分不良类)';

--------------------------------------------------
-- Create Table IBS.T1_CORE_BCKYX
--------------------------------------------------
Create table IBS.T1_CORE_BCKYX (
    KEHUZH                         CHAR(20)                        ,
    KHZHLX                         CHAR(1)                         ,
    KEMUCC                         CHAR(1)                         ,
    ZHANGH                         CHAR(20)                        ,
    KAIHRQ                         CHAR(8)                         ,
    CPBH03                         CHAR(4)                         ,
    DSYHBH                         CHAR(30)                        ,
    DSQTXX                         CHAR(20)                        ,
    ZHYODM                         CHAR(22)                        ,
    BEIYZF                         CHAR(20)                        ,
    BEIY40                         CHAR(40)                        ,
    JILUZT                         CHAR(1)                         ,
    SHJNCH                         INTEGER                         ) 
in TS_REP   
Partitioning Key (KEHUZH) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_DF_SLRY_EMP_RELA
--------------------------------------------------
Create table IBS.T1_DF_SLRY_EMP_RELA (
    AGENT_NO                       VARCHAR(15)         NOT NULL    ,
    ENT_ID                         VARCHAR(8)                      ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NO                         VARCHAR(40)                     ,
    ENT_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    BIZ_STS_ID                     VARCHAR(8)                      ,
    BIZ_STS_NM                     VARCHAR(16)                     ,
    RGST_DT                        DATE                            ,
    OPEN_DT                        DATE                            ,
    CNL_DT                         DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    DEP_LINE_NM                    VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (AGENT_NO) Using Hashing;
Comment on Table IBS.T1_DF_SLRY_EMP_RELA is '代发工资认领关系';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.AGENT_NO is '代理号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.ENT_ID is '企业编号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.EMP_ID is '员工号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.RATIO  is '认领比例';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.REMARK is '备注';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.REMARK1 is '备注1';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.ORG_ID is '签约机构号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.ORG_NM is '签约机构名';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.CST_NO is '客户号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.ENT_NM is '企业名称';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.BIZ_STS_ID is '业务状态ID';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.BIZ_STS_NM is '业务状态';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.RGST_DT is '注册日期';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.OPEN_DT is '开通日期';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.CNL_DT is '取消日期';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.EMP_NM is '员工名';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_DF_SLRY_EMP_RELA.DEP_LINE_NM is '部门';

--------------------------------------------------
-- Create Table IBS.T1_FNC_PD_SMY_Q
--------------------------------------------------
Create table IBS.T1_FNC_PD_SMY_Q (
    OFF_BST_AR_ID                  VARCHAR(20)         NOT NULL    ,
    MSR_PRD_ID                     INTEGER             NOT NULL    ,
    VIRT_AR_ID                     VARCHAR(20)                     ,
    VIRT_AR_TP_ID                  VARCHAR(20)                     ,
    AR_ID                          VARCHAR(20)                     ,
    OU_IP_ID                       INTEGER                         ,
    OU_CODE                        CHAR(4)                         ,
    OU_NM                          VARCHAR(64)                     ,
    TXN_CNL                        CHAR(4)                         ,
    CST_ID                         VARCHAR(32)                     ,
    CST_NM                         VARCHAR(64)                     ,
    TML_TP_ID                      INTEGER                         ,
    AR_LCS_TP_ID                   INTEGER                         ,
    BUY_PTRN_TP_ID                 INTEGER                         ,
    BIZ_SBJ_ID                     INTEGER                         ,
    ACG_SBJ_ID                     INTEGER                         ,
    FNC_PD_CD                      VARCHAR(10)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ,
    PD_RISK_TP_ID                  INTEGER                         ,
    RATE_PRD_TP_ID                 INTEGER                         ,
    CST_ECPT_YLD_RATE              DECIMAL(9,6)                    ,
    RAISE_EFF_DAY                  DATE                            ,
    EFF_DT                         DATE                            ,
    INT_CLCN_EFF_DT                DATE                            ,
    MAT_DT                         DATE                            ,
    END_DT                         DATE                            ,
    OPEN_TLR_ID                    INTEGER                         ,
    CLS_TLR_ID                     INTEGER                         ,
    RECOMMEND_PEOPLE               VARCHAR(11)                     ,
    SALES_PEOPLE                   VARCHAR(6)                      ,
    CCY_ID                         INTEGER                         ,
    SRC_CCY_OPN_AMT                DECIMAL(20,3)                   ,
    SRC_CCY_CLS_BAL                DECIMAL(20,3)                   ,
    SRC_CCY_MTD_AVG_BAL            DECIMAL(20,3)                   ,
    SRC_CCY_QTD_AVG_BAL            DECIMAL(20,3)                   ,
    SRC_CCY_YTD_AVG_BAL            DECIMAL(20,3)                   ,
    OPN_AMT                        DECIMAL(20,3)                   ,
    CLS_BAL                        DECIMAL(20,3)                   ,
    MTD_AVG_BAL                    DECIMAL(20,3)                   ,
    QTD_AVG_BAL                    DECIMAL(20,3)                   ,
    YTD_AVG_BAL                    DECIMAL(20,3)                   ) 
in TS_PUB   
Partitioning Key (OFF_BST_AR_ID) Using Hashing;
Comment on Table IBS.T1_FNC_PD_SMY_Q is '理财汇总表_季末（供考核用）';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OFF_BST_AR_ID is '理财表外账号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.MSR_PRD_ID is '统计日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.VIRT_AR_ID is '客户账号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.VIRT_AR_TP_ID is '客户账号类型';
Comment on Column IBS.T1_FNC_PD_SMY_Q.AR_ID      is '客户账号的活期账号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OU_IP_ID   is '机构号代理键';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OU_CODE    is '机构号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OU_NM      is '机构名';
Comment on Column IBS.T1_FNC_PD_SMY_Q.TXN_CNL    is '渠道编码';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CST_ID     is '整合后客户号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CST_NM     is '客户名';
Comment on Column IBS.T1_FNC_PD_SMY_Q.TML_TP_ID  is '终止类型';
Comment on Column IBS.T1_FNC_PD_SMY_Q.AR_LCS_TP_ID is '记录状态';
Comment on Column IBS.T1_FNC_PD_SMY_Q.BUY_PTRN_TP_ID is '购买方式';
Comment on Column IBS.T1_FNC_PD_SMY_Q.BIZ_SBJ_ID is '业务代号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.ACG_SBJ_ID is '科目号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.FNC_PD_CD  is '产品编号';
Comment on Column IBS.T1_FNC_PD_SMY_Q.FNC_PD_NM  is '理财产品名称';
Comment on Column IBS.T1_FNC_PD_SMY_Q.PD_RISK_TP_ID is '理财产品风险类型';
Comment on Column IBS.T1_FNC_PD_SMY_Q.RATE_PRD_TP_ID is '年月利率标志';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CST_ECPT_YLD_RATE is '最高预期收益率';
Comment on Column IBS.T1_FNC_PD_SMY_Q.RAISE_EFF_DAY is '募集开始日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.EFF_DT     is '开户日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.INT_CLCN_EFF_DT is '起息日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.MAT_DT     is '到期日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.END_DT     is '销户日期';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OPEN_TLR_ID is '开户柜员';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CLS_TLR_ID is '销户柜员';
Comment on Column IBS.T1_FNC_PD_SMY_Q.RECOMMEND_PEOPLE is '推荐人';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SALES_PEOPLE is '销售人';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CCY_ID     is '币种';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SRC_CCY_OPN_AMT is '源币开户金额';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SRC_CCY_CLS_BAL is '源币余额';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SRC_CCY_MTD_AVG_BAL is '源币月日均';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SRC_CCY_QTD_AVG_BAL is '源币季日均';
Comment on Column IBS.T1_FNC_PD_SMY_Q.SRC_CCY_YTD_AVG_BAL is '源币年日均';
Comment on Column IBS.T1_FNC_PD_SMY_Q.OPN_AMT    is '开户金额';
Comment on Column IBS.T1_FNC_PD_SMY_Q.CLS_BAL    is '余额';
Comment on Column IBS.T1_FNC_PD_SMY_Q.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T1_FNC_PD_SMY_Q.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T1_FNC_PD_SMY_Q.YTD_AVG_BAL is '年日均';

--------------------------------------------------
-- Create Table IBS.T1_FNC_PD_SMY_Q_CJ
--------------------------------------------------
Create table IBS.T1_FNC_PD_SMY_Q_CJ (
    OFF_BST_AR_ID                  VARCHAR(20)         NOT NULL    ,
    MSR_PRD_ID                     INTEGER             NOT NULL    ,
    VIRT_AR_ID                     VARCHAR(20)                     ,
    VIRT_AR_TP_ID                  VARCHAR(20)                     ,
    AR_ID                          VARCHAR(20)                     ,
    OU_IP_ID                       INTEGER                         ,
    OU_CODE                        CHAR(4)                         ,
    OU_NM                          VARCHAR(64)                     ,
    TXN_CNL                        CHAR(4)                         ,
    CST_ID                         VARCHAR(32)                     ,
    CST_NM                         VARCHAR(64)                     ,
    TML_TP_ID                      INTEGER                         ,
    AR_LCS_TP_ID                   INTEGER                         ,
    BUY_PTRN_TP_ID                 INTEGER                         ,
    BIZ_SBJ_ID                     INTEGER                         ,
    ACG_SBJ_ID                     INTEGER                         ,
    FNC_PD_CD                      VARCHAR(10)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ,
    PD_RISK_TP_ID                  INTEGER                         ,
    RATE_PRD_TP_ID                 INTEGER                         ,
    CST_ECPT_YLD_RATE              DECIMAL(9,6)                    ,
    RAISE_EFF_DAY                  DATE                            ,
    EFF_DT                         DATE                            ,
    INT_CLCN_EFF_DT                DATE                            ,
    MAT_DT                         DATE                            ,
    END_DT                         DATE                            ,
    OPEN_TLR_ID                    INTEGER                         ,
    CLS_TLR_ID                     INTEGER                         ,
    RECOMMEND_PEOPLE               VARCHAR(11)                     ,
    SALES_PEOPLE                   VARCHAR(6)                      ,
    CCY_ID                         INTEGER                         ,
    SRC_CCY_OPN_AMT                DECIMAL(20,3)                   ,
    SRC_CCY_CLS_BAL                DECIMAL(20,3)                   ,
    SRC_CCY_MTD_AVG_BAL            DECIMAL(20,3)                   ,
    SRC_CCY_QTD_AVG_BAL            DECIMAL(20,3)                   ,
    SRC_CCY_YTD_AVG_BAL            DECIMAL(20,3)                   ,
    OPN_AMT                        DECIMAL(20,3)                   ,
    CLS_BAL                        DECIMAL(20,3)                   ,
    MTD_AVG_BAL                    DECIMAL(20,3)                   ,
    QTD_AVG_BAL                    DECIMAL(20,3)                   ,
    YTD_AVG_BAL                    DECIMAL(20,3)                   ) 
in TS_PUB   
Partitioning Key (OFF_BST_AR_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_FNC_TXN_EMP_RELA
--------------------------------------------------
Create table IBS.T1_FNC_TXN_EMP_RELA (
    TXN_NO                         VARCHAR(32)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(32)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)        NOT NULL    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    BIZ_TYPE_CD                    VARCHAR(8)                      ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ,
    PRD_CD                         VARCHAR(32)                     ,
    PRD_NM                         VARCHAR(64)                     ,
    MID_INC                        DECIMAL(20,3)                   ,
    SERIAL_NO                      VARCHAR(32)                     ,
    CLIENT_NO                      VARCHAR(20)                     ,
    FNC_TYP                        VARCHAR(20)                     ,
    ORG_RATIO                      DECIMAL(6,2)                    ,
    ORG_EMP_ID                     VARCHAR(50)                     ) 
in TS_IBS   
Partitioning Key (TXN_DT,TXN_NO,EMP_ID,RATIO) Using Hashing;
Comment on Table IBS.T1_FNC_TXN_EMP_RELA is '理财交易认领关系';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.TXN_NO is '交易流水号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.EMP_ID is '员工号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.RATIO  is '认领比例';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.REMARK is '备注';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.REMARK1 is '备注1';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.ORG_ID is '交易机构号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.ORG_NM is '交易机构名';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.CST_NM is '客户名';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.IDENTN_NO is '证件号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.BIZ_TYPE_CD is '业务代码';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.TXN_DT is '交易日期（CFM_DATE）确认日期';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.EMP_NM is '员工名';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.TXN_AMT is '交易金额（CFM_AMT确认金额）';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.PRD_CD is '产品代码';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.PRD_NM is '产品名称';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.MID_INC is '中间业务收';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.SERIAL_NO is '定投协议号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.CLIENT_NO is '客户号';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.FNC_TYP is '理财类型';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.ORG_RATIO is '原调整比例';
Comment on Column IBS.T1_FNC_TXN_EMP_RELA.ORG_EMP_ID is '原认领人';

--------------------------------------------------
-- Create Table IBS.T1_FUND_CST_EMP_RELA
--------------------------------------------------
Create table IBS.T1_FUND_CST_EMP_RELA (
    CUS_NO                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)         NOT NULL    ,
    TXN_DT                         DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (CUS_NO,IDENTN_NO,EMP_ID) Using Hashing;
Comment on Table IBS.T1_FUND_CST_EMP_RELA is '基金客户认领关系';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.CUS_NO is '客户号';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.EMP_ID is '员工号';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.RATIO is '认领比例';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.REMARK is '备注';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.REMARK1 is '备注1';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.ORG_ID is '签约机构号';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.ORG_NM is '签约机构名';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.CST_NM is '客户名';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.IDENTN_NO is '证件号';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.TXN_DT is '签约日期';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.EMP_NM is '员工名';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_FUND_CST_EMP_RELA.EMP_ORG_NM is '员工机构名';

--------------------------------------------------
-- Create Table IBS.T1_FUND_CST_FEE
--------------------------------------------------
Create table IBS.T1_FUND_CST_FEE (
    MSR_PRD_DT                     DATE                NOT NULL    ,
    IN_CUS_NO                      VARCHAR(20)         NOT NULL    ,
    PRD_CD                         VARCHAR(32)         NOT NULL    ,
    PRD_NM                         VARCHAR(64)                     ,
    SUM_VOL                        DECIMAL(20,3)                   ,
    TRA_FEE                        DECIMAL(20,2)                   ,
    SL_FEE                         DECIMAL(20,2)                   ) 
in TS_PUB   
Partitioning Key (MSR_PRD_DT,IN_CUS_NO,PRD_CD) Using Hashing;
Comment on Table IBS.T1_FUND_CST_FEE is '客户手续费';
Comment on Column IBS.T1_FUND_CST_FEE.MSR_PRD_DT is '数据日期';
Comment on Column IBS.T1_FUND_CST_FEE.IN_CUS_NO  is '内部客户号';
Comment on Column IBS.T1_FUND_CST_FEE.PRD_CD     is '产品代码';
Comment on Column IBS.T1_FUND_CST_FEE.PRD_NM     is '产品名称';
Comment on Column IBS.T1_FUND_CST_FEE.SUM_VOL    is '总份额';
Comment on Column IBS.T1_FUND_CST_FEE.TRA_FEE    is '客户服务费';
Comment on Column IBS.T1_FUND_CST_FEE.SL_FEE     is '客户销售费';

--------------------------------------------------
-- Create Table IBS.T1_FUND_DT_EMP_RELA
--------------------------------------------------
Create table IBS.T1_FUND_DT_EMP_RELA (
    SERIAL_NO                      VARCHAR(32)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(32)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    TXN_DT                         DATE                NOT NULL    ,
    PRD_CD                         VARCHAR(32)                     ,
    PRD_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ) 
in TS_IBS   
Partitioning Key (SERIAL_NO,EMP_ID) Using Hashing;
Comment on Table IBS.T1_FUND_DT_EMP_RELA is '基金定投认领关系';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.SERIAL_NO is '定投协议号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.VUCH_NBR is '客户号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.EMP_ID is '员工号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.RATIO  is '认领比例';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.REMARK is '备注';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.REMARK1 is '备注1';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.ORG_ID is '签约机构号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.ORG_NM is '签约机构名';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.CST_NM is '客户名';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.IDENTN_NO is '证件号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.TXN_DT is '签约日期';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.PRD_CD is '产品代码';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.PRD_NM is '产品名称';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.EMP_NM is '员工名';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_FUND_DT_EMP_RELA.TXN_AMT is '签约金额';

--------------------------------------------------
-- Create Table IBS.T1_FUND_TXN_EMP_RELA
--------------------------------------------------
Create table IBS.T1_FUND_TXN_EMP_RELA (
    TXN_NO                         VARCHAR(32)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(32)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    BIZ_TYPE_CD                    VARCHAR(8)                      ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    TXN_AMT                        DECIMAL(20,3)                   ,
    PRD_CD                         VARCHAR(32)                     ,
    PRD_NM                         VARCHAR(64)                     ,
    MID_INC                        DECIMAL(20,3)                   ,
    SERIAL_NO                      VARCHAR(32)                     ) 
in TS_IBS   
Partitioning Key (TXN_DT,TXN_NO,EMP_ID) Using Hashing;
Comment on Table IBS.T1_FUND_TXN_EMP_RELA is '基金交易认领关系';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.TXN_NO is '交易流水号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.EMP_ID is '员工号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.RATIO is '认领比例';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.REMARK is '备注';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.REMARK1 is '备注1';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.ORG_ID is '交易机构号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.ORG_NM is '交易机构名';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.CST_NM is '客户名';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.IDENTN_NO is '证件号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.BIZ_TYPE_CD is '业务代码';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.TXN_DT is '交易日期';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.EMP_NM is '员工名';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.TXN_AMT is '交易金额';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.PRD_CD is '产品代码';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.PRD_NM is '产品名称';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.MID_INC is '中间业务收';
Comment on Column IBS.T1_FUND_TXN_EMP_RELA.SERIAL_NO is '定投协议号';

--------------------------------------------------
-- Create Table IBS.T1_LN_LOBBY_MANAGER_RELA
--------------------------------------------------
Create table IBS.T1_LN_LOBBY_MANAGER_RELA (
    BIZ_DIL_NBR                    VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)                     ,
    CLAIM_DT                       DATE                            ,
    MANAGER_EMP_ID                 VARCHAR(20)                     ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ) 
in TS_PUB   
Partitioning Key (BIZ_DIL_NBR) Using Hashing;
Comment on Table IBS.T1_LN_LOBBY_MANAGER_RELA is '大堂经理与贷款关系';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.BIZ_DIL_NBR is '借据号';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.EMP_ID is '员工号（大堂经理）';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.MANAGER_EMP_ID is '客户经理员工号';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_LN_LOBBY_MANAGER_RELA.VERIFY_EMP_ID is '审批人';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ,
    MNG_NM                         VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.DSC     is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.SEQ     is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.DR      is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.CR      is '贷';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ.MNG_NM  is '部门';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20221110
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20221110 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ) 
in TS_IBS   
Partitioning Key (CORE_BIZ_SBJ_ID) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20221110 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20221110.SEQ is '序号';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20230425
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20230425 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20230425 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20230425.CR is '贷';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20231031
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20231031 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20231031 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20231031.CR is '贷';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20240326
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20240326 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20240326 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20240326.CR is '贷';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20250116
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20250116 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ,
    MNG_NM                         VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20250116 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.CR is '贷';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250116.MNG_NM is '部门';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20250124
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20250124 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ,
    MNG_NM                         VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20250124 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.CR is '贷';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20250124.MNG_NM is '部门';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_20260210
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_20260210 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ,
    MNG_NM                         VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_20260210 is '中间业务科目';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.FNC_ACG_SBJ_CD is 'NC科目号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.FNC_ACG_SBJ_ID is 'NC科目ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.CORE_BIZ_SBJ_CD is '核心业务代号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.CORE_BIZ_SBJ_ID is '核心业务ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.DSC is '核心业务代号名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.SBJ_CGY_NM is '科目种类名称';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.SEQ is '序号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.DR is '借';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.CR is '贷';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_20260210.MNG_NM is '部门';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_BKP_20260316
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_BKP_20260316 (
    FNC_ACG_SBJ_CD                 VARCHAR(40)         NOT NULL    ,
    FNC_ACG_SBJ_ID                 CHAR(40)            NOT NULL    ,
    CORE_BIZ_SBJ_CD                CHAR(40)                        ,
    CORE_BIZ_SBJ_ID                INTEGER             NOT NULL    ,
    DSC                            VARCHAR(256)                    ,
    SBJ_CGY_NM                     CHAR(64)                        ,
    SEQ                            INTEGER                         ,
    DR                             INTEGER                         ,
    CR                             INTEGER                         ,
    MNG_NM                         VARCHAR(64)                     ) 
in USERSPACE1   
Partitioning Key (FNC_ACG_SBJ_CD) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811 (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811 is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20210811.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425 (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425 is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20230425.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018 (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018 is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231018.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031 (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031 is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20231031.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307 (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BIZ_SBJ_ID                     INTEGER             NOT NULL    ,
    CLS_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307 is '中间业务科目收入';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.ORG_ID is '机构号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.ORG_NM is '机构';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.BIZ_SBJ_ID is '业务代号ID';
Comment on Column IBS.T1_MIDDLE_BUSI_SBJ_INCO_20240307.CLS_BAL is '余额';

--------------------------------------------------
-- Create Table IBS.T1_MIDDLE_BUSINESS_INCOME
--------------------------------------------------
Create table IBS.T1_MIDDLE_BUSINESS_INCOME (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    INCOME                         DECIMAL(18,2)                   ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_MIDDLE_BUSINESS_INCOME is '中收业绩维护';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.EMP_ID is '员工号';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.EMP_NM is '员工名';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.ORG_ID is '员工归属机构号';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.ORG_NM is '员工归属机构';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.BRANCH_ORG_ID is '员工归属分行号';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.BRANCH_ORG_NM is '员工归属分行';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.INCOME is '中间业务收入';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.MODIFY_TIME is '修改时间';
Comment on Column IBS.T1_MIDDLE_BUSINESS_INCOME.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T1_MOBILE_BANK_EMP_DETAIL
--------------------------------------------------
Create table IBS.T1_MOBILE_BANK_EMP_DETAIL (
    MB_CST_ID                      VARCHAR(32)         NOT NULL    ,
    CORE_CST_ID                    VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    SIGN_DT                        DATE                            ,
    ORG_ID                         CHAR(4)                         ,
    RECOMMEND_PEOPLE_1             VARCHAR(6)                      ,
    RECOMMEND_PEOPLE_2             VARCHAR(6)                      ) 
in TS_IBS   
Partitioning Key (MB_CST_ID) Using Hashing;
Comment on Table IBS.T1_MOBILE_BANK_EMP_DETAIL is '手机银行签约员工推荐明细';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.MB_CST_ID is '手机银行客户号';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.CORE_CST_ID is '核心客户号';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.SIGN_DT is '签约日期';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.ORG_ID is '签约机构';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.RECOMMEND_PEOPLE_1 is '柜面录入推荐人';
Comment on Column IBS.T1_MOBILE_BANK_EMP_DETAIL.RECOMMEND_PEOPLE_2 is '自助录入推荐人';

--------------------------------------------------
-- Create Table IBS.T1_ORG_ACC_DEP_INC_DTL
--------------------------------------------------
Create table IBS.T1_ORG_ACC_DEP_INC_DTL (
    MEASURE_DT                     DATE                NOT NULL    ,
    OU_CD                          CHAR(4)             NOT NULL    ,
    CCY_ID                         INTEGER             NOT NULL    ,
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    MNG_LINE_TP_NM                 VARCHAR(32)                     ,
    DEP_BAL                        DECIMAL(20,2)                 With Default 0  ,
    CUR_RATE                       DECIMAL(16,8)                 With Default 0  ,
    FTP_RATE                       DECIMAL(16,8)                 With Default 0  ,
    DAY_INCOME                     DECIMAL(18,3)                 With Default 0  ,
    MTD_INCOME                     DECIMAL(18,3)                 With Default 0  ,
    QAR_INCOME                     DECIMAL(18,3)                 With Default 0  ,
    YTD_INCOME                     DECIMAL(18,3)                 With Default 0  ) 
in TS_REP   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_ORG_ACC_DEP_INC_DTL is '公司和机构存款收益明细表)';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.MEASURE_DT is '日期';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.OU_CD is '机构';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.CCY_ID is '币种';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.ACC_ID is '账号';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.CST_ID is '客户号';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.CST_NM is '客户名称';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.OPEN_DT is '开户日期';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.MNG_LINE_TP_ID is '管理部门ID';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.MNG_LINE_TP_NM is '管理部门NM';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.DEP_BAL is '时点余额';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.CUR_RATE is '实际利率';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.FTP_RATE is 'FTP利率';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.DAY_INCOME is '本日收益';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.MTD_INCOME is '本月累计收益';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.QAR_INCOME is '本季度累计收益';
Comment on Column IBS.T1_ORG_ACC_DEP_INC_DTL.YTD_INCOME is '本年累计收益';

--------------------------------------------------
-- Create Table IBS.T1_ORG_ACC_LN_INC_DTL
--------------------------------------------------
Create table IBS.T1_ORG_ACC_LN_INC_DTL (
    MEASURE_DT                     DATE                NOT NULL    ,
    OU_CD                          CHAR(4)             NOT NULL    ,
    CCY_ID                         INTEGER             NOT NULL    ,
    ACC_ID                         VARCHAR(20)                     ,
    BIZ_DIL_NBR                    VARCHAR(20)         NOT NULL    ,
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    LN_FIVE_ID                     INTEGER             NOT NULL    ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    MNG_LINE_TP_NM                 VARCHAR(32)                     ,
    LN_BAL                         DECIMAL(20,2)                 With Default 0  ,
    CUR_RATE                       DECIMAL(16,8)                 With Default 0  ,
    FTP_RATE                       DECIMAL(16,8)                 With Default 0  ,
    DAY_INC                        DECIMAL(18,3)                 With Default 0  ,
    MTD_INC                        DECIMAL(18,3)                 With Default 0  ,
    QAR_INC                        DECIMAL(18,3)                 With Default 0  ,
    YTD_INC                        DECIMAL(18,3)                 With Default 0  ,
    DAY_EXC_BL_INC                 DECIMAL(18,3)                 With Default 0  ,
    MTD_EXC_BL_INC                 DECIMAL(18,3)                 With Default 0  ,
    QAR_EXC_BL_INC                 DECIMAL(18,3)                 With Default 0  ,
    YTD_EXC_BL_INC                 DECIMAL(18,3)                 With Default 0  ) 
in TS_REP   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_ORG_ACC_LN_INC_DTL is '公司和机构贷款账户收益明细表';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.MEASURE_DT is '日期';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.OU_CD is '机构';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.CCY_ID is '币种';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.ACC_ID is '账号';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.BIZ_DIL_NBR is '借据号';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.CST_ID is '客户号';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.CST_NM is '客户名称';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.OPEN_DT is '开户日期';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.LN_FIVE_ID is '五级分类ID';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.MNG_LINE_TP_ID is '管理部门ID';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.MNG_LINE_TP_NM is '管理部门名称';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.LN_BAL is '时点余额';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.CUR_RATE is '实际利率';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.FTP_RATE is 'FTP利率';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.DAY_INC is '本日收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.MTD_INC is '本月累计收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.QAR_INC is '本季度累计收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.YTD_INC is '本年累计收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.DAY_EXC_BL_INC is '本日收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.MTD_EXC_BL_INC is '本月累计收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.QAR_EXC_BL_INC is '本季度累计收益';
Comment on Column IBS.T1_ORG_ACC_LN_INC_DTL.YTD_EXC_BL_INC is '本年累计收益';

--------------------------------------------------
-- Create Table IBS.T1_SALES_DETAIL
--------------------------------------------------
Create table IBS.T1_SALES_DETAIL (
    SALE_ID                        VARCHAR(32)         NOT NULL    ,
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    CHANNLE_ID                     CHAR(4)                         ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    TXN_DT                         DATE                            ,
    VALUE_DT                       DATE                            ,
    MATURITY_DT                    DATE                            ,
    TERM_DAY_CNT                   INTEGER                         ,
    CCY_ID                         INTEGER                         ,
    AMT                            DECIMAL(18,2)                   ,
    RECOMMEND_TYPE_ID              CHAR(2)                         ,
    RECOMMEND_PEOPLE               VARCHAR(20)                     ,
    RECOMMEND_PEOPLE_NM            VARCHAR(64)                     ,
    RECOMMEND_PEOPLE_MOBILE        VARCHAR(20)                     ,
    RECOMMEND_RATIO                INTEGER                         ,
    SALES_PEOPLE                   CHAR(6)                         ,
    SALES_PEOPLE_NM                VARCHAR(64)                     ,
    SALES_PEOPLE_MOBILE            VARCHAR(20)                     ,
    SALES_RATIO                    INTEGER                         ,
    SALE_PROD_STATUS_ID            INTEGER                         ,
    SALE_PROD_STATUS_NM            VARCHAR(64)                     ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    REMARK                         VARCHAR(500)                    ,
    REMARK1                        VARCHAR(500)                    ,
    CLS_BAL                        DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_NBR                       VARCHAR(20)                     ,
    FNC_PD_CD                      VARCHAR(10)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (SALE_ID,BONUS_TYPE_ID) Using Hashing;
Comment on Table IBS.T1_SALES_DETAIL is '理财员工营销';
Comment on Column IBS.T1_SALES_DETAIL.SALE_ID    is '销售编码';
Comment on Column IBS.T1_SALES_DETAIL.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T1_SALES_DETAIL.CST_ID     is '客户号';
Comment on Column IBS.T1_SALES_DETAIL.CST_NM     is '客户名';
Comment on Column IBS.T1_SALES_DETAIL.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T1_SALES_DETAIL.ORG_ID     is '机构号';
Comment on Column IBS.T1_SALES_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_SALES_DETAIL.TXN_DT     is '交易日期/信用卡发卡日期';
Comment on Column IBS.T1_SALES_DETAIL.VALUE_DT   is '起息日/信用卡激活日期';
Comment on Column IBS.T1_SALES_DETAIL.MATURITY_DT is '到期日';
Comment on Column IBS.T1_SALES_DETAIL.TERM_DAY_CNT is '期限天数';
Comment on Column IBS.T1_SALES_DETAIL.CCY_ID     is '币种';
Comment on Column IBS.T1_SALES_DETAIL.AMT        is '金额';
Comment on Column IBS.T1_SALES_DETAIL.RECOMMEND_TYPE_ID is '推荐人类型代码';
Comment on Column IBS.T1_SALES_DETAIL.RECOMMEND_PEOPLE is '推荐人';
Comment on Column IBS.T1_SALES_DETAIL.RECOMMEND_PEOPLE_NM is '推荐人名称';
Comment on Column IBS.T1_SALES_DETAIL.RECOMMEND_PEOPLE_MOBILE is '推荐人手机号';
Comment on Column IBS.T1_SALES_DETAIL.RECOMMEND_RATIO is '推荐人比例';
Comment on Column IBS.T1_SALES_DETAIL.SALES_PEOPLE is '销售人';
Comment on Column IBS.T1_SALES_DETAIL.SALES_PEOPLE_NM is '销售人名称';
Comment on Column IBS.T1_SALES_DETAIL.SALES_PEOPLE_MOBILE is '销售人手机号';
Comment on Column IBS.T1_SALES_DETAIL.SALES_RATIO is '销售人比例';
Comment on Column IBS.T1_SALES_DETAIL.SALE_PROD_STATUS_ID is '销售产品状态代码';
Comment on Column IBS.T1_SALES_DETAIL.SALE_PROD_STATUS_NM is '销售产品状态名称';
Comment on Column IBS.T1_SALES_DETAIL.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T1_SALES_DETAIL.MODIFY_TIME is '修改时间';
Comment on Column IBS.T1_SALES_DETAIL.MODIFY_IP  is '修改IP';
Comment on Column IBS.T1_SALES_DETAIL.REMARK     is '备注';
Comment on Column IBS.T1_SALES_DETAIL.REMARK1    is '备注1';
Comment on Column IBS.T1_SALES_DETAIL.CLS_BAL    is '理财余额';
Comment on Column IBS.T1_SALES_DETAIL.MTD_AVG_BAL is '理财月日均';
Comment on Column IBS.T1_SALES_DETAIL.QTD_AVG_BAL is '理财季日均';
Comment on Column IBS.T1_SALES_DETAIL.YTD_AVG_BAL is '理财年日均';

--------------------------------------------------
-- Create Table IBS.T1_SALES_DETAIL_Q
--------------------------------------------------
Create table IBS.T1_SALES_DETAIL_Q (
    SALE_ID                        VARCHAR(32)         NOT NULL    ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    CHANNLE_ID                     CHAR(4)                         ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    TXN_DT                         DATE                            ,
    VALUE_DT                       DATE                            ,
    MATURITY_DT                    DATE                            ,
    TERM_DAY_CNT                   INTEGER                         ,
    CCY_ID                         INTEGER                         ,
    AMT                            DECIMAL(18,2)                   ,
    RECOMMEND_TYPE_ID              CHAR(2)                         ,
    RECOMMEND_PEOPLE               VARCHAR(20)                     ,
    RECOMMEND_PEOPLE_NM            VARCHAR(64)                     ,
    RECOMMEND_PEOPLE_MOBILE        VARCHAR(20)                     ,
    RECOMMEND_RATIO                INTEGER                         ,
    SALES_PEOPLE                   CHAR(6)                         ,
    SALES_PEOPLE_NM                VARCHAR(64)                     ,
    SALES_PEOPLE_MOBILE            VARCHAR(20)                     ,
    SALES_RATIO                    INTEGER                         ,
    SALE_PROD_STATUS_ID            INTEGER                         ,
    SALE_PROD_STATUS_NM            VARCHAR(64)                     ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    REMARK                         VARCHAR(500)                    ,
    REMARK1                        VARCHAR(500)                    ,
    CLS_BAL                        DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_NBR                       VARCHAR(20)                     ,
    FNC_PD_CD                      VARCHAR(10)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ,
    MEASURE_DT                     DATE                            ) 
in TS_IBS   
Partitioning Key (SALE_ID) Using Hashing;
Comment on Table IBS.T1_SALES_DETAIL_Q is '理财员工营销_季末（供考核用）';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALE_ID  is '销售编码';
Comment on Column IBS.T1_SALES_DETAIL_Q.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T1_SALES_DETAIL_Q.CST_ID   is '客户号';
Comment on Column IBS.T1_SALES_DETAIL_Q.CST_NM   is '客户名';
Comment on Column IBS.T1_SALES_DETAIL_Q.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T1_SALES_DETAIL_Q.ORG_ID   is '机构号';
Comment on Column IBS.T1_SALES_DETAIL_Q.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_SALES_DETAIL_Q.TXN_DT   is '交易日期/信用卡发卡日期';
Comment on Column IBS.T1_SALES_DETAIL_Q.VALUE_DT is '起息日/信用卡激活日期';
Comment on Column IBS.T1_SALES_DETAIL_Q.MATURITY_DT is '到期日';
Comment on Column IBS.T1_SALES_DETAIL_Q.TERM_DAY_CNT is '期限天数';
Comment on Column IBS.T1_SALES_DETAIL_Q.CCY_ID   is '币种';
Comment on Column IBS.T1_SALES_DETAIL_Q.AMT      is '金额';
Comment on Column IBS.T1_SALES_DETAIL_Q.RECOMMEND_TYPE_ID is '推荐人类型代码';
Comment on Column IBS.T1_SALES_DETAIL_Q.RECOMMEND_PEOPLE is '推荐人';
Comment on Column IBS.T1_SALES_DETAIL_Q.RECOMMEND_PEOPLE_NM is '推荐人名称';
Comment on Column IBS.T1_SALES_DETAIL_Q.RECOMMEND_PEOPLE_MOBILE is '推荐人手机号';
Comment on Column IBS.T1_SALES_DETAIL_Q.RECOMMEND_RATIO is '推荐人比例';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALES_PEOPLE is '销售人';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALES_PEOPLE_NM is '销售人名称';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALES_PEOPLE_MOBILE is '销售人手机号';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALES_RATIO is '销售人比例';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALE_PROD_STATUS_ID is '销售产品状态代码';
Comment on Column IBS.T1_SALES_DETAIL_Q.SALE_PROD_STATUS_NM is '销售产品状态名称';
Comment on Column IBS.T1_SALES_DETAIL_Q.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T1_SALES_DETAIL_Q.MODIFY_TIME is '修改时间';
Comment on Column IBS.T1_SALES_DETAIL_Q.MODIFY_IP is '修改IP';
Comment on Column IBS.T1_SALES_DETAIL_Q.REMARK   is '备注';
Comment on Column IBS.T1_SALES_DETAIL_Q.REMARK1  is '备注1';
Comment on Column IBS.T1_SALES_DETAIL_Q.CLS_BAL  is '理财余额';
Comment on Column IBS.T1_SALES_DETAIL_Q.MTD_AVG_BAL is '理财月日均';
Comment on Column IBS.T1_SALES_DETAIL_Q.QTD_AVG_BAL is '理财季日均';
Comment on Column IBS.T1_SALES_DETAIL_Q.YTD_AVG_BAL is '理财年日均';
Comment on Column IBS.T1_SALES_DETAIL_Q.MEASURE_DT is '统计日期';

--------------------------------------------------
-- Create Table IBS.T1_THD_EMP_RELA
--------------------------------------------------
Create table IBS.T1_THD_EMP_RELA (
    TXN_RUN_NBR                    VARCHAR(16)         NOT NULL    ,
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    SCURT_AC                       VARCHAR(30)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)                     ,
    RATIO                          DECIMAL(6,2)                  With Default 100  ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    IDENTN_NO                      VARCHAR(32)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,SCURT_AC,TXN_RUN_NBR) Using Hashing;
Comment on Table IBS.T1_THD_EMP_RELA is '认领关系（贵金属）';
Comment on Column IBS.T1_THD_EMP_RELA.TXN_RUN_NBR is '流水号';
Comment on Column IBS.T1_THD_EMP_RELA.VUCH_NBR   is '凭证号';
Comment on Column IBS.T1_THD_EMP_RELA.SCURT_AC   is '证券账号';
Comment on Column IBS.T1_THD_EMP_RELA.EMP_ID     is '员工号';
Comment on Column IBS.T1_THD_EMP_RELA.RATIO      is '认领比例';
Comment on Column IBS.T1_THD_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_THD_EMP_RELA.CLAIM_DT   is '认领日期';
Comment on Column IBS.T1_THD_EMP_RELA.VERIFY_DT  is '审批日期';
Comment on Column IBS.T1_THD_EMP_RELA.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_THD_EMP_RELA.REMARK     is '备注';
Comment on Column IBS.T1_THD_EMP_RELA.REMARK1    is '备注1';
Comment on Column IBS.T1_THD_EMP_RELA.ORG_ID     is '签约机构号';
Comment on Column IBS.T1_THD_EMP_RELA.ORG_NM     is '签约机构名';
Comment on Column IBS.T1_THD_EMP_RELA.CST_NM     is '客户名';
Comment on Column IBS.T1_THD_EMP_RELA.IDENTN_NO  is '证件号';
Comment on Column IBS.T1_THD_EMP_RELA.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_THD_EMP_RELA.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_THD_EMP_RELA.OPEN_DT    is '签约日期';
Comment on Column IBS.T1_THD_EMP_RELA.EMP_NM     is '员工名';
Comment on Column IBS.T1_THD_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_THD_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_THD_EMP_RELA.MARKETING_NO is '活动编码';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_ACC_RELA
--------------------------------------------------
Create table IBS.T1_VUCH_ACC_RELA (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    IS_CD                          VARCHAR(20)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,ACC_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T1_VUCH_ACC_RELA is '存款凭证与账户关系';
Comment on Column IBS.T1_VUCH_ACC_RELA.VUCH_NBR  is '凭证号';
Comment on Column IBS.T1_VUCH_ACC_RELA.ACC_ID    is '账号';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_ACC_RELA_TMP
--------------------------------------------------
Create table IBS.T1_VUCH_ACC_RELA_TMP (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    IS_CD                          VARCHAR(20)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,ACC_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T1_VUCH_ACC_RELA_TMP is '存款凭证与账户关系';
Comment on Column IBS.T1_VUCH_ACC_RELA_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_ACC_RELA_TMP.ACC_ID is '账号';
Comment on Column IBS.T1_VUCH_ACC_RELA_TMP.IS_CD is '是否为存单0或空否，1是，220200401日后开户的存单';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_DETAIL
--------------------------------------------------
Create table IBS.T1_VUCH_DETAIL (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    WITH_CARD_F                    CHAR(1)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    OPEN_DT                        DATE                            ,
    CLOSE_DT                       DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_DETAIL is '存贷款凭证明细表';
Comment on Column IBS.T1_VUCH_DETAIL.VUCH_NBR    is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_DETAIL.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T1_VUCH_DETAIL.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T1_VUCH_DETAIL.WITH_CARD_F is '配卡标志（1-配卡；0-不配卡）--配卡的储蓄存折不允许认领';
Comment on Column IBS.T1_VUCH_DETAIL.CST_ID      is '客户号';
Comment on Column IBS.T1_VUCH_DETAIL.CST_NM      is '客户名';
Comment on Column IBS.T1_VUCH_DETAIL.ORG_ID      is '机构号';
Comment on Column IBS.T1_VUCH_DETAIL.ORG_NM      is '机构名';
Comment on Column IBS.T1_VUCH_DETAIL.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T1_VUCH_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_VUCH_DETAIL.OPEN_DT     is '开户日期';
Comment on Column IBS.T1_VUCH_DETAIL.CLOSE_DT    is '销户日期';
Comment on Column IBS.T1_VUCH_DETAIL.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T1_VUCH_DETAIL.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_DETAIL.PROD_ID     is '产品编号';
Comment on Column IBS.T1_VUCH_DETAIL.PROD_NM     is '产品名称';
Comment on Column IBS.T1_VUCH_DETAIL.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T1_VUCH_DETAIL.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_DETAIL.DEPT_ID     is '部门编号';
Comment on Column IBS.T1_VUCH_DETAIL.LN_AMT      is '贷款金额';
Comment on Column IBS.T1_VUCH_DETAIL.MARKETING_NO is '营销活动编号';
Comment on Column IBS.T1_VUCH_DETAIL.EMP_ID      is '推荐人';
Comment on Column IBS.T1_VUCH_DETAIL.CST_OPEN_DT is '客户开户日期';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_DETAIL_20251204
--------------------------------------------------
Create table IBS.T1_VUCH_DETAIL_20251204 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    WITH_CARD_F                    CHAR(1)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    OPEN_DT                        DATE                            ,
    CLOSE_DT                       DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ) 
in USERSPACE1   
Partitioning Key (VUCH_NBR) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_VUCH_DETAIL_TMP
--------------------------------------------------
Create table IBS.T1_VUCH_DETAIL_TMP (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    WITH_CARD_F                    CHAR(1)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    OPEN_DT                        DATE                            ,
    CLOSE_DT                       DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_DETAIL_TMP is '开发临时表-存贷款凭证明细表';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.VUCH_NBR is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.WITH_CARD_F is '配卡标志（1-配卡；0-不配卡）--配卡的储蓄存折不允许认领';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.CST_ID  is '客户号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.CST_NM  is '客户名';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.ORG_ID  is '机构号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.ORG_NM  is '机构名';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.CLOSE_DT is '销户日期';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.PROD_ID is '产品编号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.PROD_NM is '产品名称';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.DEPT_ID is '部门编号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.LN_AMT  is '贷款金额';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.MARKETING_NO is '营销活动编号';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.EMP_ID  is '推荐人';
Comment on Column IBS.T1_VUCH_DETAIL_TMP.CST_OPEN_DT is '客户开户日期';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ,
    RVS_EMP_ID                     VARCHAR(20)                     ,
    RVS_DT                         DATE                            ,
    RVS_CLAIM_EMP_ID               VARCHAR(20)                     ,
    RVS_CLAIM_DT                   DATE                            ,
    RVS_RATIO                      DECIMAL(6,2)                    ,
    FH_VERIFY_EMP_NM               VARCHAR(64)                     ,
    RVS_EMP_NM                     VARCHAR(64)                     ,
    RVS_CLAIM_EMP_NM               VARCHAR(64)                     ,
    RVS_STATUS_ID                  VARCHAR(2)                    With Default ''  ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA is '认领关系（存贷款）';
Comment on Column IBS.T1_VUCH_EMP_RELA.VUCH_NBR  is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_EMP_RELA.EMP_ID    is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA.RATIO     is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_VUCH_EMP_RELA.CLAIM_DT  is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.VERIFY_DT is '终审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T1_VUCH_EMP_RELA.REMARK    is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA.REMARK1   is '备注1';
Comment on Column IBS.T1_VUCH_EMP_RELA.ORG_ID    is '凭证机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA.ORG_NM    is '凭证机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA.CST_NM    is '客户名';
Comment on Column IBS.T1_VUCH_EMP_RELA.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_EMP_RELA.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_EMP_RELA.OPEN_DT   is '开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.EMP_NM    is '员工名';
Comment on Column IBS.T1_VUCH_EMP_RELA.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA.FH_VERIFY_DT is '初审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.FH_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T1_VUCH_EMP_RELA.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.CST_ID    is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA.PROD_ID   is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA.CTR_NBR   is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA.CTR_BAL   is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.LN_TP_ID  is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA.ADD_FLAG  is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA.RISK_FLAG is '风险标识';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_EMP_ID is '调整人';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_DT    is '调整日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_CLAIM_EMP_ID is '调整审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_CLAIM_DT is '调整审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_RATIO is '调整比例';
Comment on Column IBS.T1_VUCH_EMP_RELA.FH_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_EMP_NM is '调整人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_CLAIM_EMP_NM is '调整审批人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA.RVS_STATUS_ID is '调整状态1调整待审2调整已通过3调整未通过';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_20160407_BASELINE
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_20160407_BASELINE (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          INTEGER                         ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ) 
in TS_REP   
Partitioning Key (VUCH_NBR) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_20250806
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_20250806 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ,
    RVS_STATUS_ID                  VARCHAR(2)                      ,
    RVS_EMP_ID                     VARCHAR(20)                     ,
    RVS_DT                         DATE                            ,
    RVS_CLAIM_EMP_ID               VARCHAR(20)                     ,
    RVS_CLAIM_DT                   DATE                            ,
    RVS_RATIO                      DECIMAL(6,2)                    ,
    FH_VERIFY_EMP_NM               VARCHAR(64)                     ,
    RVS_EMP_NM                     VARCHAR(64)                     ,
    RVS_CLAIM_EMP_NM               VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_20250806 is '认领关系（存贷款）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.VUCH_NBR is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.VERIFY_DT is '终审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.REMARK1 is '备注1';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ORG_ID is '凭证机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ORG_NM is '凭证机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CST_NM is '客户名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.OPEN_DT is '开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.EMP_NM is '员工名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.FH_VERIFY_DT is '初审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.FH_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RISK_FLAG is '风险标识';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_STATUS_ID is '调整状态1调整待审2调整已通过3调整未通过';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_EMP_ID is '调整人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_DT is '调整日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_CLAIM_EMP_ID is '调整审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_CLAIM_DT is '调整审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_RATIO is '调整比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.FH_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_EMP_NM is '调整人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250806.RVS_CLAIM_EMP_NM is '调整审批人姓名';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_20250812
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_20250812 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ,
    RVS_EMP_ID                     VARCHAR(20)                     ,
    RVS_DT                         DATE                            ,
    RVS_CLAIM_EMP_ID               VARCHAR(20)                     ,
    RVS_CLAIM_DT                   DATE                            ,
    RVS_RATIO                      DECIMAL(6,2)                    ,
    FH_VERIFY_EMP_NM               VARCHAR(64)                     ,
    RVS_EMP_NM                     VARCHAR(64)                     ,
    RVS_CLAIM_EMP_NM               VARCHAR(64)                     ,
    RVS_STATUS_ID                  VARCHAR(2)                    With Default ''  ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_20250812 is '认领关系（存贷款）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.VUCH_NBR is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.VERIFY_DT is '终审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.REMARK1 is '备注1';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ORG_ID is '凭证机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ORG_NM is '凭证机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CST_NM is '客户名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.OPEN_DT is '开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.EMP_NM is '员工名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.FH_VERIFY_DT is '初审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.FH_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RISK_FLAG is '风险标识';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_EMP_ID is '调整人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_DT is '调整日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_CLAIM_EMP_ID is '调整审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_CLAIM_DT is '调整审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_RATIO is '调整比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.FH_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_EMP_NM is '调整人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_CLAIM_EMP_NM is '调整审批人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_20250812.RVS_STATUS_ID is '调整状态1调整待审2调整已通过3调整未通过';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_BAK
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_BAK (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ,
    RVS_EMP_ID                     VARCHAR(20)                     ,
    RVS_DT                         DATE                            ,
    RVS_CLAIM_EMP_ID               VARCHAR(20)                     ,
    RVS_CLAIM_DT                   DATE                            ,
    RVS_RATIO                      DECIMAL(6,2)                    ,
    FH_VERIFY_EMP_NM               VARCHAR(64)                     ,
    RVS_EMP_NM                     VARCHAR(64)                     ,
    RVS_CLAIM_EMP_NM               VARCHAR(64)                     ,
    RVS_STATUS_ID                  VARCHAR(2)                    With Default ''  ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_BAK is '认领关系（存贷款）';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.VUCH_NBR is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.VERIFY_DT is '终审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.REMARK1 is '备注1';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ORG_ID is '凭证机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ORG_NM is '凭证机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CST_NM is '客户名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.OPEN_DT is '开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.EMP_NM is '员工名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.FH_VERIFY_DT is '初审日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.FH_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RISK_FLAG is '风险标识';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_EMP_ID is '调整人';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_DT is '调整日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_CLAIM_EMP_ID is '调整审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_CLAIM_DT is '调整审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_RATIO is '调整比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.FH_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_EMP_NM is '调整人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_CLAIM_EMP_NM is '调整审批人姓名';
Comment on Column IBS.T1_VUCH_EMP_RELA_BAK.RVS_STATUS_ID is '调整状态1调整待审2调整已通过3调整未通过';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q is '季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.EMP_ID  is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.RATIO   is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.REMARK  is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.CST_ID  is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q.RISK_FLAG is '风险标识';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_20220831
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_20220831 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_20220831 is '季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20220831.MARKETING_NO is '活动编码';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_20231231LESS
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_20231231LESS (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_20231231LESS is '季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20231231LESS.MARKETING_NO is '活动编码';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_20250528
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_20250528 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_20250528 is '季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_20250528.RISK_FLAG is '风险标识';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_BAK_20260331
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_BAK_20260331 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in USERSPACE1   
Partitioning Key (VUCH_NBR) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_TEST
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_TEST (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_AMT                        DECIMAL(15,2)                   ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_TEST is '季末存贷款认领关系【季初10日运行(使用9日的数据日期)最为上季度的最终认领关系供报表】';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TEST.MARKETING_NO is '活动编码';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_TMP
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_TMP (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ,
    BIZ_TP_NM                      VARCHAR(256)                    ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_TMP is '季末存贷款认领关系';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.RISK_FLAG is '风险标识';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP.BIZ_TP_NM is '业务品种名称';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    RATIO                          DECIMAL(6,3)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201 is '季末存贷款认领关系';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.VUCH_NBR is '凭证号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.MEASURE_DT is '统计日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销；5-自动审核通过；6-事中认领自动审核通过）';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.VERIFY_DT is '审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.VERIFY_EMP_ID is '审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_Q_TMP_20231201.RISK_FLAG is '风险标识';

--------------------------------------------------
-- Create Table IBS.T1_VUCH_EMP_RELA_TMP
--------------------------------------------------
Create table IBS.T1_VUCH_EMP_RELA_TMP (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    MARKETING_NO                   VARCHAR(40)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ,
    CST_ID                         VARCHAR(32)                     ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    ST_LINE_TP_ID                  INTEGER                         ,
    PROD_ID                        VARCHAR(10)                     ,
    CTR_NBR                        VARCHAR(32)                     ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    LN_DRDN_DT                     DATE                            ,
    LN_END_DT                      DATE                            ,
    LN_TP_ID                       INTEGER                         ,
    MIN_DRDN_DT_BY_CST             DATE                            ,
    ADD_CST_FLAG                   VARCHAR(4)                      ,
    ADD_CTR_FLAG                   VARCHAR(4)                      ,
    ADD_FLAG                       VARCHAR(4)                      ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T1_VUCH_EMP_RELA_TMP is '认领关系（存贷款）';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.VUCH_NBR is '凭证号（包含对公存款/借记卡/储蓄存折/一本通/存单/贷款借据）';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.EMP_ID is '员工号';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.RATIO is '认领比例';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CLAIM_DT is '认领日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.VERIFY_DT is '支行审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.VERIFY_EMP_ID is '支行审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.REMARK is '备注';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.REMARK1 is '备注1';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ORG_ID is '凭证机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ORG_NM is '凭证机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CST_NM is '客户名';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.EMP_NM is '员工名';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.EMP_ORG_ID is '员工机构号';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.EMP_ORG_NM is '员工机构名';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.MARKETING_NO is '活动编码';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.FH_VERIFY_DT is '分行审批日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.FH_VERIFY_EMP_ID is '分行审批人';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CST_ID is '客户号';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.BIZ_TP_CD is '业务品种';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.BIZ_TP_NM is '业务品种名称';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ST_LINE_TP_ID is '统计口径';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.PROD_ID is '产品ID';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CTR_NBR is '合同号';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.CTR_BAL is '合同余额';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.LN_DRDN_DT is '发放日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.LN_END_DT is '终止日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.LN_TP_ID is '贷款类型';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.MIN_DRDN_DT_BY_CST is '客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ADD_CST_FLAG is '按客户首次放款日期';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ADD_CTR_FLAG is '按非循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ADD_FLAG is '按循环贷款';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.MNG_LINE_TP_ID is '管理部门';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ACT_INT_INCM is '实收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.ACR_INT_INCM is '应收利息';
Comment on Column IBS.T1_VUCH_EMP_RELA_TMP.RISK_FLAG is '风险标识';

--------------------------------------------------
-- Create Table IBS.T1_YBDB_EMP_RELA
--------------------------------------------------
Create table IBS.T1_YBDB_EMP_RELA (
    INSURE_NO                      VARCHAR(30)         NOT NULL    ,
    EMP_ID                         VARCHAR(32)         NOT NULL    ,
    TA_CODE                        VARCHAR(9)                      ,
    TA_NAME                        VARCHAR(60)                     ,
    PRD_CODE                       VARCHAR(20)                     ,
    PRD_NAME                       VARCHAR(250)                    ,
    CLIENT_NO                      VARCHAR(24)                     ,
    HOLDER_NAME                    VARCHAR(50)                     ,
    HOLDER_ID_TYPE                 VARCHAR(3)                      ,
    HOLDER_ID_CODE                 VARCHAR(30)                     ,
    RELATION                       VARCHAR(2)                      ,
    INSURED_NAME                   VARCHAR(50)                     ,
    INSURED_ID_TYPE                VARCHAR(1)                      ,
    INSURED_ID_CODE                VARCHAR(30)                     ,
    BRANCH_NO                      VARCHAR(8)                      ,
    BRANCH_NO_CH                   VARCHAR(64)                     ,
    OPER_NO                        VARCHAR(32)                     ,
    TRANS_DATE                     INTEGER                         ,
    SERIAL_NO                      VARCHAR(32)                     ,
    INSURE_DATE                    INTEGER                         ,
    CFM_DATE                       INTEGER                         ,
    PAY_YEAR                       VARCHAR(10)                     ,
    INSURE_YEAR_TYPE               VARCHAR(1)                      ,
    INSURE_YEAR                    VARCHAR(10)                     ,
    EFFECT_DATE                    INTEGER                         ,
    PAY_TYPE                       INTEGER                         ,
    PAY_TYPE_CH                    VARCHAR(64)                     ,
    PAY_YEAR_TYPE                  VARCHAR(1)                      ,
    AMT                            DECIMAL(18,2)                   ,
    INSURE_FEE                     DECIMAL(18,2)                   ,
    BANK_ACC                       VARCHAR(32)                     ,
    VOL                            DECIMAL(18,2)                   ,
    STATUS                         VARCHAR(1)                      ,
    STATUS_CH                      VARCHAR(64)                     ,
    RECOMMENDER                    VARCHAR(32)                     ,
    RESERVE1                       VARCHAR(250)                    ,
    RATIO                          DECIMAL(6,2)                    ,
    CLAIM_STATUS_ID                CHAR(2)                         ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VERIFY_EMP_ID                  VARCHAR(20)                     ,
    FH_VERIFY_DT                   DATE                            ,
    FH_VERIFY_EMP_ID               VARCHAR(20)                     ,
    REMARK                         VARCHAR(5000)                   ,
    REMARK1                        VARCHAR(250)                    ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (INSURE_NO) Using Hashing;
Comment on Table IBS.T1_YBDB_EMP_RELA is '保险保单认领关系表';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURE_NO is '保单号';
Comment on Column IBS.T1_YBDB_EMP_RELA.EMP_ID    is '认领员工号';
Comment on Column IBS.T1_YBDB_EMP_RELA.TA_CODE   is '公司代码';
Comment on Column IBS.T1_YBDB_EMP_RELA.TA_NAME   is '公司名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.PRD_CODE  is '产品代码';
Comment on Column IBS.T1_YBDB_EMP_RELA.PRD_NAME  is '产品铝箔';
Comment on Column IBS.T1_YBDB_EMP_RELA.CLIENT_NO is '客户编号';
Comment on Column IBS.T1_YBDB_EMP_RELA.HOLDER_NAME is '投保人名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.HOLDER_ID_TYPE is '投保人证件类型';
Comment on Column IBS.T1_YBDB_EMP_RELA.HOLDER_ID_CODE is '投保人证件号码';
Comment on Column IBS.T1_YBDB_EMP_RELA.RELATION  is '投保人被保人关系';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURED_NAME is '被保人名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURED_ID_TYPE is '被保人证件类型';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURED_ID_CODE is '被保人证件号码';
Comment on Column IBS.T1_YBDB_EMP_RELA.BRANCH_NO is '机构编号';
Comment on Column IBS.T1_YBDB_EMP_RELA.BRANCH_NO_CH is '机构名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.OPER_NO   is '操作员号';
Comment on Column IBS.T1_YBDB_EMP_RELA.TRANS_DATE is '受理日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.SERIAL_NO is '受理流水号';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURE_DATE is '投保日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.CFM_DATE  is '承保日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.PAY_YEAR  is '缴费年限';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURE_YEAR_TYPE is '保障年期类型';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURE_YEAR is '保障年期';
Comment on Column IBS.T1_YBDB_EMP_RELA.EFFECT_DATE is '生效日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.PAY_TYPE  is '缴费方式';
Comment on Column IBS.T1_YBDB_EMP_RELA.PAY_TYPE_CH is '缴费方式名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.PAY_YEAR_TYPE is '缴费年期类型';
Comment on Column IBS.T1_YBDB_EMP_RELA.AMT       is '保险金额';
Comment on Column IBS.T1_YBDB_EMP_RELA.INSURE_FEE is '保险费用';
Comment on Column IBS.T1_YBDB_EMP_RELA.BANK_ACC  is '交易帐号';
Comment on Column IBS.T1_YBDB_EMP_RELA.VOL       is '投保份数';
Comment on Column IBS.T1_YBDB_EMP_RELA.STATUS    is '保单状态';
Comment on Column IBS.T1_YBDB_EMP_RELA.STATUS_CH is '保单状态名称';
Comment on Column IBS.T1_YBDB_EMP_RELA.RECOMMENDER is '推荐人';
Comment on Column IBS.T1_YBDB_EMP_RELA.RESERVE1  is '备用字段1';
Comment on Column IBS.T1_YBDB_EMP_RELA.RATIO     is '认领比例';
Comment on Column IBS.T1_YBDB_EMP_RELA.CLAIM_STATUS_ID is '认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）';
Comment on Column IBS.T1_YBDB_EMP_RELA.CLAIM_DT  is '认领日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.VERIFY_DT is '支行审批日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.VERIFY_EMP_ID is '支行审批人';
Comment on Column IBS.T1_YBDB_EMP_RELA.FH_VERIFY_DT is '分行审批日期';
Comment on Column IBS.T1_YBDB_EMP_RELA.FH_VERIFY_EMP_ID is '分行审批人';
Comment on Column IBS.T1_YBDB_EMP_RELA.REMARK    is '备注';
Comment on Column IBS.T1_YBDB_EMP_RELA.REMARK1   is '备注';
Comment on Column IBS.T1_YBDB_EMP_RELA.EMP_NM    is '认领员工姓名';
Comment on Column IBS.T1_YBDB_EMP_RELA.EMP_ORG_ID is '员工机构';
Comment on Column IBS.T1_YBDB_EMP_RELA.EMP_ORG_NM is '员工机构名称';

--------------------------------------------------
-- Create Table IBS.T2_BONUS_DETAIL
--------------------------------------------------
Create table IBS.T2_BONUS_DETAIL (
    SALE_ID                        VARCHAR(32)         NOT NULL    ,
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BONUS_TYPE_NM                  VARCHAR(64)                     ,
    MEASURE_DT                     DATE                            ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    CHANNLE_ID                     CHAR(4)                         ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    TXN_DT                         DATE                            ,
    VALUE_DT                       DATE                            ,
    MATURITY_DT                    DATE                            ,
    TERM_DAY_CNT                   INTEGER                         ,
    CCY_ID                         INTEGER                         ,
    AMT                            DECIMAL(18,2)                   ,
    PRICE                          DECIMAL(18,10)                  ,
    RECOMMEND_TYPE_ID              CHAR(2)                         ,
    RECOMMEND_PEOPLE               VARCHAR(20)                     ,
    RECOMMEND_PEOPLE_NM            VARCHAR(64)                     ,
    RECOMMEND_PEOPLE_MOBILE        VARCHAR(20)                     ,
    RECOMMEND_RATIO                INTEGER                         ,
    RECOMMEND_BONUS                DECIMAL(18,2)                   ,
    SALES_PEOPLE                   CHAR(6)                         ,
    SALES_PEOPLE_NM                VARCHAR(64)                     ,
    SALES_PEOPLE_MOBILE            VARCHAR(20)                     ,
    SALES_RATIO                    INTEGER                         ,
    SALES_BONUS                    DECIMAL(18,2)                   ,
    SALE_PROD_STATUS_ID            INTEGER                         ,
    SALE_PROD_STATUS_NM            VARCHAR(64)                     ,
    BONUS_STATUS_ID                CHAR(2)                         ,
    BONUS_STATUS_NM                VARCHAR(64)                     ,
    BONUS_EFF_DT                   DATE                            ,
    ADD_TIME                       TIMESTAMP                       ) 
in TS_IBS   
Partitioning Key (SALE_ID,BONUS_TYPE_ID) Using Hashing;
Comment on Table IBS.T2_BONUS_DETAIL is '奖金明细表';
Comment on Column IBS.T2_BONUS_DETAIL.SALE_ID    is '销售编码';
Comment on Column IBS.T2_BONUS_DETAIL.BONUS_TYPE_ID is '奖金类型';
Comment on Column IBS.T2_BONUS_DETAIL.BONUS_TYPE_NM is '奖金类型名称';
Comment on Column IBS.T2_BONUS_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_BONUS_DETAIL.CST_ID     is '客户号';
Comment on Column IBS.T2_BONUS_DETAIL.CST_NM     is '客户名';
Comment on Column IBS.T2_BONUS_DETAIL.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T2_BONUS_DETAIL.ORG_ID     is '机构号';
Comment on Column IBS.T2_BONUS_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_BONUS_DETAIL.TXN_DT     is '交易日期/信用卡发卡日期';
Comment on Column IBS.T2_BONUS_DETAIL.VALUE_DT   is '起息日/信用卡激活日期';
Comment on Column IBS.T2_BONUS_DETAIL.MATURITY_DT is '到期日';
Comment on Column IBS.T2_BONUS_DETAIL.TERM_DAY_CNT is '期限天数';
Comment on Column IBS.T2_BONUS_DETAIL.CCY_ID     is '币种';
Comment on Column IBS.T2_BONUS_DETAIL.AMT        is '金额';
Comment on Column IBS.T2_BONUS_DETAIL.PRICE      is '价格';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_TYPE_ID is '推荐人类型代码';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_PEOPLE is '推荐人';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_PEOPLE_NM is '推荐人名称';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_PEOPLE_MOBILE is '推荐人手机号';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_RATIO is '推荐人比例';
Comment on Column IBS.T2_BONUS_DETAIL.RECOMMEND_BONUS is '推荐人奖金';
Comment on Column IBS.T2_BONUS_DETAIL.SALES_PEOPLE is '销售人';
Comment on Column IBS.T2_BONUS_DETAIL.SALES_PEOPLE_NM is '销售人名称';
Comment on Column IBS.T2_BONUS_DETAIL.SALES_PEOPLE_MOBILE is '销售人手机号';
Comment on Column IBS.T2_BONUS_DETAIL.SALES_RATIO is '销售人比例';
Comment on Column IBS.T2_BONUS_DETAIL.SALES_BONUS is '销售人奖金';
Comment on Column IBS.T2_BONUS_DETAIL.SALE_PROD_STATUS_ID is '销售产品状态代码';
Comment on Column IBS.T2_BONUS_DETAIL.SALE_PROD_STATUS_NM is '销售产品状态名称';
Comment on Column IBS.T2_BONUS_DETAIL.BONUS_STATUS_ID is '奖金状态代码';
Comment on Column IBS.T2_BONUS_DETAIL.BONUS_STATUS_NM is '奖金状态名称';
Comment on Column IBS.T2_BONUS_DETAIL.BONUS_EFF_DT is '奖金计提日期';
Comment on Column IBS.T2_BONUS_DETAIL.ADD_TIME   is '加载时间';

--------------------------------------------------
-- Create Table IBS.T2_CST_ASSET_SCORE
--------------------------------------------------
Create table IBS.T2_CST_ASSET_SCORE (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)             NOT NULL    ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_OPEN_DT                    DATE                            ,
    EMP_ASSET                      DECIMAL(18,2)                   ,
    CST_ASSET                      DECIMAL(18,2)                   ,
    EMP_CNT                        INTEGER                         ,
    SCORE                          DECIMAL(10,2)                   ) 
in TS_IBS   
Partitioning Key (CST_ID,EMP_ID,MEASURE_DT,BIZ_TYPE_ID) Using Hashing;
Comment on Table IBS.T2_CST_ASSET_SCORE is '客户资产得分';
Comment on Column IBS.T2_CST_ASSET_SCORE.CST_ID  is '客户号';
Comment on Column IBS.T2_CST_ASSET_SCORE.EMP_ID  is '员工号';
Comment on Column IBS.T2_CST_ASSET_SCORE.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_CST_ASSET_SCORE.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_CST_ASSET_SCORE.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_CST_ASSET_SCORE.CST_OPEN_DT is '客户开户日期';
Comment on Column IBS.T2_CST_ASSET_SCORE.EMP_ASSET is '员工认领资产余额：存款+理财';
Comment on Column IBS.T2_CST_ASSET_SCORE.CST_ASSET is '客户资产余额：存款+理财';
Comment on Column IBS.T2_CST_ASSET_SCORE.EMP_CNT is '客户的客户经理数：只统计存款凭证';
Comment on Column IBS.T2_CST_ASSET_SCORE.SCORE   is '积分';

--------------------------------------------------
-- Create Table IBS.T2_EMP_BILL_INCOME
--------------------------------------------------
Create table IBS.T2_EMP_BILL_INCOME (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_CD                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    BILL_INC                       DECIMAL(18,2)                   ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    CHG_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT,ORG_CD) Using Hashing;
Comment on Table IBS.T2_EMP_BILL_INCOME is '公司类中间业务收入_java界面添加';
Comment on Column IBS.T2_EMP_BILL_INCOME.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_BILL_INCOME.EMP_ID  is '员工号';
Comment on Column IBS.T2_EMP_BILL_INCOME.EMP_NM  is '员工名';
Comment on Column IBS.T2_EMP_BILL_INCOME.ORG_CD  is '员工归属机构号';
Comment on Column IBS.T2_EMP_BILL_INCOME.ORG_NM  is '员工归属机构';
Comment on Column IBS.T2_EMP_BILL_INCOME.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_BILL_INCOME.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_BILL_INCOME.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_BILL_INCOME.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_BILL_INCOME.BILL_INC is '票据收入';
Comment on Column IBS.T2_EMP_BILL_INCOME.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T2_EMP_BILL_INCOME.MODIFY_TIME is '修改时间';
Comment on Column IBS.T2_EMP_BILL_INCOME.MODIFY_IP is '修改IP';
Comment on Column IBS.T2_EMP_BILL_INCOME.CHG_DT  is '调整期';

--------------------------------------------------
-- Create Table IBS.T2_EMP_BONUS_SMY
--------------------------------------------------
Create table IBS.T2_EMP_BONUS_SMY (
    EMP_ID                         CHAR(6)             NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_TYPE_ID                    CHAR(2)             NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    CCY_ID                         INTEGER                         ,
    M_FNC_PROD_BONUS               DECIMAL(18,2)                   ,
    Q_FNC_PROD_BONUS               DECIMAL(18,2)                   ,
    Y_FNC_PROD_BONUS               DECIMAL(18,2)                   ,
    M_EBANK_BONUS                  DECIMAL(18,2)                   ,
    Q_EBANK_BONUS                  DECIMAL(18,2)                   ,
    Y_EBANK_BONUS                  DECIMAL(18,2)                   ,
    M_MOBILE_BANK_BONUS            DECIMAL(18,2)                   ,
    Q_MOBILE_BANK_BONUS            DECIMAL(18,2)                   ,
    Y_MOBILE_BANK_BONUS            DECIMAL(18,2)                   ,
    M_THIRD_PARTY_CUSTODY_BONUS    DECIMAL(18,2)                   ,
    Q_THIRD_PARTY_CUSTODY_BONUS    DECIMAL(18,2)                   ,
    Y_THIRD_PARTY_CUSTODY_BONUS    DECIMAL(18,2)                   ,
    M_FUND_BONUS                   DECIMAL(18,2)                   ,
    Q_FUND_BONUS                   DECIMAL(18,2)                   ,
    Y_FUND_BONUS                   DECIMAL(18,2)                   ,
    M_INSURANCE_BONUS              DECIMAL(18,2)                   ,
    Q_INSURANCE_BONUS              DECIMAL(18,2)                   ,
    Y_INSURANCE_BONUS              DECIMAL(18,2)                   ,
    M_CREDIT_CARD_BONUS            DECIMAL(18,2)                   ,
    Q_CREDIT_CARD_BONUS            DECIMAL(18,2)                   ,
    Y_CREDIT_CARD_BONUS            DECIMAL(18,2)                   ,
    ADD_TIME                       TIMESTAMP                       ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_BONUS_SMY is '员工奖金汇总表.存当日、月底';
Comment on Column IBS.T2_EMP_BONUS_SMY.EMP_ID    is '员工号';
Comment on Column IBS.T2_EMP_BONUS_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_BONUS_SMY.EMP_TYPE_ID is '员工类型代码';
Comment on Column IBS.T2_EMP_BONUS_SMY.EMP_NM    is '员工名';
Comment on Column IBS.T2_EMP_BONUS_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_BONUS_SMY.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_BONUS_SMY.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_BONUS_SMY.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_BONUS_SMY.ORG_ID    is '机构号';
Comment on Column IBS.T2_EMP_BONUS_SMY.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_BONUS_SMY.CCY_ID    is '币种';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_FNC_PROD_BONUS is '本月理财奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_FNC_PROD_BONUS is '本季理财奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_FNC_PROD_BONUS is '本年理财奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_EBANK_BONUS is '本月网银奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_EBANK_BONUS is '本季网银奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_EBANK_BONUS is '本年网银奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_MOBILE_BANK_BONUS is '本月手机银行奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_MOBILE_BANK_BONUS is '本季手机银行奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_MOBILE_BANK_BONUS is '本年手机银行奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_THIRD_PARTY_CUSTODY_BONUS is '本月第三方存管奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_THIRD_PARTY_CUSTODY_BONUS is '本季第三方存管奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_THIRD_PARTY_CUSTODY_BONUS is '本年第三方存管奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_FUND_BONUS is '本月基金奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_FUND_BONUS is '本季基金奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_FUND_BONUS is '本年基金奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_INSURANCE_BONUS is '本月保险奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_INSURANCE_BONUS is '本季保险奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_INSURANCE_BONUS is '本年保险奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.M_CREDIT_CARD_BONUS is '本月信用卡奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Q_CREDIT_CARD_BONUS is '本季信用卡奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.Y_CREDIT_CARD_BONUS is '本年信用卡奖金';
Comment on Column IBS.T2_EMP_BONUS_SMY.ADD_TIME  is '加载时间';

--------------------------------------------------
-- Create Table IBS.T2_EMP_CHG_PROFIT
--------------------------------------------------
Create table IBS.T2_EMP_CHG_PROFIT (
    MSR_PRD_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    PROFIT                         DECIMAL(20,2)                 With Default 0  ,
    RMARK                          VARCHAR(256)                    ,
    MODIFY_PEOPLE                  VARCHAR(32)                     ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      VARCHAR(15)                     ) 
in TS_IBS   
Partitioning Key (MSR_PRD_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T2_EMP_CHG_PROFIT is '其他调整';
Comment on Column IBS.T2_EMP_CHG_PROFIT.MSR_PRD_DT is '数据日期';
Comment on Column IBS.T2_EMP_CHG_PROFIT.EMP_ID   is '员工号';
Comment on Column IBS.T2_EMP_CHG_PROFIT.EMP_NM   is '员工名';
Comment on Column IBS.T2_EMP_CHG_PROFIT.ORG_ID   is '员工机构号';
Comment on Column IBS.T2_EMP_CHG_PROFIT.ORG_NM   is '员工机构名';
Comment on Column IBS.T2_EMP_CHG_PROFIT.PSTN_TYPE is '主考核类别代码';
Comment on Column IBS.T2_EMP_CHG_PROFIT.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T2_EMP_CHG_PROFIT.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.T2_EMP_CHG_PROFIT.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T2_EMP_CHG_PROFIT.PROFIT   is '调整后利润';
Comment on Column IBS.T2_EMP_CHG_PROFIT.RMARK    is '备注';
Comment on Column IBS.T2_EMP_CHG_PROFIT.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T2_EMP_CHG_PROFIT.MODIFY_TIME is '修改时间';
Comment on Column IBS.T2_EMP_CHG_PROFIT.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL (
    ACC_ID                         VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(64)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   )    
Partitioning Key (ACC_ID,EMP_ID,MEASURE_DT) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL is '员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in USERSPACE1   
Partitioning Key (ACC_ID,EMP_ID,MEASURE_DT) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823 is '备份20220630日数据员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20220823.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331 is '（临时提数用的表）员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_20230331.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818 (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818 is '员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_OLDTO20210818.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP (
    ACC_ID                         VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(64)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP is '（临时提数用的表）员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK (
    ACC_ID                         VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(64)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK is '（临时提数用的表）员工存贷款账户业绩明细';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_TMP_BAK.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(64)                     ,
    BONUS_TYPE_ID                  VARCHAR(20)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    DEPT_NM                        VARCHAR(64)                     ,
    ACC_STATUS_ID                  INTEGER                         ,
    ACC_STATUS_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    EXERCISE_RATE                  DECIMAL(10,6)                   ,
    FTP                            DECIMAL(10,6)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ is '员工存贷款账户业绩明细_自然增长';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.ACC_ID is '账号（存款账户/贷款借据）';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.PROD_ID is '产品编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.PROD_NM is '产品名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.DEPT_ID is '部门编号';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.DEPT_NM is '部门名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.ACC_STATUS_ID is '账户状态';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.ACC_STATUS_NM is '账户状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.EXERCISE_RATE is '执行利率';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.FTP is 'FTP';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.Q_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_DEP_LN_ACC_PROFIT_DETAIL_ZRZZ.Y_PROFIT is '年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ,
    NEW_OR_EXIST                   VARCHAR(8)          NOT NULL  With Default '无'  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY is '员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY.YEAR is '取得资格证年份';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823 is '备份20220630日数据 员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20220823.YEAR is '取得资格证年份';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331 is '员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20230331.YEAR is '取得资格证年份';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ,
    NEW_OR_EXIST                   VARCHAR(8)          NOT NULL  With Default '无'  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528 is '员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_20250528.YEAR is '取得资格证年份';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ,
    NEW_OR_EXIST                   VARCHAR(8)          NOT NULL  With Default '无'  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP is '（临时提数）员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.YEAR is '取得资格证年份';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP.NEW_OR_EXIST is '新增/存量';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ,
    NEW_OR_EXIST                   VARCHAR(8)          NOT NULL  With Default '无'  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK is '（临时提数）员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_BAL is '存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_BAL is '储蓄存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_MTD_AVG_BAL is '储蓄存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_QTD_AVG_BAL is '储蓄存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_YTD_AVG_BAL is '储蓄存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_Q_PROFIT is '储蓄存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_DEP_Y_PROFIT is '储蓄存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_BAL is '对公存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_MTD_AVG_BAL is '对公存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_QTD_AVG_BAL is '对公存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_YTD_AVG_BAL is '对公存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_Q_PROFIT is '对公存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_DEP_Y_PROFIT is '对公存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_BAL is '同业存款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_MTD_AVG_BAL is '同业存款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_QTD_AVG_BAL is '同业存款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_YTD_AVG_BAL is '同业存款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_Q_PROFIT is '同业存款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.INTERBANK_DEP_Y_PROFIT is '同业存款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_Y_PROFIT is '贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_BAL is '个人贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_MTD_AVG_BAL is '个人贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_QTD_AVG_BAL is '个人贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_YTD_AVG_BAL is '个人贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_Q_PROFIT is '个人贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.IDV_LN_Y_PROFIT is '个人贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_BAL is '公司贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_MTD_AVG_BAL is '公司贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_QTD_AVG_BAL is '公司贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_YTD_AVG_BAL is '公司贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_Q_PROFIT is '公司贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ORG_LN_Y_PROFIT is '公司贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_BAL is '三农贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_MTD_AVG_BAL is '三农贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_QTD_AVG_BAL is '三农贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_YTD_AVG_BAL is '三农贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_Q_PROFIT is '三农贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.AGRICULTURE_LN_Y_PROFIT is '三农贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_BAL is '小企业贷款余额';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_MTD_AVG_BAL is '小企业贷款月日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_QTD_AVG_BAL is '小企业贷款季日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_YTD_AVG_BAL is '小企业贷款年日均';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_Q_PROFIT is '小企业贷款季利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.SMALL_BIZ_LN_Y_PROFIT is '小企业贷款年利润';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.DEP_YTD_AVG_BAL_RANK is '存款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_YTD_AVG_BAL_RANK is '贷款年日均排名';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.ADD_TIME is '加载时间';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.GRADE is '取得资格证等级';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_Q_PROFIT_MODIFY is '贷款季利润调整';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_Q_PROFIT_MODIFY_EMP is '贷款季利润调整员工';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.LN_Q_PROFIT_MODIFY_DT is '贷款季利润调整日期';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.CORP_MIDDLE_BONUS_Q is '本季公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.CORP_MIDDLE_BONUS_Y is '本年公司类中间业务收入';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.YEAR is '取得资格证年份';
Comment on Column IBS.T2_EMP_DEP_LN_PROFIT_SMY_TMP_BAK.NEW_OR_EXIST is '新增/存量';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    CLAIM_DT                       DATE                            ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    NEW_OR_EXIST                   VARCHAR(8)                      ,
    RISK_FLAG                      VARCHAR(4)                      ,
    BIZ_TP_NM                      VARCHAR(256)                    )    
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.DQ_YTD_AVG_BAL is '定期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.CLAIM_DT is '认领日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.BIZ_TP_CD is '贷款业务品种代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.NEW_OR_EXIST is '新增/存量 贷款';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.RISK_FLAG is '是否为风险资产';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL.BIZ_TP_NM is '业务品种名称';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823 is '备份20220630日数据员工存贷款凭证业绩明细（处理小规则)';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20220823.DQ_YTD_AVG_BAL is '定期年日均';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331 is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20230331.DQ_YTD_AVG_BAL is '定期年日均';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    CLAIM_DT                       DATE                            ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    NEW_OR_EXIST                   VARCHAR(8)                      ,
    RISK_FLAG                      VARCHAR(4)                      ,
    BIZ_TP_NM                      VARCHAR(256)                    ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528 is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.DQ_YTD_AVG_BAL is '定期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.CLAIM_DT is '认领日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.BIZ_TP_CD is '贷款业务品种代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.NEW_OR_EXIST is '新增/存量 贷款';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.RISK_FLAG is '是否为风险资产';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_20250528.BIZ_TP_NM is '业务品种名称';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK is '员工存贷款凭证业绩明细（处理小规则）数据为20160331至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_BAK.ACT_Y_PROFIT is '实际年利润';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818 is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_OLDTO20210818.DQ_YTD_AVG_BAL is '定期年日均';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    CLAIM_DT                       DATE                            ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    NEW_OR_EXIST                   VARCHAR(8)                      ,
    RISK_FLAG                      VARCHAR(4)                      ,
    BIZ_TP_NM                      VARCHAR(256)                    ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.DQ_YTD_AVG_BAL is '定期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.CLAIM_DT is '认领日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.BIZ_TP_CD is '贷款业务品种代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.NEW_OR_EXIST is '新增/存量';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.RISK_FLAG is '是否为风险资产';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP.BIZ_TP_NM is '业务品种名称';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    CLAIM_DT                       DATE                            ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    NEW_OR_EXIST                   VARCHAR(8)                      ,
    RISK_FLAG                      VARCHAR(4)                      ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.DQ_YTD_AVG_BAL is '定期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.CLAIM_DT is '认领日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.BIZ_TP_CD is '贷款业务品种代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.NEW_OR_EXIST is '新增/存量';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_BAK.RISK_FLAG is '是否为风险资产';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS
--------------------------------------------------
Create table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    BAL                            DECIMAL(18,3)                   ,
    MTD_AVG_BAL                    DECIMAL(18,3)                   ,
    QTD_AVG_BAL                    DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    VUCH_YTD_AVG_BAL               DECIMAL(18,3)                   ,
    Q_PROFIT                       DECIMAL(18,3)                   ,
    Y_PROFIT                       DECIMAL(18,3)                   ,
    ACT_Q_PROFIT                   DECIMAL(18,3)                   ,
    ACT_Y_PROFIT                   DECIMAL(18,3)                   ,
    HQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    HQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ,
    DQ_BAL                         DECIMAL(18,3)                 With Default 0  ,
    DQ_YTD_AVG_BAL                 DECIMAL(18,3)                 With Default 0  ) 
in USERSPACE1   
Partitioning Key (EMP_ID,MEASURE_DT,VUCH_TYPE_ID) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS is '员工存贷款凭证业绩明细（处理小规则）数据为20180101至20191121日';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.CST_ID is '客户号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.CST_NM is '客户名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.ORG_NM is '机构名';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.LN_AMT is '贷款金额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.BAL is '余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.MTD_AVG_BAL is '月日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.YTD_AVG_BAL is '年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.VUCH_YTD_AVG_BAL is '凭证年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.Q_PROFIT is '季利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.Y_PROFIT is '年利润（兑付给客户经理的）';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.ACT_Q_PROFIT is '实际季利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.ACT_Y_PROFIT is '实际年利润';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.HQ_BAL is '活期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.HQ_YTD_AVG_BAL is '活期年日均';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.DQ_BAL is '定期余额';
Comment on Column IBS.T2_EMP_DEP_LN_VUCH_PROFIT_DETAIL_TMP_TS.DQ_YTD_AVG_BAL is '定期年日均';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DFSLRY_SMY
--------------------------------------------------
Create table IBS.T2_EMP_DFSLRY_SMY (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    DEP_LINE_NM                    VARCHAR(64)         NOT NULL    ,
    QTD_TXN_AMT                    DECIMAL(20,2)                   ,
    QTD_TXN_CNT                    INTEGER                         ,
    QTD_VUCH_CNT                   INTEGER                         ,
    QTD_ENT_CNT                    INTEGER                         ) 
in TS_PUB   
Partitioning Key (MEASURE_DT,EMP_ID,DEP_LINE_NM) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DFSLRY_SMY is '员工认领的代发工资业绩代发明细';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.EMP_ID   is '员工号';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.EMP_NM   is '员工名';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.ORG_ID   is '机构号';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.ORG_NM   is '机构名称';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.BRANCH_ORG_NM is '分行名称';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.SUB_PSTN_TYPE is '子考核类别名称';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.DEP_LINE_NM is '部门';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.QTD_TXN_AMT is '本季累计金额';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.QTD_TXN_CNT is '本季累计笔数';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.QTD_VUCH_CNT is '本季账户数';
Comment on Column IBS.T2_EMP_DFSLRY_SMY.QTD_ENT_CNT is '本季企业数';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DFSLRY_VUCH_DETAIL
--------------------------------------------------
Create table IBS.T2_EMP_DFSLRY_VUCH_DETAIL (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ENT_ID                         VARCHAR(8)          NOT NULL    ,
    ENT_NM                         VARCHAR(64)                     ,
    CST_VUCH_NBR                   VARCHAR(22)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    RATIO                          DECIMAL(20,2)                   ,
    TXN_AMT                        DECIMAL(20,2)                   ,
    TXN_CNT                        INTEGER                         ,
    DEP_LINE_NM                    VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (MEASURE_DT,EMP_ID,ENT_ID,CST_VUCH_NBR) Using Hashing
Compress Yes;
Comment on Table IBS.T2_EMP_DFSLRY_VUCH_DETAIL is '员工认领的代发工资业绩代发明细';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.MEASURE_DT is '交易日期';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.ENT_ID is '企业编号';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.ENT_NM is '企业名称';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.CST_VUCH_NBR is '客户凭证号';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.ORG_NM is '机构名称';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.TXN_AMT is '金额';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.TXN_CNT is '笔数';
Comment on Column IBS.T2_EMP_DFSLRY_VUCH_DETAIL.DEP_LINE_NM is '部门';

--------------------------------------------------
-- Create Table IBS.T2_EMP_DX_SCORE
--------------------------------------------------
Create table IBS.T2_EMP_DX_SCORE (
    MSR_PRD_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    SCORE                          DECIMAL(20,2)                 With Default 0  ,
    RMARK                          VARCHAR(256)                    ) 
in TS_IBS   
Partitioning Key (MSR_PRD_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T2_EMP_DX_SCORE is '员工定性打分';
Comment on Column IBS.T2_EMP_DX_SCORE.MSR_PRD_DT is '数据日期';
Comment on Column IBS.T2_EMP_DX_SCORE.EMP_ID     is '员工号';
Comment on Column IBS.T2_EMP_DX_SCORE.EMP_NM     is '员工名';
Comment on Column IBS.T2_EMP_DX_SCORE.ORG_ID     is '员工机构号';
Comment on Column IBS.T2_EMP_DX_SCORE.ORG_NM     is '员工机构名';
Comment on Column IBS.T2_EMP_DX_SCORE.PSTN_TYPE  is '主考核类别代码';
Comment on Column IBS.T2_EMP_DX_SCORE.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T2_EMP_DX_SCORE.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.T2_EMP_DX_SCORE.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T2_EMP_DX_SCORE.SCORE      is '分数';
Comment on Column IBS.T2_EMP_DX_SCORE.RMARK      is '备注';

--------------------------------------------------
-- Create Table IBS.T2_EMP_FNC_PD_BONUS_SMY
--------------------------------------------------
Create table IBS.T2_EMP_FNC_PD_BONUS_SMY (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    MTD_AMT                        DECIMAL(20,3)                   ,
    QTD_AMT                        DECIMAL(20,3)                   ,
    YTD_AMT                        DECIMAL(20,3)                   ,
    CLS_BAL                        DECIMAL(20,3)                   ,
    MTD_AVG_BAL                    DECIMAL(20,3)                   ,
    QTD_AVG_BAL                    DECIMAL(20,3)                   ,
    YTD_AVG_BAL                    DECIMAL(20,3)                   ,
    MTD_BONUS                      DECIMAL(20,3)                   ,
    QTD_BONUS                      DECIMAL(20,3)                   ,
    YTD_BONUS                      DECIMAL(20,3)                   ,
    RNK                            INTEGER                         ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_FNC_PD_BONUS_SMY is '员工销售理财产品排名表';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.BRANCH_ORG_ID is '员工归属分行号';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.BRANCH_ORG_NM is '员工归属分行';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.ORG_ID is '员工归属机构号';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.ORG_NM is '员工归属机构';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.CCY_ID is '币种';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.MTD_AMT is '理财月销量';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.QTD_AMT is '理财季销量';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.YTD_AMT is '理财年销量';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.CLS_BAL is '理财余额';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.MTD_AVG_BAL is '理财余额日均';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.QTD_AVG_BAL is '理财季日均';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.YTD_AVG_BAL is '理财年日均';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.MTD_BONUS is '理财月收益';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.QTD_BONUS is '理财季收益';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.YTD_BONUS is '理财年收益';
Comment on Column IBS.T2_EMP_FNC_PD_BONUS_SMY.RNK is '员工理财季销量排名';

--------------------------------------------------
-- Create Table IBS.T2_EMP_FUND_SMY
--------------------------------------------------
Create table IBS.T2_EMP_FUND_SMY (
    MSR_PRD_DT                     DATE                NOT NULL    ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    TRA_FEE                        DECIMAL(20,2)                   ,
    SL_FEE                         DECIMAL(20,2)                   ,
    TXN_FEE                        DECIMAL(20,2)                   ) 
in TS_IBS   
Partitioning Key (MSR_PRD_DT,TXN_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T2_EMP_FUND_SMY is '员工基金客户认领smy';
Comment on Column IBS.T2_EMP_FUND_SMY.MSR_PRD_DT is '数据日期';
Comment on Column IBS.T2_EMP_FUND_SMY.TXN_DT     is '交易日期';
Comment on Column IBS.T2_EMP_FUND_SMY.EMP_ID     is '员工号';
Comment on Column IBS.T2_EMP_FUND_SMY.EMP_NM     is '员工名';
Comment on Column IBS.T2_EMP_FUND_SMY.ORG_ID     is '员工机构号';
Comment on Column IBS.T2_EMP_FUND_SMY.ORG_NM     is '员工机构名';
Comment on Column IBS.T2_EMP_FUND_SMY.PSTN_TYPE  is '主考核类别代码';
Comment on Column IBS.T2_EMP_FUND_SMY.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T2_EMP_FUND_SMY.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.T2_EMP_FUND_SMY.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T2_EMP_FUND_SMY.TRA_FEE    is '客户服务费';
Comment on Column IBS.T2_EMP_FUND_SMY.SL_FEE     is '销售服务费';
Comment on Column IBS.T2_EMP_FUND_SMY.TXN_FEE    is '销售手续费';

--------------------------------------------------
-- Create Table IBS.T2_EMP_FUND_SMY_20240730
--------------------------------------------------
Create table IBS.T2_EMP_FUND_SMY_20240730 (
    MSR_PRD_DT                     DATE                NOT NULL    ,
    TXN_DT                         DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    TRA_FEE                        DECIMAL(20,2)                   ,
    SL_FEE                         DECIMAL(20,2)                   ,
    TXN_FEE                        DECIMAL(20,2)                   ) 
in TS_IBS   
Partitioning Key (MSR_PRD_DT,TXN_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T2_EMP_FUND_SMY_20240730 is '员工基金客户认领smy';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.MSR_PRD_DT is '数据日期';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.TXN_DT is '交易日期';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.ORG_ID is '员工机构号';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.ORG_NM is '员工机构名';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.PSTN_TYPE is '主考核类别代码';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.TRA_FEE is '客户服务费';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.SL_FEE is '销售服务费';
Comment on Column IBS.T2_EMP_FUND_SMY_20240730.TXN_FEE is '销售手续费';

--------------------------------------------------
-- Create Table IBS.T2_EMP_INSUR_BONUS_SMY
--------------------------------------------------
Create table IBS.T2_EMP_INSUR_BONUS_SMY (
    EMP_ID                         CHAR(6)             NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    HR_ORG_NAME                    VARCHAR(64)                     ,
    INSUR_PREMIUM_M                DECIMAL(18,2)                   ,
    INSUR_PREMIUM_Q                DECIMAL(18,2)                   ,
    INSUR_PREMIUM_Y                DECIMAL(18,2)                   ,
    INSUR_BONUS_M                  DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_EMP_INSUR_BONUS_SMY is '员工销售保险汇总表';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.ORG_ID is '员工归属机构号';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.ORG_NM is '员工归属机构';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.BRANCH_ORG_ID is '员工归属分行号';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.BRANCH_ORG_NM is '员工归属分行';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.HR_ORG_NAME is '员工归属部门';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.INSUR_PREMIUM_M is '月保费';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.INSUR_PREMIUM_Q is '季保费';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.INSUR_PREMIUM_Y is '年保费';
Comment on Column IBS.T2_EMP_INSUR_BONUS_SMY.INSUR_BONUS_M is '月保险奖金';

--------------------------------------------------
-- Create Table IBS.T2_EMP_LN_PROFIT_BL_CHG
--------------------------------------------------
Create table IBS.T2_EMP_LN_PROFIT_BL_CHG (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)         NOT NULL    ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    OPEN_DT                        DATE                            ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_CD                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    VUCH_STS_NM                    VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,2)        NOT NULL  With Default 0  ,
    QTD_AVG_BAL                    DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT                     DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT_OLD                 DECIMAL(18,3)                 With Default 0  ,
    PERF_STS_TP_ID                 INTEGER                         ,
    PERF_STS_TP_NM                 VARCHAR(32)                     ,
    ACG_SBJ_ID                     INTEGER                         ,
    MODIFY_PEOPLE                  VARCHAR(64)                     ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    CHG_DT                         DATE                            ,
    QTR_FST_DT                     DATE                            ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID,VUCH_NBR) Using Hashing;
Comment on Table IBS.T2_EMP_LN_PROFIT_BL_CHG is '员工存贷款不良业绩调整java页面录入';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.MEASURE_DT is '考核期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.EMP_NM is '姓名';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.CST_NM is '客户名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.ORG_CD is '凭证所属机构CD';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.ORG_NM is '凭证所属机构';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.VUCH_STS_NM is '凭证状态';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.QTD_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.QTD_PROFIT_OLD is '季利润（应计）';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.PERF_STS_TP_ID is '正常/不良分类ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.PERF_STS_TP_NM is '正常/不良分类NM';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.ACG_SBJ_ID is '科目业务代号ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.MODIFY_TIME is '修改IP';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.MODIFY_IP is '修改时间';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.CHG_DT is '调整期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG.QTR_FST_DT is '季初';

--------------------------------------------------
-- Create Table IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122
--------------------------------------------------
Create table IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)         NOT NULL    ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    OPEN_DT                        DATE                            ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_CD                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    VUCH_STS_NM                    VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,2)        NOT NULL  With Default 0  ,
    QTD_AVG_BAL                    DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT                     DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT_OLD                 DECIMAL(18,3)                 With Default 0  ,
    PERF_STS_TP_ID                 INTEGER                         ,
    PERF_STS_TP_NM                 VARCHAR(32)                     ,
    ACG_SBJ_ID                     INTEGER                         ,
    MODIFY_PEOPLE                  VARCHAR(64)                     ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    CHG_DT                         DATE                            ,
    QTR_FST_DT                     DATE                            ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID,VUCH_NBR) Using Hashing;
Comment on Table IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122 is '员工存贷款不良业绩调整java页面录入';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.MEASURE_DT is '考核期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.EMP_NM is '姓名';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.CST_NM is '客户名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.ORG_CD is '凭证所属机构CD';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.ORG_NM is '凭证所属机构';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.VUCH_STS_NM is '凭证状态';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.QTD_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.QTD_PROFIT_OLD is '季利润（应计）';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.PERF_STS_TP_ID is '正常/不良分类ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.PERF_STS_TP_NM is '正常/不良分类NM';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.ACG_SBJ_ID is '科目业务代号ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.MODIFY_TIME is '修改IP';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.MODIFY_IP is '修改时间';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.CHG_DT is '调整期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_20211122.QTR_FST_DT is '季初';

--------------------------------------------------
-- Create Table IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP
--------------------------------------------------
Create table IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    OPEN_DT                        DATE                            ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_CD                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    VUCH_STS_NM                    VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,2)                  With Default 0  ,
    QTD_AVG_BAL                    DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT                     DECIMAL(18,3)                 With Default 0  ,
    QTD_PROFIT_OLD                 DECIMAL(18,3)                 With Default 0  ,
    PERF_STS_TP_ID                 INTEGER                         ,
    PERF_STS_TP_NM                 VARCHAR(32)                     ,
    ACG_SBJ_ID                     INTEGER                         ,
    MODIFY_PEOPLE                  VARCHAR(64)                     ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    CHG_DT                         DATE                            ,
    QTR_FST_DT                     DATE                            ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID,VUCH_NBR) Using Hashing;
Comment on Table IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP is '员工存贷款不良业绩调整-手工调整表';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.MEASURE_DT is '考核期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.EMP_NM is '姓名';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.CST_NM is '客户名称';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.ORG_CD is '凭证所属机构CD';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.ORG_NM is '凭证所属机构';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.VUCH_STS_NM is '凭证状态';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.RATIO is '认领比例';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.QTD_AVG_BAL is '季日均';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.QTD_PROFIT is '季利润';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.QTD_PROFIT_OLD is '季利润（应计）手工调整后的利润';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.PERF_STS_TP_ID is '正常/不良分类ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.PERF_STS_TP_NM is '正常/不良分类NM';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.ACG_SBJ_ID is '科目业务代号ID';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.MODIFY_TIME is '修改IP';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.MODIFY_IP is '修改时间';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.CHG_DT is '调整期';
Comment on Column IBS.T2_EMP_LN_PROFIT_BL_CHG_TMP.QTR_FST_DT is '季初';

--------------------------------------------------
-- Create Table IBS.T2_EMP_OTHER_BIZ
--------------------------------------------------
Create table IBS.T2_EMP_OTHER_BIZ (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    MEASURE_DT                     DATE                NOT NULL    ,
    BIZ_TYPE_ID                    VARCHAR(2)          NOT NULL    ,
    BIZ_TYPE_NM                    VARCHAR(32)                     ,
    SCORE                          DECIMAL(10,2)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT,BIZ_TYPE_ID) Using Hashing;
Comment on Table IBS.T2_EMP_OTHER_BIZ is '员工其它业务得分';
Comment on Column IBS.T2_EMP_OTHER_BIZ.EMP_ID    is '员工号';
Comment on Column IBS.T2_EMP_OTHER_BIZ.EMP_NM    is '员工名';
Comment on Column IBS.T2_EMP_OTHER_BIZ.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_OTHER_BIZ.BIZ_TYPE_ID is '其它业务编号';
Comment on Column IBS.T2_EMP_OTHER_BIZ.BIZ_TYPE_NM is '其它业务名称';
Comment on Column IBS.T2_EMP_OTHER_BIZ.SCORE     is '得分';

--------------------------------------------------
-- Create Table IBS.T2_EMP_OTHER_BIZ20190513
--------------------------------------------------
Create table IBS.T2_EMP_OTHER_BIZ20190513 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    MEASURE_DT                     DATE                NOT NULL    ,
    BIZ_TYPE_ID                    VARCHAR(2)          NOT NULL    ,
    BIZ_TYPE_NM                    VARCHAR(32)                     ,
    SCORE                          DECIMAL(10,2)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT,BIZ_TYPE_ID) Using Hashing;
Comment on Table IBS.T2_EMP_OTHER_BIZ20190513 is '员工其它业务得分';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.EMP_ID is '员工号';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.EMP_NM is '员工名';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.BIZ_TYPE_ID is '其它业务编号';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.BIZ_TYPE_NM is '其它业务名称';
Comment on Column IBS.T2_EMP_OTHER_BIZ20190513.SCORE is '得分';

--------------------------------------------------
-- Create Table IBS.T2_EMP_THD_SMY
--------------------------------------------------
Create table IBS.T2_EMP_THD_SMY (
    OPEN_DT                        DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    SIG_CNT                        DECIMAL(20,3)                   ) 
in TS_IBS   
Partitioning Key (OPEN_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T2_EMP_THD_SMY is '第三方存管员工销售业绩表';
Comment on Column IBS.T2_EMP_THD_SMY.OPEN_DT     is '签约日期';
Comment on Column IBS.T2_EMP_THD_SMY.EMP_ID      is '员工号';
Comment on Column IBS.T2_EMP_THD_SMY.EMP_NM      is '员工名';
Comment on Column IBS.T2_EMP_THD_SMY.ORG_ID      is '员工机构号';
Comment on Column IBS.T2_EMP_THD_SMY.ORG_NM      is '员工机构名';
Comment on Column IBS.T2_EMP_THD_SMY.PSTN_TYPE   is '主考核类别代码';
Comment on Column IBS.T2_EMP_THD_SMY.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T2_EMP_THD_SMY.SUB_PSTN_TYPE is '子考核类别代码';
Comment on Column IBS.T2_EMP_THD_SMY.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T2_EMP_THD_SMY.SIG_CNT     is '签约数';

--------------------------------------------------
-- Create Table IBS.T2_ENT_CST_DEP_LN_PROFIT
--------------------------------------------------
Create table IBS.T2_ENT_CST_DEP_LN_PROFIT (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_ENT_CST_DEP_LN_PROFIT is '员工业绩汇总（存款+贷款+公司类中收）';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.EMP_ID is '员工号';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.EMP_NM is '员工名';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.CST_ID is '客户号';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.CST_NM is '客户名';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.CCY_ID is '币种';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_BAL is '存款余额';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_MTD_AVG_BAL is '存款月日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_YTD_AVG_BAL is '存款年日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_Q_PROFIT is '存款季利润';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.DEP_Y_PROFIT is '存款年利润';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_BAL is '贷款余额贷款余额';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_MTD_AVG_BAL is '贷款月日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_YTD_AVG_BAL is '贷款年日均';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_Q_PROFIT is '贷款季利润';
Comment on Column IBS.T2_ENT_CST_DEP_LN_PROFIT.LN_Y_PROFIT is '贷款年利润';

--------------------------------------------------
-- Create Table IBS.T2_FNC_PD_BONUS_DETAIL
--------------------------------------------------
Create table IBS.T2_FNC_PD_BONUS_DETAIL (
    OFF_BST_AR_ID                  VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    CST_ID                         VARCHAR(32)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    FNC_PD_CD                      VARCHAR(10)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ,
    EFF_DT                         DATE                            ,
    INT_CLCN_EFF_DT                DATE                            ,
    MAT_DT                         DATE                            ,
    AR_LCS_TP_ID                   INTEGER                         ,
    AR_LCS_TP_NM                   VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    PRICE                          DECIMAL(10,6)                   ,
    OPN_AMT                        DECIMAL(20,3)                   ,
    EMP_AMT                        DECIMAL(20,3)                   ,
    RATIO                          INTEGER                         ,
    CLS_BAL                        DECIMAL(20,3)                   ,
    MTD_AVG_BAL                    DECIMAL(20,3)                   ,
    QTD_AVG_BAL                    DECIMAL(20,3)                   ,
    YTD_AVG_BAL                    DECIMAL(20,3)                   ,
    EMP_CLS_BAL                    DECIMAL(20,3)                   ,
    EMP_MTD_AVG_BAL                DECIMAL(20,3)                   ,
    EMP_QTD_AVG_BAL                DECIMAL(20,3)                   ,
    EMP_YTD_AVG_BAL                DECIMAL(20,3)                   ,
    BONUS                          DECIMAL(20,3)                   ,
    EMP_BONUS                      DECIMAL(20,3)                   ,
    BONUS_EFF_DT                   DATE                            ,
    BONUS_STATUS_NM                VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (OFF_BST_AR_ID,EMP_ID) Using Hashing;
Comment on Table IBS.T2_FNC_PD_BONUS_DETAIL is '理财产品奖金明细';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.OFF_BST_AR_ID is '理财表外账号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.VUCH_NBR is '表外账号归属凭证';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.CST_NM is '客户号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.BRANCH_ORG_ID is '理财归属分行号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.BRANCH_ORG_NM is '理财归属分行名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.ORG_ID is '理财归属机构号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.ORG_NM is '理财归属机构名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.FNC_PD_CD is '理财产品号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.FNC_PD_NM is '理财产品名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EFF_DT is '销售日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.INT_CLCN_EFF_DT is '上划日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.MAT_DT is '到期日';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.AR_LCS_TP_ID is '理财产品状态';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.AR_LCS_TP_NM is '理财产品状态名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.PRICE is '价格--行内收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.OPN_AMT is '理财销售金额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_AMT is '归属员工理财销售金额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.CLS_BAL is '理财余额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.MTD_AVG_BAL is '理财月日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.QTD_AVG_BAL is '理财季日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.YTD_AVG_BAL is '理财年日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_CLS_BAL is '归属员工的理财余额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_MTD_AVG_BAL is '归属员工的理财月日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_QTD_AVG_BAL is '归属员工的理财季日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_YTD_AVG_BAL is '归属员工的理财年日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.BONUS is '理财收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.EMP_BONUS is '理财收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.BONUS_EFF_DT is '理财收益生效日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL.BONUS_STATUS_NM is '理财收益状态-未计提;已计提';

--------------------------------------------------
-- Create Table IBS.T2_FNC_PD_BONUS_DETAIL_TMP
--------------------------------------------------
Create table IBS.T2_FNC_PD_BONUS_DETAIL_TMP (
    OFF_BST_AR_ID                  VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    VUCH_NBR                       VARCHAR(20)                     ,
    CST_ID                         VARCHAR(32)                     ,
    CST_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    FNC_PD_CD                      VARCHAR(20)                     ,
    FNC_PD_NM                      VARCHAR(64)                     ,
    EFF_DT                         DATE                            ,
    INT_CLCN_EFF_DT                DATE                            ,
    MAT_DT                         DATE                            ,
    AR_LCS_TP_ID                   INTEGER                         ,
    AR_LCS_TP_NM                   VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    PRICE                          DECIMAL(10,6)                   ,
    OPN_AMT                        DECIMAL(20,3)                   ,
    EMP_AMT                        DECIMAL(20,3)                   ,
    RATIO                          INTEGER                         ,
    CLS_BAL                        DECIMAL(20,3)                   ,
    MTD_AVG_BAL                    DECIMAL(20,3)                   ,
    QTD_AVG_BAL                    DECIMAL(20,3)                   ,
    YTD_AVG_BAL                    DECIMAL(20,3)                   ,
    EMP_CLS_BAL                    DECIMAL(20,3)                   ,
    EMP_MTD_AVG_BAL                DECIMAL(20,3)                   ,
    EMP_QTD_AVG_BAL                DECIMAL(20,3)                   ,
    EMP_YTD_AVG_BAL                DECIMAL(20,3)                   ,
    BONUS                          DECIMAL(20,3)                   ,
    EMP_BONUS                      DECIMAL(20,3)                   ,
    BONUS_EFF_DT                   DATE                            ,
    BONUS_STATUS_NM                VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (OFF_BST_AR_ID,EMP_ID) Using Hashing;
Comment on Table IBS.T2_FNC_PD_BONUS_DETAIL_TMP is '理财产品奖金明细临时表';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.OFF_BST_AR_ID is '理财表外账号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_ID is '员工号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_NM is '员工名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.VUCH_NBR is '表外账号归属凭证';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.CST_ID is '客户号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.CST_NM is '客户号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.BRANCH_ORG_ID is '理财归属分行号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.BRANCH_ORG_NM is '理财归属分行名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.ORG_ID is '理财归属机构号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.ORG_NM is '理财归属机构名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.FNC_PD_CD is '理财产品号';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.FNC_PD_NM is '理财产品名';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EFF_DT is '销售日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.INT_CLCN_EFF_DT is '上划日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.MAT_DT is '到期日';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.AR_LCS_TP_ID is '理财产品状态';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.AR_LCS_TP_NM is '理财产品状态名称';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.CCY_ID is '币种';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.PRICE is '价格--行内收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.OPN_AMT is '归属员工理财销售金额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.RATIO is '认领比例';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.CLS_BAL is '理财余额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.MTD_AVG_BAL is '理财月日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.QTD_AVG_BAL is '理财季日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.YTD_AVG_BAL is '理财年日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_CLS_BAL is '归属员工的理财余额';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_MTD_AVG_BAL is '归属员工的理财月日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_QTD_AVG_BAL is '归属员工的理财季日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_YTD_AVG_BAL is '归属员工的理财年日均';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.BONUS is '理财收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.EMP_BONUS is '理财收益';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.BONUS_EFF_DT is '理财收益生效日期';
Comment on Column IBS.T2_FNC_PD_BONUS_DETAIL_TMP.BONUS_STATUS_NM is '理财收益状态-未计提;已计提';

--------------------------------------------------
-- Create Table IBS.T2_IBS_CST_ASSET
--------------------------------------------------
Create table IBS.T2_IBS_CST_ASSET (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    FNC_BAL                        DECIMAL(18,2)                   ,
    FUND_BAL                       DECIMAL(18,2)                   ,
    INSUR_BAL                      DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (CST_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T2_IBS_CST_ASSET is '客户资产合计';
Comment on Column IBS.T2_IBS_CST_ASSET.CST_ID    is '客户号';
Comment on Column IBS.T2_IBS_CST_ASSET.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_IBS_CST_ASSET.CST_NM    is '客户名';
Comment on Column IBS.T2_IBS_CST_ASSET.CCY_ID    is '币种';
Comment on Column IBS.T2_IBS_CST_ASSET.DEP_BAL   is '客户存款余额';
Comment on Column IBS.T2_IBS_CST_ASSET.FNC_BAL   is '客户理财余额';
Comment on Column IBS.T2_IBS_CST_ASSET.FUND_BAL  is '客户基金余额';
Comment on Column IBS.T2_IBS_CST_ASSET.INSUR_BAL is '客户基金余额';

--------------------------------------------------
-- Create Table IBS.T2_INSUR_BONUS_DETAIL
--------------------------------------------------
Create table IBS.T2_INSUR_BONUS_DETAIL (
    INSUR_PRINT_ID                 VARCHAR(40)         NOT NULL    ,
    EMP_ID                         CHAR(6)             NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    TLR_OR_SALE                    CHAR(4)                         ,
    MEASURE_DT                     DATE                            ,
    TXN_DT                         DATE                            ,
    EFF_DT                         DATE                            ,
    EFF_F                          CHAR(1)                         ,
    CST_NM                         VARCHAR(100)                    ,
    INSUR_CORP_NM                  VARCHAR(64)                     ,
    INSUR_PROD_ID                  VARCHAR(20)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    INSUR_PREMIUM                  DECIMAL(18,2)                   ,
    PRICE                          DECIMAL(10,4)                   ,
    RATIO                          DECIMAL(10,4)                   ,
    BONUS                          DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (INSUR_PRINT_ID,EMP_ID) Using Hashing;
Comment on Table IBS.T2_INSUR_BONUS_DETAIL is '保险产品奖励明细';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.INSUR_PRINT_ID is '保单印刷号';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.TLR_OR_SALE is '柜员或销售员工';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.MEASURE_DT is '统计日期(考核日期)';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.TXN_DT is '销售日期';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.EFF_DT is '生效日期--过了犹豫期（销售日期+16天）';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.EFF_F is '保单状态：1-犹豫期内退保,null-犹豫期内没有退保';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.INSUR_CORP_NM is '保险公司名称';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.INSUR_PROD_ID is '保险产品编号';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.ORG_NM is '机构名称';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.BRANCH_ORG_NM is '分行机构名称';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.INSUR_PREMIUM is '保费';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.PRICE is '保险手续费率';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.RATIO is '认领比例：经办柜员20%;销售员工80%';
Comment on Column IBS.T2_INSUR_BONUS_DETAIL.BONUS is '收入(未乘提成比例)';

--------------------------------------------------
-- Create Table IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL
--------------------------------------------------
Create table IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL (
    BIZ_DIL_NBR                    VARCHAR(20)         NOT NULL    ,
    LOBBY_MANAGER                  VARCHAR(20)         NOT NULL    ,
    LOBBY_MANAGER_NM               VARCHAR(64)                     ,
    LOBBY_ORG_ID                   CHAR(4)                         ,
    LOBBY_ORG_NM                   VARCHAR(64)                     ,
    LOBBY_BRANCH_ORG_ID            CHAR(4)                         ,
    LOBBY_BRANCH_ORG_NM            VARCHAR(64)                     ,
    LOBBY_SUB_PSTN_TYPE_NM         VARCHAR(64)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CLAIM_DT                       DATE                            ,
    VERIFY_DT                      DATE                            ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    VUCH_ORG_ID                    CHAR(4)                         ,
    VUCH_ORG_NM                    VARCHAR(64)                     ,
    VUCH_BRANCH_ORG_ID             CHAR(4)                         ,
    VUCH_BRANCH_ORG_NM             VARCHAR(64)                     ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    LN_AMT                         DECIMAL(18,3)                   ,
    PRICE                          DECIMAL(18,2)                   ,
    RATIO                          DECIMAL(6,3)                    ,
    BONUS                          DECIMAL(18,3)                   ,
    BONUS_EFF_DT                   DATE                            ) 
in TS_IBS   
Partitioning Key (BIZ_DIL_NBR,LOBBY_MANAGER,EMP_ID) Using Hashing;
Comment on Table IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL is '大堂经理推荐贷款奖金明细';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BIZ_DIL_NBR is '借据号';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_MANAGER is '大堂经理员工号';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_MANAGER_NM is '大堂经理姓名';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_ORG_ID is '大堂经理归属机构';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_ORG_NM is '大堂经理归属机构名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_BRANCH_ORG_ID is '大堂经理归属分行';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_BRANCH_ORG_NM is '大堂经理归属分行名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LOBBY_SUB_PSTN_TYPE_NM is '大堂经理子考核类别名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.EMP_ID is '客户经理员工号';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.EMP_NM is '客户经理姓名';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.ORG_ID is '客户经理归属机构';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.ORG_NM is '客户经理归属机构名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BRANCH_ORG_ID is '客户经理归属分行';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BRANCH_ORG_NM is '客户经理归属分行名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.SUB_PSTN_TYPE_NM is '客户经理子考核类别名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.CLAIM_DT is '认领日期';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VERIFY_DT is '审批日期';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VUCH_ORG_ID is '凭证归属机构';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VUCH_ORG_NM is '凭证归属机构名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VUCH_BRANCH_ORG_ID is '凭证归属分行';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.VUCH_BRANCH_ORG_NM is '凭证归属分行名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.PROD_ID is '产品编号';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.PROD_NM is '产品名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.LN_AMT is '贷款金额';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.PRICE is '价格';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BONUS is '奖金';
Comment on Column IBS.T2_LN_LOBBY_MANAGER_BONUS_DETAIL.BONUS_EFF_DT is '奖金计提日期';

--------------------------------------------------
-- Create Table IBS.T2_OU_DFSLRY_SMY
--------------------------------------------------
Create table IBS.T2_OU_DFSLRY_SMY (
    MEASURE_DT                     DATE                NOT NULL    ,
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    DEP_LINE_NM                    VARCHAR(64)         NOT NULL    ,
    QTD_TXN_AMT                    DECIMAL(20,2)                   ,
    QTD_TXN_CNT                    INTEGER                         ,
    QTD_VUCH_CNT                   INTEGER                         ,
    QTD_ENT_CNT                    INTEGER                         ) 
in TS_PUB   
Partitioning Key (MEASURE_DT,ORG_ID,DEP_LINE_NM) Using Hashing;
Comment on Table IBS.T2_OU_DFSLRY_SMY is '代发工资机构汇总表';
Comment on Column IBS.T2_OU_DFSLRY_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_OU_DFSLRY_SMY.ORG_ID    is '机构号';
Comment on Column IBS.T2_OU_DFSLRY_SMY.ORG_NM    is '机构';
Comment on Column IBS.T2_OU_DFSLRY_SMY.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T2_OU_DFSLRY_SMY.BRANCH_ORG_NM is '分行';
Comment on Column IBS.T2_OU_DFSLRY_SMY.QTD_TXN_AMT is '本季金额';
Comment on Column IBS.T2_OU_DFSLRY_SMY.QTD_TXN_CNT is '本季笔数';
Comment on Column IBS.T2_OU_DFSLRY_SMY.QTD_VUCH_CNT is '本季账户数';
Comment on Column IBS.T2_OU_DFSLRY_SMY.QTD_ENT_CNT is '本季企业数';

--------------------------------------------------
-- Create Table IBS.T2_YBDB_INS_DETAIL
--------------------------------------------------
Create table IBS.T2_YBDB_INS_DETAIL (
    INSURE_NO                      VARCHAR(30)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    PRD_CD                         VARCHAR(20)                     ,
    PRD_NM                         VARCHAR(250)                    ,
    COM_CD                         VARCHAR(9)                      ,
    COM_NM                         VARCHAR(60)                     ,
    PAY_YEAR                       VARCHAR(10)                     ,
    PAY_TYPE_CH                    VARCHAR(64)                     ,
    ORG_ID                         VARCHAR(4)                      ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 VARCHAR(1)                      ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    TXN_AMT                        DECIMAL(20,2)                 With Default 0  ,
    MID_AMT                        DECIMAL(20,2)                 With Default 0  ,
    PER_FEE                        DECIMAL(20,2)                 With Default 0  ) 
in TS_IBS   
Partitioning Key (INSURE_NO,EMP_ID,MEASURE_DT) Using Hashing
Compress Yes;
Comment on Table IBS.T2_YBDB_INS_DETAIL is '保险保单交易明细';
Comment on Column IBS.T2_YBDB_INS_DETAIL.INSURE_NO is '保单号';
Comment on Column IBS.T2_YBDB_INS_DETAIL.EMP_ID  is '员工号';
Comment on Column IBS.T2_YBDB_INS_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T2_YBDB_INS_DETAIL.CST_ID  is '客户号';
Comment on Column IBS.T2_YBDB_INS_DETAIL.CST_NM  is '客户名';
Comment on Column IBS.T2_YBDB_INS_DETAIL.EMP_NM  is '员工名';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T2_YBDB_INS_DETAIL.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PRD_CD  is '产品代码';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PRD_NM  is '产品名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.COM_CD  is '公司代码';
Comment on Column IBS.T2_YBDB_INS_DETAIL.COM_NM  is '公司名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PAY_YEAR is '缴费年限';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PAY_TYPE_CH is '缴费方式名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.ORG_ID  is '机构号';
Comment on Column IBS.T2_YBDB_INS_DETAIL.ORG_NM  is '机构名';
Comment on Column IBS.T2_YBDB_INS_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T2_YBDB_INS_DETAIL.VUCH_STATUS_ID is '保单状态代码';
Comment on Column IBS.T2_YBDB_INS_DETAIL.VUCH_STATUS_NM is '保单状态名称';
Comment on Column IBS.T2_YBDB_INS_DETAIL.RATIO   is '认领比例';
Comment on Column IBS.T2_YBDB_INS_DETAIL.TXN_AMT is '交易金额';
Comment on Column IBS.T2_YBDB_INS_DETAIL.MID_AMT is '中收金额';
Comment on Column IBS.T2_YBDB_INS_DETAIL.PER_FEE is '人力费';

--------------------------------------------------
-- Create Table IBS.T3_BANUS_SHARE_RATIO
--------------------------------------------------
Create table IBS.T3_BANUS_SHARE_RATIO (
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    RECOMMEND_RATIO                INTEGER                         ,
    SALES_RATIO                    INTEGER                         ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (BONUS_TYPE_ID,CHANNLE_ID,EFF_FLAG) Using Hashing;
Comment on Table IBS.T3_BANUS_SHARE_RATIO is '分润比例表';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.RECOMMEND_RATIO is '推荐人比例';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.SALES_RATIO is '销售人比例';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_BANUS_SHARE_RATIO.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T3_COMMISSION_RATIO
--------------------------------------------------
Create table IBS.T3_COMMISSION_RATIO (
    YEAR                           CHAR(4)             NOT NULL    ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    PSTN_TYPE                      CHAR(4)             NOT NULL    ,
    SUB_PSTN_TYPE                  CHAR(4)             NOT NULL    ,
    COMMISSION                     DECIMAL(18,10)                  ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    REMARK                         VARCHAR(5000)                   ) 
in TS_IBS   
Partitioning Key (YEAR,BRANCH_ORG_ID,PSTN_TYPE,SUB_PSTN_TYPE) Using Hashing;
Comment on Table IBS.T3_COMMISSION_RATIO is '提成比例表';
Comment on Column IBS.T3_COMMISSION_RATIO.YEAR   is '年度';
Comment on Column IBS.T3_COMMISSION_RATIO.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_COMMISSION_RATIO.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T3_COMMISSION_RATIO.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T3_COMMISSION_RATIO.COMMISSION is '提成比例';
Comment on Column IBS.T3_COMMISSION_RATIO.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_COMMISSION_RATIO.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_COMMISSION_RATIO.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_COMMISSION_RATIO.MODIFY_IP is '修改IP';
Comment on Column IBS.T3_COMMISSION_RATIO.REMARK is '备注';

--------------------------------------------------
-- Create Table IBS.T3_CREDIT_CARD_PRICE
--------------------------------------------------
Create table IBS.T3_CREDIT_CARD_PRICE (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    NEW_CARD_PRICE                 DECIMAL(18,10)                  ,
    OLD_CARD_PRICE                 DECIMAL(18,10)                  ,
    EFF_FLAG                       CHAR(1)                         ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_REP   
Partitioning Key (BRANCH_ORG_ID) Using Hashing;
Comment on Table IBS.T3_CREDIT_CARD_PRICE is '信用卡价格表';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.NEW_CARD_PRICE is '新卡价格';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.OLD_CARD_PRICE is '旧卡价格';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_CREDIT_CARD_PRICE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T3_FNC_PRICE
--------------------------------------------------
Create table IBS.T3_FNC_PRICE (
    EFF_DT                         DATE                NOT NULL    ,
    PRICE                          DECIMAL(8,6)                    ,
    EFF_F                          CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (EFF_DT) Using Hashing;
Comment on Table IBS.T3_FNC_PRICE is '当前员工员工表';
Comment on Column IBS.T3_FNC_PRICE.EFF_DT        is '生效日期';
Comment on Column IBS.T3_FNC_PRICE.PRICE         is '理财产品我行收益率';
Comment on Column IBS.T3_FNC_PRICE.EFF_F         is '记录生效标志（生效的记录只能有一条）：1-生效；0-失效';

--------------------------------------------------
-- Create Table IBS.T3_FNC_PROD_PRICE
--------------------------------------------------
Create table IBS.T3_FNC_PROD_PRICE (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    TERM_INTERVAL_TYPE_ID          CHAR(2)             NOT NULL    ,
    AMT_INTERVAL_TYPE_ID           CHAR(2)             NOT NULL    ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)                  ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (BRANCH_ORG_ID,CHANNLE_ID,TERM_INTERVAL_TYPE_ID,AMT_INTERVAL_TYPE_ID,EFF_FLAG) Using Hashing;
Comment on Table IBS.T3_FNC_PROD_PRICE is '理财价格表';
Comment on Column IBS.T3_FNC_PROD_PRICE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_FNC_PROD_PRICE.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T3_FNC_PROD_PRICE.TERM_INTERVAL_TYPE_ID is '期限区间代码';
Comment on Column IBS.T3_FNC_PROD_PRICE.AMT_INTERVAL_TYPE_ID is '金额区间代码';
Comment on Column IBS.T3_FNC_PROD_PRICE.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_FNC_PROD_PRICE.PRICE    is '价格';
Comment on Column IBS.T3_FNC_PROD_PRICE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_FNC_PROD_PRICE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_FNC_PROD_PRICE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T3_INSUR_PROD_PRICE
--------------------------------------------------
Create table IBS.T3_INSUR_PROD_PRICE (
    INSUR_PROD_ID                  VARCHAR(20)         NOT NULL    ,
    INSUR_PROD_NM                  VARCHAR(64)                     ,
    INSUR_CORP_ID                  VARCHAR(20)                     ,
    INSUR_CORP_NM                  VARCHAR(64)                     ,
    PAY_TYPE_ID                    CHAR(4)             NOT NULL    ,
    PAY_PERIOD                     CHAR(4)             NOT NULL    ,
    PRICE                          DECIMAL(10,4)                   ) 
in TS_IBS   
Partitioning Key (INSUR_PROD_ID,PAY_TYPE_ID,PAY_PERIOD) Using Hashing;
Comment on Table IBS.T3_INSUR_PROD_PRICE is '保险产品手续费率';
Comment on Column IBS.T3_INSUR_PROD_PRICE.INSUR_PROD_ID is '保险产品编号';
Comment on Column IBS.T3_INSUR_PROD_PRICE.INSUR_PROD_NM is '保险产品名称';
Comment on Column IBS.T3_INSUR_PROD_PRICE.INSUR_CORP_ID is '保险公司编号';
Comment on Column IBS.T3_INSUR_PROD_PRICE.INSUR_CORP_NM is '保险公司名称';
Comment on Column IBS.T3_INSUR_PROD_PRICE.PAY_TYPE_ID is '交费类型：5-趸交;1-期交';
Comment on Column IBS.T3_INSUR_PROD_PRICE.PAY_PERIOD is '交费年期';
Comment on Column IBS.T3_INSUR_PROD_PRICE.PRICE  is '手续费率';

--------------------------------------------------
-- Create Table IBS.T3_PER_FNC_QUAL
--------------------------------------------------
Create table IBS.T3_PER_FNC_QUAL (
    PER_ID                         VARCHAR(20)         NOT NULL    ,
    PER_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    PER_IDENT                      CHAR(18)                        ,
    PER_POSTITION_NAME             VARCHAR(64)                     ,
    QUAL_BANK_PUB_NUMBER           VARCHAR(64)                     ,
    QUAL_BANK_OLD_FNC_NUMBER       VARCHAR(64)                     ,
    QUAL_BANK_NEW_FNC_NUMBER       VARCHAR(64)                     ,
    QUAL_AFP_NUMBER                VARCHAR(64)                     ,
    QUAL_CFP_NUMBER                VARCHAR(64)                     ,
    REMARK                         VARCHAR(1024)                   ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (PER_ID) Using Hashing;
Comment on Table IBS.T3_PER_FNC_QUAL is '员工理财资格统计';
Comment on Column IBS.T3_PER_FNC_QUAL.PER_ID     is '员工号';
Comment on Column IBS.T3_PER_FNC_QUAL.PER_NM     is '员工姓名';
Comment on Column IBS.T3_PER_FNC_QUAL.ORG_ID     is '机构号';
Comment on Column IBS.T3_PER_FNC_QUAL.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_PER_FNC_QUAL.PER_IDENT  is '身份证号';
Comment on Column IBS.T3_PER_FNC_QUAL.PER_POSTITION_NAME is '岗位';
Comment on Column IBS.T3_PER_FNC_QUAL.QUAL_BANK_PUB_NUMBER is '公共基础证书号';
Comment on Column IBS.T3_PER_FNC_QUAL.QUAL_BANK_OLD_FNC_NUMBER is '旧个人理财证书号';
Comment on Column IBS.T3_PER_FNC_QUAL.QUAL_BANK_NEW_FNC_NUMBER is '新个人理财证书号';
Comment on Column IBS.T3_PER_FNC_QUAL.QUAL_AFP_NUMBER is 'AFP证书号';
Comment on Column IBS.T3_PER_FNC_QUAL.QUAL_CFP_NUMBER is 'CFP证书号';
Comment on Column IBS.T3_PER_FNC_QUAL.REMARK     is '备注';
Comment on Column IBS.T3_PER_FNC_QUAL.MODIFY_PEOPLE is '填写人';
Comment on Column IBS.T3_PER_FNC_QUAL.MODIFY_TIME is '填写时间';
Comment on Column IBS.T3_PER_FNC_QUAL.MODIFY_IP  is '填写IP';

--------------------------------------------------
-- Create Table IBS.T3_PERSONAL_LN_PRICE
--------------------------------------------------
Create table IBS.T3_PERSONAL_LN_PRICE (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    PROD_ID                        CHAR(10)            NOT NULL    ,
    AMT_INTERVAL_TYPE_ID           CHAR(2)             NOT NULL    ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)                  ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (BRANCH_ORG_ID) Using Hashing;
Comment on Table IBS.T3_PERSONAL_LN_PRICE is '个人贷款价格表(大堂经理)';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.PROD_ID is '产品编号';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.AMT_INTERVAL_TYPE_ID is '金额区间代码';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.PRICE is '价格';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_PERSONAL_LN_PRICE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_EMP_SMY
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_EMP_SMY (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_EMP_SMY is '资源型客户经理(未正式入职)业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.EMP_NM is '姓名';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.M_PROFIT is '月利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY.KHQ_ED_DT is '考核期结束日期';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK is '备份表to20201130资源型客户经理(未正式入职)业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.EMP_NM is '姓名';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY_BAK.M_PROFIT is '月利润';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120 is '由于要修改员工100135的考核基期先备份 资源型客户经理(未正式入职)业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.EMP_NM is '姓名';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20210120.M_PROFIT is '月利润';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011 is '资源型客户经理(未正式入职)业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.EMP_NM is '姓名';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.M_PROFIT is '月利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_EMP_SMY20211011.KHQ_ED_DT is '考核期结束日期';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_SMY
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_SMY (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID_OLD                     VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    POSITION_NM                    VARCHAR(64)                     ,
    ASSESSMENT                     DECIMAL(18,2)                   ,
    DAY_DEP_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT                 DECIMAL(18,2)                   ,
    LN_BAL                         DECIMAL(18,2)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,2)                   ,
    LN_QTD_PROFIT                  DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL_INCREASE       DECIMAL(18,2)                   ,
    ASSESSMENT_INCREASE            DECIMAL(18,2)                   ,
    TOTAL_PROFIT                   DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT_SJ              DECIMAL(18,2)                 With Default 0  ,
    LN_QTD_PROFIT_SJ               DECIMAL(18,2)                 With Default 0  ,
    LN_QTD_PROFIT_SJ_ADD           DECIMAL(18,2)                 With Default 0  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_SMY is '资源类客户经理业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.EMP_ID_OLD is '转正前员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.BRANCH_ORG_NM is '分行名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.POSITION_NM is '岗位';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.ASSESSMENT is '考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DAY_DEP_AVG_BAL is '考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DEP_BAL is '存款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DEP_QTD_PROFIT is '存款季模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.LN_BAL is '贷款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.LN_QTD_PROFIT is '贷款模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DEP_QTD_AVG_BAL_INCREASE is '日均新增=存款季日均-考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.ASSESSMENT_INCREASE is '日均新增较考核标准=日均新增-考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.TOTAL_PROFIT is '季实际利润(20191025不用了)';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.DEP_QTD_PROFIT_SJ is '存款季实际利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.LN_QTD_PROFIT_SJ is '贷款季实际利润 存量';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY.LN_QTD_PROFIT_SJ_ADD is '贷款季实际利润 新增';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_SMY_TMP
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_SMY_TMP (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID_OLD                     VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    POSITION_NM                    VARCHAR(64)                     ,
    ASSESSMENT                     DECIMAL(18,2)                   ,
    DAY_DEP_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT                 DECIMAL(18,2)                   ,
    LN_BAL                         DECIMAL(18,2)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,2)                   ,
    LN_QTD_PROFIT                  DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL_INCREASE       DECIMAL(18,2)                   ,
    ASSESSMENT_INCREASE            DECIMAL(18,2)                   ,
    TOTAL_PROFIT                   DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT_SJ              DECIMAL(18,2)                 With Default 0  ,
    LN_QTD_PROFIT_SJ               DECIMAL(18,2)                 With Default 0  ,
    LN_QTD_PROFIT_SJ_ADD           DECIMAL(18,2)                 With Default 0  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_SMY_TMP is '资源类客户经理业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.EMP_ID_OLD is '转正前员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.BRANCH_ORG_NM is '分行名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.POSITION_NM is '岗位';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.ASSESSMENT is '考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DAY_DEP_AVG_BAL is '考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DEP_BAL is '存款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DEP_QTD_PROFIT is '存款季模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.LN_BAL is '贷款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.LN_QTD_PROFIT is '贷款模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DEP_QTD_AVG_BAL_INCREASE is '日均新增=存款季日均-考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.ASSESSMENT_INCREASE is '日均新增较考核标准=日均新增-考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.TOTAL_PROFIT is '季实际利润(20191025不用了)';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.DEP_QTD_PROFIT_SJ is '存款季实际利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.LN_QTD_PROFIT_SJ is '贷款季实际利润 存量';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY_TMP.LN_QTD_PROFIT_SJ_ADD is '贷款季实际利润 新增';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_SMY20211203
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_SMY20211203 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID_OLD                     VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    POSITION_NM                    VARCHAR(64)                     ,
    ASSESSMENT                     DECIMAL(18,2)                   ,
    DAY_DEP_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT                 DECIMAL(18,2)                   ,
    LN_BAL                         DECIMAL(18,2)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,2)                   ,
    LN_QTD_PROFIT                  DECIMAL(18,2)                   ,
    DEP_QTD_AVG_BAL_INCREASE       DECIMAL(18,2)                   ,
    ASSESSMENT_INCREASE            DECIMAL(18,2)                   ,
    TOTAL_PROFIT                   DECIMAL(18,2)                   ,
    DEP_QTD_PROFIT_SJ              DECIMAL(18,2)                 With Default 0  ,
    LN_QTD_PROFIT_SJ               DECIMAL(18,2)                 With Default 0  ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_SMY20211203 is '备份20210930以后的数据资源类客户经理业绩汇总表';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.EMP_ID_OLD is '转正前员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.BRANCH_ORG_ID is '分行号';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.BRANCH_ORG_NM is '分行名';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.PSTN_TYPE_NM is '主考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.SUB_PSTN_TYPE_NM is '子考核类别';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.POSITION_NM is '岗位';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.ASSESSMENT is '考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DAY_DEP_AVG_BAL is '考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DEP_BAL is '存款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DEP_QTD_AVG_BAL is '存款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DEP_QTD_PROFIT is '存款季模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.LN_BAL is '贷款余额';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.LN_QTD_AVG_BAL is '贷款季日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.LN_QTD_PROFIT is '贷款模拟利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DEP_QTD_AVG_BAL_INCREASE is '日均新增=存款季日均-考核基期存量日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.ASSESSMENT_INCREASE is '日均新增较考核标准=日均新增-考核标准';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.TOTAL_PROFIT is '季实际利润(20191025不用了)';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.DEP_QTD_PROFIT_SJ is '存款季实际利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_SMY20211203.LN_QTD_PROFIT_SJ is '贷款季实际利润';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL is '资源型客户经理凭证明细（未正式入职）';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.VUCH_NBR is '凭证号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.CST_ID is '客户号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.RATIO is '认领比例';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.M_PROFIT is '月利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL.KHQ_ED_DT is '考核期结束日期';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK is '备份表to20201130 资源型客户经理凭证明细（未正式入职）';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.VUCH_NBR is '凭证号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.CST_ID is '客户号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.CST_NM is '客户名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.OPEN_DT is '开户日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.RATIO is '认领比例';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_BAK.M_PROFIT is '月利润';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP is '资源型客户经理凭证明细（未正式入职）';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.VUCH_NBR is '凭证号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.CST_ID is '客户号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.CST_NM is '客户名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.OPEN_DT is '开户日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.RATIO is '认领比例';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.M_PROFIT is '月利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP.KHQ_ED_DT is '考核期结束日期';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013 is '资源型客户经理凭证明细（未正式入职）';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.VUCH_NBR is '凭证号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.CST_ID is '客户号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.CST_NM is '客户名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.OPEN_DT is '开户日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.RATIO is '认领比例';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.M_PROFIT is '月利润';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL_TMP20211013.KHQ_ED_DT is '考核期结束日期';

--------------------------------------------------
-- Create Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120
--------------------------------------------------
Create table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120 (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RATIO                          DECIMAL(6,3)                    ,
    CCY_ID                         INTEGER                         ,
    CL_KHJQ_AVG_BAL                DECIMAL(18,3)                   ,
    CL_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    XZ_MTH_AVG_BAL                 DECIMAL(18,3)                   ,
    M_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (VUCH_NBR,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120 is '由于要修改员工100135的考核基期先备份 资源型客户经理凭证明细（未正式入职）';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.VUCH_NBR is '凭证号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.EMP_ID is '员工号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.MEASURE_DT is '统计日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.CST_ID is '客户号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.CST_NM is '客户名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.EMP_NM is '员工名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.VUCH_TYPE_ID is '凭证类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.VUCH_TYPE_NM is '凭证类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.BIZ_TYPE_ID is '业务类型代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.BIZ_TYPE_NM is '业务类型名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.ORG_ID is '机构号';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.ORG_NM is '机构名';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.OPEN_DT is '开户日期';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.VUCH_STATUS_ID is '凭证状态代码';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.RATIO is '认领比例';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.CCY_ID is '币种';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.CL_KHJQ_AVG_BAL is '存量客户考核基期日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.CL_MTH_AVG_BAL is '存量客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.XZ_MTH_AVG_BAL is '新增客户月日均';
Comment on Column IBS.T3_RESOURCE_MANAGER_VUCH_DETAIL20210120.M_PROFIT is '月利润';

--------------------------------------------------
-- Create Table IBS.T3_SIGN_PROD_PRICE
--------------------------------------------------
Create table IBS.T3_SIGN_PROD_PRICE (
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)                  ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (BONUS_TYPE_ID,BRANCH_ORG_ID,EFF_FLAG) Using Hashing;
Comment on Table IBS.T3_SIGN_PROD_PRICE is '签约价格表';
Comment on Column IBS.T3_SIGN_PROD_PRICE.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T3_SIGN_PROD_PRICE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_SIGN_PROD_PRICE.PRICE   is '价格';
Comment on Column IBS.T3_SIGN_PROD_PRICE.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_SIGN_PROD_PRICE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_SIGN_PROD_PRICE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_SIGN_PROD_PRICE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE
--------------------------------------------------
Create table IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    PROD_ID                        CHAR(10)            NOT NULL    ,
    EFF_FLAG                       CHAR(1)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)                  ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (PROD_ID) Using Hashing;
Comment on Table IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE is '小企业贷款价格表(大堂经理)';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.PROD_ID is '产品编号';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.EFF_FLAG is '生效标志';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.PRICE is '价格';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T3_SMALL_BUSINESS_LN_PROD_PRICE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T4_BANUS_SHARE_RATIO_H
--------------------------------------------------
Create table IBS.T4_BANUS_SHARE_RATIO_H (
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    RECOMMEND_RATIO                INTEGER             NOT NULL    ,
    SALES_RATIO                    INTEGER             NOT NULL    ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (BONUS_TYPE_ID,CHANNLE_ID,RECOMMEND_RATIO,SALES_RATIO,START_DT) Using Hashing;
Comment on Table IBS.T4_BANUS_SHARE_RATIO_H is '分润比例历史';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.RECOMMEND_RATIO is '推荐人比例';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.SALES_RATIO is '销售人比例';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.START_DT is '开始日期';
Comment on Column IBS.T4_BANUS_SHARE_RATIO_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T4_CREDIT_CARD_PRICE_H
--------------------------------------------------
Create table IBS.T4_CREDIT_CARD_PRICE_H (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    NEW_CARD_PRICE                 DECIMAL(18,10)      NOT NULL    ,
    OLD_CARD_PRICE                 DECIMAL(18,10)      NOT NULL    ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (BRANCH_ORG_ID,NEW_CARD_PRICE,OLD_CARD_PRICE,START_DT) Using Hashing;
Comment on Table IBS.T4_CREDIT_CARD_PRICE_H is '信用卡价格历史';
Comment on Column IBS.T4_CREDIT_CARD_PRICE_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_CREDIT_CARD_PRICE_H.NEW_CARD_PRICE is '新卡价格';
Comment on Column IBS.T4_CREDIT_CARD_PRICE_H.OLD_CARD_PRICE is '旧卡价格';
Comment on Column IBS.T4_CREDIT_CARD_PRICE_H.START_DT is '开始日期';
Comment on Column IBS.T4_CREDIT_CARD_PRICE_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T4_FNC_PROD_PRICE_H
--------------------------------------------------
Create table IBS.T4_FNC_PROD_PRICE_H (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    TERM_INTERVAL_TYPE_ID          CHAR(2)             NOT NULL    ,
    AMT_INTERVAL_TYPE_ID           CHAR(2)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)      NOT NULL    ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (BRANCH_ORG_ID,CHANNLE_ID,TERM_INTERVAL_TYPE_ID,AMT_INTERVAL_TYPE_ID,PRICE,START_DT) Using Hashing;
Comment on Table IBS.T4_FNC_PROD_PRICE_H is '理财价格历史';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.TERM_INTERVAL_TYPE_ID is '期限区间代码';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.AMT_INTERVAL_TYPE_ID is '金额区间代码';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.PRICE  is '价格';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.START_DT is '开始日期';
Comment on Column IBS.T4_FNC_PROD_PRICE_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T4_PERSONAL_LN_PRICE_H
--------------------------------------------------
Create table IBS.T4_PERSONAL_LN_PRICE_H (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    PROD_ID                        CHAR(10)            NOT NULL    ,
    AMT_INTERVAL_TYPE_ID           CHAR(2)             NOT NULL    ,
    PRICE                          DECIMAL(18,10)      NOT NULL    ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (BRANCH_ORG_ID) Using Hashing;
Comment on Table IBS.T4_PERSONAL_LN_PRICE_H is '个人贷款价格历史(大堂经理)';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.PROD_ID is '产品编号';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.AMT_INTERVAL_TYPE_ID is '金额区间代码';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.PRICE is '价格';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.START_DT is '开始日期';
Comment on Column IBS.T4_PERSONAL_LN_PRICE_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T4_SIGN_PROD_PRICE_H
--------------------------------------------------
Create table IBS.T4_SIGN_PROD_PRICE_H (
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    PRICE                          DECIMAL(18,2)       NOT NULL    ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_REP   
Partitioning Key (BONUS_TYPE_ID) Using Hashing;
Comment on Table IBS.T4_SIGN_PROD_PRICE_H is '签约价格历史';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.CHANNLE_ID is '渠道号';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.PRICE is '价格';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.START_DT is '开始日期';
Comment on Column IBS.T4_SIGN_PROD_PRICE_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H
--------------------------------------------------
Create table IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H (
    BRANCH_ORG_ID                  CHAR(4)             NOT NULL    ,
    PROD_ID                        CHAR(10)            NOT NULL    ,
    PRICE                          DECIMAL(18,10)                  ,
    START_DT                       DATE                NOT NULL    ,
    END_DT                         DATE                            ) 
in TS_IBS   
Partitioning Key (PROD_ID) Using Hashing;
Comment on Table IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H is '小企业贷款价格历史(大堂经理)';
Comment on Column IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H.PROD_ID is '产品编号';
Comment on Column IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H.PRICE is '价格';
Comment on Column IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H.START_DT is '开始日期';
Comment on Column IBS.T4_SMALL_BUSINESS_LN_PROD_PRICE_H.END_DT is '结束日期';

--------------------------------------------------
-- Create Table IBS.T5_EMP
--------------------------------------------------
Create table IBS.T5_EMP (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_TYPE_ID                    CHAR(2)                         ,
    EMP_NM                         VARCHAR(64)                     ,
    GENDER                         CHAR(2)                         ,
    BIRTHDAY                       DATE                            ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    MOBILE                         CHAR(20)                        ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    HR_ORG_NAME                    VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP is '当前员工员工表';
Comment on Column IBS.T5_EMP.EMP_ID              is '员工号';
Comment on Column IBS.T5_EMP.EMP_TYPE_ID         is '员工类型代码';
Comment on Column IBS.T5_EMP.EMP_NM              is '员工名';
Comment on Column IBS.T5_EMP.GENDER              is '性别';
Comment on Column IBS.T5_EMP.BIRTHDAY            is '生日';
Comment on Column IBS.T5_EMP.ORG_ID              is '机构号';
Comment on Column IBS.T5_EMP.ORG_NM              is '机构名';
Comment on Column IBS.T5_EMP.BRANCH_ORG_ID       is '分行机构号';
Comment on Column IBS.T5_EMP.BRANCH_ORG_NM       is '分行机构名';
Comment on Column IBS.T5_EMP.POSITION_ID         is '岗位代码';
Comment on Column IBS.T5_EMP.POSITION_NM         is '岗位名称';
Comment on Column IBS.T5_EMP.MOBILE              is '手机号';
Comment on Column IBS.T5_EMP.PSTN_TYPE           is '主考核类别';
Comment on Column IBS.T5_EMP.PSTN_TYPE_NM        is '主考核类别名称';
Comment on Column IBS.T5_EMP.SUB_PSTN_TYPE       is '子考核类别';
Comment on Column IBS.T5_EMP.SUB_PSTN_TYPE_NM    is '子考核类别名称';

--------------------------------------------------
-- Create Table IBS.T5_EMP_ASSESSMENT_Q
--------------------------------------------------
Create table IBS.T5_EMP_ASSESSMENT_Q (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID_OLD                     VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    ASSESSMENT                     DECIMAL(18,2)                   ,
    DAY_DEP_AVG_BAL                DECIMAL(18,2)                   ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_ASSESSMENT_Q is '资源型客户经理季度考核参数';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.EMP_ID_OLD is '转正前员工号';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.ASSESSMENT is '考核标准';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.DAY_DEP_AVG_BAL is '考核基期存量日均';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_EMP_ASSESSMENT_Q.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T5_EMP_BZJX
--------------------------------------------------
Create table IBS.T5_EMP_BZJX (
    MEASURE_DT                     DATE                NOT NULL    ,
    EXAM_YEAR                      VARCHAR(4)                      ,
    EXAM_Q                         VARCHAR(2)                      ,
    EMP_TYPE                       VARCHAR(32)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         VARCHAR(4)                      ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  VARCHAR(4)                      ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BZJX                           DECIMAL(20,2)                 With Default 0  ,
    HEAD_ORG_ID                    VARCHAR(4)                      ,
    HEAD_ORG_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    EXS_XZ                         DECIMAL(20,2)                 With Default 0  ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    VERIFY_PEOPLE                  CHAR(6)                         ,
    VERIFY_TIME                    TIMESTAMP                       ,
    VERIFY_IP                      CHAR(15)                        ,
    VERIFY_REMARK                  VARCHAR(256)                    ,
    STUS                           VARCHAR(2)          NOT NULL  With Default '0'  ,
    IS_EXAM                        VARCHAR(2)                      ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_BZJX is '员工季度标准绩效薪酬';
Comment on Column IBS.T5_EMP_BZJX.MEASURE_DT     is '日期';
Comment on Column IBS.T5_EMP_BZJX.EXAM_YEAR      is '考核年';
Comment on Column IBS.T5_EMP_BZJX.EXAM_Q         is '季度';
Comment on Column IBS.T5_EMP_BZJX.EMP_TYPE       is '岗位状态';
Comment on Column IBS.T5_EMP_BZJX.EMP_ID         is '员工号';
Comment on Column IBS.T5_EMP_BZJX.EMP_NM         is '姓名';
Comment on Column IBS.T5_EMP_BZJX.ORG_ID         is '支行cd';
Comment on Column IBS.T5_EMP_BZJX.ORG_NM         is '支行名称';
Comment on Column IBS.T5_EMP_BZJX.BRANCH_ORG_ID  is '分行cd';
Comment on Column IBS.T5_EMP_BZJX.BRANCH_ORG_NM  is '分行名称';
Comment on Column IBS.T5_EMP_BZJX.BZJX           is '季度标准绩效薪酬';
Comment on Column IBS.T5_EMP_BZJX.HEAD_ORG_ID    is '总行机构';
Comment on Column IBS.T5_EMP_BZJX.HEAD_ORG_NM    is '总行名称';
Comment on Column IBS.T5_EMP_BZJX.PSTN_TYPE      is '主考核类别';
Comment on Column IBS.T5_EMP_BZJX.PSTN_TYPE_NM   is '主考核类别名称';
Comment on Column IBS.T5_EMP_BZJX.SUB_PSTN_TYPE  is '子考核类别';
Comment on Column IBS.T5_EMP_BZJX.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_BZJX.EXS_XZ         is '存量维护薪酬';
Comment on Column IBS.T5_EMP_BZJX.MODIFY_PEOPLE  is '存量维护薪酬修改人';
Comment on Column IBS.T5_EMP_BZJX.MODIFY_TIME    is '存量维护薪酬修改时间';
Comment on Column IBS.T5_EMP_BZJX.MODIFY_IP      is '存量维护薪酬修改IP';
Comment on Column IBS.T5_EMP_BZJX.VERIFY_PEOPLE  is '存量维护薪酬审核人';
Comment on Column IBS.T5_EMP_BZJX.VERIFY_TIME    is '存量维护薪酬审核时间';
Comment on Column IBS.T5_EMP_BZJX.VERIFY_IP      is '存量维护薪酬审核人IP';
Comment on Column IBS.T5_EMP_BZJX.VERIFY_REMARK  is '存量维护薪酬审核备注';
Comment on Column IBS.T5_EMP_BZJX.STUS           is '状态0保存1提交2审核不通3审核通过';
Comment on Column IBS.T5_EMP_BZJX.IS_EXAM        is '是否参加考核：1是0否';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE.EMP_ID  is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE.EMP_NM  is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE.ORG_ID  is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE.ORG_NM  is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE.YEAR    is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE.GRADE   is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20211022
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20211022 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20211022 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211022.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20211122
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20211122 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20211122 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211122.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20211228
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20211228 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20211228 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20211228.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20220822
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20220822 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20220822 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20220822.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20230601
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20230601 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20230601 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20230601.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20231228
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20231228 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20231228 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20231228.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20240220
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20240220 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20240220 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240220.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20240513
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20240513 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20240513 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240513.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_20240919
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_20240919 (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_20240919 is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_20240919.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_CERTIFICATE_BAK
--------------------------------------------------
Create table IBS.T5_EMP_CERTIFICATE_BAK (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_CERTIFICATE_BAK is '客户经理上岗资格持证标示表';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.YEAR is '取得资格证年份';
Comment on Column IBS.T5_EMP_CERTIFICATE_BAK.GRADE is '取得资格证等级';

--------------------------------------------------
-- Create Table IBS.T5_EMP_GDQ_OR_GZ
--------------------------------------------------
Create table IBS.T5_EMP_GDQ_OR_GZ (
    EXAM_YEAR                      VARCHAR(4)          NOT NULL    ,
    EXAM_Q                         VARCHAR(2)          NOT NULL    ,
    EMP_TYPE                       VARCHAR(32)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_DT                    DATE                            ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    STATUS                         VARCHAR(32)                     ,
    GDQ_STDT                       DATE                            ,
    GDQ_ENDDT                      DATE                            ,
    CERT_GRADE                     VARCHAR(4)                      ,
    DX_SCORE                       DECIMAL(20,2)                   ,
    SJ_BZ_JX                       DECIMAL(20,2)                   ,
    YF_JX                          DECIMAL(20,2)                   ,
    IS_EXAM                        VARCHAR(2)                      ,
    REMARK                         VARCHAR(500)                    ,
    MODIFY_PEOPLE                  VARCHAR(32)                     ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      VARCHAR(32)                     ,
    DEL_FLAG                       INTEGER             NOT NULL    ,
    VERIFY_PEOPLE                  VARCHAR(32)                     ,
    VERIFY_TIME                    TIMESTAMP                       ,
    VERIFY_IP                      VARCHAR(32)                     ,
    MEASURE_DT                     VARCHAR(10)                     ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_GDQ_OR_GZ is '过渡期/借调挂职名单';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.EXAM_YEAR is '考核年';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.EXAM_Q    is '考核季度';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.EMP_TYPE  is '员工类型：过渡期/借调挂职人员';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.EMP_ID    is '员工号';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.EMP_NM    is '员工名';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.ORG_ID    is '机构号';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.ORG_NM    is '机构名';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.POSITION_DT is '岗位开始日期';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.STATUS    is '状态：0保存1提交2审核未通过3审核通过';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.GDQ_STDT  is '过渡期：开始日期';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.GDQ_ENDDT is '过渡期：结束日期';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.CERT_GRADE is '资格证';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.DX_SCORE  is '定性打分';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.SJ_BZ_JX  is '实际季度标准绩效薪酬';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.YF_JX     is '应发季度绩效薪酬';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.IS_EXAM   is '是否参加考核：1是0否';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.REMARK    is '备注';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.MODIFY_IP is '修改人IP';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.DEL_FLAG  is '删除标识：1删除';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.VERIFY_PEOPLE is '审核人';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.VERIFY_TIME is '审核时间';
Comment on Column IBS.T5_EMP_GDQ_OR_GZ.VERIFY_IP is '审核人IP';

--------------------------------------------------
-- Create Table IBS.T5_EMP_Q
--------------------------------------------------
Create table IBS.T5_EMP_Q (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_TYPE_ID                    CHAR(2)                         ,
    EMP_NM                         VARCHAR(64)                     ,
    GENDER                         VARCHAR(10)                     ,
    BIRTHDAY                       DATE                            ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    MOBILE                         CHAR(20)                        ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    HR_ORG_NAME                    VARCHAR(64)                     ,
    ACTION                         VARCHAR(20)                     ,
    EFFDT                          DATE                            ,
    PROBATION_DT                   DATE                            ,
    COMPRATE                       DECIMAL(20,2)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T5_EMP_Q is '季末员工表';
Comment on Column IBS.T5_EMP_Q.EMP_ID            is '员工号';
Comment on Column IBS.T5_EMP_Q.MEASURE_DT        is '统计日期';
Comment on Column IBS.T5_EMP_Q.EMP_TYPE_ID       is '员工类型代码';
Comment on Column IBS.T5_EMP_Q.EMP_NM            is '员工名';
Comment on Column IBS.T5_EMP_Q.GENDER            is '性别';
Comment on Column IBS.T5_EMP_Q.BIRTHDAY          is '生日';
Comment on Column IBS.T5_EMP_Q.ORG_ID            is '机构号';
Comment on Column IBS.T5_EMP_Q.ORG_NM            is '机构名';
Comment on Column IBS.T5_EMP_Q.BRANCH_ORG_ID     is '分行机构号';
Comment on Column IBS.T5_EMP_Q.BRANCH_ORG_NM     is '分行机构名';
Comment on Column IBS.T5_EMP_Q.POSITION_ID       is '岗位代码';
Comment on Column IBS.T5_EMP_Q.POSITION_NM       is '岗位名称';
Comment on Column IBS.T5_EMP_Q.MOBILE            is '手机号';
Comment on Column IBS.T5_EMP_Q.PSTN_TYPE         is '主考核类别';
Comment on Column IBS.T5_EMP_Q.PSTN_TYPE_NM      is '主考核类别名称';
Comment on Column IBS.T5_EMP_Q.SUB_PSTN_TYPE     is '子考核类别';
Comment on Column IBS.T5_EMP_Q.SUB_PSTN_TYPE_NM  is '子考核类别名称';
Comment on Column IBS.T5_EMP_Q.HR_ORG_NAME       is '人力机构';
Comment on Column IBS.T5_EMP_Q.ACTION            is '岗位状态';
Comment on Column IBS.T5_EMP_Q.EFFDT             is '岗位生效日期';
Comment on Column IBS.T5_EMP_Q.PROBATION_DT      is '试用期结束日期';
Comment on Column IBS.T5_EMP_Q.COMPRATE          is '季度标准绩效薪酬';

--------------------------------------------------
-- Create Table IBS.T5_EMP_RESOURCE_MANAGER
--------------------------------------------------
Create table IBS.T5_EMP_RESOURCE_MANAGER (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID_OLD                     VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    KHJQ_ST_DT                     DATE                NOT NULL    ,
    KHJQ_ED_DT                     DATE                NOT NULL    ,
    KHQ_ST_DT                      DATE                NOT NULL    ,
    KHQ_ED_DT                      DATE                NOT NULL    ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;
Comment on Table IBS.T5_EMP_RESOURCE_MANAGER is '资源型客户经理(未正式入职)';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.EMP_ID is '员工号';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.EMP_ID_OLD is '转正前员工号';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.EMP_NM is '员工名';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.ORG_ID is '机构号';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.ORG_NM is '机构名';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.KHJQ_ST_DT is '考核基期开始日期';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.KHJQ_ED_DT is '考核基期结束日期';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.KHQ_ST_DT is '考核期开始日期';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.KHQ_ED_DT is '考核期开始日期';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_EMP_RESOURCE_MANAGER.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T5_LOBBY_MANAGER_SCORE_Q
--------------------------------------------------
Create table IBS.T5_LOBBY_MANAGER_SCORE_Q (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    SCORE                          DECIMAL(18,2)                   ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ,
    EXAM_Y                         DECIMAL(4)          NOT NULL    ,
    EXAM_Q                         CHAR(15)            NOT NULL    ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T5_LOBBY_MANAGER_SCORE_Q is '大堂经理服务质量打分表';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.MEASURE_DT is '数据日期';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.EMP_ID is '员工号';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.EMP_NM is '员工名';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.ORG_ID is '机构号';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.ORG_NM is '机构名';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.SCORE is '服务质量得分';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.MODIFY_IP is '修改IP';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.EXAM_Y is '考核年';
Comment on Column IBS.T5_LOBBY_MANAGER_SCORE_Q.EXAM_Q is '考核季度';

--------------------------------------------------
-- Create Table IBS.T5_MANAGER_Y_SCORE
--------------------------------------------------
Create table IBS.T5_MANAGER_Y_SCORE (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_ID                    INTEGER                         ,
    POSITION_NM                    VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    SCORE_TYPE_ID                  CHAR(2)                         ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T5_MANAGER_Y_SCORE is '年度绩效表现评定结果表';
Comment on Column IBS.T5_MANAGER_Y_SCORE.MEASURE_DT is '数据日期';
Comment on Column IBS.T5_MANAGER_Y_SCORE.EMP_ID  is '员工号';
Comment on Column IBS.T5_MANAGER_Y_SCORE.EMP_NM  is '员工名';
Comment on Column IBS.T5_MANAGER_Y_SCORE.ORG_ID  is '机构号';
Comment on Column IBS.T5_MANAGER_Y_SCORE.ORG_NM  is '机构名';
Comment on Column IBS.T5_MANAGER_Y_SCORE.BRANCH_ORG_ID is '分行机构号';
Comment on Column IBS.T5_MANAGER_Y_SCORE.BRANCH_ORG_NM is '分行机构名';
Comment on Column IBS.T5_MANAGER_Y_SCORE.POSITION_ID is '岗位代码';
Comment on Column IBS.T5_MANAGER_Y_SCORE.POSITION_NM is '岗位名称';
Comment on Column IBS.T5_MANAGER_Y_SCORE.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T5_MANAGER_Y_SCORE.PSTN_TYPE_NM is '主考核类别名称';
Comment on Column IBS.T5_MANAGER_Y_SCORE.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T5_MANAGER_Y_SCORE.SUB_PSTN_TYPE_NM is '子考核类别名称';
Comment on Column IBS.T5_MANAGER_Y_SCORE.SCORE_TYPE_ID is '年度绩效表现评定类型';
Comment on Column IBS.T5_MANAGER_Y_SCORE.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_MANAGER_Y_SCORE.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_MANAGER_Y_SCORE.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T5_ORG
--------------------------------------------------
Create table IBS.T5_ORG (
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_TYPE_ID                    CHAR(2)             NOT NULL    ,
    ORG_IP_ID                      INTEGER                         ,
    ORG_NM                         VARCHAR(64)                     ,
    ORG_LEVEL_ID                   CHAR(2)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    HEAD_ORG_ID                    CHAR(4)                         ,
    HEAD_ORG_NM                    VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (ORG_ID,ORG_TYPE_ID) Using Hashing;
Comment on Table IBS.T5_ORG is '机构表';
Comment on Column IBS.T5_ORG.ORG_ID              is '支行机构号';
Comment on Column IBS.T5_ORG.ORG_TYPE_ID         is '机构类别代码';
Comment on Column IBS.T5_ORG.ORG_IP_ID           is '机构号代理键';
Comment on Column IBS.T5_ORG.ORG_NM              is '支行机构名';
Comment on Column IBS.T5_ORG.ORG_LEVEL_ID        is '机构级别';
Comment on Column IBS.T5_ORG.BRANCH_ORG_ID       is '分行机构号';
Comment on Column IBS.T5_ORG.BRANCH_ORG_NM       is '分行机构名';
Comment on Column IBS.T5_ORG.HEAD_ORG_ID         is '总行机构号';
Comment on Column IBS.T5_ORG.HEAD_ORG_NM         is '总行机构名';

--------------------------------------------------
-- Create Table IBS.T5_ORG_MEG
--------------------------------------------------
Create table IBS.T5_ORG_MEG (
    ORG_ID                         CHAR(4)             NOT NULL    ,
    ORG_TYPE_ID                    CHAR(2)             NOT NULL    ,
    ORG_IP_ID                      INTEGER                         ,
    ORG_NM                         VARCHAR(64)                     ,
    ORG_LEVEL_ID                   CHAR(2)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    HEAD_ORG_ID                    CHAR(4)                         ,
    HEAD_ORG_NM                    VARCHAR(64)                     ,
    ORG_ID_MEG                     CHAR(4)             NOT NULL    ,
    ORG_IP_ID_MEG                  INTEGER                         ,
    ORG_NM_MEG                     VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (ORG_ID,ORG_TYPE_ID) Using Hashing;
Comment on Table IBS.T5_ORG_MEG is '合并机构表-手工维护';
Comment on Column IBS.T5_ORG_MEG.ORG_ID          is '支行机构号';
Comment on Column IBS.T5_ORG_MEG.ORG_TYPE_ID     is '机构类别代码';
Comment on Column IBS.T5_ORG_MEG.ORG_IP_ID       is '机构号代理键';
Comment on Column IBS.T5_ORG_MEG.ORG_NM          is '支行机构名';
Comment on Column IBS.T5_ORG_MEG.ORG_LEVEL_ID    is '机构级别';
Comment on Column IBS.T5_ORG_MEG.BRANCH_ORG_ID   is '分行机构号';
Comment on Column IBS.T5_ORG_MEG.BRANCH_ORG_NM   is '分行机构名';
Comment on Column IBS.T5_ORG_MEG.HEAD_ORG_ID     is '总行机构号';
Comment on Column IBS.T5_ORG_MEG.HEAD_ORG_NM     is '总行机构名';
Comment on Column IBS.T5_ORG_MEG.ORG_ID_MEG      is '合并后的机构CD';
Comment on Column IBS.T5_ORG_MEG.ORG_IP_ID_MEG   is '合并后的机构ID';
Comment on Column IBS.T5_ORG_MEG.ORG_NM_MEG      is '合并后的机构名';

--------------------------------------------------
-- Create Table IBS.T5_YBDB_PER_FEE_RATION
--------------------------------------------------
Create table IBS.T5_YBDB_PER_FEE_RATION (
    PER_FEE_RATION                 DECIMAL(20,2)       NOT NULL    ,
    ST_DT                          DATE                NOT NULL    ,
    ED_DT                          DATE                NOT NULL    ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_TIME                    TIMESTAMP                       ,
    MODIFY_IP                      CHAR(15)                        ) 
in TS_IBS   
Partitioning Key (PER_FEE_RATION) Using Hashing;
Comment on Table IBS.T5_YBDB_PER_FEE_RATION is '保险人力费用系数';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.PER_FEE_RATION is '人力费用系数';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.ST_DT is '生效日期';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.ED_DT is '结束日期';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.MODIFY_TIME is '修改时间';
Comment on Column IBS.T5_YBDB_PER_FEE_RATION.MODIFY_IP is '修改IP';

--------------------------------------------------
-- Create Table IBS.T6_SALES_DISTRIBUTE_LOG
--------------------------------------------------
Create table IBS.T6_SALES_DISTRIBUTE_LOG (
    SALE_ID                        VARCHAR(32)         NOT NULL    ,
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    MODIFY_TIME                    TIMESTAMP           NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    CHANNLE_ID                     CHAR(4)                         ,
    ORG_ID                         CHAR(4)                         ,
    TXN_DT                         DATE                            ,
    AMT                            DECIMAL(18,2)                   ,
    RECOMMEND_TYPE_ID              CHAR(2)                         ,
    RECOMMEND_PEOPLE               VARCHAR(20)                     ,
    SALES_PEOPLE                   CHAR(6)                         ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_IP                      CHAR(15)                        ,
    REMARK                         VARCHAR(500)                    ) 
in TS_IBS   
Partitioning Key (SALE_ID,BONUS_TYPE_ID) Using Hashing;
Comment on Table IBS.T6_SALES_DISTRIBUTE_LOG is '销售分配日志';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.SALE_ID is '销售编码';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.MODIFY_TIME is '修改时间';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.CST_ID is '客户号';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.CST_NM is '客户名';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.CHANNLE_ID is '渠道代码';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.ORG_ID is '机构号';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.TXN_DT is '交易日期';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.AMT is '金额';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.RECOMMEND_TYPE_ID is '推荐人类型代码';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.RECOMMEND_PEOPLE is '推荐人';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.SALES_PEOPLE is '销售人';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.MODIFY_PEOPLE is '修改人';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.MODIFY_IP is '修改IP';
Comment on Column IBS.T6_SALES_DISTRIBUTE_LOG.REMARK is '备注';

--------------------------------------------------
-- Create Table IBS.T6_SALES_DISTRIBUTE_LOG_CJ
--------------------------------------------------
Create table IBS.T6_SALES_DISTRIBUTE_LOG_CJ (
    SALE_ID                        VARCHAR(32)         NOT NULL    ,
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    MODIFY_TIME                    TIMESTAMP           NOT NULL    ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    CHANNLE_ID                     CHAR(4)                         ,
    ORG_ID                         CHAR(4)                         ,
    TXN_DT                         DATE                            ,
    AMT                            DECIMAL(18,2)                   ,
    RECOMMEND_TYPE_ID              CHAR(2)                         ,
    RECOMMEND_PEOPLE               VARCHAR(20)                     ,
    SALES_PEOPLE                   CHAR(6)                         ,
    MODIFY_PEOPLE                  CHAR(6)                         ,
    MODIFY_IP                      CHAR(15)                        ,
    REMARK                         VARCHAR(500)                    ) 
in TS_IBS   
Partitioning Key (SALE_ID,BONUS_TYPE_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG
--------------------------------------------------
Create table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    OLD_EMP_ID                     VARCHAR(20)                     ,
    OLD_RATIO                      DECIMAL(6,2)                    ,
    OLD_CLAIM_STATUS_ID            CHAR(2)                         ,
    OLD_CLAIM_DT                   DATE                            ,
    OLD_VERIFY_DT                  DATE                            ,
    OLD_VERIFY_EMP_ID              VARCHAR(20)                     ,
    OLD_REMARK                     VARCHAR(5000)                   ,
    NEW_EMP_ID                     VARCHAR(20)                     ,
    NEW_RATIO                      DECIMAL(6,2)                    ,
    NEW_CLAIM_STATUS_ID            CHAR(2)                         ,
    NEW_CLAIM_DT                   TIMESTAMP                       ,
    NEW_VERIFY_DT                  TIMESTAMP                       ,
    NEW_VERIFY_EMP_ID              VARCHAR(20)                     ,
    NEW_REMARK                     VARCHAR(5000)                   ,
    CHANGE_TYPE                    CHAR(2)                         ,
    NEW_FIN_VERIFY_DT              TIMESTAMP                       ,
    NEW_FIN_VERIFY_EMP_ID          VARCHAR(20)                     ,
    CHANGE_FLAG                    VARCHAR(4)                    With Default '0'  ,
    NEW_VERIFY_EMP_NM              VARCHAR(64)                     ,
    NEW_FIN_VERIFY_EMP_NM          VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         VARCHAR(4)                      ,
    EMP_NM                         VARCHAR(64)                     ,
    OLD_FH_VERIFY_DT               DATE                            ,
    OLD_FH_VERIFY_EMP_ID           VARCHAR(20)                     ,
    OLD_FH_VERIFY_EMP_NM           VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG is '认领关系调整日志';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.VUCH_NBR is '凭证号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_EMP_ID is '原认领人工号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_RATIO is '原认领比例';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_CLAIM_STATUS_ID is '原认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_CLAIM_DT is '原认领日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_VERIFY_DT is '原审批日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_VERIFY_EMP_ID is '原审批人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_REMARK is '原备注';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_EMP_ID is '新认领人工号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_RATIO is '新认领比例';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_STATUS_ID is '新认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_CLAIM_DT is '新认领日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_VERIFY_DT is '初审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_REMARK is '新备注';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.CHANGE_TYPE is '修改方式（U-修改认领；I-新增认领；D-撤销认领）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_FIN_VERIFY_DT is '终审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_FIN_VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.CHANGE_FLAG is '1非当前调整0当前调整';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.NEW_FIN_VERIFY_EMP_NM is '终审人姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.CST_NM is '客户名称';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.ORG_ID is '机构号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.EMP_NM is '员工姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_FH_VERIFY_DT is '原初审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_FH_VERIFY_EMP_ID is '原初审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.OLD_FH_VERIFY_EMP_NM is '原初审人名称';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG.BIZ_TYPE_NM is '业务类型';

--------------------------------------------------
-- Create Table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812
--------------------------------------------------
Create table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812 (
    VUCH_NBR                       VARCHAR(64)         NOT NULL    ,
    OLD_EMP_ID                     VARCHAR(20)                     ,
    OLD_RATIO                      DECIMAL(6,2)                    ,
    OLD_CLAIM_STATUS_ID            CHAR(2)                         ,
    OLD_CLAIM_DT                   DATE                            ,
    OLD_VERIFY_DT                  DATE                            ,
    OLD_VERIFY_EMP_ID              VARCHAR(20)                     ,
    OLD_REMARK                     VARCHAR(5000)                   ,
    NEW_EMP_ID                     VARCHAR(20)                     ,
    NEW_RATIO                      DECIMAL(6,2)                    ,
    NEW_CLAIM_STATUS_ID            CHAR(2)                         ,
    NEW_CLAIM_DT                   TIMESTAMP                       ,
    NEW_VERIFY_DT                  TIMESTAMP                       ,
    NEW_VERIFY_EMP_ID              VARCHAR(20)                     ,
    NEW_REMARK                     VARCHAR(5000)                   ,
    CHANGE_TYPE                    CHAR(2)                         ,
    NEW_FIN_VERIFY_DT              TIMESTAMP                       ,
    NEW_FIN_VERIFY_EMP_ID          VARCHAR(20)                     ,
    CHANGE_FLAG                    VARCHAR(4)                    With Default '0'  ,
    NEW_VERIFY_EMP_NM              VARCHAR(64)                     ,
    NEW_FIN_VERIFY_EMP_NM          VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         VARCHAR(4)                      ,
    EMP_NM                         VARCHAR(64)                     ,
    OLD_FH_VERIFY_DT               DATE                            ,
    OLD_FH_VERIFY_EMP_ID           VARCHAR(20)                     ,
    OLD_FH_VERIFY_EMP_NM           VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812 is '认领关系调整日志';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.VUCH_NBR is '凭证号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_EMP_ID is '原认领人工号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_RATIO is '原认领比例';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_CLAIM_STATUS_ID is '原认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_CLAIM_DT is '原认领日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_VERIFY_DT is '原审批日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_VERIFY_EMP_ID is '原审批人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_REMARK is '原备注';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_EMP_ID is '新认领人工号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_RATIO is '新认领比例';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_CLAIM_STATUS_ID is '新认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_CLAIM_DT is '新认领日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_VERIFY_DT is '初审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_VERIFY_EMP_ID is '初审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_REMARK is '新备注';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.CHANGE_TYPE is '修改方式（U-修改认领；I-新增认领；D-撤销认领）';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_FIN_VERIFY_DT is '终审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_FIN_VERIFY_EMP_ID is '终审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.CHANGE_FLAG is '1非当前调整0当前调整';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_VERIFY_EMP_NM is '初审人姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.NEW_FIN_VERIFY_EMP_NM is '终审人姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.CST_NM is '客户名称';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.ORG_ID is '机构号';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.EMP_NM is '员工姓名';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_FH_VERIFY_DT is '原初审日期';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_FH_VERIFY_EMP_ID is '原初审人';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.OLD_FH_VERIFY_EMP_NM is '原初审人名称';
Comment on Column IBS.T6_VUCH_EMP_RELA_CHANGE_LOG_20250812.BIZ_TYPE_NM is '业务类型';

--------------------------------------------------
-- Create Table IBS.T7_CST_MARKETING_DETAIL
--------------------------------------------------
Create table IBS.T7_CST_MARKETING_DETAIL (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MARKETING_NO                   VARCHAR(40)         NOT NULL    ,
    CCY_ID                         INTEGER                         ,
    CURRENT_PERSONNEL_DEP_BAL      DECIMAL(18,3)                   ,
    FIXED_PERSONNEL_DEP_BAL        DECIMAL(18,3)                   ,
    TOTAL_PERSONNEL_DEP_BAL        DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID,MARKETING_NO) Using Hashing;
Comment on Table IBS.T7_CST_MARKETING_DETAIL is '客户活动统计明细-给蛐蛐网';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.MEASURE_DT is '日期';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.EMP_ID is '推荐人（客户推荐客户）';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.MARKETING_NO is '活动编码';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.CCY_ID is '币种';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.CURRENT_PERSONNEL_DEP_BAL is '活期储蓄存款';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.FIXED_PERSONNEL_DEP_BAL is '定期储蓄存款';
Comment on Column IBS.T7_CST_MARKETING_DETAIL.TOTAL_PERSONNEL_DEP_BAL is '合计储蓄存款';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY
--------------------------------------------------
Create table IBS.T7_EMP_SMY (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY is '员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY.MEASURE_DT      is '日期';
Comment on Column IBS.T7_EMP_SMY.EMP_ID          is '员工号';
Comment on Column IBS.T7_EMP_SMY.ORG_ID          is '机构号';
Comment on Column IBS.T7_EMP_SMY.PSTN_TYPE       is '主考核类别';
Comment on Column IBS.T7_EMP_SMY.SUB_PSTN_TYPE   is '子考核类别';
Comment on Column IBS.T7_EMP_SMY.DEP_Q_PROFIT    is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY.LN_Q_PROFIT     is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY.IB_Q_BONUS      is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY.FNC_Q_PROFIT    is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY.GRADE           is '取得资格证等级';
Comment on Column IBS.T7_EMP_SMY.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_20240606
--------------------------------------------------
Create table IBS.T7_EMP_SMY_20240606 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in USERSPACE1   
Partitioning Key (MEASURE_DT) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_20241125
--------------------------------------------------
Create table IBS.T7_EMP_SMY_20241125 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY_20241125 is '员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY_20241125.MEASURE_DT is '日期';
Comment on Column IBS.T7_EMP_SMY_20241125.EMP_ID is '员工号';
Comment on Column IBS.T7_EMP_SMY_20241125.ORG_ID is '机构号';
Comment on Column IBS.T7_EMP_SMY_20241125.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_EMP_SMY_20241125.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY_20241125.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_20241125.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_20241125.IB_Q_BONUS is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY_20241125.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY_20241125.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY_20241125.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY_20241125.GRADE  is '取得资格证等级';
Comment on Column IBS.T7_EMP_SMY_20241125.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_BAK
--------------------------------------------------
Create table IBS.T7_EMP_SMY_BAK (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY_BAK is '员工奖励汇总-给人力系统(调整数据前的备份)';
Comment on Column IBS.T7_EMP_SMY_BAK.MEASURE_DT  is '日期';
Comment on Column IBS.T7_EMP_SMY_BAK.EMP_ID      is '员工号';
Comment on Column IBS.T7_EMP_SMY_BAK.ORG_ID      is '机构号';
Comment on Column IBS.T7_EMP_SMY_BAK.PSTN_TYPE   is '主考核类别';
Comment on Column IBS.T7_EMP_SMY_BAK.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY_BAK.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_BAK.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_BAK.IB_Q_BONUS  is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY_BAK.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY_BAK.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY_BAK.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY_BAK.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_TMP
--------------------------------------------------
Create table IBS.T7_EMP_SMY_TMP (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY_TMP is '员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY_TMP.MEASURE_DT  is '日期';
Comment on Column IBS.T7_EMP_SMY_TMP.EMP_ID      is '员工号';
Comment on Column IBS.T7_EMP_SMY_TMP.ORG_ID      is '机构号';
Comment on Column IBS.T7_EMP_SMY_TMP.PSTN_TYPE   is '主考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP.IB_Q_BONUS  is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY_TMP.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY_TMP.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY_TMP.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY_TMP.GRADE       is '取得资格证等级';
Comment on Column IBS.T7_EMP_SMY_TMP.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_TMP_RESULT
--------------------------------------------------
Create table IBS.T7_EMP_SMY_TMP_RESULT (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY_TMP_RESULT is '给人力的新方案的最终结果';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.MEASURE_DT is '日期';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.EMP_ID is '员工号';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.ORG_ID is '机构号';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.IB_Q_BONUS is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.GRADE is '取得资格证等级';
Comment on Column IBS.T7_EMP_SMY_TMP_RESULT.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY_TMP20231205
--------------------------------------------------
Create table IBS.T7_EMP_SMY_TMP20231205 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY_TMP20231205 is '员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.MEASURE_DT is '日期';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.EMP_ID is '员工号';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.ORG_ID is '机构号';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.IB_Q_BONUS is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.GRADE is '取得资格证等级';
Comment on Column IBS.T7_EMP_SMY_TMP20231205.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY20220331
--------------------------------------------------
Create table IBS.T7_EMP_SMY20220331 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY20220331 is '备份20220331日变更前考核结果员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY20220331.MEASURE_DT is '日期';
Comment on Column IBS.T7_EMP_SMY20220331.EMP_ID  is '员工号';
Comment on Column IBS.T7_EMP_SMY20220331.ORG_ID  is '机构号';
Comment on Column IBS.T7_EMP_SMY20220331.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_EMP_SMY20220331.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY20220331.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY20220331.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY20220331.IB_Q_BONUS is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY20220331.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY20220331.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY20220331.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY20220331.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_EMP_SMY20221114
--------------------------------------------------
Create table IBS.T7_EMP_SMY20221114 (
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    IB_Q_BONUS                     DECIMAL(18,3)                   ,
    RECOMMEND_BONUS1               DECIMAL(18,3)                   ,
    RECOMMEND_BONUS2               DECIMAL(18,3)                   ,
    FNC_Q_PROFIT                   DECIMAL(18,3)                   ,
    GRADE                          VARCHAR(20)                     ,
    RESOURCE_MANAGER_F             CHAR(1)                         ) 
in TS_IBS   
Partitioning Key (MEASURE_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T7_EMP_SMY20221114 is '员工奖励汇总-给人力系统';
Comment on Column IBS.T7_EMP_SMY20221114.MEASURE_DT is '日期';
Comment on Column IBS.T7_EMP_SMY20221114.EMP_ID  is '员工号';
Comment on Column IBS.T7_EMP_SMY20221114.ORG_ID  is '机构号';
Comment on Column IBS.T7_EMP_SMY20221114.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_EMP_SMY20221114.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_EMP_SMY20221114.DEP_Q_PROFIT is '存款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY20221114.LN_Q_PROFIT is '贷款本季度净利息收入';
Comment on Column IBS.T7_EMP_SMY20221114.IB_Q_BONUS is '中间本季度业务奖金';
Comment on Column IBS.T7_EMP_SMY20221114.RECOMMEND_BONUS1 is '本季度推荐贷款奖金（大堂经理）';
Comment on Column IBS.T7_EMP_SMY20221114.RECOMMEND_BONUS2 is '本季度推荐贷款奖金（客户经理扣减）';
Comment on Column IBS.T7_EMP_SMY20221114.FNC_Q_PROFIT is '理财本季度收入';
Comment on Column IBS.T7_EMP_SMY20221114.RESOURCE_MANAGER_F is '资源类客户经理标志（1-资源类客户经理）';

--------------------------------------------------
-- Create Table IBS.T7_LOBBY_MANAGER_SMY
--------------------------------------------------
Create table IBS.T7_LOBBY_MANAGER_SMY (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    DEP_BONUS                      DECIMAL(18,2)                   ,
    FNC_BONUS                      DECIMAL(18,2)                   ,
    FUND_BONUS                     DECIMAL(18,2)                   ,
    INSUR_BONUS                    DECIMAL(18,2)                   ,
    OTHER_SCORE                    DECIMAL(18,2)                   ,
    SERVICE_SCORE                  DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.T7_LOBBY_MANAGER_SMY is '大堂经理业绩汇总表';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.EMP_ID is '员工号';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.MEASURE_DT is '统计日期';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.EMP_NM is '员工名';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.ORG_ID is '机构号';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.PSTN_TYPE is '主考核类别';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.DEP_BONUS is '存款奖励';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.FNC_BONUS is '理财奖励';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.FUND_BONUS is '基金奖励';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.INSUR_BONUS is '保险奖励';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.OTHER_SCORE is '其它业务得分';
Comment on Column IBS.T7_LOBBY_MANAGER_SMY.SERVICE_SCORE is '服务得分';

--------------------------------------------------
-- Create Table IBS.T7_TMP
--------------------------------------------------
Create table IBS.T7_TMP (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.T8_DATA_DT
--------------------------------------------------
Create table IBS.T8_DATA_DT (
    DATA_DT                        DATE                NOT NULL    ,
    ADD_TIME                       TIMESTAMP                       ) 
in TS_IBS   
Partitioning Key (DATA_DT) Using Hashing;
Comment on Table IBS.T8_DATA_DT is '存贷款数据日期_WEB前端使用,报表的最新数据日期';
Comment on Column IBS.T8_DATA_DT.DATA_DT         is '数据日期';
Comment on Column IBS.T8_DATA_DT.ADD_TIME        is '记录添加时间';

--------------------------------------------------
-- Create Table IBS.T8_TBP
--------------------------------------------------
Create table IBS.T8_TBP (
    TBSPC_NAME                     VARCHAR(128)                    ,
    TOTAL_P                        BIGINT                          ,
    USED_P                         BIGINT                          ,
    FREE_P                         BIGINT                          ,
    TOTAL_G                        BIGINT                          ,
    USED_G                         BIGINT                          ,
    FREE_G                         BIGINT                          ,
    PERCENT                        BIGINT                          ,
    HIGH_WATER_MARK                BIGINT                          ,
    CUR_TIME                       TIMESTAMP           NOT NULL    ) 
in TS_IBS   
Partitioning Key (TBSPC_NAME) Using Hashing;
Comment on Table IBS.T8_TBP is '空间使用情况';

--------------------------------------------------
-- Create Table IBS.T9_AMT_INTERVAL_TYPE
--------------------------------------------------
Create table IBS.T9_AMT_INTERVAL_TYPE (
    AMT_INTERVAL_TYPE_ID           CHAR(2)             NOT NULL    ,
    AMT_INTERVAL_TYPE_NM           VARCHAR(64)                     ,
    UPPER_LIMIT                    DECIMAL(18)                     ,
    LOWER_LIMIT                    DECIMAL(18)                     ,
    REMARK                         VARCHAR(256)                    ) 
in TS_IBS   
Partitioning Key (AMT_INTERVAL_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_AMT_INTERVAL_TYPE is '金额区间代码表';
Comment on Column IBS.T9_AMT_INTERVAL_TYPE.AMT_INTERVAL_TYPE_ID is '金额区间代码';
Comment on Column IBS.T9_AMT_INTERVAL_TYPE.AMT_INTERVAL_TYPE_NM is '金额区间名称';
Comment on Column IBS.T9_AMT_INTERVAL_TYPE.UPPER_LIMIT is '上限';
Comment on Column IBS.T9_AMT_INTERVAL_TYPE.LOWER_LIMIT is '下限';

--------------------------------------------------
-- Create Table IBS.T9_BIZ_TYPE
--------------------------------------------------
Create table IBS.T9_BIZ_TYPE (
    BIZ_TYPE_ID                    CHAR(2)             NOT NULL    ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    BIZ_TYPE_NM_NEW                VARCHAR(64)                     ,
    BIZ_TYPE_CGY                   VARCHAR(32)                     ) 
in TS_IBS   
Partitioning Key (BIZ_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_BIZ_TYPE is '业务类型代码表';
Comment on Column IBS.T9_BIZ_TYPE.BIZ_TYPE_ID    is '业务类型代码';
Comment on Column IBS.T9_BIZ_TYPE.BIZ_TYPE_NM    is '业务类型名称';
Comment on Column IBS.T9_BIZ_TYPE.BIZ_TYPE_NM_NEW is '类别统一名称';

--------------------------------------------------
-- Create Table IBS.T9_BONUS_STATUS
--------------------------------------------------
Create table IBS.T9_BONUS_STATUS (
    BONUS_STATUS_ID                CHAR(2)             NOT NULL    ,
    BONUS_STATUS_NM                VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (BONUS_STATUS_ID) Using Hashing;
Comment on Table IBS.T9_BONUS_STATUS is '奖金状态代码表';
Comment on Column IBS.T9_BONUS_STATUS.BONUS_STATUS_ID is '奖金状态代码';
Comment on Column IBS.T9_BONUS_STATUS.BONUS_STATUS_NM is '奖金状态名称';

--------------------------------------------------
-- Create Table IBS.T9_BONUS_TYPE
--------------------------------------------------
Create table IBS.T9_BONUS_TYPE (
    BONUS_TYPE_ID                  CHAR(2)             NOT NULL    ,
    BONUS_TYPE_NM                  VARCHAR(64)                     ) 
in TS_REP   
Partitioning Key (BONUS_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_BONUS_TYPE is '奖金类型代码表';
Comment on Column IBS.T9_BONUS_TYPE.BONUS_TYPE_ID is '奖金类型代码';
Comment on Column IBS.T9_BONUS_TYPE.BONUS_TYPE_NM is '奖金类型名称';

--------------------------------------------------
-- Create Table IBS.T9_CERTIFICATE
--------------------------------------------------
Create table IBS.T9_CERTIFICATE (
    TYPE                           CHAR(4)             NOT NULL    ,
    VALUE                          VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (TYPE) Using Hashing;
Comment on Table IBS.T9_CERTIFICATE is '取得资格证码表';
Comment on Column IBS.T9_CERTIFICATE.TYPE        is '取得资格证维度(Y-年份，G-等级)';
Comment on Column IBS.T9_CERTIFICATE.VALUE       is '取得资格证类别';

--------------------------------------------------
-- Create Table IBS.T9_CHANNEL
--------------------------------------------------
Create table IBS.T9_CHANNEL (
    CHANNLE_ID                     CHAR(4)             NOT NULL    ,
    CHANNLE_NM                     VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (CHANNLE_ID) Using Hashing;
Comment on Table IBS.T9_CHANNEL is '渠道代码表';
Comment on Column IBS.T9_CHANNEL.CHANNLE_ID      is '渠道代码';
Comment on Column IBS.T9_CHANNEL.CHANNLE_NM      is '渠道名称';

--------------------------------------------------
-- Create Table IBS.T9_CLAIM_STATUS_TYPE
--------------------------------------------------
Create table IBS.T9_CLAIM_STATUS_TYPE (
    CLAIM_STATUS_ID                CHAR(2)             NOT NULL    ,
    CLAIM_STATUS_NM                VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (CLAIM_STATUS_ID) Using Hashing;
Comment on Table IBS.T9_CLAIM_STATUS_TYPE is '认领状态代码表';
Comment on Column IBS.T9_CLAIM_STATUS_TYPE.CLAIM_STATUS_ID is '认领状态代码';
Comment on Column IBS.T9_CLAIM_STATUS_TYPE.CLAIM_STATUS_NM is '认领状态名称';

--------------------------------------------------
-- Create Table IBS.T9_FNC_TXN_CD
--------------------------------------------------
Create table IBS.T9_FNC_TXN_CD (
    TXN_CD                         VARCHAR(8)          NOT NULL    ,
    TXN_NM                         VARCHAR(64)                     ,
    TXN_CGY_CD                     VARCHAR(8)          NOT NULL    ,
    TXN_CGY_NM                     VARCHAR(64)                     ,
    STA_FLAG                       VARCHAR(2)                      ) 
in TS_SINGLE   ;
Comment on Table IBS.T9_FNC_TXN_CD is '理财交易类型';
Comment on Column IBS.T9_FNC_TXN_CD.TXN_CD       is '交易类型';
Comment on Column IBS.T9_FNC_TXN_CD.TXN_NM       is '交易类型名称';
Comment on Column IBS.T9_FNC_TXN_CD.TXN_CGY_CD   is '交易分类';
Comment on Column IBS.T9_FNC_TXN_CD.TXN_CGY_NM   is '交易分类名称';
Comment on Column IBS.T9_FNC_TXN_CD.STA_FLAG     is '是否统计';

--------------------------------------------------
-- Create Table IBS.T9_FUND_TXN_CD
--------------------------------------------------
Create table IBS.T9_FUND_TXN_CD (
    TXN_CD                         VARCHAR(8)          NOT NULL    ,
    TXN_NM                         VARCHAR(64)                     ,
    TXN_CGY_CD                     VARCHAR(8)          NOT NULL    ,
    TXN_CGY_NM                     VARCHAR(64)                     ,
    STA_FLAG                       VARCHAR(2)                      ) 
in TS_SINGLE   ;
Comment on Table IBS.T9_FUND_TXN_CD is '基金手交易类型';
Comment on Column IBS.T9_FUND_TXN_CD.TXN_CD      is '交易类型';
Comment on Column IBS.T9_FUND_TXN_CD.TXN_NM      is '交易类型名称';
Comment on Column IBS.T9_FUND_TXN_CD.TXN_CGY_CD  is '交易分类';
Comment on Column IBS.T9_FUND_TXN_CD.TXN_CGY_NM  is '交易分类名称';
Comment on Column IBS.T9_FUND_TXN_CD.STA_FLAG    is '是否统计';

--------------------------------------------------
-- Create Table IBS.T9_MANAGER_Y_SCORE_TYPE
--------------------------------------------------
Create table IBS.T9_MANAGER_Y_SCORE_TYPE (
    SCORE_TYPE_ID                  CHAR(2)             NOT NULL    ,
    SCORE_TYPE_NM                  VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (SCORE_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_MANAGER_Y_SCORE_TYPE is '年度绩效表现评定代码表';
Comment on Column IBS.T9_MANAGER_Y_SCORE_TYPE.SCORE_TYPE_ID is '年度绩效表现评定类型代码';
Comment on Column IBS.T9_MANAGER_Y_SCORE_TYPE.SCORE_TYPE_NM is '年度绩效表现评定类型名称';

--------------------------------------------------
-- Create Table IBS.T9_MARKETING_TYPE
--------------------------------------------------
Create table IBS.T9_MARKETING_TYPE (
    MARKETING_NO                   CHAR(20)            NOT NULL    ,
    MARKETING_NM                   VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (MARKETING_NO) Using Hashing;
Comment on Table IBS.T9_MARKETING_TYPE is '活动编码类型代码表';
Comment on Column IBS.T9_MARKETING_TYPE.MARKETING_NO is '活动编码';
Comment on Column IBS.T9_MARKETING_TYPE.MARKETING_NM is '活动名称';

--------------------------------------------------
-- Create Table IBS.T9_ORG_LEVEL
--------------------------------------------------
Create table IBS.T9_ORG_LEVEL (
    ORG_LEVEL_ID                   CHAR(2)             NOT NULL    ,
    ORG_LEVEL_NM                   VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (ORG_LEVEL_ID) Using Hashing;
Comment on Table IBS.T9_ORG_LEVEL is '机构级别代码表';
Comment on Column IBS.T9_ORG_LEVEL.ORG_LEVEL_ID  is '机构级别代码';
Comment on Column IBS.T9_ORG_LEVEL.ORG_LEVEL_NM  is '机构级别名称';

--------------------------------------------------
-- Create Table IBS.T9_ORG_TYPE
--------------------------------------------------
Create table IBS.T9_ORG_TYPE (
    ORG_TYPE_ID                    CHAR(2)             NOT NULL    ,
    ORG_TYPE_NM                    VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (ORG_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_ORG_TYPE is '机构类别代码表';
Comment on Column IBS.T9_ORG_TYPE.ORG_TYPE_ID    is '机构类别代码';
Comment on Column IBS.T9_ORG_TYPE.ORG_TYPE_NM    is '机构类别名称';

--------------------------------------------------
-- Create Table IBS.T9_PER_TYPE
--------------------------------------------------
Create table IBS.T9_PER_TYPE (
    PER_TYPE                       VARCHAR(8)                      ,
    PER_TYPE_NAME                  VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (PER_TYPE) Using Hashing;
Comment on Table IBS.T9_PER_TYPE is '员工状态';
Comment on Column IBS.T9_PER_TYPE.PER_TYPE       is '状态代码';
Comment on Column IBS.T9_PER_TYPE.PER_TYPE_NAME  is '状态名称';

--------------------------------------------------
-- Create Table IBS.T9_PSTN_TYPE
--------------------------------------------------
Create table IBS.T9_PSTN_TYPE (
    PSTN_TYPE                      CHAR(2)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (PSTN_TYPE,SUB_PSTN_TYPE) Using Hashing;
Comment on Table IBS.T9_PSTN_TYPE is '考核类别分类';
Comment on Column IBS.T9_PSTN_TYPE.PSTN_TYPE     is '主考核类别';
Comment on Column IBS.T9_PSTN_TYPE.PSTN_TYPE_NM  is '主考核类别名称';
Comment on Column IBS.T9_PSTN_TYPE.SUB_PSTN_TYPE is '子考核类别';
Comment on Column IBS.T9_PSTN_TYPE.SUB_PSTN_TYPE_NM is '子考核类别名称';

--------------------------------------------------
-- Create Table IBS.T9_RECOMMEND_TYPE
--------------------------------------------------
Create table IBS.T9_RECOMMEND_TYPE (
    RECOMMEND_TYPE_ID              CHAR(2)             NOT NULL    ,
    RECOMMEND_TYPE_NM              VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (RECOMMEND_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_RECOMMEND_TYPE is '推荐人类型表';
Comment on Column IBS.T9_RECOMMEND_TYPE.RECOMMEND_TYPE_ID is '推荐人类型代码';
Comment on Column IBS.T9_RECOMMEND_TYPE.RECOMMEND_TYPE_NM is '推荐人类型名称';

--------------------------------------------------
-- Create Table IBS.T9_RVS_STATUS_TYPE
--------------------------------------------------
Create table IBS.T9_RVS_STATUS_TYPE (
    RVS_STATUS_ID                  CHAR(2)             NOT NULL    ,
    RVS_STATUS_NM                  VARCHAR(64)                     ) 
in TS_PUB   
Partitioning Key (RVS_STATUS_ID) Using Hashing;
Comment on Table IBS.T9_RVS_STATUS_TYPE is '调整状态代码表';
Comment on Column IBS.T9_RVS_STATUS_TYPE.RVS_STATUS_ID is '调整状态代码';
Comment on Column IBS.T9_RVS_STATUS_TYPE.RVS_STATUS_NM is '调整状态名称';

--------------------------------------------------
-- Create Table IBS.T9_SP_GROUPID
--------------------------------------------------
Create table IBS.T9_SP_GROUPID (
    GROUP_ID                       VARCHAR(64)         NOT NULL    ,
    GROUP_NM                       VARCHAR(128)                    ,
    BIZ_TYP                        VARCHAR(64)         NOT NULL    ,
    IS_CS                          VARCHAR(4)          NOT NULL    ,
    IS_FS                          VARCHAR(4)          NOT NULL    ,
    SP_TYP                         VARCHAR(64)         NOT NULL    ) 
in TS_PUB   
Partitioning Key (GROUP_ID,BIZ_TYP,IS_CS,IS_FS,SP_TYP) Using Hashing;
Comment on Table IBS.T9_SP_GROUPID is '审批权限配置';
Comment on Column IBS.T9_SP_GROUPID.GROUP_ID     is '角色ID';
Comment on Column IBS.T9_SP_GROUPID.GROUP_NM     is '角色名称';
Comment on Column IBS.T9_SP_GROUPID.BIZ_TYP      is '业务类型';
Comment on Column IBS.T9_SP_GROUPID.IS_CS        is '是否初审1是0否';
Comment on Column IBS.T9_SP_GROUPID.IS_FS        is '是否终审1是0否';
Comment on Column IBS.T9_SP_GROUPID.SP_TYP       is '审批类别';

--------------------------------------------------
-- Create Table IBS.T9_TERM_INTERVAL_TYPE
--------------------------------------------------
Create table IBS.T9_TERM_INTERVAL_TYPE (
    TERM_INTERVAL_TYPE_ID          CHAR(2)             NOT NULL    ,
    TERM_INTERVAL_TYPE_NM          VARCHAR(64)                     ,
    UPPER_LIMIT                    DECIMAL(18)                     ,
    LOWER_LIMIT                    DECIMAL(18)                     ) 
in TS_IBS   
Partitioning Key (TERM_INTERVAL_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_TERM_INTERVAL_TYPE is '期限区间代码表';
Comment on Column IBS.T9_TERM_INTERVAL_TYPE.TERM_INTERVAL_TYPE_ID is '期限区间代码';
Comment on Column IBS.T9_TERM_INTERVAL_TYPE.TERM_INTERVAL_TYPE_NM is '期限区间名称';
Comment on Column IBS.T9_TERM_INTERVAL_TYPE.UPPER_LIMIT is '上限';
Comment on Column IBS.T9_TERM_INTERVAL_TYPE.LOWER_LIMIT is '下限';

--------------------------------------------------
-- Create Table IBS.T9_VUCH_TYPE
--------------------------------------------------
Create table IBS.T9_VUCH_TYPE (
    VUCH_TYPE_ID                   CHAR(2)             NOT NULL    ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (VUCH_TYPE_ID) Using Hashing;
Comment on Table IBS.T9_VUCH_TYPE is '凭证类型代码表';
Comment on Column IBS.T9_VUCH_TYPE.VUCH_TYPE_ID  is '凭证类型代码';
Comment on Column IBS.T9_VUCH_TYPE.VUCH_TYPE_NM  is '凭证类型名称';

--------------------------------------------------
-- Create Table IBS.T9_YEAR_Q
--------------------------------------------------
Create table IBS.T9_YEAR_Q (
    QTD                            VARCHAR(2)          NOT NULL    ,
    QTD_NM                         VARCHAR(64)                     ,
    QTD_CD                         VARCHAR(10)                     ) 
in TS_IBS   
Partitioning Key (QTD) Using Hashing;
Comment on Table IBS.T9_YEAR_Q is '考核季度表';
Comment on Column IBS.T9_YEAR_Q.QTD              is '季度';
Comment on Column IBS.T9_YEAR_Q.QTD_NM           is '季度名称';

--------------------------------------------------
-- Create Table IBS.T99_EMP_RELA_Q_SWITCH
--------------------------------------------------
Create table IBS.T99_EMP_RELA_Q_SWITCH (
    MEASURE_DT                     DATE                NOT NULL    ,
    SWITCH_F                       CHAR(1)                         ,
    REMARK                         VARCHAR(64)                     ) 
in TS_REP   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T99_EMP_RELA_Q_SWITCH is '季末认领关系开关表';
Comment on Column IBS.T99_EMP_RELA_Q_SWITCH.MEASURE_DT is '数据日期';
Comment on Column IBS.T99_EMP_RELA_Q_SWITCH.SWITCH_F is '开关（1-考核开始；0-开始结束）';
Comment on Column IBS.T99_EMP_RELA_Q_SWITCH.REMARK is '备注';

--------------------------------------------------
-- Create Table IBS.T99_HELP
--------------------------------------------------
Create table IBS.T99_HELP (
    ID                             VARCHAR(2)          NOT NULL    ,
    MSG_DT                         DATE                NOT NULL    ,
    MSE_STATE                      CHAR(1)                         ,
    MSG_PER                        VARCHAR(20)                     ,
    QUESTION                       VARCHAR(500)                    ,
    ANSWER                         VARCHAR(500)                    ) 
in TS_IBS   
Partitioning Key (MSG_DT) Using Hashing;
Comment on Table IBS.T99_HELP is '常见问题帮助表';
Comment on Column IBS.T99_HELP.ID                is '问题序号';
Comment on Column IBS.T99_HELP.MSG_DT            is '时间';
Comment on Column IBS.T99_HELP.MSE_STATE         is '状态';
Comment on Column IBS.T99_HELP.MSG_PER           is '发布人';
Comment on Column IBS.T99_HELP.QUESTION          is '问题';
Comment on Column IBS.T99_HELP.ANSWER            is '回复';

--------------------------------------------------
-- Create Table IBS.T99_MIDDLE_INCOME_SWITCH
--------------------------------------------------
Create table IBS.T99_MIDDLE_INCOME_SWITCH (
    MEASURE_DT                     DATE                NOT NULL    ,
    SWITCH_F                       CHAR(1)                         ,
    REMARK                         VARCHAR(64)                     ) 
in TS_IBS   
Partitioning Key (MEASURE_DT) Using Hashing;
Comment on Table IBS.T99_MIDDLE_INCOME_SWITCH is '手动录入开关表(中间业务收入/季度利润调整等报表控制)';
Comment on Column IBS.T99_MIDDLE_INCOME_SWITCH.MEASURE_DT is '数据日期';
Comment on Column IBS.T99_MIDDLE_INCOME_SWITCH.SWITCH_F is '开关（1-考核开始；0-开始结束）';
Comment on Column IBS.T99_MIDDLE_INCOME_SWITCH.REMARK is '备注';

--------------------------------------------------
-- Create Table IBS.T99_NEW_MEGS
--------------------------------------------------
Create table IBS.T99_NEW_MEGS (
    MSG_DT                         DATE                NOT NULL    ,
    MSE_STATE                      CHAR(1)                         ,
    MSG_PER                        VARCHAR(20)                     ,
    MSG_INFO                       VARCHAR(500)                    ) 
in TS_IBS   
Partitioning Key (MSG_DT) Using Hashing;
Comment on Table IBS.T99_NEW_MEGS is '系统提示消息表';
Comment on Column IBS.T99_NEW_MEGS.MSG_DT        is '消息日期';
Comment on Column IBS.T99_NEW_MEGS.MSE_STATE     is '消息状态（1-新发布状态，有效；0-历史消息，无效）';
Comment on Column IBS.T99_NEW_MEGS.MSG_PER       is '消息发布人';
Comment on Column IBS.T99_NEW_MEGS.MSG_INFO      is '消息内容';

--------------------------------------------------
-- Create Table IBS.T99_RESOURCE_MANAGER_PROFIT
--------------------------------------------------
Create table IBS.T99_RESOURCE_MANAGER_PROFIT (
    WORK_DT                        TIMESTAMP           NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    POSITION_NM                    VARCHAR(64)                     ,
    DEP_AVG_BAL                    DECIMAL(18,2)                   ,
    VUCH_CNT                       INTEGER                         ,
    REMARK1                        VARCHAR(200)                    ,
    REMARK2                        VARCHAR(200)                    ) 
in TS_IBS   
Partitioning Key (WORK_DT,EMP_ID) Using Hashing;
Comment on Table IBS.T99_RESOURCE_MANAGER_PROFIT is '资源类客户经理绩效统计';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.WORK_DT is '取数时间';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.EMP_ID is '员工号';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.EMP_NM is '员工名';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.ORG_ID is '员工归属机构';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.ORG_NM is '员工归属机构名';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.BRANCH_ORG_NM is '员工归属分行名';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.POSITION_NM is '岗位';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.DEP_AVG_BAL is '统计区间存款日均';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.VUCH_CNT is '认领的凭证个数';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.REMARK1 is '备注1';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT.REMARK2 is '备注2';

--------------------------------------------------
-- Create Table IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL
--------------------------------------------------
Create table IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL (
    ACC_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    CCY_NM                         VARCHAR(10)                     ,
    DEP_AVG_BAL                    DECIMAL(18,2)                   ,
    REMARK1                        VARCHAR(250)                    ,
    WORK_DT                        TIMESTAMP                       ) 
in TS_REP   
Partitioning Key (ACC_ID) Using Hashing;
Comment on Table IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL is '资源类客户经理业绩明细';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.ACC_ID is '凭证号';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.CST_NM is '客户名';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.EMP_ID is '员工号';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.EMP_NM is '员工名';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.OPEN_DT is '开户日期';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.CCY_NM is '币种';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.DEP_AVG_BAL is '存款动态日均';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.REMARK1 is '备注';
Comment on Column IBS.T99_RESOURCE_MANAGER_PROFIT_DETAIL.WORK_DT is '取数日期';

--------------------------------------------------
-- Create Table IBS.T99_VUCH_BAL
--------------------------------------------------
Create table IBS.T99_VUCH_BAL (
    VUCH_NBR                       VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    BAL                            DECIMAL(18,2)                   ,
    AVG_BAL                        DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TLER_ACC
--------------------------------------------------
Create table IBS.TLER_ACC (
    TLER_ID                        VARCHAR(20)         NOT NULL    ,
    ACC_ID                         VARCHAR(25)         NOT NULL    ,
    TA_DATE                        VARCHAR(10)                     ,
    TA_SCO                         VARCHAR(10)                     ,
    S_DATE                         VARCHAR(20)                     ,
    E_DATE                         VARCHAR(10)                     ,
    DT_STUS                        VARCHAR(4)          NOT NULL    ,
    ACC_TYP                        VARCHAR(10)                     ,
    ACC_KIND                       VARCHAR(2)                      ,
    ORG_ID                         VARCHAR(10)                     ,
    ACC_ORG                        VARCHAR(10)                     ,
    ACC_AGREE                      VARCHAR(10)                     ,
    ACC_AGREET                     VARCHAR(10)                     ,
    ACC_FLAG                       BIGINT                          ,
    ADD_TIME                       TIMESTAMP                       ,
    PRO_ID                         VARCHAR(30)                     ) 
in TS_IBS   
Partitioning Key (TLER_ID,ACC_ID,DT_STUS) Using Hashing;
Comment on Table IBS.TLER_ACC is '认领关系-给资产负债的接口';
Comment on Column IBS.TLER_ACC.TLER_ID           is '客户经理编号';
Comment on Column IBS.TLER_ACC.ACC_ID            is '账户编号';
Comment on Column IBS.TLER_ACC.TA_DATE           is '认领时间';
Comment on Column IBS.TLER_ACC.TA_SCO            is '认领比例';
Comment on Column IBS.TLER_ACC.S_DATE            is '本月最大日期';
Comment on Column IBS.TLER_ACC.E_DATE            is '截至日期';
Comment on Column IBS.TLER_ACC.DT_STUS           is '0-暂存 1-未通过 2-已提交待审核，2.1-分行已审核 3-通过';
Comment on Column IBS.TLER_ACC.ACC_TYP           is '账户类型';
Comment on Column IBS.TLER_ACC.ACC_KIND          is '认领类型';
Comment on Column IBS.TLER_ACC.ORG_ID            is '认领人机构号';
Comment on Column IBS.TLER_ACC.ACC_ORG           is '帐号开户机构';
Comment on Column IBS.TLER_ACC.ACC_AGREE         is '审核机构(一次审核)';
Comment on Column IBS.TLER_ACC.ACC_AGREET        is '审核机构(二次审核)';
Comment on Column IBS.TLER_ACC.ACC_FLAG          is 'FLAG(是否为跨行机构)';
Comment on Column IBS.TLER_ACC.ADD_TIME          is '添加时间';
Comment on Column IBS.TLER_ACC.PRO_ID            is '所属介质号';

--------------------------------------------------
-- Create Table IBS.TMP
--------------------------------------------------
Create table IBS.TMP (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TMP_EMP_CERTIFICATE
--------------------------------------------------
Create table IBS.TMP_EMP_CERTIFICATE (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    YEAR                           CHAR(4)                         ,
    GRADE                          CHAR(20)                        ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TMP_EMP_RELA
--------------------------------------------------
Create table IBS.TMP_EMP_RELA (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    RATIO                          DECIMAL(6,2)                    ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.TMP_EMP_RELA is '认领关系（存贷款）';

--------------------------------------------------
-- Create Table IBS.TMP_T1_VUCH_DETAIL_GGPZ
--------------------------------------------------
Create table IBS.TMP_T1_VUCH_DETAIL_GGPZ (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    CST_NO                         VARCHAR(20)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    CLOSE_DT                       DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    RANK                           INTEGER                         ) 
in TS_IBS   
Partitioning Key (VUCH_NBR) Using Hashing;
Comment on Table IBS.TMP_T1_VUCH_DETAIL_GGPZ is '临时表-存储公共凭证信息';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.VUCH_NBR is '凭证号';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.VUCH_TYPE_ID is '凭证种类';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.VUCH_TYPE_NM is '凭证种类名称';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.CST_NO is '源客户号';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.ORG_ID is '机构号';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.ORG_NM is '机构名';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.BRANCH_ORG_ID is '分行机构名';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.BRANCH_ORG_NM is '分行机构号';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.OPEN_DT is '开户日期';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.CLOSE_DT is '销户日期';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.VUCH_STATUS_ID is '凭证状态';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.VUCH_STATUS_NM is '凭证状态名称';
Comment on Column IBS.TMP_T1_VUCH_DETAIL_GGPZ.RANK is '排序--去重复用';

--------------------------------------------------
-- Create Table IBS.TMP_T2_BONUS_DETAIL1
--------------------------------------------------
Create table IBS.TMP_T2_BONUS_DETAIL1 (
    SALE_ID                        VARCHAR(32)                     ,
    BONUS_TYPE_ID                  CHAR(2)                         ,
    EMP_ID                         VARCHAR(20)                     ,
    EMP_TYPE_ID                    CHAR(2)                         ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    CCY_ID                         INTEGER                         ,
    BONUS                          DECIMAL(18,2)                   ,
    BONUS_EFF_DT                   DATE                            ) 
in TS_IBS   
Partitioning Key (SALE_ID,BONUS_TYPE_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TMP_T2_EMP_DEP_LN_ACC_PROFIT_DETAIL
--------------------------------------------------
Create table IBS.TMP_T2_EMP_DEP_LN_ACC_PROFIT_DETAIL (
    ACC_ID                         VARCHAR(32)                     ,
    MEASURE_DT                     DATE                            ,
    Q_PROFIT                       DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (ACC_ID,MEASURE_DT) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TMP_T2_EMP_DEP_LN_PROFIT_SMY
--------------------------------------------------
Create table IBS.TMP_T2_EMP_DEP_LN_PROFIT_SMY (
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    PSTN_TYPE                      VARCHAR(4)                      ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  VARCHAR(4)                      ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    CCY_ID                         INTEGER                         ,
    DEP_BAL                        DECIMAL(18,3)                   ,
    DEP_MTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_QTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL                DECIMAL(18,3)                   ,
    DEP_Q_PROFIT                   DECIMAL(18,3)                   ,
    DEP_Y_PROFIT                   DECIMAL(18,3)                   ,
    IDV_DEP_BAL                    DECIMAL(18,3)                   ,
    IDV_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    IDV_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    IDV_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_BAL                    DECIMAL(18,3)                   ,
    ORG_DEP_MTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_QTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_YTD_AVG_BAL            DECIMAL(18,3)                   ,
    ORG_DEP_Q_PROFIT               DECIMAL(18,3)                   ,
    ORG_DEP_Y_PROFIT               DECIMAL(18,3)                   ,
    INTERBANK_DEP_BAL              DECIMAL(18,3)                   ,
    INTERBANK_DEP_MTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_QTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_YTD_AVG_BAL      DECIMAL(18,3)                   ,
    INTERBANK_DEP_Q_PROFIT         DECIMAL(18,3)                   ,
    INTERBANK_DEP_Y_PROFIT         DECIMAL(18,3)                   ,
    LN_BAL                         DECIMAL(18,3)                   ,
    LN_MTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_QTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_YTD_AVG_BAL                 DECIMAL(18,3)                   ,
    LN_Q_PROFIT                    DECIMAL(18,3)                   ,
    LN_Y_PROFIT                    DECIMAL(18,3)                   ,
    IDV_LN_BAL                     DECIMAL(18,3)                   ,
    IDV_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    IDV_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    IDV_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_BAL                     DECIMAL(18,3)                   ,
    ORG_LN_MTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_QTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_YTD_AVG_BAL             DECIMAL(18,3)                   ,
    ORG_LN_Q_PROFIT                DECIMAL(18,3)                   ,
    ORG_LN_Y_PROFIT                DECIMAL(18,3)                   ,
    AGRICULTURE_LN_BAL             DECIMAL(18,3)                   ,
    AGRICULTURE_LN_MTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_QTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_YTD_AVG_BAL     DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Q_PROFIT        DECIMAL(18,3)                   ,
    AGRICULTURE_LN_Y_PROFIT        DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_BAL               DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_MTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_QTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_YTD_AVG_BAL       DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Q_PROFIT          DECIMAL(18,3)                   ,
    SMALL_BIZ_LN_Y_PROFIT          DECIMAL(18,3)                   ,
    DEP_YTD_AVG_BAL_RANK           INTEGER                         ,
    LN_YTD_AVG_BAL_RANK            INTEGER                         ,
    ADD_TIME                       TIMESTAMP                       ,
    GRADE                          CHAR(20)                        ,
    LN_Q_PROFIT_MODIFY             DECIMAL(18,2)                   ,
    LN_Q_PROFIT_MODIFY_EMP         VARCHAR(6)                      ,
    LN_Q_PROFIT_MODIFY_DT          DATE                            ,
    CORP_MIDDLE_BONUS_Q            DECIMAL(18,2)                   ,
    CORP_MIDDLE_BONUS_Y            DECIMAL(18,2)                   ,
    YEAR                           CHAR(4)                         ) 
in TS_REP   
Partitioning Key (EMP_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TMP_T2_EMP_OTHER_BIZ_CST_DEP
--------------------------------------------------
Create table IBS.TMP_T2_EMP_OTHER_BIZ_CST_DEP (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    MEASURE_DT                     DATE                NOT NULL    ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    FNC_BAL                        DECIMAL(18,2)                   ,
    EMP_CNT                        INTEGER                         ) 
in TS_IBS   
Partitioning Key (CST_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.TMP_T2_EMP_OTHER_BIZ_CST_DEP is '客户存款';
Comment on Column IBS.TMP_T2_EMP_OTHER_BIZ_CST_DEP.EMP_CNT is '客户被多少个员工瓜分';

--------------------------------------------------
-- Create Table IBS.TMP_T2_EMP_OTHER_BIZ_CST_EMP_DEP
--------------------------------------------------
Create table IBS.TMP_T2_EMP_OTHER_BIZ_CST_EMP_DEP (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_ID                         VARCHAR(20)         NOT NULL    ,
    EMP_NM                         VARCHAR(64)                     ,
    MEASURE_DT                     DATE                NOT NULL    ,
    CST_OPEN_DT                    DATE                            ,
    EMP_DEP_BAL                    DECIMAL(18,2)                   ,
    EMP_FNC_BAL                    DECIMAL(18,2)                   ,
    EMP_CNT                        INTEGER                         ) 
in TS_IBS   
Partitioning Key (CST_ID,EMP_ID,MEASURE_DT) Using Hashing;
Comment on Table IBS.TMP_T2_EMP_OTHER_BIZ_CST_EMP_DEP is '员工分了客户存款';

--------------------------------------------------
-- Create Table IBS.TS_CORP_CST_DEPT_RELA
--------------------------------------------------
Create table IBS.TS_CORP_CST_DEPT_RELA (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)         NOT NULL    ,
    DEPT_NM                        VARCHAR(20)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_NM                      VARCHAR(64)                     ,
    REMARK1                        VARCHAR(254)                    ,
    REMARK2                        VARCHAR(254)                    ) 
in TS_PUB   
Partitioning Key (CST_ID) Using Hashing;
Comment on Table IBS.TS_CORP_CST_DEPT_RELA is '对公客户归属部门';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.CST_ID is '客户号';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.CST_NM is '客户名';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.DEPT_NM is '部门';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.ORG_ID is '机构号';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.ORG_NM is '机构名';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.BRANCH_NM is '分行';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.REMARK1 is '备注1';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA.REMARK2 is '备注2';

--------------------------------------------------
-- Create Table IBS.TS_CORP_CST_DEPT_RELA1
--------------------------------------------------
Create table IBS.TS_CORP_CST_DEPT_RELA1 (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)         NOT NULL    ,
    DEPT_NM                        VARCHAR(20)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(20)                     ,
    BRANCH_NM                      VARCHAR(10)                     ,
    REMARK1                        VARCHAR(254)                    ,
    REMARK2                        VARCHAR(254)                    ) 
in TS_PUB   
Partitioning Key (CST_ID) Using Hashing;
Comment on Table IBS.TS_CORP_CST_DEPT_RELA1 is '对公客户归属部门';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.CST_ID is '客户号';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.CST_NM is '客户名';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.DEPT_NM is '部门';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.ORG_ID is '机构号';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.ORG_NM is '机构名';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.BRANCH_NM is '分行';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.REMARK1 is '备注1';
Comment on Column IBS.TS_CORP_CST_DEPT_RELA1.REMARK2 is '备注2';

--------------------------------------------------
-- Create Table IBS.TS_CORP_CST_FX
--------------------------------------------------
Create table IBS.TS_CORP_CST_FX (
    WORK_DT                        TIMESTAMP           NOT NULL    ,
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_NM                      VARCHAR(64)                     ,
    DEPT_NM                        VARCHAR(64)                     ,
    DEP_BAL_2014                   DECIMAL(18,2)                   ,
    DEP_BAL_2015                   DECIMAL(18,2)                   ,
    DEP_BAL_2016                   DECIMAL(18,2)                   ,
    DEP_AVG_BAL_2014               DECIMAL(18,2)                   ,
    DEP_AVG_BAL_2015               DECIMAL(18,2)                   ,
    DEP_AVG_BAL_2016               DECIMAL(18,2)                   ,
    JF_CNT_2014                    INTEGER                         ,
    JF_CNT_2015                    INTEGER                         ,
    JF_CNT_2016                    INTEGER                         ,
    DF_CNT_2014                    INTEGER                         ,
    DF_CNT_2015                    INTEGER                         ,
    DF_CNT_2016                    INTEGER                         ,
    JF_AMT_2014                    DECIMAL(18,2)                   ,
    JF_AMT_2015                    DECIMAL(18,2)                   ,
    JF_AMT_2016                    DECIMAL(18,2)                   ,
    DF_AMT_2014                    DECIMAL(18,2)                   ,
    DF_AMT_2015                    DECIMAL(18,2)                   ,
    DF_AMT_2016                    DECIMAL(18,2)                   ,
    LN_BAL_2014                    DECIMAL(18,2)                   ,
    LN_BAL_2015                    DECIMAL(18,2)                   ,
    LN_BAL_2016                    DECIMAL(18,2)                   ,
    LN_AVG_BAL_2014                DECIMAL(18,2)                   ,
    LN_AVG_BAL_2015                DECIMAL(18,2)                   ,
    LN_AVG_BAL_2016                DECIMAL(18,2)                   ) 
in TS_PUB   
Partitioning Key (CST_ID) Using Hashing;
Comment on Table IBS.TS_CORP_CST_FX is '客户按部门分析';
Comment on Column IBS.TS_CORP_CST_FX.WORK_DT     is '提数时间';
Comment on Column IBS.TS_CORP_CST_FX.CST_ID      is '客户号';
Comment on Column IBS.TS_CORP_CST_FX.CST_NM      is '客户名';
Comment on Column IBS.TS_CORP_CST_FX.ORG_ID      is '机构号';
Comment on Column IBS.TS_CORP_CST_FX.ORG_NM      is '机构名';
Comment on Column IBS.TS_CORP_CST_FX.BRANCH_NM   is '分行';
Comment on Column IBS.TS_CORP_CST_FX.DEPT_NM     is '部门';
Comment on Column IBS.TS_CORP_CST_FX.DEP_BAL_2014 is '存款余额2014年';
Comment on Column IBS.TS_CORP_CST_FX.DEP_BAL_2015 is '存款余额2015年';
Comment on Column IBS.TS_CORP_CST_FX.DEP_BAL_2016 is '存款余额2016年';
Comment on Column IBS.TS_CORP_CST_FX.DEP_AVG_BAL_2014 is '存款日均2014年';
Comment on Column IBS.TS_CORP_CST_FX.DEP_AVG_BAL_2015 is '存款日均2015年';
Comment on Column IBS.TS_CORP_CST_FX.DEP_AVG_BAL_2016 is '存款日均2016年';
Comment on Column IBS.TS_CORP_CST_FX.JF_CNT_2014 is '借方笔数2014年';
Comment on Column IBS.TS_CORP_CST_FX.JF_CNT_2015 is '借方笔数2015年';
Comment on Column IBS.TS_CORP_CST_FX.JF_CNT_2016 is '借方笔数2016年';
Comment on Column IBS.TS_CORP_CST_FX.DF_CNT_2014 is '贷方笔数2014年';
Comment on Column IBS.TS_CORP_CST_FX.DF_CNT_2015 is '贷方笔数2015年';
Comment on Column IBS.TS_CORP_CST_FX.DF_CNT_2016 is '贷方笔数2016年';
Comment on Column IBS.TS_CORP_CST_FX.JF_AMT_2014 is '借方金额2014年';
Comment on Column IBS.TS_CORP_CST_FX.JF_AMT_2015 is '借方金额2015年';
Comment on Column IBS.TS_CORP_CST_FX.JF_AMT_2016 is '借方金额2016年';
Comment on Column IBS.TS_CORP_CST_FX.DF_AMT_2014 is '贷方金额2014年';
Comment on Column IBS.TS_CORP_CST_FX.DF_AMT_2015 is '贷方金额2015年';
Comment on Column IBS.TS_CORP_CST_FX.DF_AMT_2016 is '贷方金额2016年';
Comment on Column IBS.TS_CORP_CST_FX.LN_BAL_2014 is '贷款余额2014年';
Comment on Column IBS.TS_CORP_CST_FX.LN_BAL_2015 is '贷款余额2015年';
Comment on Column IBS.TS_CORP_CST_FX.LN_BAL_2016 is '贷款余额2016年';
Comment on Column IBS.TS_CORP_CST_FX.LN_AVG_BAL_2014 is '贷款日均2014年';
Comment on Column IBS.TS_CORP_CST_FX.LN_AVG_BAL_2015 is '贷款日均2015年';
Comment on Column IBS.TS_CORP_CST_FX.LN_AVG_BAL_2016 is '贷款日均2016年';

--------------------------------------------------
-- Create Table IBS.TS_DEP_AR_SMY_ZYL
--------------------------------------------------
Create table IBS.TS_DEP_AR_SMY_ZYL (
    AR_ID                          VARCHAR(40)         NOT NULL    ,
    MSR_PRD_ID                     INTEGER             NOT NULL    ,
    ORIG_CCY_ID                    INTEGER                         ,
    CCY_NM                         VARCHAR(64)                     ,
    CLS_BAL                        DECIMAL(18,3)                   ) 
in TS_PUB   
Partitioning Key (AR_ID) Using Hashing;
Comment on Table IBS.TS_DEP_AR_SMY_ZYL is '资源类客户经理每日存款账户明细';

--------------------------------------------------
-- Create Table IBS.TS_DEP_AR_ZYL
--------------------------------------------------
Create table IBS.TS_DEP_AR_ZYL (
    AR_ID                          VARCHAR(40)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    CST_NM                         VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    RATIO                          INTEGER                         ) 
in TS_IBS   
Partitioning Key (AR_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TS_T1_ACC_PROFIT_DETAIL_ZYL
--------------------------------------------------
Create table IBS.TS_T1_ACC_PROFIT_DETAIL_ZYL (
    AR_ID                          VARCHAR(40)                     ,
    MSR_PRD_ID                     DATE                            ,
    ORIG_CCY_ID                    INTEGER                         ,
    CLS_BAL                        DECIMAL(18,3)                   ,
    YTD_AVG_BAL                    DECIMAL(18,3)                   ,
    PROFIT                         DECIMAL(18,3)                   ) 
in TS_IBS   
Partitioning Key (AR_ID,MSR_PRD_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.TS_VUCH_BAL
--------------------------------------------------
Create table IBS.TS_VUCH_BAL (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    VUCH_TYPE_NM                   VARCHAR(20)                     ,
    MEASURE_DT                     DATE                            ,
    EMP_ID                         VARCHAR(20)                     ,
    EMP_NM                         VARCHAR(64)                     ,
    EMP_ORG_ID                     CHAR(4)                         ,
    EMP_ORG_NM                     VARCHAR(64)                     ,
    VUCH_ORG_ID                    CHAR(4)                         ,
    VUCH_ORG_NM                    VARCHAR(64)                     ,
    VUCH_BRANCH_ORG_NM             VARCHAR(64)                     ,
    OPEN_DT                        DATE                            ,
    RATIO                          DECIMAL(5,2)                    ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    DEP_AVG_BAL                    DECIMAL(18,2)                   ,
    REMARK1                        VARCHAR(200)                    ) 
in TS_IBS   
Partitioning Key (EMP_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.XNB_CST
--------------------------------------------------
Create table IBS.XNB_CST (
    CST_ID                         VARCHAR(20)         NOT NULL    ,
    CST_NM                         VARCHAR(64)                     ,
    BIRTH_DT                       DATE                            ,
    GENDER                         CHAR(2)                         ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    DEP_BAL                        DECIMAL(18,2)                   ,
    DEP_AVG_BAL                    DECIMAL(18,2)                   ,
    LN_BAL                         DECIMAL(18,2)                   ,
    LN_AVG_BAL                     DECIMAL(18,2)                   ,
    FNC_AVG                        DECIMAL(18,2)                   ,
    FNC_AVG_BAL                    DECIMAL(18,2)                   ) 
in TS_IBS   
Partitioning Key (CST_ID) Using Hashing;

--------------------------------------------------
-- Create Table IBS.XNB_VUCH
--------------------------------------------------
Create table IBS.XNB_VUCH (
    VUCH_NBR                       VARCHAR(20)         NOT NULL    ,
    VUCH_TYPE_ID                   CHAR(2)                         ,
    VUCH_TYPE_NM                   VARCHAR(64)                     ,
    WITH_CARD_F                    CHAR(1)                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_NM                         VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    BRANCH_ORG_NM                  VARCHAR(64)                     ,
    BRANCH_ORG_ID                  CHAR(4)                         ,
    OPEN_DT                        DATE                            ,
    CLOSE_DT                       DATE                            ,
    VUCH_STATUS_ID                 INTEGER                         ,
    VUCH_STATUS_NM                 VARCHAR(64)                     ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    BIZ_TYPE_ID                    CHAR(2)                         ,
    BIZ_TYPE_NM                    VARCHAR(64)                     ,
    DEPT_ID                        INTEGER                         ,
    LN_AMT                         DECIMAL(18,3)                   ,
    MARKETING_NO                   VARCHAR(40)                     ,
    EMP_ID                         VARCHAR(20)                     ,
    CST_OPEN_DT                    DATE                            ) 
in TS_REP   
Partitioning Key (VUCH_NBR) Using Hashing;




- Create Table PUB.BIZ_TP
--------------------------------------------------
Create table PUB.BIZ_TP (
    BIZ_TP_ID                      INTEGER             NOT NULL    ,
    BIZ_TP_CD                      VARCHAR(32)         NOT NULL    ,
    BIZ_TP_NM                      VARCHAR(256)                    ,
    IS_IN_USE_F                    SMALLINT                        ,
    DEL_F                          SMALLINT                        ,
    PPN_TMSTAMP                    TIMESTAMP                       ,
    ETL_FL_NM                      CHAR(18)                        ,
    SRC_STM_ID                     SMALLINT                        ,
    JOB_SEQ_ID                     INTEGER                         ,
    LAST_ETL_ACG_DT                DATE                            ) 
in TS_SINGLE   ;
Comment on Table PUB.BIZ_TP is '业务类型';
Comment on Column PUB.BIZ_TP.BIZ_TP_ID           is '业务类型 号';
Comment on Column PUB.BIZ_TP.BIZ_TP_CD           is '业务类型代码';
Comment on Column PUB.BIZ_TP.BIZ_TP_NM           is '业务类型名称';
Comment on Column PUB.BIZ_TP.IS_IN_USE_F         is '使用中标识';
Comment on Column PUB.BIZ_TP.DEL_F               is '删除标识';
Comment on Column PUB.BIZ_TP.PPN_TMSTAMP         is '数据填入时间';
Comment on Column PUB.BIZ_TP.ETL_FL_NM           is 'ETL文件名';
Comment on Column PUB.BIZ_TP.SRC_STM_ID          is '源系统号';
Comment on Column PUB.BIZ_TP.JOB_SEQ_ID          is '指令序列号';
Comment on Column PUB.BIZ_TP.LAST_ETL_ACG_DT     is '上次ETL账户日期';


--------------------------------------------------
-- Create Table PUB.CL
--------------------------------------------------
Create table PUB.CL (
    CL_ID                          INTEGER             NOT NULL    ,
    SRC_STM_ID                     SMALLINT                        ,
    CL_SCM_ID                      INTEGER             NOT NULL    ,
    CL_SCM_SEQ_NO                  SMALLINT            NOT NULL    ,
    ROOT_CL_SCM_ID                 INTEGER                         ,
    GRP_CL_ID                      INTEGER                         ,
    MGN_IP_ID                      BIGINT                          ,
    EFF_DT                         DATE                            ,
    END_DT                         DATE                            ,
    CL_UTLZ_F                      INTEGER                         ,
    CL_CODE                        CHAR(64)                        ,
    SHRT_NM                        CHAR(18)                        ,
    GEN_NO                         SMALLINT                        ,
    NM                             CHAR(64)                        ,
    DSC                            VARCHAR(256)                    ,
    LOWEST_F                       CHAR(1)                         ,
    DM_DIM_F                       SMALLINT                        ,
    ETL_FL_NM                      VARCHAR(128)                    ,
    PPN_TMSTAMP                    TIMESTAMP                       ,
    JOB_SEQ_ID                     INTEGER                         ) 
in TS_SINGLE   ;
Comment on Column PUB.CL.CL_ID                   is '类别号';
Comment on Column PUB.CL.SRC_STM_ID              is '源系统号';
Comment on Column PUB.CL.EFF_DT                  is '有效日期';
Comment on Column PUB.CL.END_DT                  is '终止日期';
Comment on Column PUB.CL.SHRT_NM                 is '缩写';
Comment on Column PUB.CL.NM                      is '名称';
Comment on Column PUB.CL.DSC                     is '说明';
Comment on Column PUB.CL.ETL_FL_NM               is 'ETL文件名';
Comment on Column PUB.CL.PPN_TMSTAMP             is '数据填入时间';
Comment on Column PUB.CL.JOB_SEQ_ID              is '指令序列号';
--------------------------------------------------
-- Create Table PUB.DEP_AR_SMY
--------------------------------------------------
Create table PUB.DEP_AR_SMY (
    AR_ID                          CHAR(20)            NOT NULL    ,
    MSR_PRD_ID                     INTEGER             NOT NULL    ,
    AR_NM                          VARCHAR(150)                    ,
    AR_TP_ID                       INTEGER             NOT NULL    ,
    DEP_TP_ID                      INTEGER             NOT NULL    ,
    ORIG_CCY_ID                    INTEGER                         ,
    CCY_NM                         VARCHAR(256)                    ,
    PRIM_CST_ID                    VARCHAR(20)                     ,
    BIZ_SBJ_ID                     INTEGER                         ,
    BIZ_SBJ_CD                     CHAR(4)                         ,
    ACG_STC_ITM_ID                 INTEGER                         ,
    ACG_SBJ_CD                     VARCHAR(10)                     ,
    ACG_SBJ_NM                     VARCHAR(256)                    ,
    OPN_BK_BAL                     DECIMAL(15,2)                   ,
    CLS_BAL                        DECIMAL(15,2)                   ,
    INTL_AMT                       DECIMAL(15,2)                   ,
    MTD_ACML_BAL                   DECIMAL(20,2)                   ,
    QTD_ACML_BAL                   DECIMAL(20,2)                   ,
    YTD_ACML_BAL                   DECIMAL(20,2)                   ,
    RPRG_OU_IP_ID                  INTEGER                         ,
    OU_CODE                        CHAR(4)                         ,
    DEP_TM_ID                      INTEGER                         ,
    AC_OPEN_DT                     DATE                            ,
    FNC_ACG_SBJ_ID                 INTEGER                         ,
    FNC_DEP_CGY_TP_ID              INTEGER                         ,
    FNC_DEP_CGY_TP_NM              VARCHAR(256)                    ,
    FNC_DEP_PRD_TP_ID              INTEGER                         ,
    FNC_DEP_PRD_TP_NM              VARCHAR(256)                    ,
    FNC_DEP_TP_ID                  INTEGER                         ,
    FNC_DEP_TP_NM                  VARCHAR(256)                    ,
    IS_GF_F                        SMALLINT                        ,
    INT_RATE                       DECIMAL(9,6)                    ,
    SPCL_AC_F                      CHAR(1)                         ,
    MAT_DT                         DATE                            ,
    BASIC_AC_TP_ID                 INTEGER                         ,
    INT_CACL_EFF_DT                DATE                            ,
    PPN_TMSTAMP                    TIMESTAMP                       ,
    ETL_FL_NM                      CHAR(18)                        ,
    SRC_STM_ID                     INTEGER                         ,
    JOB_SEQ_ID                     INTEGER                         ,
    LAST_ETL_ACG_DT                DATE                            ,
    DEL_F                          SMALLINT                        ,
    AR_LCS_TP_ID                   INTEGER                         ,
    ACML_INT                       DECIMAL(15,2)                   ,
    NBR_OF_DEP_WD_INTVL_MTH        INTEGER                         ,
    EACH_DEPING_WDING_AMT          DECIMAL(15,2)                   ,
    ACT_INT_RATE                   DECIMAL(9,6)                    ,
    RATE_CD                        CHAR(3)                         ,
    BASE_INT_RATE                  DECIMAL(9,6)                    ,
    VAR_INT_RATE_TP_ID             INTEGER                         ,
    VAR_INT_RATE_VAL               DECIMAL(9,6)                    ,
    END_DT                         DATE                            ,
    DB_AMT                         DECIMAL(20,2)                   ,
    CR_AMT                         DECIMAL(20,2)                   ,
    NBR_MTH_DEP_TM                 INTEGER                         ,
    NBR_DAY_DEP_TM                 INTEGER                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    FTP                            DECIMAL(9,6)                    ,
    D_PROFIT                       DECIMAL(20,3)                   ,
    M_PROFIT                       DECIMAL(20,3)                   ,
    Q_PROFIT                       DECIMAL(20,3)                   ,
    Y_PROFIT                       DECIMAL(20,3)                   ,
    CSH_X_RMIT_IND_TP_ID           INTEGER                         ,
    LAST_TXN_DT                    DATE                            ,
    LAST_CST_TXN_DT                DATE                            ,
    FST_TXN_DT                     DATE                            ,
    SMLT_INT                       DECIMAL(15,2)                   ,
    YTD_ACML_SMLT_INT              DECIMAL(20,2)                   ,
    DEP_LINE_ID                    INTEGER                         ,
    CST_NO                         VARCHAR(32)                     ,
    YTD_ACML_BAL_LAST_YR           DECIMAL(20,2)                   ,
    ACML_BAL_90D                   DECIMAL(20,2)                   ,
    ACML_BAL_120D                  DECIMAL(20,2)                   ,
    ACML_BAL_180D                  DECIMAL(20,2)                   ,
    TQZQ_AMT                       DECIMAL(20,2)                   )    
Partitioning Key (AR_ID,MSR_PRD_ID) Using Hashing
Compress Yes;
Comment on Table PUB.DEP_AR_SMY is '存款账户汇总';
Comment on Column PUB.DEP_AR_SMY.AR_ID           is '账户号';
Comment on Column PUB.DEP_AR_SMY.MSR_PRD_ID      is '度量期号';
Comment on Column PUB.DEP_AR_SMY.AR_NM           is '帐户名称';
Comment on Column PUB.DEP_AR_SMY.AR_TP_ID        is '帐户类型号';
Comment on Column PUB.DEP_AR_SMY.DEP_TP_ID       is '存款类型号';
Comment on Column PUB.DEP_AR_SMY.ORIG_CCY_ID     is '源货币号';
Comment on Column PUB.DEP_AR_SMY.CCY_NM          is '货币名称';
Comment on Column PUB.DEP_AR_SMY.PRIM_CST_ID     is '主客户号';
Comment on Column PUB.DEP_AR_SMY.BIZ_SBJ_ID      is '业务科目号';
Comment on Column PUB.DEP_AR_SMY.BIZ_SBJ_CD      is '业务科目代码';
Comment on Column PUB.DEP_AR_SMY.ACG_STC_ITM_ID  is '会计结构项目号';
Comment on Column PUB.DEP_AR_SMY.ACG_SBJ_CD      is '会计科目代码';
Comment on Column PUB.DEP_AR_SMY.ACG_SBJ_NM      is '会计科目名称';
Comment on Column PUB.DEP_AR_SMY.OPN_BK_BAL      is '初始余额';
Comment on Column PUB.DEP_AR_SMY.CLS_BAL         is '期末余额';
Comment on Column PUB.DEP_AR_SMY.INTL_AMT        is '开户金额';
Comment on Column PUB.DEP_AR_SMY.MTD_ACML_BAL    is '月累计余额';
Comment on Column PUB.DEP_AR_SMY.QTD_ACML_BAL    is '季度累计余额';
Comment on Column PUB.DEP_AR_SMY.YTD_ACML_BAL    is '年度累计余额';
Comment on Column PUB.DEP_AR_SMY.RPRG_OU_IP_ID   is '代表机构号';
Comment on Column PUB.DEP_AR_SMY.OU_CODE         is '机构代码';
Comment on Column PUB.DEP_AR_SMY.DEP_TM_ID       is '存款方式';
Comment on Column PUB.DEP_AR_SMY.AC_OPEN_DT      is '有效日期';
Comment on Column PUB.DEP_AR_SMY.FNC_ACG_SBJ_ID  is '财务账户科目号';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_CGY_TP_ID is '财务存款类别号';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_CGY_TP_NM is '财务存款类型名称';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_PRD_TP_ID is '财务存款周期类型号';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_PRD_TP_NM is '财务存款周期类型名称';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_TP_ID   is '财务存款类型号';
Comment on Column PUB.DEP_AR_SMY.FNC_DEP_TP_NM   is '财务存款类型名称';
Comment on Column PUB.DEP_AR_SMY.IS_GF_F         is '保证金标识';
Comment on Column PUB.DEP_AR_SMY.INT_RATE        is '利率';
Comment on Column PUB.DEP_AR_SMY.SPCL_AC_F       is '特殊帐户标识';
Comment on Column PUB.DEP_AR_SMY.MAT_DT          is '到期日';
Comment on Column PUB.DEP_AR_SMY.BASIC_AC_TP_ID  is '基本账户类型号';
Comment on Column PUB.DEP_AR_SMY.INT_CACL_EFF_DT is '利息计算起始日期';
Comment on Column PUB.DEP_AR_SMY.PPN_TMSTAMP     is '数据填入时间';
Comment on Column PUB.DEP_AR_SMY.ETL_FL_NM       is 'ETL文件名';
Comment on Column PUB.DEP_AR_SMY.SRC_STM_ID      is '源系统号';
Comment on Column PUB.DEP_AR_SMY.JOB_SEQ_ID      is '指令序列号';
Comment on Column PUB.DEP_AR_SMY.LAST_ETL_ACG_DT is '上次ETL账户日期';
Comment on Column PUB.DEP_AR_SMY.DEL_F           is '删除标识';
Comment on Column PUB.DEP_AR_SMY.AR_LCS_TP_ID    is '账户生命周期状态类型号';
Comment on Column PUB.DEP_AR_SMY.ACML_INT        is '累计利息';
Comment on Column PUB.DEP_AR_SMY.NBR_OF_DEP_WD_INTVL_MTH is '支取/续存间隔月数';
Comment on Column PUB.DEP_AR_SMY.EACH_DEPING_WDING_AMT is '每次支取/续存金额';
Comment on Column PUB.DEP_AR_SMY.ACT_INT_RATE    is '执行利率';
Comment on Column PUB.DEP_AR_SMY.RATE_CD         is '利率代码';
Comment on Column PUB.DEP_AR_SMY.BASE_INT_RATE   is '基准利率';
Comment on Column PUB.DEP_AR_SMY.VAR_INT_RATE_TP_ID is '浮动利率类型';
Comment on Column PUB.DEP_AR_SMY.VAR_INT_RATE_VAL is '浮动利率值';
Comment on Column PUB.DEP_AR_SMY.END_DT          is '销户日期';
Comment on Column PUB.DEP_AR_SMY.DB_AMT          is '借方发生额';
Comment on Column PUB.DEP_AR_SMY.CR_AMT          is '贷方发生额';
Comment on Column PUB.DEP_AR_SMY.NBR_MTH_DEP_TM  is '期限月';
Comment on Column PUB.DEP_AR_SMY.NBR_DAY_DEP_TM  is '期限日';
Comment on Column PUB.DEP_AR_SMY.PROD_ID         is '产品编号';
Comment on Column PUB.DEP_AR_SMY.PROD_NM         is '产品名称';
Comment on Column PUB.DEP_AR_SMY.FTP             is 'FTP';
Comment on Column PUB.DEP_AR_SMY.D_PROFIT        is '本日贡献度';
Comment on Column PUB.DEP_AR_SMY.M_PROFIT        is '本月贡献度';
Comment on Column PUB.DEP_AR_SMY.Q_PROFIT        is '本季贡献度';
Comment on Column PUB.DEP_AR_SMY.Y_PROFIT        is '本年贡献度';
Comment on Column PUB.DEP_AR_SMY.CSH_X_RMIT_IND_TP_ID is '现金/汇款标志';
Comment on Column PUB.DEP_AR_SMY.LAST_TXN_DT     is '最后财务交易日';
Comment on Column PUB.DEP_AR_SMY.LAST_CST_TXN_DT is '最后客户财务交易日(20100101以后)';
Comment on Column PUB.DEP_AR_SMY.FST_TXN_DT      is '首笔财务交易日(20100101以后)';
Comment on Column PUB.DEP_AR_SMY.SMLT_INT        is '模拟利息';
Comment on Column PUB.DEP_AR_SMY.YTD_ACML_SMLT_INT is '年度累计模拟利息';
Comment on Column PUB.DEP_AR_SMY.DEP_LINE_ID     is '存款部门编码';
Comment on Column PUB.DEP_AR_SMY.CST_NO          is '核心客户号';
Comment on Column PUB.DEP_AR_SMY.YTD_ACML_BAL_LAST_YR is '年度累计余额-去年';
Comment on Column PUB.DEP_AR_SMY.ACML_BAL_90D    is '累计余额-90天';
Comment on Column PUB.DEP_AR_SMY.ACML_BAL_120D   is '累计余额-120天';
Comment on Column PUB.DEP_AR_SMY.ACML_BAL_180D   is '累计余额-180天';
Comment on Column PUB.DEP_AR_SMY.TQZQ_AMT        is '提前支取发生额';



--------------------------------------------------
-- Create Table PUB.LN_AR_SMY
--------------------------------------------------
Create table PUB.LN_AR_SMY (
    MSR_PRD_ID                     INTEGER             NOT NULL    ,
    BIZ_DIL_NBR                    VARCHAR(64)         NOT NULL    ,
    ACG_SBJ_ID                     INTEGER                         ,
    BIZ_TP_CD                      VARCHAR(32)                     ,
    CCY_ID                         INTEGER                         ,
    CST_ID                         VARCHAR(20)                     ,
    CST_TP_ID                      INTEGER                         ,
    CST_NO                         VARCHAR(32)                     ,
    CST_NM                         VARCHAR(150)                    ,
    CORE_BNK_OU_IP_ID              INTEGER                         ,
    CTR_ALIAS_NBR                  VARCHAR(64)                     ,
    CTR_NBR                        VARCHAR(64)                     ,
    LN_FIVE_TIER_CL_TP_ID          INTEGER                         ,
    LN_TP_ID                       INTEGER                         ,
    LN_GNT_TP_ID                   INTEGER                         ,
    LN_FNC_STS_TP_ID               INTEGER                         ,
    LN_DRDN_TP_ID                  INTEGER                         ,
    LN_DIRC_TP_CD                  VARCHAR(8)                      ,
    LN_RPYMT_PRD_TP_ID             INTEGER                         ,
    LN_PUS_DSC                     VARCHAR(256)                    ,
    FM_RLT_LN_TP_CD                VARCHAR(8)                      ,
    FM_RLT_LN_F                    SMALLINT                        ,
    OPTG_OU_IP_ID                  INTEGER                         ,
    IS_ORG_F                       SMALLINT                        ,
    NBR_MTH_LN_TM                  SMALLINT                        ,
    NBR_DAY_LN_TM                  INTEGER                         ,
    CTR_AMT                        DECIMAL(15,2)                   ,
    CTR_BAL                        DECIMAL(15,2)                   ,
    INT_DUE_OFF_BST_PART           DECIMAL(15,2)                   ,
    INT_DUE_ON_BST_PART            DECIMAL(15,2)                   ,
    LN_DRDN_AMT                    DECIMAL(15,2)                   ,
    MTD_ACML_DRDN_AMT              DECIMAL(20,2)                   ,
    MTD_ACML_BAL                   DECIMAL(20,2)                   ,
    QTD_ACML_DRDN_AMT              DECIMAL(20,2)                   ,
    QTD_ACML_BAL                   DECIMAL(20,2)                   ,
    YTD_ACML_DRDN_AMT              DECIMAL(20,2)                   ,
    YTD_ACML_BAL                   DECIMAL(20,2)                   ,
    LN_BAL                         DECIMAL(15,2)                   ,
    ACML_LN_DRDN_AMT               DECIMAL(15,2)                   ,
    LN_INT_RATE                    DECIMAL(9,6)                    ,
    CTR_MAT_DT                     DATE                            ,
    CTR_EFF_DT                     DATE                            ,
    LN_DRDN_DT                     DATE                            ,
    LN_MAT_DT                      DATE                            ,
    END_DT                         DATE                            ,
    GUR_RATE                       DECIMAL(9,6)                    ,
    MNG_LINE_TP_ID                 INTEGER                         ,
    DELR_ORG_NM                    VARCHAR(256)                    ,
    DEVR_ORG_NM                    VARCHAR(256)                    ,
    BLDG_AREA                      DECIMAL(24,6)                   ,
    RPYMT_IN_ADV_TP                VARCHAR(20)                     ,
    AC_MGR_TLR_ID                  INTEGER                         ,
    ASTN_AC_MGR_NM                 VARCHAR(32)                     ,
    LN_RATE_VRIC_VAL               DECIMAL(10,7)                   ,
    BA_DB_INT_RATE                 DECIMAL(9,6)                    ,
    IDV_LN_PNP_ODUE_PARE           DECIMAL(20,2)                   ,
    IDV_LN_OTSND_INT               DECIMAL(20,2)                   ,
    NBR_IDV_LN_ODUE                INTEGER                         ,
    ACT_INT_INCM                   DECIMAL(15,2)                   ,
    EXTD_DT                        VARCHAR(20)                     ,
    NML_BAL                        DECIMAL(15,2)                   ,
    ODUE_BAL                       DECIMAL(15,2)                   ,
    DULL_BAL                       DECIMAL(15,2)                   ,
    BAD_DEBT_BAL                   DECIMAL(15,2)                   ,
    INT_CACL_PRD_TP_ID             INTEGER                         ,
    MEAG_PFT_ITM_F                 INTEGER                         ,
    STU_LN_TP_ID                   INTEGER                         ,
    SCOL_TP_ID                     INTEGER                         ,
    NBR_ODUE_DAYS                  INTEGER                         ,
    MTHLY_UD_ODUE_DT               DATE                            ,
    LN_PNP_RPYMT_TP_ID             INTEGER                         ,
    LN_RATE_AJTMT_TP_ID            INTEGER                         ,
    CST_CGY_TP_ID                  INTEGER                         ,
    ACR_INT_INCM                   DECIMAL(15,2)                   ,
    AR_TP_ID                       INTEGER                         ,
    PROD_ID                        CHAR(10)                        ,
    PROD_NM                        VARCHAR(64)                     ,
    DEAL_ASSET                     VARCHAR(20)                     ,
    INT_ODUE_DAYS                  INTEGER                         ,
    DIS_FLAG                       VARCHAR(2)                      ,
    RUN_MODEL                      VARCHAR(10)                     ,
    BA_DB_INT_RATE_TP_ID           INTEGER                         ,
    BIZ_LCNS_TP_ID                 INTEGER                         ,
    W_BIZ_LCNS_F                   INTEGER                         ,
    ST_LINE_TP_ID                  INTEGER                         ,
    YMZ_CCY                        VARCHAR(3)                      ,
    YMZ_GURT_TYPE                  VARCHAR(2)                      ,
    YMZ_INRAT_FLOT_TYPE            VARCHAR(10)                     ,
    YMZ_REPY_MODE_ID               VARCHAR(10)                     ,
    YMZ_BAD_LOAN_FLAG_ID           VARCHAR(1)                      ,
    YMZ_REPY_FREQ_ID               VARCHAR(10)                     ,
    YMZ_BENM_INRAT_TYPE            VARCHAR(10)                     ,
    YMZ_INRS_TYPE                  VARCHAR(2)                      ,
    PROD_CD_CORE                   VARCHAR(30)                     ,
    PROD_NM_CORE                   VARCHAR(500)                    ,
    OPEN_ACCT_DT                   DATE                            ,
    STRT_INT_CALN_DT               DATE                            ,
    ACD_NON_ACD_STE                VARCHAR(1)                      ,
    LOAN_ACCT_STE                  VARCHAR(1)                      ,
    RCVBL_ACD_INT                  DECIMAL(21,2)                   ,
    URGE_COLLT_ACD_INT             DECIMAL(21,2)                   ,
    RCVBL_DB_INT                   DECIMAL(21,2)                   ,
    URGE_COLLT_DB_INT              DECIMAL(21,2)                   ,
    RCVBL_ACD_PNLY_INT             DECIMAL(21,2)                   ,
    URGE_COLLT_ACD_PNLY_INT        DECIMAL(21,2)                   ,
    RCVBL_PNLY_INT                 DECIMAL(21,2)                   ,
    URGE_COLLT_PNLY_INT            DECIMAL(21,2)                   ,
    ACD_CMPD_INT                   DECIMAL(21,2)                   ,
    CMPD_INT                       DECIMAL(21,2)                   ,
    ACD_SUBSD_INT                  DECIMAL(21,2)                   ,
    RCVBL_SUBSD_INT                DECIMAL(21,2)                   ,
    WAIT_AMRTN_INT                 DECIMAL(21,2)                   ,
    CHK_WRITE_OFF_PRCPL            DECIMAL(21,2)                   ,
    CHK_WRITE_OFF_INT              DECIMAL(21,2)                   ,
    ALRDY_ACRL_LOAN_INT            DECIMAL(21,2)                   ,
    ALRDY_CHK_WRITE_OFF_PRCPL_INT  DECIMAL(21,2)                   ,
    FINAL_FINC_TXN_DT              DATE                            ,
    DUE_BILL_CHARIC                VARCHAR(1)                      ,
    CNCL_ACCT_DT                   DATE                            ,
    ALRDY_DERT_PRCPL               DECIMAL(21,2)                   ,
    ALRDY_DERT_INT                 DECIMAL(21,2)                   ,
    SPEC_LOAN_TYPE                 VARCHAR(2)                      ,
    TRFR_JQ_FLG                    VARCHAR(2)                      ,
    ETL_FL_NM                      VARCHAR(30)                     ,
    YMZ_PRDU_NUM                   VARCHAR(32)                     ,
    YMZ_AGR_TYPE                   VARCHAR(4)                      ,
    YMZ_REST_CYCL                  VARCHAR(2)                      ,
    YMZ_IF_CYCL                    VARCHAR(1)                      ,
    YMZ_RISK_CLASS                 VARCHAR(10)                     ,
    PAY_MODE_ID                    INTEGER                         ,
    NXT_REPYPNP_DT                 DATE                            ,
    NXT_REPYINT_DT                 DATE                            ,
    NML_BAL_BIZ_SBJ_CD             VARCHAR(32)                     ,
    ODUE_BAL_BIZ_SBJ_CD            VARCHAR(32)                     ,
    DULL_BAL_BIZ_SBJ_CD            VARCHAR(32)                     ,
    BAD_DEBT_BAL_BIZ_SBJ_CD        VARCHAR(32)                     ,
    NRL_INT_RATE                   DECIMAL(12,7)                   ,
    OVDUE_INT_RATE                 DECIMAL(12,7)                   ,
    APED_SYND_FLAG                 VARCHAR(8)                      ,
    STATIS                         VARCHAR(20)                     )    
Partitioning Key (MSR_PRD_ID,BIZ_DIL_NBR) Using Hashing
Compress Yes;
Comment on Table PUB.LN_AR_SMY is '贷款账户汇总';
Comment on Column PUB.LN_AR_SMY.MSR_PRD_ID       is '度量日期';
Comment on Column PUB.LN_AR_SMY.BIZ_DIL_NBR      is '业务借据编号';
Comment on Column PUB.LN_AR_SMY.ACG_SBJ_ID       is '账户科目号';
Comment on Column PUB.LN_AR_SMY.BIZ_TP_CD        is '业务类型代码';
Comment on Column PUB.LN_AR_SMY.CCY_ID           is '货币代号';
Comment on Column PUB.LN_AR_SMY.CST_ID           is '客户号';
Comment on Column PUB.LN_AR_SMY.CST_TP_ID        is '涉农主体类型号';
Comment on Column PUB.LN_AR_SMY.CST_NO           is '信贷系统源客户号';
Comment on Column PUB.LN_AR_SMY.CST_NM           is '客户名称';
Comment on Column PUB.LN_AR_SMY.CORE_BNK_OU_IP_ID is '核心银行机构号';
Comment on Column PUB.LN_AR_SMY.CTR_ALIAS_NBR    is '合同别名编号';
Comment on Column PUB.LN_AR_SMY.CTR_NBR          is '合同编号';
Comment on Column PUB.LN_AR_SMY.LN_FIVE_TIER_CL_TP_ID is '贷款五级分类类型号';
Comment on Column PUB.LN_AR_SMY.LN_TP_ID         is '贷款类型ID';
Comment on Column PUB.LN_AR_SMY.LN_GNT_TP_ID     is '贷款担保类型ID';
Comment on Column PUB.LN_AR_SMY.LN_FNC_STS_TP_ID is '贷款财务状态 类型号';
Comment on Column PUB.LN_AR_SMY.LN_DRDN_TP_ID    is '贷款放款 类型号';
Comment on Column PUB.LN_AR_SMY.LN_DIRC_TP_CD    is '贷款方向类型 代码';
Comment on Column PUB.LN_AR_SMY.LN_RPYMT_PRD_TP_ID is '贷款还款期限类型号';
Comment on Column PUB.LN_AR_SMY.LN_PUS_DSC       is '贷款目的描述';
Comment on Column PUB.LN_AR_SMY.FM_RLT_LN_TP_CD  is '农户相关贷款类型代码';
Comment on Column PUB.LN_AR_SMY.FM_RLT_LN_F      is '农户相关贷款标识';
Comment on Column PUB.LN_AR_SMY.OPTG_OU_IP_ID    is '运营机构号';
Comment on Column PUB.LN_AR_SMY.IS_ORG_F         is '是否是组织标识';
Comment on Column PUB.LN_AR_SMY.NBR_MTH_LN_TM    is '月贷款期限数量';
Comment on Column PUB.LN_AR_SMY.NBR_DAY_LN_TM    is '期限天';
Comment on Column PUB.LN_AR_SMY.CTR_AMT          is '合同金额';
Comment on Column PUB.LN_AR_SMY.CTR_BAL          is '合同余额';
Comment on Column PUB.LN_AR_SMY.INT_DUE_OFF_BST_PART is '表外欠息余额';
Comment on Column PUB.LN_AR_SMY.INT_DUE_ON_BST_PART is '表内欠息余额';
Comment on Column PUB.LN_AR_SMY.LN_DRDN_AMT      is '贷款放款金额';
Comment on Column PUB.LN_AR_SMY.MTD_ACML_DRDN_AMT is '月累计放款金额';
Comment on Column PUB.LN_AR_SMY.MTD_ACML_BAL     is '月累计余额';
Comment on Column PUB.LN_AR_SMY.QTD_ACML_DRDN_AMT is '季度累计方案金额';
Comment on Column PUB.LN_AR_SMY.QTD_ACML_BAL     is '季度累计余额';
Comment on Column PUB.LN_AR_SMY.YTD_ACML_DRDN_AMT is '年度累计放款金额';
Comment on Column PUB.LN_AR_SMY.YTD_ACML_BAL     is '年度累计余额';
Comment on Column PUB.LN_AR_SMY.LN_BAL           is '贷款余额';
Comment on Column PUB.LN_AR_SMY.ACML_LN_DRDN_AMT is '累计贷款放款金额';
Comment on Column PUB.LN_AR_SMY.LN_INT_RATE      is '贷款利率';
Comment on Column PUB.LN_AR_SMY.CTR_MAT_DT       is '合同到期日';
Comment on Column PUB.LN_AR_SMY.CTR_EFF_DT       is '合同有效日期';
Comment on Column PUB.LN_AR_SMY.LN_DRDN_DT       is '贷款放款日期';
Comment on Column PUB.LN_AR_SMY.LN_MAT_DT        is '贷款到期日';
Comment on Column PUB.LN_AR_SMY.END_DT           is '终止日期';
Comment on Column PUB.LN_AR_SMY.GUR_RATE         is '保证金比例';
Comment on Column PUB.LN_AR_SMY.MNG_LINE_TP_ID   is '管理口径';
Comment on Column PUB.LN_AR_SMY.DELR_ORG_NM      is '经销商';
Comment on Column PUB.LN_AR_SMY.DEVR_ORG_NM      is '开发商';
Comment on Column PUB.LN_AR_SMY.BLDG_AREA        is '建筑面积';
Comment on Column PUB.LN_AR_SMY.RPYMT_IN_ADV_TP  is '提前还款方式';
Comment on Column PUB.LN_AR_SMY.AC_MGR_TLR_ID    is '主办客户经理';
Comment on Column PUB.LN_AR_SMY.ASTN_AC_MGR_NM   is '协办客户经理';
Comment on Column PUB.LN_AR_SMY.LN_RATE_VRIC_VAL is '浮动值';
Comment on Column PUB.LN_AR_SMY.BA_DB_INT_RATE   is '基准利率';
Comment on Column PUB.LN_AR_SMY.IDV_LN_PNP_ODUE_PARE is '逾期贷款本金';
Comment on Column PUB.LN_AR_SMY.IDV_LN_OTSND_INT is '逾期贷款欠息';
Comment on Column PUB.LN_AR_SMY.NBR_IDV_LN_ODUE  is '逾期笔数';
Comment on Column PUB.LN_AR_SMY.ACT_INT_INCM     is '实际利息收益';
Comment on Column PUB.LN_AR_SMY.EXTD_DT          is '展期日期';
Comment on Column PUB.LN_AR_SMY.NML_BAL          is '正常余额';
Comment on Column PUB.LN_AR_SMY.ODUE_BAL         is '逾期余额';
Comment on Column PUB.LN_AR_SMY.DULL_BAL         is '呆滞余额';
Comment on Column PUB.LN_AR_SMY.BAD_DEBT_BAL     is '呆账余额';
Comment on Column PUB.LN_AR_SMY.INT_CACL_PRD_TP_ID is '利息计算周期类型号';
Comment on Column PUB.LN_AR_SMY.MEAG_PFT_ITM_F   is '是否微利项目标志';
Comment on Column PUB.LN_AR_SMY.STU_LN_TP_ID     is '助学贷款类型';
Comment on Column PUB.LN_AR_SMY.SCOL_TP_ID       is '学校类型';
Comment on Column PUB.LN_AR_SMY.NBR_ODUE_DAYS    is '逾期天数';
Comment on Column PUB.LN_AR_SMY.MTHLY_UD_ODUE_DT is '逾期日期(月更新)';
Comment on Column PUB.LN_AR_SMY.LN_PNP_RPYMT_TP_ID is '本金还款方式';
Comment on Column PUB.LN_AR_SMY.LN_RATE_AJTMT_TP_ID is '利率调整方式';
Comment on Column PUB.LN_AR_SMY.CST_CGY_TP_ID    is '客户类型';
Comment on Column PUB.LN_AR_SMY.ACR_INT_INCM     is '应收利息';
Comment on Column PUB.LN_AR_SMY.AR_TP_ID         is '账户类型';
Comment on Column PUB.LN_AR_SMY.PROD_ID          is '产品编号';
Comment on Column PUB.LN_AR_SMY.PROD_NM          is '产品名称';
Comment on Column PUB.LN_AR_SMY.DEAL_ASSET       is '0正常1资产处置2核销';
Comment on Column PUB.LN_AR_SMY.INT_ODUE_DAYS    is '利息逾期天数';
Comment on Column PUB.LN_AR_SMY.DIS_FLAG         is '是否贴息';
Comment on Column PUB.LN_AR_SMY.RUN_MODEL        is '运作模式';
Comment on Column PUB.LN_AR_SMY.BA_DB_INT_RATE_TP_ID is '基准利率类型';
Comment on Column PUB.LN_AR_SMY.BIZ_LCNS_TP_ID   is '营业执照类型';
Comment on Column PUB.LN_AR_SMY.W_BIZ_LCNS_F     is '是否具有工商营业执照';
Comment on Column PUB.LN_AR_SMY.ST_LINE_TP_ID    is '统计口径';
Comment on Column PUB.LN_AR_SMY.YMZ_CCY          is '源币种(ccyCode)';
Comment on Column PUB.LN_AR_SMY.YMZ_GURT_TYPE    is '源主要担保方式（grauMode）';
Comment on Column PUB.LN_AR_SMY.YMZ_INRAT_FLOT_TYPE is '源利率浮动类型';
Comment on Column PUB.LN_AR_SMY.YMZ_BAD_LOAN_FLAG_ID is '资产转让标志 1非洁净(公司)、2非洁净(个人)';
Comment on Column PUB.LN_AR_SMY.YMZ_BENM_INRAT_TYPE is '源基准利率类型';
Comment on Column PUB.LN_AR_SMY.YMZ_INRS_TYPE    is '源计息方式_合同';
Comment on Column PUB.LN_AR_SMY.PROD_NM_CORE     is '产品名称（核心）';
Comment on Column PUB.LN_AR_SMY.OPEN_ACCT_DT     is '开户日期';
Comment on Column PUB.LN_AR_SMY.STRT_INT_CALN_DT is '起息日期';
Comment on Column PUB.LN_AR_SMY.ACD_NON_ACD_STE  is '应计非应计状态';
Comment on Column PUB.LN_AR_SMY.LOAN_ACCT_STE    is '贷款账户状态0正常1销户2已核销3准销户4录入5已减免';
Comment on Column PUB.LN_AR_SMY.RCVBL_ACD_INT    is '应收应计利息';
Comment on Column PUB.LN_AR_SMY.URGE_COLLT_ACD_INT is '催收应计利息';
Comment on Column PUB.LN_AR_SMY.RCVBL_DB_INT     is '应收欠息';
Comment on Column PUB.LN_AR_SMY.URGE_COLLT_DB_INT is '催收欠息';
Comment on Column PUB.LN_AR_SMY.RCVBL_ACD_PNLY_INT is '应收应计罚息';
Comment on Column PUB.LN_AR_SMY.URGE_COLLT_ACD_PNLY_INT is '催收应计罚息';
Comment on Column PUB.LN_AR_SMY.RCVBL_PNLY_INT   is '应收罚息';
Comment on Column PUB.LN_AR_SMY.URGE_COLLT_PNLY_INT is '催收罚息';
Comment on Column PUB.LN_AR_SMY.ACD_CMPD_INT     is '应计复息';
Comment on Column PUB.LN_AR_SMY.CMPD_INT         is '复息';
Comment on Column PUB.LN_AR_SMY.ACD_SUBSD_INT    is '应计贴息';
Comment on Column PUB.LN_AR_SMY.RCVBL_SUBSD_INT  is '应收贴息';
Comment on Column PUB.LN_AR_SMY.WAIT_AMRTN_INT   is '待摊利息';
Comment on Column PUB.LN_AR_SMY.CHK_WRITE_OFF_PRCPL is '核销本金';
Comment on Column PUB.LN_AR_SMY.CHK_WRITE_OFF_INT is '核销利息';
Comment on Column PUB.LN_AR_SMY.ALRDY_ACRL_LOAN_INT is '已计提贷款利息';
Comment on Column PUB.LN_AR_SMY.ALRDY_CHK_WRITE_OFF_PRCPL_INT is '已核销本金利息';
Comment on Column PUB.LN_AR_SMY.FINAL_FINC_TXN_DT is '最后财务交易日';
Comment on Column PUB.LN_AR_SMY.DUE_BILL_CHARIC  is '借据性质';
Comment on Column PUB.LN_AR_SMY.CNCL_ACCT_DT     is '销户日期';
Comment on Column PUB.LN_AR_SMY.ALRDY_DERT_PRCPL is '已减免本金';
Comment on Column PUB.LN_AR_SMY.ALRDY_DERT_INT   is '已减免利息';
Comment on Column PUB.LN_AR_SMY.SPEC_LOAN_TYPE   is '特殊贷款类型(00不适用01网贷02中信云企)';
Comment on Column PUB.LN_AR_SMY.TRFR_JQ_FLG      is '转让结清标志(00不适用01公司类为批量转让不良资产02个人类为债权收益权转让资产03转让结清)';
Comment on Column PUB.LN_AR_SMY.ETL_FL_NM        is '借据ETL文件名';
Comment on Column PUB.LN_AR_SMY.YMZ_PRDU_NUM     is '源产品编号_合同';
Comment on Column PUB.LN_AR_SMY.YMZ_AGR_TYPE     is '源是否涉农_合同';
Comment on Column PUB.LN_AR_SMY.YMZ_REST_CYCL    is '源结息周期_合同';
Comment on Column PUB.LN_AR_SMY.YMZ_IF_CYCL      is '源是否循环(comnIfFlag)_合同';
Comment on Column PUB.LN_AR_SMY.PAY_MODE_ID      is '支付方式';
Comment on Column PUB.LN_AR_SMY.NXT_REPYPNP_DT   is '下次还本日';
Comment on Column PUB.LN_AR_SMY.NXT_REPYINT_DT   is '下次还息日';
Comment on Column PUB.LN_AR_SMY.NML_BAL_BIZ_SBJ_CD is '正常本金业务代号';
Comment on Column PUB.LN_AR_SMY.ODUE_BAL_BIZ_SBJ_CD is '逾期本金业务代号';
Comment on Column PUB.LN_AR_SMY.DULL_BAL_BIZ_SBJ_CD is '呆滞本金业务代号';
Comment on Column PUB.LN_AR_SMY.BAD_DEBT_BAL_BIZ_SBJ_CD is '呆账本金业务代号';
Comment on Column PUB.LN_AR_SMY.NRL_INT_RATE     is '正常利率';
Comment on Column PUB.LN_AR_SMY.OVDUE_INT_RATE   is '逾期利率';
Comment on Column PUB.LN_AR_SMY.APED_SYND_FLAG   is '银团贷款总借据子借据标识 1总借据 2子借据';
Comment on Column PUB.LN_AR_SMY.STATIS           is '统计字';
-- Create Table PUB.PERSONNEL_RURAL
--------------------------------------------------
Create table PUB.PERSONNEL (
    PER_ID                         CHAR(6)             NOT NULL    ,
    PER_NAME                       VARCHAR(64)                     ,
    CUST_ID                        VARCHAR(20)                     ,
    PER_SEX                        CHAR(10)                        ,
    PER_BIRTHDAY                   DATE                            ,
    PER_IDENT_TYPE                 INTEGER                         ,
    PER_IDENT                      CHAR(18)                        ,
    HR_STATUS                      CHAR(2)                         ,
    PER_TYPE                       INTEGER                         ,
    PER_TYPE_NAME                  VARCHAR(64)                     ,
    PER_BRANCH_ID                  CHAR(4)                         ,
    PER_BRANCH                     VARCHAR(64)                     ,
    ORG_ID                         CHAR(4)                         ,
    ORG_NM                         VARCHAR(64)                     ,
    PER_TX                         VARCHAR(5)                      ,
    HR_ORG_ID                      INTEGER                         ,
    HR_ORG_NAME                    VARCHAR(64)                     ,
    BOSS_FLAG                      VARCHAR(10)                     ,
    PER_POSTITION                  INTEGER                         ,
    PER_POSTITION_NAME             VARCHAR(64)                     ,
    PSTN_TYPE                      CHAR(4)                         ,
    PSTN_TYPE_NM                   VARCHAR(64)                     ,
    SUB_PSTN_TYPE                  CHAR(4)                         ,
    SUB_PSTN_TYPE_NM               VARCHAR(64)                     ,
    PER_MOBLE                      VARCHAR(20)                     ,
    PER_ADDRESS                    VARCHAR(64)                     ,
    PER_EMAIL                      VARCHAR(64)                     ,
    PER_MNGFLAG                    CHAR(2)                         ,
    PER_MNGFLAG_NAME               VARCHAR(64)                     ,
    PER_BNGFLAG                    INTEGER                         ,
    PER_BNGFLAG_NAME               VARCHAR(64)                     ,
    PER_ZHIJ                       INTEGER                         ,
    PER_ZHIJ_NAME                  VARCHAR(64)                     ,
    PER_XL                         INTEGER                         ,
    PER_XL_NAME                    VARCHAR(64)                     ,
    PER_OFFICETEL                  VARCHAR(20)                     ,
    PER_QZHHF                      CHAR(1)                         ,
    PER_QZH_NAME                   VARCHAR(64)                     ,
    PER_OLDNAME                    VARCHAR(20)                     ,
    PER_PAR                        VARCHAR(10)                     ,
    PER_SUBBRANCH                  VARCHAR(60)                     ,
    PER_LVL                        VARCHAR(20)                     ,
    PER_ORG_LVLJ                   VARCHAR(10)                     ,
    PER_BUM                        VARCHAR(20)                     ,
    PER_NATION                     VARCHAR(20)                     ,
    PER_POLI                       VARCHAR(20)                     ,
    PER_RDSJ                       VARCHAR(10)                     ,
    PER_WORKT                      VARCHAR(10)                     ,
    PER_JRCYT                      VARCHAR(10)                     ,
    PER_BANKT                      VARCHAR(10)                     ,
    PER_XL_NO1                     VARCHAR(10)                     ,
    PER_XSDYJB                     VARCHAR(10)                     ,
    PER_ZHIC                       VARCHAR(10)                     ,
    PER_JISLB                      VARCHAR(10)                     ,
    PER_DESC                       VARCHAR(200)                    ,
    PER_EMERNAME                   VARCHAR(20)                     ,
    PER_EMERTEL                    VARCHAR(20)                     ,
    PER_TLERFLAG                   VARCHAR(10)                     ,
    CREATETIME                     TIMESTAMP                       ,
    ENDTIME                        TIMESTAMP                       ,
    FLAG                           VARCHAR(2)                      ,
    TLER_SQRQ                      VARCHAR(10)                     ) 
in TS_PUB   
Partitioning Key (PER_ID) Using Hashing;
--------------------------------------------------
-- Create Table PUB.PROD
--------------------------------------------------
Create table PUB.PROD (
    PROD_ID                        CHAR(10)            NOT NULL    ,
    PROD_NM                        VARCHAR(64)                     ,
    PROD_DESC                      VARCHAR(256)                    ,
    PROD_LEVEL                     INTEGER                         ,
    PARENT_PROD_ID                 CHAR(10)                        ,
    A_L_F                          CHAR(1)                         ,
    LINE_ID                        INTEGER                         ,
    LINE_NM                        VARCHAR(64)                     ,
    PROD_STATUS_ID                 CHAR(2)                         ,
    EFF_DT                         DATE                            ,
    END_DT                         DATE                            ) 
in TS_PUB   
Partitioning Key (PROD_ID) Using Hashing;
Comment on Table PUB.PROD is '产品_产品表';
Comment on Column PUB.PROD.PROD_ID               is '产品编号';
Comment on Column PUB.PROD.PROD_NM               is '产品名称';
Comment on Column PUB.PROD.PROD_DESC             is '产品描述';
Comment on Column PUB.PROD.PROD_LEVEL            is '产品层级';
Comment on Column PUB.PROD.PARENT_PROD_ID        is '上级产品编号';
Comment on Column PUB.PROD.A_L_F                 is '资产负债标志';
Comment on Column PUB.PROD.LINE_ID               is '条线编号';
Comment on Column PUB.PROD.LINE_NM               is '条线名称';
Comment on Column PUB.PROD.PROD_STATUS_ID        is '产品状态';
Comment on Column PUB.PROD.EFF_DT                is '生效日期';
Comment on Column PUB.PROD.END_DT                is '结束日期';
-------------------------------------------------
-- Create Table DIM.DIM_LN_FIVE_TIER_CL_TP
--------------------------------------------------
Create table DIM.DIM_LN_FIVE_TIER_CL_TP (
    LN_FIVE_TIER_CL_TP_ID          INTEGER                         ,
    LN_FIVE_TIER_CL_TP_NM          VARCHAR(32)                     ,
    PERF_STS_TP_ID                 INTEGER                         ,
    PERF_STS_TP_NM                 VARCHAR(32)                     ) 
in TS_SINGLE   ;
--------------------------------------------------
-- Create Table DIM.DIM_OU
--------------------------------------------------
Create table DIM.DIM_OU (
    OU_SUR_ID                      CHAR(18)            NOT NULL    ,
    SEC_OU_CD                      INTEGER                         ,
    SEC_OU_NM                      VARCHAR(256)                    ,
    SEC_OU_SUR_ID                  CHAR(18)                        ,
    OU_CD                          CHAR(4)                         ,
    FST_OU_CD                      INTEGER                         ,
    FST_OU_NM                      VARCHAR(256)                    ,
    FST_OU_SUR_ID                  CHAR(18)                        ,
    OU_NM                          VARCHAR(256)                    ,
    SEC_OU_SEQ                     CHAR(4)                         ,
    OU_SEQ                         CHAR(8)                         ,
    COUNTY_FLG                     VARCHAR(2)                      ,
    FM_FLG                         VARCHAR(2)                      ,
    JILUZT                         VARCHAR(20)                     ) 
in TS_SINGLE   
Partitioning Key (OU_SUR_ID) Using Hashing;
Comment on Column DIM.DIM_OU.COUNTY_FLG          is '县域支行标志1是';
Comment on Column DIM.DIM_OU.FM_FLG              is '涉农标识1是';
Comment on Column DIM.DIM_OU.JILUZT              is '核心记录状态';
--------------------------------------------------
-- Create Table DIM.DIM_OU_DTIL
--------------------------------------------------
Create table DIM.DIM_OU_DTIL (
    OU_SUR_ID                      CHAR(18)            NOT NULL    ,
    PRN_OU_IP_ID                   INTEGER                         ,
    END_DT                         DATE                            ,
    OU_CD                          CHAR(4)                         ,
    OU_NM                          VARCHAR(256)                    ,
    PRN_OU_SUR_ID                  CHAR(18)                        ,
    OU_IP_ID                       INTEGER             NOT NULL    ,
    EFF_DT                         DATE                            ,
    OU_SEQ                         CHAR(8)                         ) 
in TS_SINGLE   
Partitioning Key (OU_SUR_ID) Using Hashing;

