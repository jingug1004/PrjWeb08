/*
3)고등교육재정지원의 평가
① 효과성
HRD
(1) 인력양성·지원 성과
*/

--*학제별(학술, 기술)

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(UNIV_GUBUN)RN
             , DECODE(UNIV_GUBUN,'U','대학','C','전문대') UNIV_GUBUN
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
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
             , ROW_NUMBER() OVER(ORDER BY UNIV_GUBUN) ORDERED
          FROM (
                SELECT UNIV_GUBUN 
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
                     , COUNT(DISTINCT A.BIZ_CD)     BIZ_CNT
                     , SUM(REAL_SURP_AMT)           BIZ_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , DECODE(SCH.UNIV_GUBUN, 'G','U',SCH.UNIV_GUBUN) UNIV_GUBUN
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
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030007' 
                  ) A
                  WHERE A.BIZ_YR = '2011'
                   GROUP BY UNIV_GUBUN
          )
         GROUP BY ROLLUP(UNIV_GUBUN)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , TRIM(TO_CHAR(A.SUB1,'9,999,999,999,999'))      SUB1
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.SUB1/B.BIZ_CNT,1)) PER1
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , TRIM(TO_CHAR(A.SUB2,'9,999,999,999,999'))      SUB2
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.SUB2/B.BIZ_CNT,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;



--*대학특성별(학술,기술)
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
            , CNT1
            , CNT2
            , CNT3
            , CNT4
            , CNT5
            , CNT6
            , CNT7
            , CNT8
            , SUB1
            , SUB2
        FROM (    
                  SELECT TRGT.BIZ_YR
                       , TRGT.BIZ_CD
                       , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                       , REAL_SURP_AMT
                       , ATTR1_VAL+ATTR2_VAL CNT1
                       , ATTR3_VAL+ATTR4_VAL CNT2
                       , ATTR5_VAL+ATTR6_VAL CNT3
                       , ATTR7_VAL+ATTR8_VAL CNT4
                       , ATTR1_VAL+ATTR2_VAL
                          + ATTR3_VAL+ATTR4_VAL
                          + ATTR5_VAL+ATTR6_VAL
                          + ATTR7_VAL+ATTR8_VAL  SUB1
                       , ATTR9_VAL+ATTR10_VAL CNT5
                       , ATTR11_VAL+ATTR12_VAL CNT6
                       , ATTR13_VAL+ATTR14_VAL CNT7
                       , ATTR15_VAL+ATTR16_VAL CNT8
                       , ATTR9_VAL+ATTR10_VAL
                          +ATTR11_VAL+ATTR12_VAL
                          +ATTR13_VAL+ATTR14_VAL
                          +ATTR15_VAL+ATTR16_VAL SUB2
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
                   AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                   AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                   AND ACMMT.ACMMT_FLAG(+)   = 'K030007' 
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
     , 'K05601111'
     , ATTR1
     , NVL(ATTR2,'소계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(CNT1,'9,999,999,999,999')) CNT1
     , TRIM(TO_CHAR(CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(SUB1,'9,999,999,999,999')) SUB1
     --, DECODE(BIZ_TOT,0,0,ROUND(SUB1/BIZ_TOT,1)) PER1
     , TRIM(TO_CHAR(CNT5,'9,999,999,999,999')) CNT5
     , TRIM(TO_CHAR(CNT6,'9,999,999,999,999')) CNT6
     , TRIM(TO_CHAR(CNT7,'9,999,999,999,999')) CNT7
     , TRIM(TO_CHAR(CNT8,'9,999,999,999,999')) CNT8
     , TRIM(TO_CHAR(SUB2,'9,999,999,999,999')) SUB2
     --, DECODE(BIZ_TOT,0,0,ROUND(SUB2/BIZ_TOT,1)) PER2
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB)  ORDERED
                 , '설립'                                 ATTR1
                 , A.UNIV_ESTB                            ATTR2
                 --, NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 --, NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR3
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR4 
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
              FROM (SELECT SRY_YY, UNIV_ESTB, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ESTB) A
                 , (SELECT BIZ_YR, UNIV_ESTB, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT 
                      ,SUM(CNT1)CNT1, SUM(CNT2)CNT2, SUM(CNT3)CNT3, SUM(CNT4)CNT4, SUM(SUB1)SUB1, SUM(CNT5)CNT5, SUM(CNT6)CNT6, SUM(CNT7)CNT7, SUM(CNT8)CNT8, SUM(SUB2)SUB2
                    FROM TMP_B GROUP BY BIZ_YR, UNIV_ESTB) B
              WHERE A.UNIV_ESTB=B.UNIV_ESTB
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ESTB) 
             UNION 
            SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                               ATTR1
                 , A.UNIV_ZON                              ATTR2
                 --, NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 --, NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR3
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR4 
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
              FROM (SELECT SRY_YY, UNIV_ZON, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ZON) A
                 , (SELECT BIZ_YR, UNIV_ZON, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT 
                      ,SUM(CNT1)CNT1, SUM(CNT2)CNT2, SUM(CNT3)CNT3, SUM(CNT4)CNT4, SUM(SUB1)SUB1, SUM(CNT5)CNT5, SUM(CNT6)CNT6, SUM(CNT7)CNT7, SUM(CNT8)CNT8, SUM(SUB2)SUB2
                    FROM TMP_B GROUP BY BIZ_YR, UNIV_ZON) B
              WHERE A.UNIV_ZON=B.UNIV_ZON
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ZON)
             UNION 
            SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_SIZE)  ORDERED
                 , '규모'                                 ATTR1
                 , A.UNIV_SIZE                              ATTR2
                 --, NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 --, NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR3
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR4 
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
              FROM (SELECT SRY_YY, UNIV_SIZE, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_SIZE) A
                 , (SELECT BIZ_YR, UNIV_SIZE, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT 
                      ,SUM(CNT1)CNT1, SUM(CNT2)CNT2, SUM(CNT3)CNT3, SUM(CNT4)CNT4, SUM(SUB1)SUB1, SUM(CNT5)CNT5, SUM(CNT6)CNT6, SUM(CNT7)CNT7, SUM(CNT8)CNT8, SUM(SUB2)SUB2
                    FROM TMP_B GROUP BY BIZ_YR, UNIV_SIZE) B
              WHERE A.UNIV_SIZE=B.UNIV_SIZE
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_SIZE) 
     ) 
 ;


