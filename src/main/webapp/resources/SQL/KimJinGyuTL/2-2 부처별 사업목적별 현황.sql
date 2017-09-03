/*** 부처별 사업목적별 현황  */

--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560202' and stats_yr = '2011';
--DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560202' and stats_yr = '2011';



INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(D.GVM_INSTN_CD)   RN
         , F_GET_INSTN_NM('INSTN', D.GVM_INSTN_CD) ATTR_VAL1 
         , NVL(SUM(HRD_CNT1),0) CNT1
         , NVL(SUM(HRD_AMT1),0) AMT1
         , NVL(SUM(HRD_CNT2),0) CNT2
         , NVL(SUM(HRD_AMT2),0) AMT2
         , NVL(SUM(HRD_CNT3),0) CNT3
         , NVL(SUM(HRD_AMT3),0) AMT3
         , NVL(SUM(TOT_CNT),0)  CNT4
         , NVL(SUM(TOT_AMT),0)  AMT4
         , ROW_NUMBER() OVER(ORDER BY decode(D.GVM_INSTN_CD,null,9,1) , SUM(TOT_AMT) desc) ORDERED
       FROM (
            SELECT GVM_INSTN_CD
                  , DECODE(BIZ_PRPS_TYP, 'K027001', COUNT (DISTINCT BIZ_CD))        HRD_CNT1
                  , DECODE(BIZ_PRPS_TYP, 'K027001', SUM(REAL_SURP_AMT))  HRD_AMT1
                  , DECODE(BIZ_PRPS_TYP, 'K027002', COUNT (DISTINCT BIZ_CD))        HRD_CNT2
                  , DECODE(BIZ_PRPS_TYP, 'K027002', SUM(REAL_SURP_AMT))  HRD_AMT2
                  , DECODE(BIZ_PRPS_TYP, 'K027003', COUNT (DISTINCT BIZ_CD))        HRD_CNT3
                  , DECODE(BIZ_PRPS_TYP, 'K027003', SUM(REAL_SURP_AMT))  HRD_AMT3
                  , COUNT (DISTINCT BIZ_CD)                         TOT_CNT
                  , SUM(REAL_SURP_AMT)                                   TOT_AMT
               FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , BIZ.GVM_INSTN_CD
                      , BIZ.BIZ_PRPS_TYP
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
                     AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                     AND TRGT.BIZ_YR = '2011'
                ) A
              GROUP BY GVM_INSTN_CD, BIZ_PRPS_TYP
            ) D
      GROUP BY ROLLUP (D.GVM_INSTN_CD)
)
/* HRD지원금액/총HRD지원금액 */
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560202'
     , NVL(A.ATTR_VAL1,'합계')
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
-- 공시대상
INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(D.GVM_INSTN_CD)   RN
         , F_GET_INSTN_NM('INSTN', D.GVM_INSTN_CD) ATTR_VAL1 
         , NVL(SUM(HRD_CNT1),0) CNT1
         , NVL(SUM(HRD_AMT1),0) AMT1
         , NVL(SUM(HRD_CNT2),0) CNT2
         , NVL(SUM(HRD_AMT2),0) AMT2
         , NVL(SUM(HRD_CNT3),0) CNT3
         , NVL(SUM(HRD_AMT3),0) AMT3
         , NVL(SUM(TOT_CNT),0)  CNT4
         , NVL(SUM(TOT_AMT),0)  AMT4
         , ROW_NUMBER() OVER(ORDER BY decode(D.GVM_INSTN_CD,null,9,1) , SUM(TOT_AMT) desc) ORDERED
       FROM (
            SELECT GVM_INSTN_CD
                  , DECODE(BIZ_PRPS_TYP, 'K027001', COUNT (DISTINCT BIZ_CD))        HRD_CNT1
                  , DECODE(BIZ_PRPS_TYP, 'K027001', SUM(REAL_SURP_AMT))  HRD_AMT1
                  , DECODE(BIZ_PRPS_TYP, 'K027002', COUNT (DISTINCT BIZ_CD))        HRD_CNT2
                  , DECODE(BIZ_PRPS_TYP, 'K027002', SUM(REAL_SURP_AMT))  HRD_AMT2
                  , DECODE(BIZ_PRPS_TYP, 'K027003', COUNT (DISTINCT BIZ_CD))        HRD_CNT3
                  , DECODE(BIZ_PRPS_TYP, 'K027003', SUM(REAL_SURP_AMT))  HRD_AMT3
                  , COUNT (DISTINCT BIZ_CD)                         TOT_CNT
                  , SUM(REAL_SURP_AMT)                                   TOT_AMT
               FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , BIZ.GVM_INSTN_CD
                      , BIZ.BIZ_PRPS_TYP
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
                     AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                     AND TRGT.BIZ_YR = '2011'
                ) A
              GROUP BY GVM_INSTN_CD, BIZ_PRPS_TYP
            ) D
      GROUP BY ROLLUP (D.GVM_INSTN_CD)
)
/* HRD지원금액/총HRD지원금액 */
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560202'
     , NVL(A.ATTR_VAL1,'합계')
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


/* HRD지원금액/부처의 총지원금액 */
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560202'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT1/A.AMT4*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT2/A.AMT4*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT3/A.AMT4*100,1)),'FM999,990.0') PER3
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(A.AMT4,0,0,ROUND(A.AMT4/A.AMT4*100,1)),'FM999,990') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   



