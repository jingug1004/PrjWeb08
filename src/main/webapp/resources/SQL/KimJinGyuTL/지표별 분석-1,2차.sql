/** ?б??? ???????? ??? (????)**/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) RN
   , A.UNIV_ESTB
   , A.UNIV_ZON
   , A.UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(TOT_CNT),0)   TOT_CNT
   , NVL(SUM(TOT_AMT),0)   TOT_AMT
   , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
FROM (
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
     ) A
    , ( 
          SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
               , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
               , SUM(REAL_SURP_AMT)                                               TOT_AMT
            FROM (
                      SELECT TRGT.BIZ_YR
                           , TRGT.BIZ_CD
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                       AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ??? ???? */
                       AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , ( 
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('U', 'G')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2011'
             GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
     ) B
     , (
          SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
            , COUNT(DISTINCT SCHL_CD) SCHL_CNT
            , SUM(RE_STD_NUM) RE_STD_NUM
          FROM (
                SELECT SRY_YY, SCHL_CD
                   , MAX(SCHL_HG_NM)        SCHL_HG_NM
                   , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                   , MAX(ZON_CD)            RE_ZON_CD
                   , SUM(STD_NUM)           RE_STD_NUM
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                             AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                      )
                GROUP BY SRY_YY, SCHL_CD
                ) 
           WHERE SRY_YY = '2011'
           GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
     ) C
 WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
  AND A.UNIV_ZON  = B.UNIV_ZON(+)
  AND A.UNIV_SIZE = B.UNIV_SIZE(+)
  AND A.UNIV_ESTB = C.UNIV_ESTB(+)
  AND A.UNIV_ZON  = C.UNIV_ZON(+)
  AND A.UNIV_SIZE = C.UNIV_SIZE(+)
GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.TOT_AMT/A.SCHL_CNT,0)),'9,999,999,999,999') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;




/** ?б??? ???????? ??? (????????)**/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) RN
   , A.UNIV_ESTB
   , A.UNIV_ZON
   , A.UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(TOT_CNT),0)   TOT_CNT
   , NVL(SUM(TOT_AMT),0)   TOT_AMT
   , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
FROM (
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
     ) A
    , ( 
          SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
               , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
               , SUM(REAL_SURP_AMT)                                               TOT_AMT
            FROM (
                      SELECT TRGT.BIZ_YR
                           , TRGT.BIZ_CD
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                       AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
                       AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , ( 
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('C')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2011'
             GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
     ) B
     , (
          SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
            , COUNT(DISTINCT SCHL_CD) SCHL_CNT
            , SUM(RE_STD_NUM) RE_STD_NUM
          FROM (
                SELECT SRY_YY, SCHL_CD
                   , MAX(SCHL_HG_NM)        SCHL_HG_NM
                   , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                   , MAX(ZON_CD)            RE_ZON_CD
                   , SUM(STD_NUM)           RE_STD_NUM
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN IN ('C')  /* ???????и? */
                             AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                      )
                GROUP BY SRY_YY, SCHL_CD
                ) 
           WHERE SRY_YY = '2011'
           GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
     ) C
 WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
  AND A.UNIV_ZON  = B.UNIV_ZON(+)
  AND A.UNIV_SIZE = B.UNIV_SIZE(+)
  AND A.UNIV_ESTB = C.UNIV_ESTB(+)
  AND A.UNIV_ZON  = C.UNIV_ZON(+)
  AND A.UNIV_SIZE = C.UNIV_SIZE(+)
GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.TOT_AMT/A.SCHL_CNT,0)),'9,999,999,999,999') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;
 





/** ???????? ???? ???? 20?? ???? : ?б??? ???? ??? ????(????) **/

SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ??? ???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('U', 'G')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 9 desc
 
 

/** ???????? ???? ???? 20?? ???? : ?б??? ???? ??? ????(????????) **/

SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('C')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 9 desc





