INSERT INTO IBS.T5_EMP_GDQ_OR_GZ (
    EXAM_YEAR,
    EXAM_Q,
    EMP_TYPE,
    EMP_ID,
    EMP_NM,
    ORG_ID,
    ORG_NM,
    BRANCH_ORG_ID,
    BRANCH_ORG_NM,
    POSITION_DT,
    PSTN_TYPE,
    PSTN_TYPE_NM,
    SUB_PSTN_TYPE,
    SUB_PSTN_TYPE_NM,
    STATUS,
    GDQ_STDT,
    GDQ_ENDDT,
    REMARK,
    MODIFY_PEOPLE,
    MODIFY_TIME,
    MODIFY_IP,
    DEL_FLAG,
    MEASURE_DT
)
SELECT
    '2026',
    '01',
    CONVERT(0xE8BF87E6B8A1E69C9F USING utf8mb4),
    e.EMP_ID,
    e.EMP_NM,
    e.ORG_ID,
    e.ORG_NM,
    e.BRANCH_ORG_ID,
    e.BRANCH_ORG_NM,
    NULL,
    e.PSTN_TYPE,
    e.PSTN_TYPE_NM,
    e.SUB_PSTN_TYPE,
    e.SUB_PSTN_TYPE_NM,
    '0',
    '2026-01-01',
    '2026-03-31',
    'Docker demo seed',
    'admin',
    NOW(),
    '127.0.0.1',
    0,
    '2026-03-31'
FROM IBS.T5_EMP e
WHERE e.EMP_ID = 'admin'
  AND NOT EXISTS (
      SELECT 1
      FROM IBS.T5_EMP_GDQ_OR_GZ g
      WHERE g.EXAM_YEAR = '2026'
        AND g.EXAM_Q = '01'
        AND g.EMP_ID = e.EMP_ID
        AND g.EMP_TYPE = CONVERT(0xE8BF87E6B8A1E69C9F USING utf8mb4)
  );
