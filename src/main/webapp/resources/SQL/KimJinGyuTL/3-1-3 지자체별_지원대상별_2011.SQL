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
     SELECT GROUPING_ID(D.UNIV_ZON,D.BLN_PROV)   RN
          , UNIV_ZON
         , F_GET_INSTN_NM('INSTN', D.BLN_PROV) ATTR_VAL1
         , NVL(SUM(CNT1),0) CNT1
         , NVL(SUM(AMT1),0) AMT1
         , NVL(SUM(CNT2),0) CNT2
         , NVL(SUM(AMT2),0) AMT2
         , NVL(SUM(CNT3),0) CNT3
         , NVL(SUM(AMT3),0) AMT3
         , NVL(SUM(TOT_CNT),0) TOT_CNT
         , NVL(SUM(TOT_AMT),0) TOT_AMT        
         , ROW_NUMBER() OVER(ORDER BY D.UNIV_ZON , decode(D.BLN_PROV,null,9,1)) ORDERED
       FROM (
            SELECT BLN_PROV
            ,CASE WHEN BLN_PROV IN ('7010000','7150000','7240000','7310000','7380000','7430000','7480000','7530000','7800000','8000000','8140000','8320000','8490000','8750000','9010000','9290000') 
                   THEN '교육지자체' ELSE '일반지자체'  END        UNIV_ZON
                  , COUNT (DISTINCT DECODE(SURP_UNIT_TYP, 'K020001', A.BIZ_CD))        CNT1
                  , SUM(DECODE(SURP_UNIT_TYP, 'K020001', REAL_SURP_AMT, 0))            AMT1
                  , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN A.BIZ_CD ELSE NULL END) CNT2
                  , SUM (CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN REAL_SURP_AMT ELSE 0 END) AMT2
                  , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN A.BIZ_CD ELSE NULL END) CNT3
                  , SUM (CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN REAL_SURP_AMT ELSE 0 END) AMT3
                  , COUNT(DISTINCT A.BIZ_CD) TOT_CNT
                  , SUM(REAL_SURP_AMT) TOT_AMT
                 FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , PROV.BLN_PROV
                      , TRGT.SURP_UNIT_TYP
                      , REAL_SURP_AMT
                       ,CASE WHEN BLN_PROV IN ('7010000','7150000','7240000','7310000','7380000','7430000','7480000','7530000','7800000','8000000','8140000','8320000','8490000','8750000','9010000','9290000') 
                   THEN '교육지자체' ELSE '일반지자체'  END        UNIV_ZON
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
                     AND BIZ.BIZ_FLAG in ( 'K042004','K042005')  /*지자체 사업 */
                     AND BIZM.pnoti_yn     = 'Y'  /* 비공시대상 대학 제외 */
                     AND TRGT.BIZ_YR = '2011'
                     AND BIZ.BIZ_PRPS_TYP IS NOT NULL
                     --AND PROV.BLN_PROV not in ('7010000','7150000','7240000','7310000','7380000','7430000','7480000','7530000','7800000','8000000','8140000','8320000','8490000','8750000','9010000','9290000')
                ) A
              GROUP BY UNIV_ZON, BLN_PROV, SURP_UNIT_TYP
            ) D
      GROUP BY ROLLUP (D.UNIV_ZON, D.BLN_PROV)
)
SELECT '2011'
,  STATS_SNO_SQ.NEXTVAL
     , 'K0560601031'
     , A.UNIV_ZON   
     , DECODE(A.RN,'0', A.ATTR_VAL1, '1','소계','3', '합계')
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
     , TO_CHAR(DECODE(B.TOT_AMT,0,0,ROUND(A.TOT_AMT/B.TOT_AMT*100,1)),'FM999,990.0') PER4    
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 3) B
      WHERE A.RN IN ('0','1','3');