/** ?л?1?δ? ???????? ??? (????) **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) RN
   , A.UNIV_ESTB
   , A.UNIV_ZON
   , A.UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(TOT_CNT),0)   TOT_CNT
   , NVL(SUM(TOT_AMT),0)   TOT_AMT
   , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
FROM (
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
     ) A
    , ( 
          SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
               , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
               , SUM(REAL_SURP_AMT)                                               TOT_AMT
            FROM (
                      SELECT TRGT.BIZ_YR
                           , TRGT.BIZ_CD
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                       AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ??? ???? */
                       AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , ( 
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('U', 'G')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2011'
             GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
     ) B
     , (
          SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
            , COUNT(DISTINCT SCHL_CD) SCHL_CNT
            , SUM(RE_STD_NUM) RE_STD_NUM
          FROM (
                SELECT SRY_YY, SCHL_CD
                   , MAX(SCHL_HG_NM)        SCHL_HG_NM
                   , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                   , MAX(ZON_CD)            RE_ZON_CD
                   , SUM(STD_NUM)           RE_STD_NUM
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                             AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                      )
                GROUP BY SRY_YY, SCHL_CD
                ) 
           WHERE SRY_YY = '2011'
           GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
     ) C
 WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
  AND A.UNIV_ZON  = B.UNIV_ZON(+)
  AND A.UNIV_SIZE = B.UNIV_SIZE(+)
  AND A.UNIV_ESTB = C.UNIV_ESTB(+)
  AND A.UNIV_ZON  = C.UNIV_ZON(+)
  AND A.UNIV_SIZE = C.UNIV_SIZE(+)
GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999')) RE_STD_NUM 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.TOT_AMT/A.RE_STD_NUM,0)),'9,999,999,999,999') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;



/** ?л?1?δ? ???????? ??? (????????) **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) RN
   , A.UNIV_ESTB
   , A.UNIV_ZON
   , A.UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(TOT_CNT),0)   TOT_CNT
   , NVL(SUM(TOT_AMT),0)   TOT_AMT
   , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
FROM (
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
     ) A
    , ( 
          SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
               , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
               , SUM(REAL_SURP_AMT)                                               TOT_AMT
            FROM (
                      SELECT TRGT.BIZ_YR
                           , TRGT.BIZ_CD
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                       AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
                       AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , ( 
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('C')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2011'
             GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
     ) B
     , (
          SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
            , COUNT(DISTINCT SCHL_CD) SCHL_CNT
            , SUM(RE_STD_NUM) RE_STD_NUM
          FROM (
                SELECT SRY_YY, SCHL_CD
                   , MAX(SCHL_HG_NM)        SCHL_HG_NM
                   , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                   , MAX(ZON_CD)            RE_ZON_CD
                   , SUM(STD_NUM)           RE_STD_NUM
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN IN ('C')  /* ???????и? */
                             AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                      )
                GROUP BY SRY_YY, SCHL_CD
                ) 
           WHERE SRY_YY = '2011'
           GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
     ) C
 WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
  AND A.UNIV_ZON  = B.UNIV_ZON(+)
  AND A.UNIV_SIZE = B.UNIV_SIZE(+)
  AND A.UNIV_ESTB = C.UNIV_ESTB(+)
  AND A.UNIV_ZON  = C.UNIV_ZON(+)
  AND A.UNIV_SIZE = C.UNIV_SIZE(+)
GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999')) RE_STD_NUM 
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT 
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT 
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.TOT_AMT/A.RE_STD_NUM,0)),'9,999,999,999,999') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;
 
 
 

/** ???????? ???? ???? 20?? ???? : ?л?1?δ? ???? ??? ????(????) **/

SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
   , DECODE(B.STD_NUM,0,0,ROUND(SUM(REAL_SURP_AMT)/B.STD_NUM,0))      PER_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ??? ???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('U', 'G')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 10 desc
 
 

/** ???????? ???? ???? 20?? ???? : ?л?1?δ? ???? ??? ????(????????) **/

SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
   , DECODE(B.STD_NUM,0,0,ROUND(SUM(REAL_SURP_AMT)/B.STD_NUM,0))      PER_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('C')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 10 desc




/** ????????? ??????(????): HRD, R&D, ???? **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
             , RE_STD_NUM
          FROM (
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
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
                                 AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                                 AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
                                 AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                                       , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                                       , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                          ELSE '' 
                                                      END ZON_CD 
                                                   , STD_NUM
                                                FROM T_SCH_INFO_HIST
                                               WHERE UNIV_GUBUN in ('U', 'G')
                                                 AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
               , (
                    SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999'))                RE_STD_NUM 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT1/A.SCHL_CNT,0)),'9,999,999,999,999') PER1
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT1/A.RE_STD_NUM,0)),'9,999,999,999,999') PER11
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT2/A.SCHL_CNT,0)),'9,999,999,999,999') PER2
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT2/A.RE_STD_NUM,0)),'9,999,999,999,999') PER22
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT3/A.SCHL_CNT,0)),'9,999,999,999,999') PER3
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT3/A.RE_STD_NUM,0)),'9,999,999,999,999') PER33
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;


/** ????????? ??????(????????): HRD, R&D, ???? **/

WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
             , RE_STD_NUM
          FROM (
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
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
                                 AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                                 AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ????? ???, ???????????????????? ???? */
                                 AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                                       , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                                       , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                          ELSE '' 
                                                      END ZON_CD 
                                                   , STD_NUM
                                                FROM T_SCH_INFO_HIST
                                               WHERE UNIV_GUBUN in ('C')
                                                 AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
               , (
                    SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN IN ('C')  /* ???????и? */
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999'))                RE_STD_NUM 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT1/A.SCHL_CNT,0)),'9,999,999,999,999') PER1
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT1/A.RE_STD_NUM,0)),'9,999,999,999,999') PER11
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT2/A.SCHL_CNT,0)),'9,999,999,999,999') PER2
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT2/A.RE_STD_NUM,0)),'9,999,999,999,999') PER22
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT3/A.SCHL_CNT,0)),'9,999,999,999,999') PER3
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT3/A.RE_STD_NUM,0)),'9,999,999,999,999') PER33
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;


/** ????????? ??????(????): ??????????, ???л?? */

WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
             , RE_STD_NUM
          FROM (
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_FLAG, 'K042001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_FLAG, 'K042002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_FLAG
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
                                 AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                                 AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001', 'K042002')  /* ??????????, ???л?? */
                                 AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                                       , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                                       , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                          ELSE '' 
                                                      END ZON_CD 
                                                   , STD_NUM
                                                FROM T_SCH_INFO_HIST
                                               WHERE UNIV_GUBUN in ('U', 'G')
                                                 AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
               , (
                    SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999'))                RE_STD_NUM 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT1/A.SCHL_CNT,0)),'9,999,999,999,999') PER1
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT1/A.RE_STD_NUM,0)),'9,999,999,999,999') PER11
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999'))AMT2
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT2/A.SCHL_CNT,0)),'9,999,999,999,999') PER2
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT2/A.RE_STD_NUM,0)),'9,999,999,999,999') PER22
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;



/** ????????? ??????(????????): ??????????, ???л?? */

WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(RE_STD_NUM),0) RE_STD_NUM
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
             , RE_STD_NUM
          FROM (
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                     UNION 
                    SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_FLAG, 'K042001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_FLAG, 'K042002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_FLAG, 'K042002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_FLAG
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
                                 AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
                                 AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                 AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001', 'K042002')  /* ??????????, ???л?? */
                                 AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                           )A
                         , ( 
                                  SELECT SRY_YY, SCHL_CD
                                       , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                                       , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                                       , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                                    FROM (
                                              SELECT SRY_YY, SCHL_HG_NM
                                                   , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                                   , ORGCODE
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                          ELSE '' 
                                                      END ZON_CD 
                                                   , STD_NUM
                                                FROM T_SCH_INFO_HIST
                                               WHERE UNIV_GUBUN in ('C')
                                                 AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
               , (
                    SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                      , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                      , SUM(RE_STD_NUM) RE_STD_NUM
                    FROM (
                          SELECT SRY_YY, SCHL_CD
                             , MAX(SCHL_HG_NM)        SCHL_HG_NM
                             , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                             , MAX(ZON_CD)            RE_ZON_CD
                             , SUM(STD_NUM)           RE_STD_NUM
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN IN ('C')  /* ???????и? */
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                          GROUP BY SRY_YY, SCHL_CD
                          ) 
                     WHERE SRY_YY = '2011'
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT 
     , TRIM(TO_CHAR(A.RE_STD_NUM,'9,999,999,999,999'))                RE_STD_NUM 
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT1/A.SCHL_CNT,0)),'9,999,999,999,999') PER1
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT1/A.RE_STD_NUM,0)),'9,999,999,999,999') PER11
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999'))AMT2
     , TO_CHAR(DECODE(A.SCHL_CNT,0,0,ROUND(A.AMT2/A.SCHL_CNT,0)),'9,999,999,999,999') PER2
     , TO_CHAR(DECODE(A.RE_STD_NUM,0,0,ROUND(A.AMT2/A.RE_STD_NUM,0)),'9,999,999,999,999') PER22
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
 ;



/** ?????????? ???????? ???? ???? 20?? ???? : ??????? ???? **/

--1.????
SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001')  /* ???????????? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('U', 'G')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 9 desc
 

