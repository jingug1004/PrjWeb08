/*
Ⅲ. 고등교육 재정지원 주요 지표별 분석

1) 고등교육 재정지원의 충족성

① 유형별 고등교육 재정지원의 규모
*/

WITH TMP_A AS 
(
     SELECT GROUPING_ID(ATTR_VAL1) RN 
          , F_GET_COMMN_NM(ATTR_VAL1)ATTR_VAL1
          , SUM(ATTR_VAL2)ATTR_VAL2
          , SUM(ATTR_VAL3)ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY nvl(F_GET_COMMN_NM(ATTR_VAL1),'ㅎ') desc) ORDERED
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
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     --, DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , TO_CHAR(DECODE(A.ATTR_VAL2,0,0,ROUND(A.ATTR_VAL3/A.ATTR_VAL2*100,0)),'9,999,999,999,999') ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   


/*
 ② 연구개발지원비율(정부고등교육재정 대비 R&D 지원액)
*/

WITH TMP_A AS 
(
     SELECT BIZ_YR ATTR_VAL1
         , NVL(SUM(HRD_CNT1),0) CNT1
         , NVL(SUM(HRD_AMT1),0) AMT1
         , NVL(SUM(HRD_CNT2),0) CNT2
         , NVL(SUM(HRD_AMT2),0) AMT2
         , NVL(SUM(HRD_CNT3),0) CNT3
         , NVL(SUM(HRD_AMT3),0) AMT3
         , NVL(SUM(TOT_CNT),0)  CNT4
         , NVL(SUM(TOT_AMT),0)  AMT4
       FROM (
            SELECT BIZ_YR
                  , DECODE(BIZ_PRPS_TYP, 'K027001', COUNT (DISTINCT BIZ_CD))        HRD_CNT1
                  , DECODE(BIZ_PRPS_TYP, 'K027001', SUM(REAL_SURP_AMT))  HRD_AMT1
                  , DECODE(BIZ_PRPS_TYP, 'K027002', COUNT (DISTINCT BIZ_CD))        HRD_CNT2
                  , DECODE(BIZ_PRPS_TYP, 'K027002', SUM(REAL_SURP_AMT))  HRD_AMT2
                  , DECODE(BIZ_PRPS_TYP, 'K027003', COUNT (DISTINCT BIZ_CD))        HRD_CNT3
                  , DECODE(BIZ_PRPS_TYP, 'K027003', SUM(REAL_SURP_AMT))  HRD_AMT3
                  , COUNT (DISTINCT BIZ_CD)                         TOT_CNT
                  , SUM(REAL_SURP_AMT)                                   TOT_AMT
               FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      --, nvl(BIZ.BIZ_PRPS_TYP,'K0539') BIZ_PRPS_TYP
                      , BIZ_PRPS_TYP
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
                     --AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                     AND TRGT.BIZ_YR = '2011'
                ) A
              GROUP BY BIZ_YR, BIZ_PRPS_TYP
            ) D
      GROUP BY BIZ_YR
)
SELECT '2011'
--     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
  --   , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT4/A.AMT4*100,1)),'FM999,990') PER4
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT1/A.AMT4*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT2/A.AMT4*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT3/A.AMT4*100,1)),'FM999,990.0') PER3
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   




/* 
2) 고등교육 재정지원의 자구성
중앙정부와 지방자치단체의 고등교육 재정지원 규모
*/

WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.BIZ_PRPS_TYP) RN 
          , F_GET_COMMN_NM(A.BIZ_PRPS_TYP)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT1)               ATTR_VAL3
          , SUM(REAL_SURP_AMT2)               ATTR_VAL4
          , ROW_NUMBER() OVER(ORDER BY A.BIZ_PRPS_TYP) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZ.BIZ_PRPS_TYP
              , case when BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003') then REAL_SURP_AMT else 0 end REAL_SURP_AMT1
              , case when BIZ.BIZ_FLAG in ( 'K042004','K042005') then REAL_SURP_AMT else 0 end REAL_SURP_AMT2
              , SCH_CORSP_INVES_AMT
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
             --AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND BIZ.BIZ_PRPS_TYP IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.BIZ_PRPS_TYP)
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , DECODE(A.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL4/A.ATTR_VAL3*100,1)) ATTR5_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   


/*
3) 고등교육 재정지원의 효율성
*/

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
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
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
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
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
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                         AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
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
                           AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                           AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                           AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
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



/*
4) 고등교육 재정지원의 공정성

학제별 유형별 고등교육재정지원의 규모
*사업목적
*/
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
 WHERE A.RN IN ('0','3')
 ;




/*
5) 고등교육 재정지원의 자율성
*사업목적별 지원금액 교부방식
*/

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
                             AND SURP_AMT_DELV_WAY IS NOT NULL
                         ) A
                   WHERE A.BIZ_YR = '2011'
                   GROUP BY BIZ_PRPS_TYP
               )
         GROUP BY ROLLUP(BIZ_PRPS_TYP)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.BIZ_PRPS_TYP)BIZ_PRPS_TYP 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , DECODE(B.CNT1,0,0,ROUND(A.CNT1/B.CNT1*100,1)) PER_CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)) PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , DECODE(B.CNT2,0,0,ROUND(A.CNT2/B.CNT2*100,1)) PER_CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)) PER2
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , DECODE(B.CNT4,0,0,ROUND(A.CNT4/B.CNT4*100,1)) PER_CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)) PER4
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;
 
 