-------------이거부터는 쿼리 다시 짜기.....

/*
R&D
(1) 논문성과
*/

--*학제별(국내, 국외)

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(A.UNIV_GUBUN)RN
             , DECODE(A.UNIV_GUBUN,'U','대학','C','전문대') UNIV_GUBUN
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , NVL(SUM(CNT3),0)                 CNT3
             , NVL(SUM(CNT4),0)                 CNT4
             , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
          FROM (
                 SELECT UNIV_GUBUN
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , DECODE(UNIV_GUBUN, 'G','U',UNIV_GUBUN) UNIV_GUBUN
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
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  UNIV_GUBUN
           )A
         GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT3/B.BIZ_CNT,1)) PER3
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT4/B.BIZ_CNT,1)) PER4
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;
 
 

--*대학특성별(국내, 국외)

WITH TMP_A AS 
(        
         SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
             , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
             , REAL_SURP_AMT
             , CNT1
             , CNT2
             , CNT3
             , CNT4
           FROM (
                    SELECT BIZ_YR, BIZ_CD, SCHL_CD 
                       , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                       , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                       , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                       , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                       , SUM(REAL_SURP_AMT) REAL_SURP_AMT
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
                           AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                           AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                           AND TRGT.BIZ_CD = BIZM.BIZ_CD
                           AND TRGT.BIZ_YR = BIZM.BIZ_YR
                           AND BIZM.BIZ_CD = BIZ.BIZ_CD
                           AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                           AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                           AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                           AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                           AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                           AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
                       )
                    GROUP BY BIZ_YR, BIZ_CD, SCHL_CD
             ) A
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
     , 'K0560111'
     , ATTR1
     , NVL(ATTR2,'소계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(CNT1,'9,999,999,999,999')) CNT1
     , TRIM(TO_CHAR(CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(CNT4,'9,999,999,999,999')) CNT4
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB)  ORDERED
                 , '설립'                                  ATTR1
                 , UNIV_ESTB                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ESTB) 
             UNION 
              SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                                ATTR1
                 , UNIV_ZON                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ZON) 
             UNION 
              SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_SIZE)   ORDERED
                 , '규모'                                ATTR1
                 , UNIV_SIZE                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_SIZE) 
)
 ;

/*
(2) 특허성과
*/


