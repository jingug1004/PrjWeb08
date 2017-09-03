/* 논문 성과 */

WITH TMP_A AS 
(
       SELECT INSTN_TYP
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
                   , INSTN.INSTN_TYP
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
               AND ACMMT.ACMMT_FLAG(+)   = 'K030001' 
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  INSTN_TYP
      
)
SELECT '2011'
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.OUT_CNT2,'9,999,999,999,999')) ATTR_VAL7
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   


/* 특허 성과 */

WITH TMP_A AS 
(
       SELECT INSTN_TYP
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
                   , INSTN.INSTN_TYP
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
               AND ACMMT.ACMMT_FLAG(+)   = 'K030002' 
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  INSTN_TYP
      
)
SELECT '2011'
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.IN_CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.OUT_CNT1,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.IN_CNT2,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.OUT_CNT2,'9,999,999,999,999')) ATTR_VAL7
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   



/* 기술료 성과 */

WITH TMP_A AS 
(
       SELECT INSTN_TYP
           , COUNT(ACMMT_SNO) CNT1
           , SUM(ATTR3_VAL)  AS CNT2
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
                   , INSTN.INSTN_TYP
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
               AND ACMMT.ACMMT_FLAG(+)   = 'K030003' 
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  INSTN_TYP
      
)
SELECT '2011'
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) ATTR_VAL6
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   




/* 사업화 성과 */

WITH TMP_A AS 
(
       SELECT INSTN_TYP
           , COUNT(ACMMT_SNO) CNT1
           , SUM(ATTR3_VAL)  AS CNT2
           , SUM(ATTR2_VAL)  AS CNT3
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
                   , INSTN.INSTN_TYP
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
               AND ACMMT.ACMMT_FLAG(+)   = 'K030004' 
               AND BIZ.GVM_INSTN_CD = INSTN.INSTN_CD
           ) A
     WHERE A.BIZ_YR = '2011'
     GROUP BY  INSTN_TYP
      
)
SELECT '2011'
     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) ATTR_VAL6
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   

