/******************************************************************************
Ⅳ. 주요 지표별 재정지원 현황

1) 고등교육 재정지원의 확보 - 제외처리됨
******************************************************************************/

-- 유형별 고등교육 재정지원의 규모

WITH TMP_A AS 
(
     SELECT GROUPING_ID(ATTR_VAL1) RN 
          , F_GET_COMMN_NM(ATTR_VAL1)ATTR_VAL1
          , SUM(ATTR_VAL2)ATTR_VAL2
          , SUM(ATTR_VAL3)ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY ATTR_VAL1) ORDERED
       FROM ( 
                SELECT A.SURP_UNIT_TYP ATTR_VAL1
                    , COUNT(DISTINCT A.BIZ_CD) ATTR_VAL2
                    , SUM(REAL_SURP_AMT)  ATTR_VAL3
                FROM (
                          SELECT TRGT.BIZ_YR, TRGT.BIZ_CD
                             , DECODE(TRGT.SURP_UNIT_TYP ,'K020004','K020003','K020005','K020002',TRGT.SURP_UNIT_TYP )SURP_UNIT_TYP
                             , BIZT.REAL_SURP_AMT
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                         WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
                           AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                           AND TRGT.BIZ_YR = SCH.SRY_YY
                           AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                           AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                           AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                           AND TRGT.BIZ_CD = BIZM.BIZ_CD
                           AND TRGT.BIZ_YR = BIZM.BIZ_YR
                           AND BIZM.BIZ_CD = BIZ.BIZ_CD
                           AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                           AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                           AND TRGT.BIZ_YR = '2011'
                        ) A
                   GROUP BY A.SURP_UNIT_TYP
            )
        GROUP BY ROLLUP(ATTR_VAL1)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560106'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;   



-- 연구개발지원비율(정부고등교육재정 대비 R&D 지원액) 
SELECT '' BDG
     , MAX(DECODE(ORDERED,1,ATTR_VAL2)) ATTR1
     , MAX(DECODE(ORDERED,1,ATTR_VAL3)) ATTR2
     , '' PER1
     , MAX(DECODE(ORDERED,2,ATTR_VAL2)) ATTR3
     , MAX(DECODE(ORDERED,2,ATTR_VAL3)) ATTR4
     , '' PER2
     , MAX(DECODE(ORDERED,3,ATTR_VAL2)) ATTR5
     , MAX(DECODE(ORDERED,3,ATTR_VAL3)) ATTR6
     , '' PER3
FROM
(
     SELECT GROUPING_ID(A.BIZ_PRPS_TYP) RN 
          , F_GET_COMMN_NM(A.BIZ_PRPS_TYP)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.BIZ_PRPS_TYP) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZ.BIZ_PRPS_TYP
              , REAL_SURP_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND BIZ.BIZ_PRPS_TYP IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.BIZ_PRPS_TYP)
);



/******************************************************************************
Ⅳ. 주요 지표별 재정지원 현황

2)고등교육재정지원의 배분 및 지출
① 효율성
지원액당 고등교육 재정지원의 성과(노란색 부분 맞는지 확인!)
******************************************************************************/

-- 논문(국내), 논문(국외)

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)        BIZ_AMT
         , NVL(SUM(IN_CNT1),0)                 IN_CNT1
         , NVL(SUM(IN_CNT2),0)                 IN_CNT2 
         , NVL(SUM(OUT_CNT1),0)                 OUT_CNT1
         , NVL(SUM(OUT_CNT2),0)                 OUT_CNT2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS IN_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS IN_CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS OUT_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS OUT_CNT2
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
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999'))   IN_CNT2
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/B.PER_AMT,1)) PER_AMT_IN_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT2/B.PER_AMT,1)) PER_AMT_IN_CNT2
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999'))  OUT_CNT1
     , TRIM(TO_CHAR(A.OUT_CNT2,'9,999,999,999,999'))  OUT_CNT2 
     --, DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT1/B.PER_AMT,1)) PER_AMT_OUT_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT2/B.PER_AMT,1)) PER_AMT_OUT_CNT2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;




-- 특허(국내), 특허(국외)

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)        BIZ_AMT
         , NVL(SUM(IN_CNT1),0)                 IN_CNT1
         , NVL(SUM(IN_CNT2),0)                 IN_CNT2 
         , NVL(SUM(OUT_CNT1),0)                 OUT_CNT1
         , NVL(SUM(OUT_CNT2),0)                 OUT_CNT2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS IN_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS IN_CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS OUT_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS OUT_CNT2
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
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030002' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999'))   IN_CNT2
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/B.PER_AMT,1)) PER_AMT_IN_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT2/B.PER_AMT,1)) PER_AMT_IN_CNT2
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999'))  OUT_CNT1
     , TRIM(TO_CHAR(A.OUT_CNT2,'9,999,999,999,999'))  OUT_CNT2 
     --, DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT1/B.PER_AMT,1)) PER_AMT_OUT_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT2/B.PER_AMT,1)) PER_AMT_OUT_CNT2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;