--*학제별(국내,국외)

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(A.UNIV_GUBUN)RN
             , DECODE(A.UNIV_GUBUN,'U','대학','C','전문대') UNIV_GUBUN
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , NVL(SUM(CNT3),0)                 CNT3
             , NVL(SUM(CNT4),0)                 CNT4
             , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
          FROM (
                 SELECT UNIV_GUBUN
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT1
                     , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT2
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT3
                     , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT4
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , DECODE(UNIV_GUBUN, 'G','U',UNIV_GUBUN) UNIV_GUBUN
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
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030002' 
                     ) A
               WHERE A.BIZ_YR = '2011'
               GROUP BY  UNIV_GUBUN
           )A
         GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT3/B.BIZ_CNT,1)) PER3
     --, DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT4/B.BIZ_CNT,1)) PER4
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;
 

--*대학특성별(국내, 국외)

WITH TMP_A AS 
(        
         SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
             , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
             , REAL_SURP_AMT
             , CNT1
             , CNT2
             , CNT3
             , CNT4
           FROM (
                    SELECT BIZ_YR, BIZ_CD, SCHL_CD 
                       , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT1
                       , SUM(CASE WHEN  ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT2
                       , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT3
                       , SUM(CASE WHEN  ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT4
                       , SUM(REAL_SURP_AMT) REAL_SURP_AMT
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
                           AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                           AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                           AND TRGT.BIZ_CD = BIZM.BIZ_CD
                           AND TRGT.BIZ_YR = BIZM.BIZ_YR
                           AND BIZM.BIZ_CD = BIZ.BIZ_CD
                           AND BIZ.BIZ_FLAG in ( 'K042001')  /* 일반지원 사업만 포함 */
                           AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                           AND BIZ.GVM_INSTN_CD = '1341000'  /* 교육과학기술부만 */
                           AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                           AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                           AND ACMMT.ACMMT_FLAG(+)   = 'K030002' 
                       )
                    GROUP BY BIZ_YR, BIZ_CD, SCHL_CD
             ) A
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
     , 'K0560111'
     , ATTR1
     , NVL(ATTR2,'소계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(CNT1,'9,999,999,999,999')) CNT1
     , TRIM(TO_CHAR(CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(CNT4,'9,999,999,999,999')) CNT4
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB)  ORDERED
                 , '설립'                                  ATTR1
                 , UNIV_ESTB                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ESTB) 
             UNION 
              SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                                ATTR1
                 , UNIV_ZON                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ZON) 
             UNION 
              SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_SIZE)   ORDERED
                 , '규모'                                ATTR1
                 , UNIV_SIZE                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_SIZE) 
)
 ;
 
-------------------------- 여기부터는 쿼리 다시 짜야함

/*
	(3) 기술료 성과(입력데이터 양이 적어 분석 불가능)-(제외)
	*부처별
*/

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(GVM_INSTN_CD)RN
             , F_GET_INSTN_NM('INSTN', GVM_INSTN_CD) GVM_INSTN_CD
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , ROW_NUMBER() OVER(ORDER BY GVM_INSTN_CD) ORDERED
          FROM (  
                  SELECT GVM_INSTN_CD
                       , COUNT(DISTINCT A.BIZ_CD)   BIZ_CNT
                       , SUM(REAL_SURP_AMT)         BIZ_AMT
                       , SUM(CNT1)                  CNT1
                       , SUM(CNT2)                  CNT2
                    FROM (
                             SELECT A.BIZ_CD
                                  , A.GVM_INSTN_CD
                                  , C.BIZ_SURP_INFO_ID
                                  , C.SCHL_CD
                                  , C.REAL_SURP_AMT
                                  , D.CNT1
                                  , D.CNT2
                               FROM T_BIZ_INFO     A
                                  , T_BIZ_MNG_INFO B
                                  , (
                                         SELECT A.BIZ_CD
                                              , A.BIZ_SURP_INFO_ID
                                              , B.REAL_SURP_AMT
                                              , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                           FROM T_BIZ_SURP_TRGT_INFO A
                                              , T_BIZT_INFO          B
                                              , T_SCH_INFO           C
                                          WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                                            AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                                            AND B.SURP_DT    = '2011' 
                                            AND C.UNIV_GUBUN <> 'H'
                                            AND C.SCHL_CD    <>  '99999999'
                                            AND C.SCHL_CD    <>  '00000000'
                                     )C
                                   , (
                                            SELECT BIZ_SURP_INFO_ID   
                                                 , COUNT(ACMMT_SNO) AS CNT1
                                                 , SUM(ATTR3_VAL) AS CNT2  
                                              FROM T_ACMMT_STS
                                             WHERE ACMMT_FLAG   = 'K030003' 
                                               AND ACMMT_YR     = '2011'
                                             GROUP BY BIZ_SURP_INFO_ID
                                    )D
                              WHERE A.BIZ_CD            = B.BIZ_CD
                                AND A.BIZ_CD            = C.BIZ_CD
                                AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                                AND B.BIZ_YR        = '2011'
                                AND A.BIZ_EFCT_YN   = 'Y'  
                                AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
                     ) A
                   GROUP BY GVM_INSTN_CD
               )
         GROUP BY ROLLUP(GVM_INSTN_CD)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.GVM_INSTN_CD)GVM_INSTN_CD 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;

