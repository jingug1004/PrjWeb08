INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL, ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID
    , RGST_DTTM
    )
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
          SELECT '국·공립' UNIV_ESTB, '수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '국·공립' UNIV_ESTB, '수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '국·공립' UNIV_ESTB, '비수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '국·공립' UNIV_ESTB, '비수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '사립' UNIV_ESTB, '수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '사립' UNIV_ESTB, '수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '사립' UNIV_ESTB, '비수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '사립' UNIV_ESTB, '비수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
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
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042004','K042005')  /* 지자체  */
                       AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                       AND BIZ.BIZ_PRPS_TYP <> 'K027004'/* 국공립대경상운영비 제외 */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , (
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 10000            THEN '대규모' ELSE '중·소규모'END        UNIV_SIZE
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
                                       AND PNOTI_YN = 'Y'      /* 공시대상 사업만 */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2012'
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
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 10000            THEN '대규모' ELSE '중·소규모'END        UNIV_SIZE
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
                           WHERE UNIV_GUBUN IN ('U','G')  /* 대학만 */
                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                      )
                GROUP BY SRY_YY, SCHL_CD
                )
           WHERE SRY_YY = '2012'
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
SELECT '2012'
        ,  STATS_SNO_SQ.NEXTVAL
     , 'UK0560605011'
     , DECODE(A.RN,'대학','합계','대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT
     , TO_CHAR(DECODE(B.TOT_AMT,0,0,ROUND(A.TOT_AMT/B.TOT_AMT*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
  --전문대학
  
INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL, ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID
    , RGST_DTTM
    )
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
          SELECT '국·공립' UNIV_ESTB, '수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '국·공립' UNIV_ESTB, '수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '국·공립' UNIV_ESTB, '비수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '국·공립' UNIV_ESTB, '비수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '사립' UNIV_ESTB, '수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '사립' UNIV_ESTB, '수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
           UNION 
          SELECT '사립' UNIV_ESTB, '비수도권' UNIV_ZON, '대규모' UNIV_SIZE FROM DUAL
           UNION 
          SELECT '사립' UNIV_ESTB, '비수도권' UNIV_ZON, '중·소규모' UNIV_SIZE FROM DUAL 
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
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                       AND TRGT.BIZ_CD = BIZM.BIZ_CD
                       AND TRGT.BIZ_YR = BIZM.BIZ_YR
                       AND BIZM.BIZ_CD = BIZ.BIZ_CD
                       AND BIZ.BIZ_FLAG in ( 'K042004','K042005')  /* 지자체 사업 */
                       AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 */
                       AND BIZ.BIZ_PRPS_TYP <> 'K027004'/* 국공립대경상운영비 제외 */
                       AND SURP_UNIT_TYP IS NOT NULL
                 )A
               , (
                        SELECT SRY_YY, SCHL_CD
                             , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                             , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                             , CASE WHEN SUM(STD_NUM) >= 4000            THEN '대규모' ELSE '중·소규모'END        UNIV_SIZE
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
                                       AND PNOTI_YN = 'Y'      /* 공시대상 사업만 */
                                )
                         GROUP BY SRY_YY, SCHL_CD
                   )B
             WHERE A.BIZ_YR = B.SRY_YY
               AND A.SCHL_CD = B.SCHL_CD
               AND A.BIZ_YR = '2012'
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
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '대규모' ELSE '중·소규모'END        UNIV_SIZE
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
                           WHERE UNIV_GUBUN IN ('C')  /* 전문대학 */
                             AND PNOTI_YN = 'Y'      /* 공시대상 사업만 */
                      )
                GROUP BY SRY_YY, SCHL_CD
                )
           WHERE SRY_YY = '2012'
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
SELECT '2012'
  ,  STATS_SNO_SQ.NEXTVAL
     , 'CK0560605012'
     , DECODE(A.RN,'전문대학','합계','전문대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999'))   TOT_CNT
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999'))   TOT_AMT
     , TO_CHAR(DECODE(B.TOT_AMT,0,0,ROUND(A.TOT_AMT/B.TOT_AMT*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')

 ;
 