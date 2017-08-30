/*** 실지원액 통계 **/
--    SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560104' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560104' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
         SELECT  GROUPING_ID(A.BIZT_MNPV_TYP)   RN
              , F_GET_COMMN_NM(A.BIZT_MNPV_TYP) ATTR_VAL1
              , NVL(COUNT(A.BIZ_CD),0) ATTR_VAL2
              , NVL(SUM(SURP_UNIT_AMT),0)     ATTR_VAL3
              , ROW_NUMBER() OVER(ORDER BY A.BIZT_MNPV_TYP) ORDERED
         FROM (
             SELECT A.BIZT_MNPV_TYP
                , A.BIZ_CD
                , D.SURP_UNIT_AMT
             FROM T_BIZ_MNPV_INFO A
                , T_BIZ_INFO      B
                , T_BIZ_MNG_INFO  C
                , (
                    SELECT TRGT.BIZ_CD, TRGT.BIZ_YR, SUM(REAL_SURP_AMT) SURP_UNIT_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT, T_BIZT_INFO BIZT , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                  )D
            WHERE A.BIZ_CD        = B.BIZ_CD
              AND A.BIZ_CD        = C.BIZ_CD
              AND A.BIZ_YR        = C.BIZ_YR
              AND A.BIZ_CD        = D.BIZ_CD(+)
              AND A.BIZ_YR        = D.BIZ_YR(+)
              AND B.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
              AND A.BIZ_YR         = '2011'   /* 2011년 사업만 */
              AND C.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
              AND A.BIZT_MNPV_AMT  > 0
          ) A
          GROUP BY ROLLUP(A.BIZT_MNPV_TYP)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560104'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;





/**
*** 일반지원사업 중 대학에 실 지원이 되지 않으나 고등교육발전을 위해 계획된 14개 사업은 당해연도지원액을 포함하였음
**/

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
         SELECT  GROUPING_ID(A.BIZT_MNPV_TYP)   RN
              , F_GET_COMMN_NM(A.BIZT_MNPV_TYP) ATTR_VAL1
              , NVL(COUNT(A.BIZ_CD),0) ATTR_VAL2
              , NVL(SUM(SURP_UNIT_AMT),0)     ATTR_VAL3
              , ROW_NUMBER() OVER(ORDER BY A.BIZT_MNPV_TYP) ORDERED
         FROM (
             SELECT A.BIZT_MNPV_TYP
                , A.BIZ_CD
                , case when A.BIZ_CD in ('13410000205','13410000187','13410000069','13410000074','13410000001','13410000215','13410000043','13410000035','13410000214','13410000049','13410000032','13410000200','13410000213','13410000093')
                            then A.BIZT_MNPV_AMT
                            else D.SURP_UNIT_AMT end SURP_UNIT_AMT
             FROM T_BIZ_MNPV_INFO A
                , T_BIZ_INFO      B
                , T_BIZ_MNG_INFO  C
                , (
                    SELECT TRGT.BIZ_CD, TRGT.BIZ_YR, SUM(REAL_SURP_AMT) SURP_UNIT_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT, T_BIZT_INFO BIZT , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                  )D
            WHERE A.BIZ_CD        = B.BIZ_CD
              AND A.BIZ_CD        = C.BIZ_CD
              AND A.BIZ_YR        = C.BIZ_YR
              AND A.BIZ_CD        = D.BIZ_CD(+)
              AND A.BIZ_YR        = D.BIZ_YR(+)
              AND B.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
              AND A.BIZ_YR         = '2011'   /* 2011년 사업만 */
              AND C.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
              AND A.BIZT_MNPV_AMT  > 0
          ) A
          GROUP BY ROLLUP(A.BIZT_MNPV_TYP)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560104'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;


 /**
*** 일반지원사업 중 대학에 실 지원이 되지 않으나 고등교육발전을 위해 계획된 14개 사업은 당해연도지원액을 포함하였음(공시대학기준)
**/

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )
WITH TMP_A AS
(
         SELECT  GROUPING_ID(A.BIZT_MNPV_TYP)   RN
              , F_GET_COMMN_NM(A.BIZT_MNPV_TYP) ATTR_VAL1
              , NVL(COUNT(A.BIZ_CD),0) ATTR_VAL2
              , NVL(SUM(SURP_UNIT_AMT),0)     ATTR_VAL3
              , ROW_NUMBER() OVER(ORDER BY A.BIZT_MNPV_TYP) ORDERED
         FROM (
             SELECT A.BIZT_MNPV_TYP
                , A.BIZ_CD
                , case when A.BIZ_CD in ('13410000205','13410000187','13410000069','13410000074','13410000001','13410000215','13410000043','13410000035','13410000214','13410000049','13410000032','13410000200','13410000213','13410000093')
                            then A.BIZT_MNPV_AMT
                            else D.SURP_UNIT_AMT end SURP_UNIT_AMT
             FROM T_BIZ_MNPV_INFO A
                , T_BIZ_INFO      B
                , T_BIZ_MNG_INFO  C
                , (
                    SELECT TRGT.BIZ_CD, TRGT.BIZ_YR, SUM(REAL_SURP_AMT) SURP_UNIT_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT, T_BIZT_INFO BIZT , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                  )D
            WHERE A.BIZ_CD        = B.BIZ_CD
              AND A.BIZ_CD        = C.BIZ_CD
              AND A.BIZ_YR        = C.BIZ_YR
              AND A.BIZ_CD        = D.BIZ_CD(+)
              AND A.BIZ_YR        = D.BIZ_YR(+)
              AND B.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
              AND A.BIZ_YR         = '2011'   /* 2011년 사업만 */
              AND C.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
              AND A.BIZT_MNPV_AMT  > 0
          ) A
          GROUP BY ROLLUP(A.BIZT_MNPV_TYP)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560104'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;