--*학제별(제외)

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(A.UNIV_GUBUN)RN
             , DECODE(A.UNIV_GUBUN,'U','대학','C','전문대') UNIV_GUBUN
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
          FROM (
                    SELECT 'C' UNIV_GUBUN FROM DUAL
                     UNION 
                    SELECT 'U' UNIV_GUBUN FROM DUAL
               ) A
             , (  
                  SELECT UNIV_GUBUN
                       , COUNT(DISTINCT A.BIZ_CD)   BIZ_CNT
                       , SUM(REAL_SURP_AMT)         BIZ_AMT
                       , SUM(CNT1)                  CNT1
                       , SUM(CNT2)                  CNT2
                    FROM (
                             SELECT A.BIZ_CD
                                  , A.GVM_INSTN_CD
                                  , C.BIZ_SURP_INFO_ID
                                  , C.SCHL_CD
                                  , C.REAL_SURP_AMT
                                  , C.UNIV_GUBUN
                                  , D.CNT1
                                  , D.CNT2
                               FROM T_BIZ_INFO     A
                                  , T_BIZ_MNG_INFO B
                                  , (
                                         SELECT A.BIZ_CD
                                              , A.BIZ_SURP_INFO_ID
                                              , B.REAL_SURP_AMT
                                              , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                              , DECODE(C.UNIV_GUBUN, 'G','U',C.UNIV_GUBUN) UNIV_GUBUN
                                           FROM T_BIZ_SURP_TRGT_INFO A
                                              , T_BIZT_INFO          B
                                              , T_SCH_INFO           C
                                          WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                                            AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                                            AND B.SURP_DT    = '2011' 
                                            AND C.UNIV_GUBUN <> 'H'
                                            AND C.SCHL_CD    <>  '99999999'
                                            AND C.SCHL_CD    <>  '00000000'
                                     )C
                                   , (
                                            SELECT BIZ_SURP_INFO_ID   
                                                 , COUNT(ACMMT_SNO) AS CNT1
                                                 , SUM(ATTR3_VAL) AS CNT2  
                                              FROM T_ACMMT_STS
                                             WHERE ACMMT_FLAG   = 'K030003' 
                                               AND ACMMT_YR     = '2011'
                                             GROUP BY BIZ_SURP_INFO_ID
                                    )D
                              WHERE A.BIZ_CD            = B.BIZ_CD
                                AND A.BIZ_CD            = C.BIZ_CD
                                AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                                AND B.BIZ_YR        = '2011'
                                AND A.BIZ_EFCT_YN   = 'Y'  
                                AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
                     ) A
                   GROUP BY UNIV_GUBUN
               )B
         WHERE A.UNIV_GUBUN = B.UNIV_GUBUN(+)
         GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;


--*대학특성별(제외)