--2.????????
SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042001')  /* ???????????? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('C')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 9 desc



/** ???л?? ???????? ???? ???? 20?? ???? : ?л?1?δ? ?????? ???? **/

--1.????
SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
   , DECODE(B.STD_NUM,0,0,ROUND(SUM(REAL_SURP_AMT)/B.STD_NUM,0))      PER_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042002')  /* ???л???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('U', 'G')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 10 desc
 

--2. ????????
SELECT B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
   , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
   , SUM(REAL_SURP_AMT)                                               TOT_AMT
   , DECODE(B.STD_NUM,0,0,ROUND(SUM(REAL_SURP_AMT)/B.STD_NUM,0))      PER_AMT
FROM (
          SELECT TRGT.BIZ_YR
               , TRGT.BIZ_CD
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
           AND BIZ_EXE_END_YN = 'Y'    /* ???????? ???? ???? */
           AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
           AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
           AND TRGT.BIZ_CD = BIZM.BIZ_CD
           AND TRGT.BIZ_YR = BIZM.BIZ_YR
           AND BIZM.BIZ_CD = BIZ.BIZ_CD
           AND BIZ.BIZ_FLAG in ( 'K042002')  /* ???л???? */
           AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
     )A
   , ( 
            SELECT SRY_YY, SCHL_CD, MAX(SCHL_HG_NM) SCHL_HG_NM
                 , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                 , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                 , CASE WHEN SUM(STD_NUM) >= 4000            THEN '????' ELSE '???????'END        UNIV_SIZE
                 , SUM(STD_NUM) STD_NUM
              FROM (
                        SELECT SRY_YY
                             , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                             , ORGCODE
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN SCHL_HG_NM 
                                    ELSE '' 
                                END SCHL_HG_NM
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                    ELSE '' 
                                END ESTB_SC_DIV
                             , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                    ELSE '' 
                                END ZON_CD 
                             , STD_NUM
                          FROM T_SCH_INFO_HIST
                         WHERE UNIV_GUBUN in ('C')
                           AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                    )
             GROUP BY SRY_YY, SCHL_CD
       )B
 WHERE A.BIZ_YR = B.SRY_YY
   AND A.SCHL_CD = B.SCHL_CD
   AND A.BIZ_YR = '2011'
 GROUP BY  B.SRY_YY, B.SCHL_CD, B.SCHL_HG_NM, B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE, B.STD_NUM
 ORDER BY 10 desc


/** ?????????? ???? ?????? : ??? **/

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CNT),0)             SCHL_CNT
         , 103  BIZ_CNT--, NVL(SUM(TOT_CNT),0)              BIZ_CNT
         , NVL(SUM(TOT_AMT),0)              BIZ_AMT
         , NVL(SUM(IN_CNT1),0)              IN_CNT1
         , NVL(SUM(IN_CNT2),0)              IN_CNT2 
         , NVL(SUM(OUT_CNT1),0)             OUT_CNT1
         , NVL(SUM(OUT_CNT2),0)             OUT_CNT2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           )A
         , (
                 SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS IN_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS IN_CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS OUT_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS OUT_CNT2
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
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
                         AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                         AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* ??????? ????? ???? */
                         AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* ???????б???θ? */
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
                     ) A
                   , (
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('U', 'G')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                    ) B
               WHERE A.BIZ_YR = B.SRY_YY
                 AND A.SCHL_CD = B.SCHL_CD
                 AND A.BIZ_YR = '2011'
               GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
           )B
           , (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                                   AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                            )
                      GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           ) C
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
       AND A.UNIV_ESTB = C.UNIV_ESTB(+)
       AND A.UNIV_ZON  = C.UNIV_ZON(+)
       AND A.UNIV_SIZE = C.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) 
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE) UNIV_SIZE 
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999'))  OUT_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.IN_CNT1/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_IN_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.OUT_CNT1/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_OUT_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_IN_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_OUT_CNT1
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
;



