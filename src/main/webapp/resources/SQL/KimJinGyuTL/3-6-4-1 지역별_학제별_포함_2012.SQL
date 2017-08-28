INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL
    , ATTR43_VAL
    , RGSTR_ID
    , RGST_DTTM
    )
WITH TMP_A AS
(
     SELECT GROUPING_ID(D.ZON_CD)   RN
         , DECODE(D.ZON_CD,NULL,'',F_GET_COMMN_NM('K051'||D.ZON_CD)) ATTR_VAL1
         , NVL(SUM(AMT1),0) AMT1
         , NVL(SUM(AMT2),0) AMT2
         , NVL(SUM(TOT_AMT),0) TOT_AMT        
         , ROW_NUMBER() OVER(ORDER BY decode(D.ZON_CD,null,9,1) asc) ORDERED
       FROM (
            SELECT ZON_CD
                  , DECODE(UNIV_GUBUN, 'U', SUM(REAL_SURP_AMT))  AMT1
                  , DECODE(UNIV_GUBUN, 'C', SUM(REAL_SURP_AMT))  AMT2
                  , SUM (REAL_SURP_AMT) TOT_AMT
                 FROM (
                   SELECT TRGT.BIZ_YR
                      , TRGT.BIZ_CD
                      , SCH.ZON_CD
                      , DECODE(SCH.UNIV_GUBUN,'G','U',SCH.UNIV_GUBUN) UNIV_GUBUN
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
                     AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     AND TRGT.BIZ_CD = BIZM.BIZ_CD
                     AND TRGT.BIZ_YR = BIZM.BIZ_YR
                     AND BIZM.BIZ_CD = BIZ.BIZ_CD
                     AND BIZ.BIZ_CD  = PROV.BIZ_CD
                     AND BIZ.BIZ_FLAG in ( 'K042004','K042005')  /*지자체 사업 */
                     AND BIZM.pnoti_yn     = 'Y'  /* 비공시대상 대학 제외 */
                     AND TRGT.BIZ_YR = '2012'
                ) A
              GROUP BY ZON_CD, UNIV_GUBUN
            ) D
      GROUP BY ROLLUP (D.ZON_CD)
)
SELECT '2012'
,  STATS_SNO_SQ.NEXTVAL
     , 'K0560602041'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.AMT1,'9,999,999,999,999'))AMT1
     , TO_CHAR(DECODE(B.AMT1,0,0,ROUND(A.AMT1/B.AMT1*100,1)),'FM999,990.0') PER1
     , TRIM(TO_CHAR(A.AMT2,'9,999,999,999,999')) AMT2
     , TO_CHAR(DECODE(B.AMT2,0,0,ROUND(A.AMT2/B.AMT2*100,1)),'FM999,990.0') PER2
     , TRIM(TO_CHAR(A.TOT_AMT,'9,999,999,999,999')) TOT_AMT
     , TO_CHAR(DECODE(B.TOT_AMT,0,0,ROUND(A.TOT_AMT/B.TOT_AMT*100,1)),'FM999,990.0') PER3     
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 1) B
 ;