WITH TMP_A AS 
(       
       SELECT A.BIZ_CD
            , A.GVM_INSTN_CD
            , C.BIZ_SURP_INFO_ID
            , C.SCHL_CD
            , C.REAL_SURP_AMT
            , E.UNIV_ESTB
            , E.UNIV_ZON
            , E.UNIV_SIZE
            , D.CNT1
            , D.CNT2
         FROM T_BIZ_INFO     A
            , T_BIZ_MNG_INFO B
            , (
                   SELECT A.BIZ_CD
                        , A.BIZ_SURP_INFO_ID
                        , B.REAL_SURP_AMT
                        , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                     FROM T_BIZ_SURP_TRGT_INFO A
                        , T_BIZT_INFO          B
                        , T_SCH_INFO           C
                    WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                      AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                      AND B.SURP_DT    = '2011' 
                      AND C.UNIV_GUBUN <> 'H'
                      AND C.SCHL_CD    <>  '99999999'
                      AND C.SCHL_CD    <>  '00000000'
               )C
             , (
                      SELECT BIZ_SURP_INFO_ID   
                           , COUNT(ACMMT_SNO) AS CNT1
                           , SUM(ATTR3_VAL) AS CNT2  
                        FROM T_ACMMT_STS
                       WHERE ACMMT_FLAG   = 'K030003' 
                         AND ACMMT_YR     = '2011'
                       GROUP BY BIZ_SURP_INFO_ID
              )D
              ,(
                    SELECT SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , MAX(UNIV_GUBUN)        UNIV_GUBUN
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                         , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모' 
                                WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모' 
                                ELSE '중·소규모'
                           END        UNIV_SIZE 
                      FROM (
                                SELECT SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                                     , CASE WHEN ORGCODE= '1' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO
                                 WHERE UNIV_GUBUN <> 'H'
                                   AND SCHL_CD    <>  '99999999'
                                   AND SCHL_CD    <>  '00000000'
                                 ORDER BY 1
                            )
                     GROUP BY SCHL_CD
                     ORDER BY 2  
              ) E
        WHERE A.BIZ_CD            = B.BIZ_CD
          AND A.BIZ_CD            = C.BIZ_CD
          AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
          AND C.SCHL_CD = E.SCHL_CD
          AND B.BIZ_YR        = '2011'
          AND A.BIZ_EFCT_YN   = 'Y'  
          AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
)
SELECT '2011'
     , 'K0560111'
     , ATTR1
     , NVL(ATTR2,'소계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(CNT1,'9,999,999,999,999')) CNT1
     , TRIM(TO_CHAR(CNT2,'9,999,999,999,999')) CNT2
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB)  ORDERED
                 , '설립'                                  ATTR1
                 , UNIV_ESTB                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ESTB) 
             UNION 
              SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                                ATTR1
                 , UNIV_ZON                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ZON) 
             UNION 
              SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_SIZE)   ORDERED
                 , '규모'                                ATTR1
                 , UNIV_SIZE                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_SIZE) 
)
 ;


/*
	(4) 사업화 현황(입력데이터 양이 적어 분석 불가능)-제외
	*부처별
	*학제별
*대학특성별
==> 상단에 쿼리 있음
*/

