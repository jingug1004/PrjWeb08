/* 부처별 재정지원 현황(공시대상) */

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL,  ATTR5_VAL, 
    ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, 
    ATTR10_VAL, ATTR11_VAL, ATTR12_VAL, ATTR13_VAL, 
    ATTR14_VAL, ATTR15_VAL, ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.GVM_INSTN_CD)   RN
          , F_GET_INSTN_NM('INSTN', A.GVM_INSTN_CD) ATTR_VAL1
          , COUNT(A.BIZ_CD)                ATTR_VAL2 
          , SUM(REAL_SURP_AMT)                 ATTR_VAL3
          , SUM(C.CNT1)                             ATTR_VAL4
          , SUM(C.CNT2)                             ATTR_VAL5
          , SUM(C.CNT3)                             ATTR_VAL6
          , SUM(C.CNT4)                             ATTR_VAL7
          , SUM(C.CNT5)                             ATTR_VAL8
          , SUM(C.CNT6)                             ATTR_VAL9
          , SUM(C.CNT7)                             ATTR_VAL10
          , SUM(C.CNT8)                             ATTR_VAL11
          , ROW_NUMBER() OVER(ORDER BY decode(A.GVM_INSTN_CD,null,9,1) , COUNT(A.BIZ_CD) desc) ORDERED
       FROM T_BIZ_INFO      A
          , T_BIZ_MNG_INFO  B  
          , (
                    SELECT ACMMT_YR, BIZ_CD 
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
                      FROM T_BIZ_SURP_TRGT_INFO C, T_ACMMT_STS D
                     WHERE ACMMT_FLAG   in ( 'K030001' , 'K030002')
                       --AND ACMMT_YR     = '2011'
                       AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                     GROUP BY ACMMT_YR, BIZ_CD
            ) C
            , ( 
                    SELECT TRGT.BIZ_CD
                         , TRGT.BIZ_YR
                         , SUM(REAL_SURP_AMT) REAL_SURP_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT
                         , T_BIZT_INFO BIZT 
                         , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )D
      WHERE A.BIZ_CD         = B.BIZ_CD 
        AND B.BIZ_YR         = C.ACMMT_YR(+)
        AND B.BIZ_CD         = C.BIZ_CD(+)
        AND B.BIZ_YR         = D.BIZ_YR(+)
        AND B.BIZ_CD         = D.BIZ_CD(+)
        AND A.BIZ_FLAG in ( 'K042001')  /* 일반지원사업 만 포함 */
        AND B.BIZ_YR         = '2011'   /* 2011년 사업만 */
        AND B.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
      GROUP BY ROLLUP (A.GVM_INSTN_CD)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560113'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL4+A.ATTR_VAL6)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT1
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL5+A.ATTR_VAL7)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT2
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL11
     , TRIM(TO_CHAR(A.ATTR_VAL10,'9,999,999,999,999')) ATTR_VAL12
     , TRIM(TO_CHAR(A.ATTR_VAL11,'9,999,999,999,999')) ATTR_VAL13
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL8+A.ATTR_VAL10)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT3
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL9+A.ATTR_VAL11)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   


/* 부처별 재정지원 현황 */

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL,  ATTR5_VAL, 
    ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL, 
    ATTR10_VAL, ATTR11_VAL, ATTR12_VAL, ATTR13_VAL, 
    ATTR14_VAL, ATTR15_VAL, ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.GVM_INSTN_CD)   RN
          , F_GET_INSTN_NM('INSTN', A.GVM_INSTN_CD) ATTR_VAL1
          , COUNT(A.BIZ_CD)                ATTR_VAL2 
          , SUM(REAL_SURP_AMT)                 ATTR_VAL3
          , SUM(C.CNT1)                             ATTR_VAL4
          , SUM(C.CNT2)                             ATTR_VAL5
          , SUM(C.CNT3)                             ATTR_VAL6
          , SUM(C.CNT4)                             ATTR_VAL7
          , SUM(C.CNT5)                             ATTR_VAL8
          , SUM(C.CNT6)                             ATTR_VAL9
          , SUM(C.CNT7)                             ATTR_VAL10
          , SUM(C.CNT8)                             ATTR_VAL11
          , ROW_NUMBER() OVER(ORDER BY decode(A.GVM_INSTN_CD,null,9,1) , COUNT(A.BIZ_CD) desc) ORDERED
       FROM T_BIZ_INFO      A
          , T_BIZ_MNG_INFO  B  
          , (
                    SELECT ACMMT_YR, BIZ_CD 
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT1
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT2
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032001' THEN 1 ELSE 0 END)  AS CNT3
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030001' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K032002' THEN 1 ELSE 0 END)  AS CNT4
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT5
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031001' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT6
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033001' THEN 1 ELSE 0 END)  AS CNT7
                         , SUM(CASE WHEN  ACMMT_FLAG = 'K030002' AND ATTR1_VAL='K031002' AND  ATTR2_VAL = 'K033002' THEN 1 ELSE 0 END)  AS CNT8
                      FROM T_BIZ_SURP_TRGT_INFO C, T_ACMMT_STS D
                     WHERE ACMMT_FLAG   in ( 'K030001' , 'K030002')
                       --AND ACMMT_YR     = '2011'
                       AND C.BIZ_SURP_INFO_ID  = D.BIZ_SURP_INFO_ID
                     GROUP BY ACMMT_YR, BIZ_CD
            ) C
            , ( 
                    SELECT TRGT.BIZ_CD
                         , TRGT.BIZ_YR
                         , SUM(REAL_SURP_AMT) REAL_SURP_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT
                         , T_BIZT_INFO BIZT 
                         , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )D
      WHERE A.BIZ_CD         = B.BIZ_CD 
        AND B.BIZ_YR         = C.ACMMT_YR(+)
        AND B.BIZ_CD         = C.BIZ_CD(+)
        AND B.BIZ_YR         = D.BIZ_YR(+)
        AND B.BIZ_CD         = D.BIZ_CD(+)
        AND A.BIZ_FLAG in ( 'K042001')  /* 일반지원사업 만 포함 */
        AND B.BIZ_YR         = '2011'   /* 2011년 사업만 */
        AND B.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
      GROUP BY ROLLUP (A.GVM_INSTN_CD)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560113'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL4+A.ATTR_VAL6)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT1
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL5+A.ATTR_VAL7)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT2
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL10
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL11
     , TRIM(TO_CHAR(A.ATTR_VAL10,'9,999,999,999,999')) ATTR_VAL12
     , TRIM(TO_CHAR(A.ATTR_VAL11,'9,999,999,999,999')) ATTR_VAL13
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL8+A.ATTR_VAL10)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT3
     , DECODE(A.ATTR_VAL3,0,0,ROUND((A.ATTR_VAL9+A.ATTR_VAL11)/A.ATTR_VAL3*1000000,1))  PER_AMT_CNT4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
     ;   

