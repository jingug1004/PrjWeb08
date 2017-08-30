/* 국공립대경상운영비지원사업 포함 */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
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
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;



/* 국공립대경상운영비지원사업 제외 */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
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
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601092'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;

/* 국공립대경상운영비지원사업 포함(공시대상, 20개 사업은 해당항목 미입력함) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
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
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;



/* 국공립대경상운영비지원사업 제외(공시대상, 17개 사업은 해당항목 미입력함) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
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
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601092'
     , NVL(A.ATTR_VAL1,'합계')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;