/*
(5) 연수지원 성과-제외
*부처별(국내, 학술)
*/

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(GVM_INSTN_CD)RN
             , F_GET_INSTN_NM('INSTN', GVM_INSTN_CD) GVM_INSTN_CD
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , NVL(SUM(CNT3),0)                 CNT3
             , NVL(SUM(CNT4),0)                 CNT4
             , NVL(SUM(CNT5),0)                 CNT5
             , NVL(SUM(CNT6),0)                 CNT6
             , NVL(SUM(CNT7),0)                 CNT7
             , NVL(SUM(CNT8),0)                 CNT8
             , ROW_NUMBER() OVER(ORDER BY GVM_INSTN_CD) ORDERED
          FROM (  
                  SELECT GVM_INSTN_CD
                       , COUNT(DISTINCT A.BIZ_CD)   BIZ_CNT
                       , SUM(REAL_SURP_AMT)         BIZ_AMT
                       , SUM(CNT1)                  CNT1
                       , SUM(CNT2)                  CNT2
                       , SUM(CNT3)                  CNT3
                       , SUM(CNT4)                  CNT4
                       , SUM(CNT5)                  CNT5
                       , SUM(CNT6)                  CNT6
                       , SUM(CNT7)                  CNT7
                       , SUM(CNT8)                  CNT8
                    FROM (
                             SELECT A.BIZ_CD
                                  , A.GVM_INSTN_CD
                                  , C.BIZ_SURP_INFO_ID
                                  , C.SCHL_CD
                                  , C.REAL_SURP_AMT
                                  , D.CNT1
                                  , D.CNT2
                                  , D.CNT3
                                  , D.CNT4
                                  , D.CNT5
                                  , D.CNT6
                                  , D.CNT7
                                  , D.CNT8
                               FROM T_BIZ_INFO     A
                                  , T_BIZ_MNG_INFO B
                                  , (
                                         SELECT A.BIZ_CD
                                              , A.BIZ_SURP_INFO_ID
                                              , B.REAL_SURP_AMT
                                              , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                           FROM T_BIZ_SURP_TRGT_INFO A
                                              , T_BIZT_INFO          B
                                              , T_SCH_INFO           C
                                          WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                                            AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                                            AND B.SURP_DT    = '2011' 
                                            AND C.UNIV_GUBUN <> 'H'
                                            AND C.SCHL_CD    <>  '99999999'
                                            AND C.SCHL_CD    <>  '00000000'
                                     )C
                                   , (
                                            SELECT BIZ_SURP_INFO_ID    
                                                 , SUM(ATTR1_VAL) AS CNT1 
                                                 , SUM(ATTR2_VAL) AS CNT2
                                                 , SUM(ATTR3_VAL) AS CNT3
                                                 , SUM(ATTR4_VAL) AS CNT4
                                                 , SUM(ATTR5_VAL) AS CNT5 
                                                 , SUM(ATTR6_VAL) AS CNT6
                                                 , SUM(ATTR7_VAL) AS CNT7
                                                 , SUM(ATTR8_VAL) AS CNT8
                                              FROM T_ACMMT_STS
                                             WHERE ACMMT_FLAG   = 'K030006'
                                               AND ACMMT_YR     = '2011'
                                             GROUP BY BIZ_SURP_INFO_ID
                                    )D
                              WHERE A.BIZ_CD            = B.BIZ_CD
                                AND A.BIZ_CD            = C.BIZ_CD
                                AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                                AND B.BIZ_YR        = '2011'
                                AND A.BIZ_EFCT_YN   = 'Y'  
                                AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
                     ) A
                   GROUP BY GVM_INSTN_CD
               )
         GROUP BY ROLLUP(GVM_INSTN_CD)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.GVM_INSTN_CD)GVM_INSTN_CD 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT3/B.BIZ_CNT,1)) PER_BIZ_CNT3
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT4/B.BIZ_CNT,1)) PER_BIZ_CNT4 
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT5/B.BIZ_CNT,1)) PER_BIZ_CNT5
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT6/B.BIZ_CNT,1)) PER_BIZ_CNT6 
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT7/B.BIZ_CNT,1)) PER_BIZ_CNT7
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT8/B.BIZ_CNT,1)) PER_BIZ_CNT8 
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;

--*학제별(국내, 학술)-제외

