/** 시도별 사업목적별 현황 **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT)TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
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
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;


/** 시도별 재원별 현황 **/
  
WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT)TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(BIZT_MNPV_TYP, 'K015001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZT_MNPV_TYP, 'K015001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZT_MNPV_TYP, 'K015002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZT_MNPV_TYP, 'K015002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZT_MNPV_TYP, 'K015003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZT_MNPV_TYP, 'K015003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZV.BIZT_MNPV_TYP
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , REAL_SURP_AMT    
                                  FROM T_BIZ_SURP_TRGT_INFO TRGT
                                     , T_BIZT_INFO          BIZT
                                     , T_SCH_INFO_HIST      SCH
                                     , T_BIZ_MNG_INFO       BIZM
                                     , T_BIZ_INFO           BIZ
                                     , T_BIZ_MNPV_INFO      BIZV
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
                                 AND BIZM.BIZ_YR = BIZV.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZV.BIZ_CD
                                 AND BIZV.BIZT_MNPV_AMT  > 0
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;
 

/** 지원대상별 현황 */

WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(BIZ_CNT1),0) CNT1
   , NVL(SUM(BIZ_AMT1),0) AMT1
   , NVL(SUM(BIZ_CNT2),0) CNT2
   , NVL(SUM(BIZ_AMT2),0) AMT2
   , NVL(SUM(BIZ_CNT3),0) CNT3
   , NVL(SUM(BIZ_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT1) BIZ_CNT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT1) BIZ_AMT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT2) BIZ_CNT2
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT2) BIZ_AMT2
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT3) BIZ_CNT3
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT3) BIZ_AMT3
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT) TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT) TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(SURP_UNIT_TYP, 'K020001', A.BIZ_CD))        BIZ_CNT1
                         , SUM(DECODE(SURP_UNIT_TYP, 'K020001', REAL_SURP_AMT, 0))            BIZ_AMT1
                         , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN A.BIZ_CD ELSE NULL END) BIZ_CNT2
                         , SUM (CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN REAL_SURP_AMT ELSE 0 END) BIZ_AMT2
                         , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN A.BIZ_CD ELSE NULL END) BIZ_CNT3
                         , SUM (CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN REAL_SURP_AMT ELSE 0 END) BIZ_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , SURP_UNIT_TYP
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
                                 AND SURP_UNIT_TYP IS NOT NULL
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;



/* 지원금액결정방식별 현황 */

WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(BIZ_CNT1),0) CNT1
   , NVL(SUM(BIZ_AMT1),0) AMT1
   , NVL(SUM(BIZ_CNT2),0) CNT2
   , NVL(SUM(BIZ_AMT2),0) AMT2
   , NVL(SUM(BIZ_CNT3),0) CNT3
   , NVL(SUM(BIZ_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT1) BIZ_CNT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT1) BIZ_AMT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT2) BIZ_CNT2
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT2) BIZ_AMT2
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT3) BIZ_CNT3
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT3) BIZ_AMT3
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT) TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT) TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(SURP_AMT_DCISN_WAY, 'K018001', A.BIZ_CD))        BIZ_CNT1
                         , SUM(DECODE(SURP_AMT_DCISN_WAY, 'K018001', REAL_SURP_AMT, 0))            BIZ_AMT1
                         , COUNT (DISTINCT DECODE(SURP_AMT_DCISN_WAY, 'K018002', A.BIZ_CD))        BIZ_CNT2
                         , SUM(DECODE(SURP_AMT_DCISN_WAY, 'K018002', REAL_SURP_AMT, 0))            BIZ_AMT2
                         , COUNT (DISTINCT DECODE(SURP_AMT_DCISN_WAY, 'K018003', A.BIZ_CD))        BIZ_CNT3
                         , SUM(DECODE(SURP_AMT_DCISN_WAY, 'K018003', REAL_SURP_AMT, 0))            BIZ_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , SURP_AMT_DCISN_WAY
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
                                 AND SURP_AMT_DCISN_WAY IS NOT NULL
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;



/* 지원금액교부방식별 현황 */


WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(BIZ_CNT1),0) CNT1
   , NVL(SUM(BIZ_AMT1),0) AMT1
   , NVL(SUM(BIZ_CNT2),0) CNT2
   , NVL(SUM(BIZ_AMT2),0) AMT2
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT1) BIZ_CNT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT1) BIZ_AMT1
             , DECODE(C.UNIV_ZON,'',0, BIZ_CNT2) BIZ_CNT2
             , DECODE(C.UNIV_ZON,'',0, BIZ_AMT2) BIZ_AMT2
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT) TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT) TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019001', A.BIZ_CD))        BIZ_CNT1
                         , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019001', REAL_SURP_AMT, 0))            BIZ_AMT1
                         , COUNT (DISTINCT DECODE(SURP_AMT_DELV_WAY, 'K019002', A.BIZ_CD))        BIZ_CNT2
                         , SUM(DECODE(SURP_AMT_DELV_WAY, 'K019002', REAL_SURP_AMT, 0))            BIZ_AMT2
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
                                     , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                     , SURP_AMT_DELV_WAY
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
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;



/** 사업유형별 현황 **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID( UNIV_ZON)RN
   , F_GET_COMMN_NM_CHILD('K051', UNIV_ZON) UNIV_ZON
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ZON) ORDERED
FROM (
        SELECT C.UNIV_ZON
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(C.UNIV_ZON,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(C.UNIV_ZON,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(C.UNIV_ZON,'',0, TOT_CNT)TOT_CNT
             , DECODE(C.UNIV_ZON,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
          FROM ( 
                    SELECT A.BIZ_YR, B.UNIV_ZON
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_FLAG, 'K042001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_FLAG, 'K042002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_FLAG, 'K042003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
                                     , BIZ_FLAG
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
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , MAX(ZON_CD)        UNIV_ZON
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
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
                       GROUP BY A.BIZ_YR, B.UNIV_ZON
               ) B
               , (
                    SELECT SRY_YY, UNIV_ZON
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , MAX(ZON_CD)        UNIV_ZON
                          FROM (
                                    SELECT SRY_YY
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN SCHL_HG_NM 
                                                ELSE '' 
                                            END SCHL_HG_NM
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','C') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN <> 'H'
                                       AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY,  UNIV_ZON
               ) C
          WHERE C.SRY_YY  = B.BIZ_YR(+)
            AND C.UNIV_ZON = B.UNIV_ZON(+)
   )
GROUP BY ROLLUP(UNIV_ZON)
)
SELECT '2011'
     , NVL(A.UNIV_ZON,'합계') UNIV_ZON
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
  , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;