-- 기술료 성과

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)        BIZ_AMT
         , NVL(SUM(CNT1),0)                 IN_CNT1
         , NVL(SUM(CNT2),0)                 IN_CNT2 
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , COUNT(ACMMT_SNO) AS CNT1
                     , SUM(ATTR3_VAL)   AS CNT2  
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , BIZ_PRPS_TYP
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , REAL_SURP_AMT
                             , ACMMT_SNO
                             , ATTR1_VAL
                             , ATTR2_VAL
                             , ATTR3_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030003' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999'))   IN_CNT2
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/B.PER_AMT,1)) PER_AMT_IN_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT2/B.PER_AMT,1)) PER_AMT_IN_CNT2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;



-- 사업화 현황

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)               BIZ_AMT
         , NVL(SUM(CNT1),0)                 IN_CNT1
         , NVL(SUM(CNT2),0)                 IN_CNT2 
         , NVL(SUM(CNT3),0)                 IN_CNT3 
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , COUNT(ACMMT_SNO) AS CNT1
                     , SUM(ATTR2_VAL)   AS CNT2  
                     , SUM(ATTR3_VAL)   AS CNT3  
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , BIZ_PRPS_TYP
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , REAL_SURP_AMT
                             , ACMMT_SNO
                             , ATTR1_VAL
                             , ATTR2_VAL
                             , ATTR3_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030004' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.IN_CNT3,'9,999,999,999,999'))   IN_CNT3
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999'))   IN_CNT2
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/B.PER_AMT,1)) PER_AMT_IN_CNT1
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT3/B.PER_AMT,1)) PER_AMT_IN_CNT3
     --, DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT2/B.PER_AMT,1)) PER_AMT_IN_CNT2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;


-- 연수지원성과(제외)

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)               BIZ_AMT
         , NVL(SUM(CNT1),0)                 CNT1
         , NVL(SUM(CNT2),0)                 CNT2
         , NVL(SUM(CNT3),0)                 CNT3
         , NVL(SUM(CNT4),0)                 CNT4
         , NVL(SUM(CNT5),0)                 CNT5
         , NVL(SUM(CNT6),0)                 CNT6
         , NVL(SUM(CNT7),0)                 CNT7
         , NVL(SUM(CNT8),0)                 CNT8
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , SUM(ATTR1_VAL) AS CNT1 
                     , SUM(ATTR2_VAL) AS CNT2
                     , SUM(ATTR3_VAL) AS CNT3
                     , SUM(ATTR4_VAL) AS CNT4
                     , SUM(ATTR5_VAL) AS CNT5 
                     , SUM(ATTR6_VAL) AS CNT6
                     , SUM(ATTR7_VAL) AS CNT7
                     , SUM(ATTR8_VAL) AS CNT8
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , BIZ_PRPS_TYP
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , REAL_SURP_AMT
                             , ACMMT_SNO
                             , ATTR1_VAL
                             , ATTR2_VAL
                             , ATTR3_VAL
                             , ATTR4_VAL
                             , ATTR5_VAL
                             , ATTR6_VAL
                             , ATTR7_VAL
                             , ATTR8_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030006' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT1/B.PER_AMT,1)) PER_AMT_CNT1
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT2/B.PER_AMT,1)) PER_AMT_CNT2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT3/B.PER_AMT,1)) PER_AMT_CNT3
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT4/B.PER_AMT,1)) PER_AMT_CNT4
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT5/B.PER_AMT,1)) PER_AMT_CNT5
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT6/B.PER_AMT,1)) PER_AMT_CNT6
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT7/B.PER_AMT,1)) PER_AMT_CNT7
     , DECODE(A.PER_AMT,0,0,ROUND(A.CNT8/B.PER_AMT,1)) PER_AMT_CNT8
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;



