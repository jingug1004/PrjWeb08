INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, ATTR10_VAL, ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR43_VAL
    , RGSTR_ID
    , RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(D.ZON_CD)   RN
         , DECODE(D.ZON_CD,NULL,'',F_GET_COMMN_NM('K051'||D.ZON_CD)) ATTR_VAL1
         , NVL(SUM(SCHL_CNT),0) SCHL_CNT
         , NVL(SUM(AMT1_1),0) AMT1_1
         , NVL(SUM(AMT1_2),0) AMT1_2
         , NVL(SUM(AMT1_1),0)+NVL(SUM(AMT1_2),0) TOT1
         , NVL(SUM(AMT2_1),0) AMT2_1
         , NVL(SUM(AMT2_2),0) AMT2_2
         , NVL(SUM(AMT2_1),0)+NVL(SUM(AMT2_2),0) TOT2
         , NVL(SUM(AMT3_1),0) AMT3_1
         , NVL(SUM(AMT3_2),0) AMT3_2
         , NVL(SUM(AMT3_1),0)+NVL(SUM(AMT3_2),0) TOT3
         , NVL(SUM(AMT1_1),0)+NVL(SUM(AMT2_1),0)+NVL(SUM(AMT3_1),0) TOT_AMT1    
         , NVL(SUM(AMT1_2),0)+NVL(SUM(AMT2_2),0)+NVL(SUM(AMT3_2),0) TOT_AMT2     
         , NVL(SUM(TOT_AMT),0) TOT_AMT       
         , ROW_NUMBER() OVER(ORDER BY decode(D.ZON_CD,null,9,1) asc) ORDERED
       FROM (
            SELECT ZON_CD
                 , NVL( COUNT(DISTINCT SCHL_CD),0) SCHL_CNT
                  , CASE WHEN BIZ_PRPS_TYP = 'K027002' AND BIZ_FLAG='K042005' THEN SUM(REAL_SURP_AMT) END AS AMT1_1
                  , CASE WHEN BIZ_PRPS_TYP = 'K027002' AND BIZ_FLAG='K042004' THEN SUM(REAL_SURP_AMT) END AS AMT1_2
                  , CASE WHEN BIZ_PRPS_TYP = 'K027001' AND BIZ_FLAG='K042005' THEN SUM(REAL_SURP_AMT) END AS AMT2_1
                  , CASE WHEN BIZ_PRPS_TYP = 'K027001' AND BIZ_FLAG='K042004' THEN SUM(REAL_SURP_AMT) END AS AMT2_2
                  , CASE WHEN BIZ_PRPS_TYP = 'K027003' AND BIZ_FLAG='K042005' THEN SUM(REAL_SURP_AMT) END AS AMT3_1
                  , CASE WHEN BIZ_PRPS_TYP = 'K027003' AND BIZ_FLAG='K042004' THEN SUM(REAL_SURP_AMT) END AS AMT3_2
                  , SUM(REAL_SURP_AMT) TOT_AMT
                 FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , SCH.ZON_CD
                      , BIZ.BIZ_PRPS_TYP
                      , REAL_SURP_AMT
                      , SUBSTR(SCH.SCHL_CD,1,5) ||'000' SCHL_CD
                      ,BIZ_FLAG
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
                     AND TRGT.BIZ_YR = '2011'
                ) A
              GROUP BY ZON_CD, BIZ_PRPS_TYP,BIZ_FLAG
            ) D
      GROUP BY ROLLUP (D.ZON_CD)
)
SELECT '2011'
,  STATS_SNO_SQ.NEXTVAL
     , 'K0560602051'
     , NVL(A.ATTR_VAL1,'합계')
  --   , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999'))                SCHL_CNT

    , TRIM(TO_CHAR(A.AMT2_1,'9,999,999,999,999'))AMT2_1
    , TRIM(TO_CHAR(A.AMT2_2,'9,999,999,999,999'))AMT2_2
    , TRIM(TO_CHAR(A.TOT2,'9,999,999,999,999'))TOT2
        , TRIM(TO_CHAR(A.AMT1_1,'9,999,999,999,999'))AMT1_1
    , TRIM(TO_CHAR(A.AMT1_2,'9,999,999,999,999'))AMT1_2
    , TRIM(TO_CHAR(A.TOT1,'9,999,999,999,999'))TOT1
     , TRIM(TO_CHAR(A.AMT3_1,'9,999,999,999,999'))AMT3_1
     , TRIM(TO_CHAR(A.AMT3_2,'9,999,999,999,999'))AMT3_2
     , TRIM(TO_CHAR(A.TOT3,'9,999,999,999,999'))TOT3
     , TRIM(TO_CHAR(A.TOT_AMT1,'9,999,999,999,999')) TOT_AMT1
     , TRIM(TO_CHAR(A.TOT_AMT2,'9,999,999,999,999')) TOT_AMT2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) TOT_AMT
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B

