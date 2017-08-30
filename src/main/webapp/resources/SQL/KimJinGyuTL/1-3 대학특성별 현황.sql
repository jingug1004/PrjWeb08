/* 홈페이지용 */
/* 대학특성별 현황_대학 */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601141' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
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
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601141'
     , DECODE(A.RN,'7','합계','대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;






/* 대학특성별 현황_전문대학 */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601142' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
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
                                 WHERE UNIV_GUBUN IN ('C')  /* 전문대학만 */
                                   AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601142'
     , DECODE(A.RN,'3','합계','전문대학')
     , DECODE(A.RN,'1','소계','3','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'1','소계','3','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 3) B
 ;

 -- 설립유형추가
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
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
                                 WHERE  UNIV_GUBUN IN ('C')  /* 전문대학만 */
                           AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                          --   AND BIZ.GVM_INSTN_CD <> '1341000' /* 교육부 사업 제외 */
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
                                           WHERE UNIV_GUBUN IN ('C')  /* 전문대학만 */
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601142'
     , DECODE(A.RN,'7','합계','전문대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;


/** 대학특성별(국공립대경상운영비사업제외)_대학 **/
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601151' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
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
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
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
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601151'
     , DECODE(A.RN,'7','합계','대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;






/** 대학특성별(국공립대경상운영비사업제외)_전문대학 **/
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601152' and stats_yr = '2011';


 INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
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
                                 WHERE UNIV_GUBUN IN ('C')  /* 전문대학만 */
                                   AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                       )A
                     , (
                              SELECT SRY_YY, SCHL_CD
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
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601152'
     , DECODE(A.RN,'3','합계','전문대학')
     , DECODE(A.RN,'1','소계','3','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'1','소계','3','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 3) B
 ;


--설립유형 추가
WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
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
                                 WHERE  UNIV_GUBUN IN ('C')  /* 전문대학만 */
                           AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
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
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
                             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                          --   AND BIZ.GVM_INSTN_CD <> '1341000' /* 교육부 사업 제외 */
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
                                           WHERE UNIV_GUBUN IN ('C')  /* 전문대학만 */
                                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601152'
     , DECODE(A.RN,'7','합계','전문대학')
     , DECODE(A.RN,'7','합계',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','소계','7','합계',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;

 INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID
    ,RGST_DTTM
    )


/****************************************************************
* 홈페이지에서는 제외됨. 현황분석(1)에서만 사용
*****************************************************************/


/* 국공립대경상운영비지원사업 포함 */
WITH TMP_A AS
(
      SELECT SRY_YY, SCHL_CD
           , MAX(SCHL_HG_NM)        SCHL_HG_NM
           , MAX(ESTB_SC_DIV)       ESTB_SC_DIV
           , MAX(ZON_CD)            ZON_CD
           , SUM(STD_NUM)           STD_NUM
           , MAX(UNIV_GUBUN)        UNIV_GUBUN
           , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
           , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
           , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모'
                  WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모'
                  ELSE '중·소규모'
             END        UNIV_SIZE
        FROM (
                  SELECT SRY_YY, SCHL_HG_NM
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV
                              ELSE ''
                          END ESTB_SC_DIV
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD
                              ELSE ''
                          END ZON_CD
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
              )
       WHERE SRY_YY = '2011'
       GROUP BY SRY_YY, SCHL_CD
)
, TMP_B AS
(
   SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
       , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
       , REAL_SURP_AMT
    FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
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
               AND BIZ.BIZ_FLAG in ( 'K042001','K042002' ,'K042003')  /* 지자체 사업 제외 */
               AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
         )A
       , (
                SELECT SRY_YY, SCHL_CD
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                   , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모'
                          WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모'
                          ELSE '중·소규모'
                     END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV
                                      ELSE ''
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD
                                      ELSE ''
                                  END ZON_CD
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                      )
               GROUP BY SRY_YY, SCHL_CD
           )B
     WHERE A.BIZ_YR = B.SRY_YY
       AND A.SCHL_CD = B.SCHL_CD
       AND A.BIZ_YR = '2011'
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601111'
     , ATTR1
     , NVL(ATTR2,'합계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(ATTR6,'9,999,999,999,999')) ATTR6
     , TRIM(TO_CHAR(ATTR5,'9,999,999,999,999')) ATTR5
     , DECODE(TOT,0,0, ROUND(ATTR5/TOT*100,1)) PER
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB)  ORDERED
                 , '설립'                                 ATTR1
                 , A.UNIV_ESTB                            ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ESTB, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ESTB) A
                 , (SELECT BIZ_YR, UNIV_ESTB, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ESTB) B
              WHERE A.UNIV_ESTB=B.UNIV_ESTB
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ESTB)
             UNION
            SELECT 'B'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                               ATTR1
                 , A.UNIV_ZON                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ZON, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ZON) A
                 , (SELECT BIZ_YR, UNIV_ZON, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ZON) B
              WHERE A.UNIV_ZON=B.UNIV_ZON
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ZON)
             UNION
            SELECT 'C'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_SIZE)  ORDERED
                 , '규모'                                 ATTR1
                 , A.UNIV_SIZE                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_SIZE, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_SIZE) A
                 , (SELECT BIZ_YR, UNIV_SIZE, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_SIZE) B
              WHERE A.UNIV_SIZE=B.UNIV_SIZE
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_SIZE)
     )
 ;