/** <?????????? ???? ?????? : R&D???> **/

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CNT),0)             SCHL_CNT
         , 58  BIZ_CNT--, NVL(SUM(TOT_CNT),0)              BIZ_CNT
         , NVL(SUM(TOT_AMT),0)              BIZ_AMT
         , NVL(SUM(IN_CNT1),0)              IN_CNT1
         , NVL(SUM(IN_CNT2),0)              IN_CNT2 
         , NVL(SUM(OUT_CNT1),0)             OUT_CNT1
         , NVL(SUM(OUT_CNT2),0)             OUT_CNT2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           )A
         , (
                 SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS IN_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS IN_CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS OUT_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS OUT_CNT2
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
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
                         AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                         AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* ??????? ????? ???? */
                         AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* ???????б???θ? */
                         AND BIZ.BIZ_PRPS_TYP = 'K027002'
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
                     ) A
                   , (
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('U', 'G')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                    ) B
               WHERE A.BIZ_YR = B.SRY_YY
                 AND A.SCHL_CD = B.SCHL_CD
                 AND A.BIZ_YR = '2011'
               GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
           )B
           , (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                                   AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                            )
                      GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           ) C
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
       AND A.UNIV_ESTB = C.UNIV_ESTB(+)
       AND A.UNIV_ZON  = C.UNIV_ZON(+)
       AND A.UNIV_SIZE = C.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) 
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE) UNIV_SIZE 
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999'))  OUT_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.IN_CNT1/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_IN_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.OUT_CNT1/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_OUT_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_IN_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_OUT_CNT1
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
;


/** <?????????? ???? ????? : ???, ???> **/

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CNT),0)             SCHL_CNT
         , 103  BIZ_CNT--, NVL(SUM(TOT_CNT),0)              BIZ_CNT
         , NVL(SUM(TOT_AMT),0)              BIZ_AMT
         , NVL(SUM(IN_CNT1),0)              IN_CNT1
         , NVL(SUM(IN_CNT2),0)              IN_CNT2 
         , NVL(SUM(OUT_CNT1),0)             OUT_CNT1
         , NVL(SUM(OUT_CNT2),0)             OUT_CNT2
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '????????' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '??????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '????' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '??' UNIV_ESTB, '???????' UNIV_ZON, '???????' UNIV_SIZE FROM DUAL 
           )A
         , (
                 SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS IN_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS IN_CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS OUT_CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS OUT_CNT2
                     , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                     , SUM(REAL_SURP_AMT)                                               TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
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
                         AND SCH.PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                         AND SCH.UNIV_GUBUN <> 'H'   /* ???п????? ???? */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* ??????? ????? ???? */
                         AND BIZM.pnoti_yn     = 'Y'  /* ?????? ????? */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* ???????б???θ? */
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030002' 
                     ) A
                   , (
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                          FROM (
                                    SELECT SRY_YY, SCHL_HG_NM
                                         , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                         , ORGCODE
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN in ('U', 'G')
                                       AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                    ) B
               WHERE A.BIZ_YR = B.SRY_YY
                 AND A.SCHL_CD = B.SCHL_CD
                 AND A.BIZ_YR = '2011'
               GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
           )B
           , (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CNT
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '??'   ELSE '????????'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '??????' ELSE '???????'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 10000            THEN '????' ELSE '???????'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('U','G')  /* ???и? */
                                   AND PNOTI_YN = 'Y'      /* ??????? ???? ???? */
                            )
                      GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           ) C
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
       AND A.UNIV_ESTB = C.UNIV_ESTB(+)
       AND A.UNIV_ZON  = C.UNIV_ZON(+)
       AND A.UNIV_SIZE = C.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) 
)
SELECT '2011'
     , DECODE(A.RN,'7','???','????')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','???','7','',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE) UNIV_SIZE 
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999'))   IN_CNT1
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999'))  OUT_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.IN_CNT1/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_IN_CNT1
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.OUT_CNT1/A.BIZ_CNT,1)),'FM999,990.0') PER_BIZ_OUT_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_IN_CNT1
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT1/A.PER_AMT,1)),'FM999,990.0') PER_AMT_OUT_CNT1
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999'))   IN_CNT2
     , TRIM(TO_CHAR(A.OUT_CNT2,'9,999,999,999,999'))  OUT_CNT2 
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.IN_CNT2/A.BIZ_CNT,1)),'FM999,990.0')  PER_BIZ_IN_CNT2
     , TO_CHAR(DECODE(A.BIZ_CNT,0,0,ROUND(A.OUT_CNT2/A.BIZ_CNT,1)),'FM999,990.0') PER_BIZ_OUT_CNT2 
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.IN_CNT2/A.PER_AMT,1)),'FM999,990.0') PER_AMT_IN_CNT2
     , TO_CHAR(DECODE(A.PER_AMT,0,0,ROUND(A.OUT_CNT2/A.PER_AMT,1)),'FM999,990.0') PER_AMT_OUT_CNT2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
 WHERE A.RN IN ('0','3','7')
;