WITH TMP_A AS 
(          
        SELECT GROUPING_ID(A.UNIV_GUBUN)RN
             , DECODE(A.UNIV_GUBUN,'U','대학','C','전문대') UNIV_GUBUN
             , NVL(SUM(BIZ_CNT),0)              BIZ_CNT
             , NVL(SUM(BIZ_AMT),0)              BIZ_AMT
             , NVL(SUM(CNT1),0)                 CNT1
             , NVL(SUM(CNT2),0)                 CNT2
             , NVL(SUM(CNT3),0)                 CNT3
             , NVL(SUM(CNT4),0)                 CNT4
             , NVL(SUM(CNT5),0)                 CNT5
             , NVL(SUM(CNT6),0)                 CNT6
             , NVL(SUM(CNT7),0)                 CNT7
             , NVL(SUM(CNT8),0)                 CNT8
             , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
          FROM (
                    SELECT 'C' UNIV_GUBUN FROM DUAL
                     UNION 
                    SELECT 'U' UNIV_GUBUN FROM DUAL
               ) A
             , (  
                  SELECT UNIV_GUBUN
                       , COUNT(DISTINCT A.BIZ_CD)   BIZ_CNT
                       , SUM(REAL_SURP_AMT)         BIZ_AMT
                       , SUM(CNT1)                  CNT1
                       , SUM(CNT2)                  CNT2
                       , SUM(CNT3)                  CNT3
                       , SUM(CNT4)                  CNT4
                       , SUM(CNT5)                  CNT5
                       , SUM(CNT6)                  CNT6
                       , SUM(CNT7)                  CNT7
                       , SUM(CNT8)                  CNT8
                    FROM (
                             SELECT A.BIZ_CD
                                  , A.GVM_INSTN_CD
                                  , C.BIZ_SURP_INFO_ID
                                  , C.SCHL_CD
                                  , C.REAL_SURP_AMT
                                  , C.UNIV_GUBUN
                                  , D.CNT1
                                  , D.CNT2
                                  , D.CNT3
                                  , D.CNT4
                                  , D.CNT5
                                  , D.CNT6
                                  , D.CNT7
                                  , D.CNT8
                               FROM T_BIZ_INFO     A
                                  , T_BIZ_MNG_INFO B
                                  , (
                                         SELECT A.BIZ_CD
                                              , A.BIZ_SURP_INFO_ID
                                              , B.REAL_SURP_AMT
                                              , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                              , DECODE(C.UNIV_GUBUN, 'G','U',C.UNIV_GUBUN) UNIV_GUBUN
                                           FROM T_BIZ_SURP_TRGT_INFO A
                                              , T_BIZT_INFO          B
                                              , T_SCH_INFO           C
                                          WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                                            AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                                            AND B.SURP_DT    = '2011' 
                                            AND C.UNIV_GUBUN <> 'H'
                                            AND C.SCHL_CD    <>  '99999999'
                                            AND C.SCHL_CD    <>  '00000000'
                                     )C
                                   , (
                                            SELECT BIZ_SURP_INFO_ID    
                                                 , SUM(ATTR1_VAL) AS CNT1 
                                                 , SUM(ATTR2_VAL) AS CNT2
                                                 , SUM(ATTR3_VAL) AS CNT3
                                                 , SUM(ATTR4_VAL) AS CNT4
                                                 , SUM(ATTR5_VAL) AS CNT5 
                                                 , SUM(ATTR6_VAL) AS CNT6
                                                 , SUM(ATTR7_VAL) AS CNT7
                                                 , SUM(ATTR8_VAL) AS CNT8
                                              FROM T_ACMMT_STS
                                             WHERE ACMMT_FLAG   = 'K030006'
                                               AND ACMMT_YR     = '2011'
                                             GROUP BY BIZ_SURP_INFO_ID
                                    )D
                              WHERE A.BIZ_CD            = B.BIZ_CD
                                AND A.BIZ_CD            = C.BIZ_CD
                                AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                                AND B.BIZ_YR        = '2011'
                                AND A.BIZ_EFCT_YN   = 'Y'  
                                AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
                     ) A
                   GROUP BY UNIV_GUBUN
               )B
         WHERE A.UNIV_GUBUN = B.UNIV_GUBUN(+)
         GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     , 'UK0560301'
     , DECODE(A.RN,'1','합계',A.UNIV_GUBUN)UNIV_GUBUN 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT1/B.BIZ_CNT,1)) PER1
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT2/B.BIZ_CNT,1)) PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT3/B.BIZ_CNT,1)) PER_BIZ_CNT3
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT4/B.BIZ_CNT,1)) PER_BIZ_CNT4 
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT5/B.BIZ_CNT,1)) PER_BIZ_CNT5
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT6/B.BIZ_CNT,1)) PER_BIZ_CNT6 
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT7/B.BIZ_CNT,1)) PER_BIZ_CNT7
     , DECODE(B.BIZ_CNT,0,0,ROUND(A.CNT8/B.BIZ_CNT,1)) PER_BIZ_CNT8 
     , A.ORDERED
     , 'SQL'
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;


--*대학특성별(국내, 학술)-제외

