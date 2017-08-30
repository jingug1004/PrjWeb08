/* 홈페이지용 -성과 현황(교과부만) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560113' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560113' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL,  ATTR5_VAL,
    ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL,
    ATTR10_VAL, ATTR11_VAL, ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
       SELECT GVM_INSTN_CD
           , F_GET_INSTN_NM('INSTN', A.GVM_INSTN_CD) ATTR_VAL1
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
           , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
           , SUM(REAL_SURP_AMT)                                               TOT_AMT
         FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
                   , BIZ_PRPS_TYP
                   , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                   , REAL_SURP_AMT
                   , ATTR1_VAL
                   , ATTR2_VAL
                   , INSTN.INSTN_TYP
                   , ACMMT_FLAG
                   , GVM_INSTN_CD
                FROM T_BIZ_SURP_TRGT_INFO TRGT
                   , T_BIZT_INFO          BIZT
                   , T_SCH_INFO_HIST      SCH
                   , T_BIZ_MNG_INFO       BIZM
                   , T_BIZ_INFO           BIZ
                   , T_ACMMT_STS          ACMMT
                   , T_INSTN_INFO         INSTN
              WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
               AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
               AND TRGT.BIZ_YR = SCH.SRY_YY
               AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
               AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
               AND TRGT.BIZ_CD = BIZM.BIZ_CD
               AND TRGT.BIZ_YR = BIZM.BIZ_YR
               AND BIZM.BIZ_CD = BIZ.BIZ_CD
               AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
               AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
               AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
               AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
               AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
               AND ACMMT.ACMMT_FLAG(+)   in ( 'K030001' ,  'K030002' )
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  GVM_INSTN_CD
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560113'
     , NVL(A.ATTR_VAL1,'합계') ATTR_VAL1
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999')) ATTR_VAL9
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999')) ATTR_VAL11
     , 1
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;

/* 홈페이지용 -성과 현황(교과부만, 공시대상) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560113' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560113' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL,  ATTR5_VAL,
    ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL,
    ATTR10_VAL, ATTR11_VAL, ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
       SELECT GVM_INSTN_CD
           , F_GET_INSTN_NM('INSTN', A.GVM_INSTN_CD) ATTR_VAL1
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
           , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
           , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
           , SUM(REAL_SURP_AMT)                                               TOT_AMT
         FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
                   , BIZ_PRPS_TYP
                   , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                   , REAL_SURP_AMT
                   , ATTR1_VAL
                   , ATTR2_VAL
                   , INSTN.INSTN_TYP
                   , ACMMT_FLAG
                   , GVM_INSTN_CD
                FROM T_BIZ_SURP_TRGT_INFO TRGT
                   , T_BIZT_INFO          BIZT
                   , T_SCH_INFO_HIST      SCH
                   , T_BIZ_MNG_INFO       BIZM
                   , T_BIZ_INFO           BIZ
                   , T_ACMMT_STS          ACMMT
                   , T_INSTN_INFO         INSTN
              WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
               AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
               AND TRGT.BIZ_YR = SCH.SRY_YY
               AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
               --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
               AND TRGT.BIZ_CD = BIZM.BIZ_CD
               AND TRGT.BIZ_YR = BIZM.BIZ_YR
               AND BIZM.BIZ_CD = BIZ.BIZ_CD
               AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
               AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
               AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
               AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
               AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
               AND ACMMT.ACMMT_FLAG(+)   in ( 'K030001' ,  'K030002' )
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  GVM_INSTN_CD
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560113'
     , NVL(A.ATTR_VAL1,'합계') ATTR_VAL1
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999')) ATTR_VAL9
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999')) ATTR_VAL11
     , 1
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;





/* 목적별 현황-현황분석(1)에서만 사용 */
--    SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560112' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560112' and stats_yr = '2011';

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL, ATTR5_VAL
    , ATTR6_VAL, ATTR7_VAL , ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL , ATTR14_VAL, ATTR15_VAL
    , ATTR43_VAL
    , RGSTR_ID
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.BIZ_PRPS_TYP) RN
          , F_GET_COMMN_NM(A.BIZ_PRPS_TYP)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)                ATTR_VAL2
          , SUM(SURP_UNIT_AMT)                 ATTR_VAL3
          , SUM(C.CNT1)                             ATTR_VAL4
          , SUM(C.CNT2)                             ATTR_VAL5
          , SUM(C.CNT3)                             ATTR_VAL6
          , SUM(C.CNT4)                             ATTR_VAL7
          , SUM(C.CNT5)                             ATTR_VAL8
          , SUM(C.CNT6)                             ATTR_VAL9
          , SUM(C.CNT7)                             ATTR_VAL10
          , SUM(C.CNT8)                             ATTR_VAL11
          , ROW_NUMBER() OVER(ORDER BY A.BIZ_PRPS_TYP) ORDERED
       FROM T_BIZ_INFO      A
          , T_BIZ_MNG_INFO  B
          , (
                    SELECT BIZ_CD
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
                      FROM T_BIZ_SURP_TRGT_INFO C, T_ACMMT_STS D, T_SCH_INFO E
                     WHERE ACMMT_FLAG   in ( 'K030001' , 'K030002')
                       AND ACMMT_YR     = '2010'
                       AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                       AND F_GET_BLN_SCHL_CD(C.EXE_INSTN_CD)       = E.INSTN_CD
                       AND E.UNIV_GUBUN        IN  ('U','G')
                       AND E.SCHL_CD  <> '99999999'
                       AND E.SCHL_CD  <> '00000000'
                     GROUP BY BIZ_CD
            ) C
            , (
                    SELECT A.BIZ_CD
                         , SUM(REAL_SURP_AMT) SURP_UNIT_AMT
                      FROM T_BIZ_SURP_TRGT_INFO A
                         , T_BIZT_INFO          B
                         , T_SCH_INFO           D
                     WHERE A.BIZ_SURP_INFO_ID = B.BIZ_SURP_INFO_ID
                       AND B.SURP_DT = '2010'
                       AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD) = D.INSTN_CD
                       AND D.UNIV_GUBUN in ('U','G')
                       AND D.SCHL_CD  <> '99999999'
                       AND D.SCHL_CD  <> '00000000'
                     GROUP BY A.BIZ_CD
                )D
      WHERE A.BIZ_CD         = B.BIZ_CD
        AND A.BIZ_CD         = C.BIZ_CD(+)
        AND A.BIZ_CD         = D.BIZ_CD(+)
        AND A.BIZ_EFCT_YN    = 'Y'
        AND B.BIZ_YR         = '2010'
        AND A.BIZ_PRPS_TYP IS NOT NULL
        AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
      GROUP BY ROLLUP(A.BIZ_PRPS_TYP)
)
SELECT '2010'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560112'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , DECODE(B.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL4+A.ATTR_VAL6)/B.ATTR_VAL3*1000000,1))  PER_AMT_CNT1
     , DECODE(B.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL5+A.ATTR_VAL7)/B.ATTR_VAL3*1000000,1))  PER_AMT_CNT2
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL11
     , TRIM(TO_CHAR(A.ATTR_VAL10,'9,999,999,999,999')) ATTR_VAL12
     , TRIM(TO_CHAR(A.ATTR_VAL11,'9,999,999,999,999')) ATTR_VAL13
     , DECODE(B.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL8+A.ATTR_VAL10)/B.ATTR_VAL3*1000000,1))  PER_AMT_CNT3
     , DECODE(B.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL9+A.ATTR_VAL11)/B.ATTR_VAL3*1000000,1))  PER_AMT_CNT4
     , A.ORDERED
     , 'SQL'
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;









