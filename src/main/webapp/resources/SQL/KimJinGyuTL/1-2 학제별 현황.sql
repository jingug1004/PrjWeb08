/* 국공립대경상운영비지원사업 포함 */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601031' and stats_yr = '2011';
--DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601031' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_GUBUN) RN
         , F_GET_COMMN_NM_CHILD('K050',A.UNIV_GUBUN)    ATTR_VAL1
         , SUM(B.SCH_CNT)                  ATTR_VAL2
         , SUM(B.STD_NUM)                  ATTR_VAL3
         , SUM(A.BIZ_CD)                   ATTR_VAL4
         , SUM(A.SURP_UNIT_AMT)            ATTR_VAL5
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
      FROM (
                SELECT TRGT.BIZ_YR
                     , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                     , COUNT( distinct TRGT.BIZ_CD) BIZ_CD
                     , SUM(REAL_SURP_AMT) SURP_UNIT_AMT
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
                GROUP BY TRGT.BIZ_YR, DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN)
           )A
         , (
                SELECT SRY_YY, UNIV_GUBUN
                     , COUNT(distinct SCHL_CD) SCH_CNT
                     , SUM(STD_NUM) STD_NUM
                  FROM (
                  SELECT SRY_YY
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , SCHL_HG_NM
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                  )
                GROUP BY SRY_YY, UNIV_GUBUN
           )B
     WHERE A.UNIV_GUBUN = B.UNIV_GUBUN
      AND  A.BIZ_YR = B.SRY_YY
      AND  B.SRY_YY  = '2011'
     GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601031'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , DECODE(B.ATTR_VAL5,0,0,ROUND(A.ATTR_VAL5/B.ATTR_VAL5*100,1)) ATTR6_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;





/* 국공립대경상운영비지원사업 제외 기준 */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601032' and stats_yr = '2011';
--DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601032' and stats_yr = '2011';



INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_GUBUN) RN
         , F_GET_COMMN_NM_CHILD('K050',A.UNIV_GUBUN)    ATTR_VAL1
         , SUM(B.SCH_CNT)                  ATTR_VAL2
         , SUM(B.STD_NUM)                  ATTR_VAL3
         , SUM(A.BIZ_CD)                   ATTR_VAL4
         , SUM(A.SURP_UNIT_AMT)            ATTR_VAL5
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
      FROM (
                SELECT TRGT.BIZ_YR
                     , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                     , COUNT( distinct TRGT.BIZ_CD) BIZ_CD
                     , SUM(REAL_SURP_AMT) SURP_UNIT_AMT
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
                   AND BIZM.pnoti_yn     = 'Y'    /* 공시대상 사업만 */
                   AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* 지자체 사업, 국공립대경상운영비지원사업 제외 */
                GROUP BY TRGT.BIZ_YR, DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN)
           )A
         , (
                SELECT SRY_YY, UNIV_GUBUN
                     , COUNT(distinct SCHL_CD) SCH_CNT
                     , SUM(STD_NUM) STD_NUM
                  FROM (
                  SELECT SRY_YY
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , SCHL_HG_NM
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                  )
                GROUP BY SRY_YY, UNIV_GUBUN
           )B
     WHERE A.UNIV_GUBUN = B.UNIV_GUBUN
      AND  A.BIZ_YR = B.SRY_YY
      AND  B.SRY_YY  = '2011'
     GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601032'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , DECODE(B.ATTR_VAL5,0,0,ROUND(A.ATTR_VAL5/B.ATTR_VAL5*100,1)) ATTR6_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;








/* 대학원대학을 대학에 포함 */


WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_GUBUN) RN
         , F_GET_COMMN_NM_CHILD('K050',A.UNIV_GUBUN)    ATTR_VAL1
         , SUM(B.SCH_CNT)                  ATTR_VAL2
         , SUM(B.STD_NUM)                  ATTR_VAL3
         , SUM(A.BIZ_CD)                   ATTR_VAL4
         , SUM(A.SURP_UNIT_AMT)            ATTR_VAL5
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_GUBUN) ORDERED
      FROM (
                SELECT TRGT.BIZ_YR
                     , DECODE(UNIV_GUBUN,'G','U','H','U',UNIV_GUBUN) UNIV_GUBUN
                     , COUNT( distinct TRGT.BIZ_CD) BIZ_CD
                     , SUM(REAL_SURP_AMT) SURP_UNIT_AMT
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
                   AND TRGT.BIZ_CD = BIZM.BIZ_CD
                   AND TRGT.BIZ_YR = BIZM.BIZ_YR
                   AND BIZM.BIZ_CD = BIZ.BIZ_CD
                   AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
                   AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
                GROUP BY TRGT.BIZ_YR, DECODE(UNIV_GUBUN,'G','U','H','U',UNIV_GUBUN)
           )A
         , (
                SELECT SRY_YY, UNIV_GUBUN
                     , COUNT(distinct SCHL_CD) SCH_CNT
                     , SUM(STD_NUM) STD_NUM
                  FROM (
                  SELECT SRY_YY
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , SCHL_HG_NM
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U','H','U',UNIV_GUBUN) UNIV_GUBUN
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                  )
                GROUP BY SRY_YY, UNIV_GUBUN
           )B
     WHERE A.UNIV_GUBUN = B.UNIV_GUBUN
      AND  A.BIZ_YR = B.SRY_YY
      AND  B.SRY_YY  = '2011'
     GROUP BY ROLLUP(A.UNIV_GUBUN)
)
SELECT '2011'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , DECODE(B.ATTR_VAL5,0,0,ROUND(A.ATTR_VAL5/B.ATTR_VAL5*100,1)) ATTR6_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;