-- 인력양성·지원성과(제외)

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(BIZ_PRPS_TYP )   RN
         , F_GET_COMMN_NM(BIZ_PRPS_TYP)   ATTR_VAL1
         , NVL(SUM(TOT_CNT),0)               BIZ_CNT
         , NVL(SUM(TOT_AMT),0)               BIZ_AMT
         , NVL(SUM(CNT1),0)                 CNT1
         , NVL(SUM(CNT2),0)                 CNT2
         , NVL(SUM(CNT3),0)                 CNT3
         , NVL(SUM(CNT4),0)                 CNT4
         , NVL(SUM(SUB1),0)                 SUB1
         , NVL(SUM(CNT5),0)                 CNT5
         , NVL(SUM(CNT6),0)                 CNT6
         , NVL(SUM(CNT7),0)                 CNT7
         , NVL(SUM(CNT8),0)                 CNT8
         , NVL(SUM(SUB2),0)                 SUB2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
      FROM (
                 SELECT BIZ_PRPS_TYP
                     , SUM(ATTR1_VAL+ATTR2_VAL) AS CNT1 
                     , SUM(ATTR3_VAL+ATTR4_VAL) AS CNT2
                     , SUM(ATTR5_VAL+ATTR6_VAL) AS CNT3
                     , SUM(ATTR7_VAL+ATTR8_VAL) AS CNT4
                     , SUM( ATTR1_VAL+ATTR2_VAL
                          + ATTR3_VAL+ATTR4_VAL
                          + ATTR5_VAL+ATTR6_VAL
                          + ATTR7_VAL+ATTR8_VAL) AS SUB1
                     , SUM(ATTR9_VAL+ATTR10_VAL)  AS CNT5 
                     , SUM(ATTR11_VAL+ATTR12_VAL) AS CNT6
                     , SUM(ATTR13_VAL+ATTR14_VAL) AS CNT7
                     , SUM(ATTR15_VAL+ATTR16_VAL) AS CNT8
                     , SUM(ATTR9_VAL+ATTR10_VAL
                          +ATTR11_VAL+ATTR12_VAL
                          +ATTR13_VAL+ATTR14_VAL
                          +ATTR15_VAL+ATTR16_VAL) AS SUB2
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
                             , ATTR3_VAL
                             , ATTR4_VAL
                             , ATTR5_VAL
                             , ATTR6_VAL
                             , ATTR7_VAL
                             , ATTR8_VAL
                             , ATTR9_VAL
                             , ATTR10_VAL
                             , ATTR11_VAL
                             , ATTR12_VAL
                             , ATTR13_VAL
                             , ATTR14_VAL
                             , ATTR15_VAL
                             , ATTR16_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                         AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ_PRPS_TYP is not null
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030007' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  BIZ_PRPS_TYP
           ) T
     GROUP BY ROLLUP(T.BIZ_PRPS_TYP) 
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , TRIM(TO_CHAR(A.SUB1,'9,999,999,999,999'))      SUB1
     , DECODE(A.PER_AMT,0,0,ROUND(A.SUB1/B.PER_AMT,1)) PER_AMT_CNT1
     /*, TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , TRIM(TO_CHAR(A.SUB2,'9,999,999,999,999'))      SUB2
     , DECODE(A.PER_AMT,0,0,ROUND(A.SUB2/B.PER_AMT,1)) PER_AMT_CNT2*/
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
;



/* 
② 공정성
학제별 유형별 고등교육재정지원의 규모
*/
-- 사업목적

