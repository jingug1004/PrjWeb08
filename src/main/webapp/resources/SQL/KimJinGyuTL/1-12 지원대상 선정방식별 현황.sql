-- 공시대상
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_TRGT_SLCT_STND) RN
          , F_GET_COMMN_NM(A.SURP_TRGT_SLCT_STND)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)                ATTR_VAL2
          , SUM(REAL_SURP_AMT)                    ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_TRGT_SLCT_STND) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_TRGT_SLCT_STND
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
             --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND BIZM.SURP_TRGT_SLCT_STND IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_TRGT_SLCT_STND)
)
SELECT '2010'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;


WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_TRGT_SLCT_STND) RN
          , F_GET_COMMN_NM(A.SURP_TRGT_SLCT_STND)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)                ATTR_VAL2
          , SUM(REAL_SURP_AMT)                    ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_TRGT_SLCT_STND) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_TRGT_SLCT_STND
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
             AND BIZM.SURP_TRGT_SLCT_STND IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_TRGT_SLCT_STND)
)
SELECT '2010'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;



사업계획서 기반	330	4,434,155,531	55.4
포뮬러 기반	10	1,379,246,729	17.2
사업계획서 및 포뮬러 기반	15	260,355,000	3.3
기타	18	1,936,672,963	24.2
합계	373	8,010,430,223	100
