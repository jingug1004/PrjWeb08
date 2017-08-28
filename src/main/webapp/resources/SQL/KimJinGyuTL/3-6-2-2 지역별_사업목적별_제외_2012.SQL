INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, ATTR10_VAL, ATTR11_VAL, ATTR12_VAL, ATTR13_VAL, ATTR14_VAL
    , ATTR43_VAL
    , RGSTR_ID
    , RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(D.ZON_CD)   RN
         , DECODE(D.ZON_CD,NULL,'',F_GET_COMMN_NM('K051'||D.ZON_CD)) ATTR_VAL1
        , NVL(SUM(SCHL_CNT),0) SCHL_CNT
         , NVL(SUM(CNT1),0) CNT1
         , NVL(SUM(AMT1),0) AMT1
         , NVL(SUM(CNT2),0) CNT2
         , NVL(SUM(AMT2),0) AMT2
         , NVL(SUM(CNT3),0) CNT3
         , NVL(SUM(AMT3),0) AMT3
         , NVL(SUM(CNT4),0) CNT4
         , NVL(SUM(AMT4),0) AMT4
         , NVL(SUM(TOT_CNT),0) TOT_CNT
         , NVL(SUM(TOT_AMT),0) TOT_AMT        
         , ROW_NUMBER() OVER(ORDER BY decode(D.ZON_CD,null,9,1) asc) ORDERED
       FROM (
            SELECT ZON_CD
                 , NVL( COUNT(DISTINCT SCHL_CD),0) SCHL_CNT
                  , DECODE(BIZ_PRPS_TYP, 'K027002', COUNT (DISTINCT BIZ_CD))        CNT1
                  , DECODE(BIZ_PRPS_TYP, 'K027002', SUM(REAL_SURP_AMT))  AMT1
                  , DECODE(BIZ_PRPS_TYP, 'K027001', COUNT (DISTINCT BIZ_CD))        CNT2
                  , DECODE(BIZ_PRPS_TYP, 'K027001', SUM(REAL_SURP_AMT))  AMT2
                  , DECODE(BIZ_PRPS_TYP, 'K027003', COUNT (DISTINCT BIZ_CD))        CNT3
                  , DECODE(BIZ_PRPS_TYP, 'K027003', SUM(REAL_SURP_AMT))  AMT3
                  , DECODE(BIZ_PRPS_TYP, 'K027004', COUNT (DISTINCT BIZ_CD))        CNT4
                  , DECODE(BIZ_PRPS_TYP, 'K027004', SUM(REAL_SURP_AMT))  AMT4
                  , COUNT (DISTINCT BIZ_CD) TOT_CNT
                  , SUM(REAL_SURP_AMT) TOT_AMT
                 FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , SCH.ZON_CD
                      , BIZ.BIZ_PRPS_TYP
                      , REAL_SURP_AMT
                      , SUBSTR(SCH.SCHL_CD,1,5) ||'000' SCHL_CD
                   FROM T_BIZ_SURP_TRGT_INFO TRGT
                      , T_BIZT_INFO          BIZT
                      , T_SCH_INFO_HIST      SCH
                      , T_BIZ_MNG_INFO       BIZM
                      , T_BIZ_INFO           BIZ
                      , T_BIZ_INFO_PROV      PROV
                  WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                     AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                     AND TRGT.BIZ_YR = SCH.SRY_YY
                     AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                     AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                     --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND TRGT.BIZ_CD = BIZM.BIZ_CD
                     AND TRGT.BIZ_YR = BIZM.BIZ_YR
                     AND BIZM.BIZ_CD = BIZ.BIZ_CD
                     AND BIZ.BIZ_CD  = PROV.BIZ_CD
                     AND BIZ.BIZ_PRPS_TYP IN ('K027001','K027002','K027003')
                     AND BIZ.BIZ_FLAG in ( 'K042004','K042005')  /*지자체 사업 */
                     AND BIZM.pnoti_yn     = 'Y'  /* 비공시대상 대학 제외 */
                     AND TRGT.BIZ_YR = '2012'
                ) A
              GROUP BY ZON_CD, BIZ_PRPS_TYP
            ) D
      GROUP BY ROLLUP (D.ZON_CD)
)
SELECT '2012'
,  STATS_SNO_SQ.NEXTVAL
     , 'K0560602022'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))CNT1
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999')) CNT2
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999')) CNT3
     , TRIM(TO_CHAR(A.AMT3,'9,999,999,999,999')) AMT3
     , TO_CHAR(DECODE(B.AMT3,0,0,ROUND(A.AMT3/B.AMT3*100,1)),'FM999,990.0') PER3

     , TRIM(TO_CHAR(A.TOT_CNT,'9,999,999,999,999')) TOT_CNT
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) TOT_AMT
     , TO_CHAR(DECODE(B.TOT_AMT,0,0,ROUND(A.TOT_AMT/B.TOT_AMT*100,1)),'FM999,990.0') PER5     
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B