WITH TMP_A AS 
(          
  SELECT GROUPING_ID(UNIV_GUBUN, UNIV_ZON)RN
       , UNIV_GUBUN
       , UNIV_ZON
       , NVL(SUM(HRD_CNT1),0) CNT1
       , NVL(SUM(HRD_AMT1),0) AMT1
       , NVL(SUM(HRD_CNT2),0) CNT2
       , NVL(SUM(HRD_AMT2),0) AMT2
       , NVL(SUM(HRD_CNT3),0) CNT3
       , NVL(SUM(HRD_AMT3),0) AMT3
       , NVL(SUM(TOT_CNT),0)  CNT4
       , NVL(SUM(TOT_AMT),0)  AMT4
       , ROW_NUMBER() OVER(ORDER BY DECODE(UNIV_GUBUN,'대학','추',UNIV_GUBUN), NVL(UNIV_ZON,'1') DESC) ORDERED
    FROM (
              SELECT A.UNIV_GUBUN, A.UNIV_ZON
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_CNT1)HRD_CNT1
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_AMT1)HRD_AMT1
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_CNT2)HRD_CNT2
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_AMT2)HRD_AMT2
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_CNT3)HRD_CNT3
                   , DECODE(B.UNIV_GUBUN,'',0, HRD_AMT3)HRD_AMT3
                   , DECODE(B.UNIV_GUBUN,'',0, TOT_CNT)TOT_CNT
                   , DECODE(B.UNIV_GUBUN,'',0, TOT_AMT)TOT_AMT
                FROM (
                          SELECT '전문대' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '전문대' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                     ) A
                   , ( 
                    SELECT B.UNIV_GUBUN, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , REAL_SURP_AMT    
                                  FROM T_BIZ_SURP_TRGT_INFO TRGT
                                     , T_BIZT_INFO          BIZT
                                     , T_SCH_INFO_HIST      SCH
                                     , T_BIZ_MNG_INFO       BIZM
                                     , T_BIZ_INFO           BIZ
                                WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                                 AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                                 AND TRGT.BIZ_YR = SCH.SRY_YY
                                 AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                                 AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                                 AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                                 --AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                           )A
                         , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , DECODE(MAX(UNIV_GUBUN),'U','대학','C','전문대')    UNIV_GUBUN
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN UNIV_GUBUN 
                                                      ELSE '' 
                                                  END UNIV_GUBUN
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN <> 'H'
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_GUBUN, B.UNIV_ZON
               ) B
              WHERE A.UNIV_GUBUN = B.UNIV_GUBUN(+)
                AND A.UNIV_ZON  = B.UNIV_ZON(+)
       )
 GROUP BY ROLLUP(UNIV_GUBUN, UNIV_ZON)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'3','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , DECODE(A.RN,'3','',A.UNIV_ZON)UNIV_ZON
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.AMT1,0,0,ROUND(A.CNT1/B.CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.AMT1,0,0,ROUND(A.CNT2/B.CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , DECODE(B.AMT1,0,0,ROUND(A.CNT3/B.CNT3*100,1)) PER_CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)) PER3
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 3) B
 --WHERE A.RN IN ('0','3')
 ;


-- 지원액 결정방식

