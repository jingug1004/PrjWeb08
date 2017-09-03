--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560201' and stats_yr = '2011';
--DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560201' and stats_yr = '2011';

/*** 실지원액 통계(공시대상)

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(D.GVM_INSTN_CD)   RN
          , F_GET_INSTN_NM('INSTN', D.GVM_INSTN_CD) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(D.THYR_YR_SURP_AMT)       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY decode(D.GVM_INSTN_CD,null,9,1) , SUM(D.THYR_YR_SURP_AMT) desc) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD , F_GET_COMMN_NM(A.BIZ_FLAG)
                  , DECODE(A.BIZ_FLAG,'K042001',A.BIZ_CD) 	BIZ_CD1
                  , DECODE(A.BIZ_FLAG,'K042002',A.BIZ_CD) 	BIZ_CD2
                  , DECODE(A.BIZ_FLAG,'K042003',A.BIZ_CD) 	BIZ_CD3
                  , DECODE(A.BIZ_FLAG,'K042001',REAL_SURP_AMT) 		THYR_YR_SURP_AMT1
                  , DECODE(A.BIZ_FLAG,'K042002',REAL_SURP_AMT) 		THYR_YR_SURP_AMT2
                  , DECODE(A.BIZ_FLAG,'K042003',REAL_SURP_AMT)    THYR_YR_SURP_AMT3
            FROM T_BIZ_INFO A
                , T_BIZ_MNG_INFO  B
                , ( 
                    SELECT TRGT.BIZ_CD, TRGT.BIZ_YR, SUM(REAL_SURP_AMT) REAL_SURP_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT, T_BIZT_INFO BIZT , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       --AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
              AND B.BIZ_YR         = '2011'   /* 2011년 사업만 */
              AND B.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
            )      D
      GROUP BY ROLLUP (D.GVM_INSTN_CD)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560201'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL9
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   

/*** 실지원액 통계

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(D.GVM_INSTN_CD)   RN
          , F_GET_INSTN_NM('INSTN', D.GVM_INSTN_CD) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(D.THYR_YR_SURP_AMT)       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY decode(D.GVM_INSTN_CD,null,9,1) , SUM(D.THYR_YR_SURP_AMT) desc) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD , F_GET_COMMN_NM(A.BIZ_FLAG)
                  , DECODE(A.BIZ_FLAG,'K042001',A.BIZ_CD) 	BIZ_CD1
                  , DECODE(A.BIZ_FLAG,'K042002',A.BIZ_CD) 	BIZ_CD2
                  , DECODE(A.BIZ_FLAG,'K042003',A.BIZ_CD) 	BIZ_CD3
                  , DECODE(A.BIZ_FLAG,'K042001',REAL_SURP_AMT) 		THYR_YR_SURP_AMT1
                  , DECODE(A.BIZ_FLAG,'K042002',REAL_SURP_AMT) 		THYR_YR_SURP_AMT2
                  , DECODE(A.BIZ_FLAG,'K042003',REAL_SURP_AMT)    THYR_YR_SURP_AMT3
            FROM T_BIZ_INFO A
                , T_BIZ_MNG_INFO  B
                , ( 
                    SELECT TRGT.BIZ_CD, TRGT.BIZ_YR, SUM(REAL_SURP_AMT) REAL_SURP_AMT
                      FROM T_BIZ_SURP_TRGT_INFO TRGT, T_BIZT_INFO BIZT , T_SCH_INFO_HIST SCH
                     WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
                       AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                       AND TRGT.BIZ_YR = SCH.SRY_YY
                       AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
                       AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
                       AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
              AND B.BIZ_YR         = '2011'   /* 2011년 사업만 */
              AND B.pnoti_yn       = 'Y'      /* 공시대상 사업만 */
            )      D
      GROUP BY ROLLUP (D.GVM_INSTN_CD)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560201'
     , NVL(A.ATTR_VAL1,'합계')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.ATTR_VAL9,'9,999,999,999,999')) ATTR_VAL9
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   
 
 
 
**/