/***

--사업 성과리스트


SELECT ROW_NUMBER() OVER(ORDER BY A.BIZ_NM) ORDERED
    , A.BIZ_CD, A.BIZ_NM
    , F_GET_BIZ_TP(A.BIZ_CD) BIZ_TYP
    , F_GET_COMMN_NM(A.BIZ_PRPS_TYP) BIZ_PRPS_TYP
    , B.THYR_YR_SURP_AMT                 ATTR_VAL3
    , C.CNT1                             ATTR_VAL4
    , C.CNT2                             ATTR_VAL5
    , C.CNT3                             ATTR_VAL6
    , C.CNT4                             ATTR_VAL7
    , C.CNT5                             ATTR_VAL8
    , C.CNT6                             ATTR_VAL9
    , C.CNT7                             ATTR_VAL10
    , C.CNT8                             ATTR_VAL11
 FROM T_BIZ_INFO      A
    , T_BIZ_MNG_INFO  B
    , (
              SELECT BIZ_CD
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
                   , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
                FROM T_BIZ_SURP_TRGT_INFO C, T_ACMMT_STS D
               WHERE ACMMT_FLAG   in ( 'K030001' , 'K030002')
                 AND ACMMT_YR     = '2010'
                 AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
               GROUP BY BIZ_CD
      ) C
WHERE A.BIZ_CD         = B.BIZ_CD
  AND A.BIZ_CD         = C.BIZ_CD
  AND A.BIZ_EFCT_YN    = 'Y'
  AND B.BIZ_YR         = '2010'
  --AND A.BIZ_PRPS_TYP IS NOT NULL
  AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'

  */