WITH TMP_A AS 
(          
  SELECT GROUPING_ID(UNIV_GUBUN, UNIV_ZON)RN
       , UNIV_GUBUN
       , UNIV_ZON
       , NVL(SUM(BIZ_CNT1),0)  BIZ_CNT1
       , NVL(SUM(BIZ_AMT1),0)  BIZ_AMT1
       , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
       , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
       , NVL(SUM(BIZ_CNT3),0)  BIZ_CNT3
       , NVL(SUM(BIZ_AMT3),0)  BIZ_AMT3
       , NVL(SUM(TOT_CNT),0)   TOT_CNT
       , NVL(SUM(TOT_AMT),0)   TOT_AMT
       , ROW_NUMBER() OVER(ORDER BY DECODE(UNIV_GUBUN,'대학','추',UNIV_GUBUN), NVL(UNIV_ZON,'1') DESC) ORDERED
    FROM (
              SELECT A.UNIV_GUBUN, A.UNIV_ZON
                   , BIZ_CNT1
                   , BIZ_AMT1
                   , BIZ_CNT2
                   , BIZ_AMT2
                   , BIZ_CNT3
                   , BIZ_AMT3
                   , TOT_CNT
                   , TOT_AMT
                FROM (
                          SELECT '전문대' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '전문대' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                     ) A
                   , ( 
                    SELECT B.UNIV_GUBUN, B.UNIV_ZON
                         , COUNT(DISTINCT DECODE( A.SURP_AMT_DCISN_WAY, 'K018001', A.BIZ_CD))    BIZ_CNT1
                         , SUM(DECODE( A.SURP_AMT_DCISN_WAY, 'K018001', REAL_SURP_AMT))          BIZ_AMT1 
                         , COUNT(DISTINCT DECODE( A.SURP_AMT_DCISN_WAY, 'K018002', A.BIZ_CD))    BIZ_CNT2
                         , SUM(DECODE( A.SURP_AMT_DCISN_WAY, 'K018002', REAL_SURP_AMT))          BIZ_AMT2 
                         , COUNT(DISTINCT DECODE( A.SURP_AMT_DCISN_WAY, 'K018003', A.BIZ_CD))    BIZ_CNT3
                         , SUM(DECODE( A.SURP_AMT_DCISN_WAY, 'K018003', REAL_SURP_AMT))          BIZ_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , SURP_AMT_DCISN_WAY
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , REAL_SURP_AMT    
                                  FROM T_BIZ_SURP_TRGT_INFO TRGT
                                     , T_BIZT_INFO          BIZT
                                     , T_SCH_INFO_HIST      SCH
                                     , T_BIZ_MNG_INFO       BIZM
                                     , T_BIZ_INFO           BIZ
                                WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                                 AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                                 AND TRGT.BIZ_YR = SCH.SRY_YY
                                 AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                                 AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                                 AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                                 --AND SURP_AMT_DCISN_WAY IS NOT NULL
                           )A
                         , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , DECODE(MAX(UNIV_GUBUN),'U','대학','C','전문대')    UNIV_GUBUN
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN UNIV_GUBUN 
                                                      ELSE '' 
                                                  END UNIV_GUBUN
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN <> 'H'
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_GUBUN, B.UNIV_ZON
               ) B
              WHERE A.UNIV_GUBUN = B.UNIV_GUBUN(+)
                AND A.UNIV_ZON  = B.UNIV_ZON(+)
       )
 GROUP BY ROLLUP(UNIV_GUBUN, UNIV_ZON)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'3','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , DECODE(A.RN,'3','',A.UNIV_ZON)UNIV_ZON
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , DECODE(B.BIZ_CNT1,0,0,ROUND(A.BIZ_CNT1/B.BIZ_CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , DECODE(B.BIZ_AMT1,0,0,ROUND(A.BIZ_AMT1/B.BIZ_AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , DECODE(B.BIZ_CNT2,0,0,ROUND(A.BIZ_CNT2/B.BIZ_CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.BIZ_CNT3,'9,999,999,999,999'))  BIZ_CNT3 
     , DECODE(B.BIZ_CNT3,0,0,ROUND(A.BIZ_CNT3/B.BIZ_CNT3*100,1)) PER_CNT3
     , TRIM(TO_CHAR(A.BIZ_AMT3,'9,999,999,999,999'))  BIZ_AMT3 
     , DECODE(B.BIZ_AMT3,0,0,ROUND(A.BIZ_AMT3/B.BIZ_AMT3*100,1)) PER3
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 3) B
 --WHERE A.RN IN ('0','3')
 ;


-- 지원액 교부방식

WITH TMP_A AS 
(          
  SELECT GROUPING_ID(UNIV_GUBUN, UNIV_ZON)RN
       , UNIV_GUBUN
       , UNIV_ZON
       , NVL(SUM(BIZ_CNT1),0)  BIZ_CNT1
       , NVL(SUM(BIZ_AMT1),0)  BIZ_AMT1
       , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
       , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
       , NVL(SUM(TOT_CNT),0)   TOT_CNT
       , NVL(SUM(TOT_AMT),0)   TOT_AMT
       , ROW_NUMBER() OVER(ORDER BY DECODE(UNIV_GUBUN,'대학','추',UNIV_GUBUN), NVL(UNIV_ZON,'1') DESC) ORDERED
    FROM (
              SELECT A.UNIV_GUBUN, A.UNIV_ZON
                   , BIZ_CNT1
                   , BIZ_AMT1
                   , BIZ_CNT2
                   , BIZ_AMT2
                   , TOT_CNT
                   , TOT_AMT
                FROM (
                          SELECT '전문대' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '전문대' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '수도권' UNIV_ZON FROM DUAL
                           UNION 
                          SELECT '대학' UNIV_GUBUN, '비수도권' UNIV_ZON FROM DUAL 
                     ) A
                   , ( 
                    SELECT B.UNIV_GUBUN, B.UNIV_ZON
                         , COUNT(DISTINCT DECODE( A.SURP_AMT_DELV_WAY, 'K019001', A.BIZ_CD))    BIZ_CNT1
                         , SUM(DECODE( A.SURP_AMT_DELV_WAY, 'K019001', REAL_SURP_AMT))          BIZ_AMT1 
                         , COUNT(DISTINCT DECODE( A.SURP_AMT_DELV_WAY, 'K019002', A.BIZ_CD))    BIZ_CNT2
                         , SUM(DECODE( A.SURP_AMT_DELV_WAY, 'K019002', REAL_SURP_AMT))          BIZ_AMT2 
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , SURP_AMT_DELV_WAY
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , REAL_SURP_AMT    
                                  FROM T_BIZ_SURP_TRGT_INFO TRGT
                                     , T_BIZT_INFO          BIZT
                                     , T_SCH_INFO_HIST      SCH
                                     , T_BIZ_MNG_INFO       BIZM
                                     , T_BIZ_INFO           BIZ
                                WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                                 AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                                 AND TRGT.BIZ_YR = SCH.SRY_YY
                                 AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                                 AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                                 AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                                 --AND SURP_AMT_DELV_WAY IS NOT NULL
                           )A
                         , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , DECODE(MAX(UNIV_GUBUN),'U','대학','C','전문대')    UNIV_GUBUN
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN UNIV_GUBUN 
                                                      ELSE '' 
                                                  END UNIV_GUBUN
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in('U','C') THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN <> 'H'
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_GUBUN, B.UNIV_ZON
               ) B
              WHERE A.UNIV_GUBUN = B.UNIV_GUBUN(+)
                AND A.UNIV_ZON  = B.UNIV_ZON(+)
       )
 GROUP BY ROLLUP(UNIV_GUBUN, UNIV_ZON)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'3','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , DECODE(A.RN,'3','',A.UNIV_ZON)UNIV_ZON
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , DECODE(B.BIZ_CNT1,0,0,ROUND(A.BIZ_CNT1/B.BIZ_CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , DECODE(B.BIZ_AMT1,0,0,ROUND(A.BIZ_AMT1/B.BIZ_AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , DECODE(B.BIZ_CNT2,0,0,ROUND(A.BIZ_CNT2/B.BIZ_CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 3) B
 --WHERE A.RN IN ('0','3')
 ;


/* 지원액 결정방식별 고등교육 재정지원의 규모  */
-- 사업목적

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(SURP_AMT_DELV_WAY)RN
             , f_get_commn_nm(SURP_AMT_DELV_WAY) SURP_AMT_DELV_WAY
             , NVL(SUM(HRD_CNT1),0) CNT1
             , NVL(SUM(HRD_AMT1),0) AMT1
             , NVL(SUM(HRD_CNT2),0) CNT2
             , NVL(SUM(HRD_AMT2),0) AMT2
             , NVL(SUM(HRD_CNT3),0) CNT3
             , NVL(SUM(HRD_AMT3),0) AMT3
             , NVL(SUM(TOT_CNT),0)  CNT4
             , NVL(SUM(TOT_AMT),0)  AMT4
             , ROW_NUMBER() OVER(ORDER BY SURP_AMT_DELV_WAY) ORDERED
          FROM (  
                  SELECT SURP_AMT_DELV_WAY
                       , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                       , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT))  HRD_AMT1
                       , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                       , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT))  HRD_AMT2
                       , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                       , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT))  HRD_AMT3
                       , COUNT (DISTINCT BIZ_CD)                              TOT_CNT
                       , SUM(REAL_SURP_AMT)                                   TOT_AMT
                    FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SURP_AMT_DELV_WAY
                                 , BIZ.BIZ_PRPS_TYP
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                             AND SURP_AMT_DELV_WAY IS NOT NULL
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY SURP_AMT_DELV_WAY
               )
         GROUP BY ROLLUP(SURP_AMT_DELV_WAY)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.SURP_AMT_DELV_WAY)SURP_AMT_DELV_WAY 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.AMT1,0,0,ROUND(A.CNT1/B.CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.AMT1,0,0,ROUND(A.CNT2/B.CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , DECODE(B.AMT1,0,0,ROUND(A.CNT3/B.CNT3*100,1)) PER_CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)) PER3
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;


-- 지원기간별 현황

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(SURP_AMT_DELV_WAY)RN
             , f_get_commn_nm(SURP_AMT_DELV_WAY) SURP_AMT_DELV_WAY
             , NVL(SUM(BIZ_CNT1),0) BIZ_CNT1
             , NVL(SUM(BIZ_AMT1),0) BIZ_AMT1
             , NVL(SUM(BIZ_CNT2),0) BIZ_CNT2
             , NVL(SUM(BIZ_AMT2),0) BIZ_AMT2
             , NVL(SUM(BIZ_CNT3),0) BIZ_CNT3
             , NVL(SUM(BIZ_AMT3),0) BIZ_AMT3
             , NVL(SUM(BIZ_CNT4),0) BIZ_CNT4
             , NVL(SUM(BIZ_AMT4),0) BIZ_AMT4
             , NVL(SUM(TOT_CNT),0)  TOT_CNT
             , NVL(SUM(TOT_AMT),0)  TOT_AMT
             , ROW_NUMBER() OVER(ORDER BY SURP_AMT_DELV_WAY) ORDERED
          FROM (  
                  SELECT SURP_AMT_DELV_WAY
                       , COUNT (DISTINCT DECODE(TM_FLAG, 'K014001', BIZ_CD))        BIZ_CNT1
                       , SUM(DECODE(TM_FLAG, 'K014001', REAL_SURP_AMT))  BIZ_AMT1
                       , COUNT (DISTINCT DECODE(TM_FLAG, 'K014002', BIZ_CD))        BIZ_CNT2
                       , SUM(DECODE(TM_FLAG, 'K014002', REAL_SURP_AMT))  BIZ_AMT2
                       , COUNT (DISTINCT DECODE(TM_FLAG, 'K014003', BIZ_CD))        BIZ_CNT3
                       , SUM(DECODE(TM_FLAG, 'K014003', REAL_SURP_AMT))  BIZ_AMT3
                       , COUNT (DISTINCT DECODE(TM_FLAG, '미정', BIZ_CD))        BIZ_CNT4
                       , SUM(DECODE(TM_FLAG, '미정', REAL_SURP_AMT))  BIZ_AMT4
                       , COUNT (DISTINCT BIZ_CD)                              TOT_CNT
                       , SUM(REAL_SURP_AMT)                                   TOT_AMT
                    FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SURP_AMT_DELV_WAY
                                 , NVL(TM_FLAG,'미정') TM_FLAG
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                             AND SURP_AMT_DELV_WAY IS NOT NULL
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY SURP_AMT_DELV_WAY
               )
         GROUP BY ROLLUP(SURP_AMT_DELV_WAY)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.SURP_AMT_DELV_WAY)SURP_AMT_DELV_WAY 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) TOT_CNT
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) TOT_AMT
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.BIZ_CNT1,0,0,ROUND(A.BIZ_CNT1/B.BIZ_CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.BIZ_AMT1,0,0,ROUND(A.BIZ_AMT1/B.BIZ_AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.BIZ_CNT2,0,0,ROUND(A.BIZ_CNT2/B.BIZ_CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.BIZ_CNT3,'9,999,999,999,999')) CNT3
     , DECODE(B.BIZ_CNT3,0,0,ROUND(A.BIZ_CNT3/B.BIZ_CNT3*100,1)) PER_CNT3
     , TRIM(TO_CHAR(A.BIZ_AMT3,'9,999,999,999,999')) AMT3
     , DECODE(B.BIZ_AMT3,0,0,ROUND(A.BIZ_AMT3/B.BIZ_AMT3*100,1)) PER3
     , TRIM(TO_CHAR(A.BIZ_CNT4,'9,999,999,999,999')) CNT4
     , DECODE(B.BIZ_CNT4,0,0,ROUND(A.BIZ_CNT4/B.BIZ_CNT4*100,1)) PER_CNT4
     , TRIM(TO_CHAR(A.BIZ_AMT4,'9,999,999,999,999')) AMT4
     , DECODE(B.BIZ_AMT4,0,0,ROUND(A.BIZ_AMT4/B.BIZ_AMT4*100,1)) PER4
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;


-- *지원대상 유형

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(SURP_AMT_DELV_WAY)RN
             , f_get_commn_nm(SURP_AMT_DELV_WAY) SURP_AMT_DELV_WAY
             , NVL(SUM(BIZ_CNT1),0) BIZ_CNT1
             , NVL(SUM(BIZ_AMT1),0) BIZ_AMT1
             , NVL(SUM(BIZ_CNT2),0) BIZ_CNT2
             , NVL(SUM(BIZ_AMT2),0) BIZ_AMT2
             , NVL(SUM(BIZ_CNT3),0) BIZ_CNT3
             , NVL(SUM(BIZ_AMT3),0) BIZ_AMT3
             , NVL(SUM(TOT_CNT),0)  TOT_CNT
             , NVL(SUM(TOT_AMT),0)  TOT_AMT
             , ROW_NUMBER() OVER(ORDER BY SURP_AMT_DELV_WAY) ORDERED
          FROM (  
                  SELECT SURP_AMT_DELV_WAY
                       , COUNT (DISTINCT DECODE(SURP_UNIT_TYP, 'K020001', BIZ_CD))        BIZ_CNT1
                       , SUM(DECODE(SURP_UNIT_TYP, 'K020001', REAL_SURP_AMT))  BIZ_AMT1
                       , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN A.BIZ_CD ELSE NULL END)        BIZ_CNT2
                       , SUM(CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN REAL_SURP_AMT ELSE 0 END)  BIZ_AMT2
                       , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN A.BIZ_CD ELSE NULL END)        BIZ_CNT3
                       , SUM(CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN REAL_SURP_AMT ELSE 0 END)  BIZ_AMT3
                       , COUNT (DISTINCT BIZ_CD)                              TOT_CNT
                       , SUM(REAL_SURP_AMT)                                   TOT_AMT
                    FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SURP_AMT_DELV_WAY
                                 , SURP_UNIT_TYP
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                             AND SURP_AMT_DELV_WAY IS NOT NULL
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY SURP_AMT_DELV_WAY
               )
         GROUP BY ROLLUP(SURP_AMT_DELV_WAY)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.SURP_AMT_DELV_WAY)SURP_AMT_DELV_WAY 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) TOT_CNT
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) TOT_AMT
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.BIZ_CNT1,0,0,ROUND(A.BIZ_CNT1/B.BIZ_CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.BIZ_AMT1,0,0,ROUND(A.BIZ_AMT1/B.BIZ_AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.BIZ_CNT2,0,0,ROUND(A.BIZ_CNT2/B.BIZ_CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.BIZ_CNT3,'9,999,999,999,999')) CNT3
     , DECODE(B.BIZ_CNT3,0,0,ROUND(A.BIZ_CNT3/B.BIZ_CNT3*100,1)) PER_CNT3
     , TRIM(TO_CHAR(A.BIZ_AMT3,'9,999,999,999,999')) AMT3
     , DECODE(B.BIZ_AMT3,0,0,ROUND(A.BIZ_AMT3/B.BIZ_AMT3*100,1)) PER3
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;




/*부처별 지원액 교부방식*/
--*부처별 지원액 교부방식(제외)

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(GVM_INSTN_CD)RN
             , F_GET_INSTN_NM('INSTN', GVM_INSTN_CD) GVM_INSTN_CD
             , NVL(SUM(BIZ_CNT1),0) CNT1
             , NVL(SUM(BIZ_AMT1),0) AMT1
             , NVL(SUM(BIZ_CNT2),0) CNT2
             , NVL(SUM(BIZ_AMT2),0) AMT2
             , NVL(SUM(TOT_CNT),0)  CNT4
             , NVL(SUM(TOT_AMT),0)  AMT4
             , ROW_NUMBER() OVER(ORDER BY decode(GVM_INSTN_CD,null,9,1) ,SUM(TOT_CNT) desc) ORDERED
          FROM (  
                  SELECT GVM_INSTN_CD
                       , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019001', BIZ_CD))        BIZ_CNT1
                       , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019001', REAL_SURP_AMT))  BIZ_AMT1
                       , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019002', BIZ_CD))        BIZ_CNT2
                       , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019002', REAL_SURP_AMT))  BIZ_AMT2
                       , COUNT (DISTINCT BIZ_CD)                              TOT_CNT
                       , SUM(REAL_SURP_AMT)                                   TOT_AMT
                    FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , BIZ.GVM_INSTN_CD
                                 , SURP_AMT_DELV_WAY
                                 , SURP_UNIT_TYP
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY GVM_INSTN_CD
               )
         GROUP BY ROLLUP(GVM_INSTN_CD)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.GVM_INSTN_CD)GVM_INSTN_CD 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.AMT1,0,0,ROUND(A.CNT1/B.CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.AMT1,0,0,ROUND(A.CNT2/B.CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;



--*사업목적별 지원액 교부방식

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(BIZ_PRPS_TYP)RN
             , f_get_commn_nm(BIZ_PRPS_TYP) BIZ_PRPS_TYP
             , NVL(SUM(BIZ_CNT1),0) CNT1
             , NVL(SUM(BIZ_AMT1),0) AMT1
             , NVL(SUM(BIZ_CNT2),0) CNT2
             , NVL(SUM(BIZ_AMT2),0) AMT2
             , NVL(SUM(TOT_CNT),0)  CNT4
             , NVL(SUM(TOT_AMT),0)  AMT4
             , ROW_NUMBER() OVER(ORDER BY BIZ_PRPS_TYP) ORDERED
          FROM (  
                  SELECT BIZ_PRPS_TYP
                       , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019001', BIZ_CD))        BIZ_CNT1
                       , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019001', REAL_SURP_AMT))  BIZ_AMT1
                       , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019002', BIZ_CD))        BIZ_CNT2
                       , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019002', REAL_SURP_AMT))  BIZ_AMT2
                       , COUNT (DISTINCT BIZ_CD)                              TOT_CNT
                       , SUM(REAL_SURP_AMT)                                   TOT_AMT
                    FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , BIZ_PRPS_TYP
                                 , SURP_AMT_DELV_WAY
                                 , SURP_UNIT_TYP
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                             AND BIZ_PRPS_TYP IS NOT NULL
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY BIZ_PRPS_TYP
               )
         GROUP BY ROLLUP(BIZ_PRPS_TYP)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.BIZ_PRPS_TYP)BIZ_PRPS_TYP 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , DECODE(A.CNT4,0,0,ROUND(A.CNT1/A.CNT4*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , DECODE(A.AMT4,0,0,ROUND(A.AMT1/A.AMT4*100,1)) PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , DECODE(A.CNT4,0,0,ROUND(A.CNT2/A.CNT4*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , DECODE(A.AMT4,0,0,ROUND(A.AMT2/A.AMT4*100,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
--     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;