WITH TMP_A AS 
(       
       SELECT A.BIZ_CD
            , A.GVM_INSTN_CD
            , C.BIZ_SURP_INFO_ID
            , C.SCHL_CD
            , C.REAL_SURP_AMT
            , E.UNIV_ESTB
            , E.UNIV_ZON
            , E.UNIV_SIZE
            , D.CNT1
            , D.CNT2
            , D.CNT3
            , D.CNT4
            , D.CNT5
            , D.CNT6
            , D.CNT7
            , D.CNT8
         FROM T_BIZ_INFO     A
            , T_BIZ_MNG_INFO B
            , (
                   SELECT A.BIZ_CD
                        , A.BIZ_SURP_INFO_ID
                        , B.REAL_SURP_AMT
                        , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                     FROM T_BIZ_SURP_TRGT_INFO A
                        , T_BIZT_INFO          B
                        , T_SCH_INFO           C
                    WHERE A.BIZ_SURP_INFO_ID   = B.BIZ_SURP_INFO_ID(+)
                      AND F_GET_BLN_SCHL_CD(A.EXE_INSTN_CD)       = C.INSTN_CD 
                      AND B.SURP_DT    = '2011' 
                      AND C.UNIV_GUBUN <> 'H'
                      AND C.SCHL_CD    <>  '99999999'
                      AND C.SCHL_CD    <>  '00000000'
               )C
             , (
                      SELECT BIZ_SURP_INFO_ID    
                           , SUM(ATTR1_VAL) AS CNT1 
                           , SUM(ATTR2_VAL) AS CNT2
                           , SUM(ATTR3_VAL) AS CNT3
                           , SUM(ATTR4_VAL) AS CNT4
                           , SUM(ATTR5_VAL) AS CNT5 
                           , SUM(ATTR6_VAL) AS CNT6
                           , SUM(ATTR7_VAL) AS CNT7
                           , SUM(ATTR8_VAL) AS CNT8
                        FROM T_ACMMT_STS
                       WHERE ACMMT_FLAG   = 'K030006'
                         AND ACMMT_YR     = '2011'
                       GROUP BY BIZ_SURP_INFO_ID
              )D
              ,(
                    SELECT SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , MAX(UNIV_GUBUN)        UNIV_GUBUN
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '사립'   ELSE '국·공립'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '수도권' ELSE '비수도권'  END        UNIV_ZON
                         , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '대규모' 
                                WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '대규모' 
                                ELSE '중·소규모'
                           END        UNIV_SIZE 
                      FROM (
                                SELECT SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                                     , CASE WHEN ORGCODE= '1' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO
                                 WHERE UNIV_GUBUN <> 'H'
                                   AND SCHL_CD    <>  '99999999'
                                   AND SCHL_CD    <>  '00000000'
                                 ORDER BY 1
                            )
                     GROUP BY SCHL_CD
                     ORDER BY 2  
              ) E
        WHERE A.BIZ_CD            = B.BIZ_CD
          AND A.BIZ_CD            = C.BIZ_CD
          AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
          AND C.SCHL_CD = E.SCHL_CD
          AND B.BIZ_YR        = '2011'
          AND A.BIZ_EFCT_YN   = 'Y'  
          AND F_GET_BIZ_TP(A.BIZ_CD) = '일반지원사업'
)
SELECT '2011'
     , 'K0560111'
     , ATTR1
     , NVL(ATTR2,'소계') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(CNT1,'9,999,999,999,999')) CNT1
     , TRIM(TO_CHAR(CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(CNT5,'9,999,999,999,999')) CNT5
     , TRIM(TO_CHAR(CNT6,'9,999,999,999,999')) CNT6
     , TRIM(TO_CHAR(CNT7,'9,999,999,999,999')) CNT7
     , TRIM(TO_CHAR(CNT8,'9,999,999,999,999')) CNT8
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB)  ORDERED
                 , '설립'                                  ATTR1
                 , UNIV_ESTB                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
                 , NVL(SUM(CNT5),0)                 CNT5
                 , NVL(SUM(CNT6),0)                 CNT6
                 , NVL(SUM(CNT7),0)                 CNT7
                 , NVL(SUM(CNT8),0)                 CNT8
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ESTB) 
             UNION 
              SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(UNIV_ZON,'ㅎ') DESC)   ORDERED
                 , '소재지'                                ATTR1
                 , UNIV_ZON                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
                 , NVL(SUM(CNT5),0)                 CNT5
                 , NVL(SUM(CNT6),0)                 CNT6
                 , NVL(SUM(CNT7),0)                 CNT7
                 , NVL(SUM(CNT8),0)                 CNT8
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_ZON) 
             UNION 
              SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY UNIV_SIZE)   ORDERED
                 , '규모'                                ATTR1
                 , UNIV_SIZE                              ATTR2
                 , NVL(COUNT(DISTINCT A.BIZ_CD) ,0)       ATTR3
                 , NVL(SUM(REAL_SURP_AMT),0)              ATTR4 
                 , NVL(SUM(CNT1),0)                 CNT1
                 , NVL(SUM(CNT2),0)                 CNT2
                 , NVL(SUM(CNT3),0)                 CNT3
                 , NVL(SUM(CNT4),0)                 CNT4
                 , NVL(SUM(CNT5),0)                 CNT5
                 , NVL(SUM(CNT6),0)                 CNT6
                 , NVL(SUM(CNT7),0)                 CNT7
                 , NVL(SUM(CNT8),0)                 CNT8
              FROM TMP_A A
             GROUP BY ROLLUP(UNIV_SIZE) 
)
 ;