WITH TMP_A AS
(
     SELECT F_GET_INSTN_NM('INSTN', A.GVM_INSTN_CD) ATTR_VAL1
          , COUNT(A.BIZ_CD)                ATTR_VAL2
          , SUM(REAL_SURP_AMT)                 ATTR_VAL3
          , SUM(C.CNT1)                             ATTR_VAL4
          , SUM(C.CNT2)                             ATTR_VAL5
          , SUM(C.CNT3)                             ATTR_VAL6
          , SUM(C.CNT4)                             ATTR_VAL7
          , SUM(C.CNT5)                             ATTR_VAL8
          , SUM(C.CNT6)                             ATTR_VAL9
          , SUM(C.CNT7)                             ATTR_VAL10
          , SUM(C.CNT8)                             ATTR_VAL11
          , ROW_NUMBER() OVER(ORDER BY A.GVM_INSTN_CD) ORDERED
       FROM T_BIZ_INFO      A
          , T_BIZ_MNG_INFO  B
          , (
                    SELECT ACMMT_YR, BIZ_CD
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
                      FROM T_BIZ_SURP_TRGT_INFO C, T_ACMMT_STS D
                     WHERE ACMMT_FLAG   in ( 'K030001' , 'K030002')
                       --AND ACMMT_YR     = '2011'
                       AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                     GROUP BY ACMMT_YR, BIZ_CD
            ) C
            , (
                    SELECT TRGT.BIZ_CD
                         , TRGT.BIZ_YR
                         , SUM(REAL_SURP_AMT) REAL_SURP_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT
                         , T_BIZT_INFO BIZT
                         , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )D
                , T_INSTN_INFO E
      WHERE A.BIZ_CD         = B.BIZ_CD
        AND B.BIZ_YR         = C.ACMMT_YR(+)
        AND B.BIZ_CD         = C.BIZ_CD(+)
        AND B.BIZ_YR         = D.BIZ_YR(+)
        AND B.BIZ_CD         = D.BIZ_CD(+)
        AND A.GVM_INSTN_CD = E.INSTN_CD
        AND A.BIZ_FLAG in ( 'K042001')  /* 일반지원사업 만 포함 */
        AND B.BIZ_YR         = '2011'   /* 2011년 사업만 */
        AND B.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
        AND A.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
      GROUP BY (A.GVM_INSTN_CD)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560113'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL11
     , TRIM(TO_CHAR(A.ATTR_VAL10,'9,999,999,999,999')) ATTR_VAL12
     , TRIM(TO_CHAR(A.ATTR_VAL11,'9,999,999,999,999')) ATTR_VAL13
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL4+A.ATTR_VAL6)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT1
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL5+A.ATTR_VAL7)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT2
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL8+A.ATTR_VAL10)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT3
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL9+A.ATTR_VAL11)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;