/* 국공립대경상운영비지원사업 제외 */

WITH TMP_A AS
(
      SELECT SRY_YY, SCHL_CD
           , MAX(SCHL_HG_NM)        SCHL_HG_NM
           , MAX(ESTB_SC_DIV)       ESTB_SC_DIV
           , MAX(ZON_CD)            ZON_CD
           , SUM(STD_NUM)           STD_NUM
           , MAX(UNIV_GUBUN)        UNIV_GUBUN
           , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
           , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
           , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모'
                  WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모'
                  ELSE '중·소규모'
             END        UNIV_SIZE
        FROM (
                  SELECT SRY_YY, SCHL_HG_NM
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV
                              ELSE ''
                          END ESTB_SC_DIV
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD
                              ELSE ''
                          END ZON_CD
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
              )
       WHERE SRY_YY = '2011'
       GROUP BY SRY_YY, SCHL_CD
)
, TMP_B AS
(
   SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
       , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
       , REAL_SURP_AMT
    FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
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
               AND BIZ.BIZ_FLAG in ( 'K042001','K042002' )  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
               AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
         )A
       , (
                SELECT SRY_YY, SCHL_CD
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                   , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모'
                          WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모'
                          ELSE '중·소규모'
                     END        UNIV_SIZE
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV
                                      ELSE ''
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD
                                      ELSE ''
                                  END ZON_CD
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                             AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                      )
               GROUP BY SRY_YY, SCHL_CD
           )B
     WHERE A.BIZ_YR = B.SRY_YY
       AND A.SCHL_CD = B.SCHL_CD
       AND A.BIZ_YR = '2011'
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601111'
     , ATTR1
     , NVL(ATTR2,'합계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(ATTR6,'9,999,999,999,999')) ATTR6
     , TRIM(TO_CHAR(ATTR5,'9,999,999,999,999')) ATTR5
     , DECODE(TOT,0,0, ROUND(ATTR5/TOT*100,1)) PER
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB)  ORDERED
                 , '설립'                                 ATTR1
                 , A.UNIV_ESTB                            ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ESTB, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ESTB) A
                 , (SELECT BIZ_YR, UNIV_ESTB, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ESTB) B
              WHERE A.UNIV_ESTB=B.UNIV_ESTB
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ESTB)
             UNION
            SELECT 'B'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                               ATTR1
                 , A.UNIV_ZON                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ZON, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ZON) A
                 , (SELECT BIZ_YR, UNIV_ZON, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ZON) B
              WHERE A.UNIV_ZON=B.UNIV_ZON
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ZON)
             UNION
            SELECT 'C'                                    RN
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_SIZE)  ORDERED
                 , '규모'                                 ATTR1
                 , A.UNIV_SIZE                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_SIZE, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_SIZE) A
                 , (SELECT BIZ_YR, UNIV_SIZE, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_SIZE) B
              WHERE A.UNIV_SIZE=B.UNIV_SIZE
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_SIZE)
     )
 ;

