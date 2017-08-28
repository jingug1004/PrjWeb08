/* �������� ���� */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K0560101' and stats_yr = '2011';
--DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K0560101' and stats_yr = '2011';


--������� �Է�
INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
		(
		     SELECT  F_GET_COMMN_NM(D.INSTN_TYP) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(D.THYR_YR_SURP_AMT)       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY D.INSTN_TYP) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD, D.INSTN_TYP, F_GET_COMMN_NM(A.BIZ_FLAG)
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
                       AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
                , T_INSTN_INFO D
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND A.GVM_INSTN_CD = D.INSTN_CD
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
              AND B.BIZ_YR         = '2011'   /* 2011�� ����� */
              AND B.pnoti_yn       = 'Y'      /* ���ô�� ����� */
            )      D
      GROUP BY D.INSTN_TYP
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560101'
     , NVL(A.ATTR_VAL1,'�հ�')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3/100000,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5/100000,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7/100000,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.ATTR_VAL9/100000,'9,999,999,999,999')) ATTR_VAL9
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   

/**
*** �Ϲ�������� �� ���п� �� ������ ���� ������ ���������� ���� ��ȹ�� 14�� ����� ���ؿ����������� �����Ͽ���(���ô��б���)
**/

WITH TMP_A AS 
(
		     SELECT  F_GET_COMMN_NM(D.INSTN_TYP) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(nvl(D.THYR_YR_SURP_AMT1,0)+nvl(THYR_YR_SURP_AMT2,0)+nvl(THYR_YR_SURP_AMT3,0))       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY D.INSTN_TYP) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD, D.INSTN_TYP, F_GET_COMMN_NM(A.BIZ_FLAG)
                  , DECODE(A.BIZ_FLAG,'K042001',A.BIZ_CD) 	BIZ_CD1
                  , DECODE(A.BIZ_FLAG,'K042002',A.BIZ_CD) 	BIZ_CD2
                  , DECODE(A.BIZ_FLAG,'K042003',A.BIZ_CD) 	BIZ_CD3
                  , DECODE(A.BIZ_FLAG,'K042001',nvl(REAL_SURP_AMT, E.BIZT_MNPV_AMT) ) 		THYR_YR_SURP_AMT1
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
                       AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                       --AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
                , T_INSTN_INFO D
                , (
                    SELECT BIZ_YR, BIZ_CD, SUM(BIZT_MNPV_AMT) BIZT_MNPV_AMT
                     FROM T_BIZ_MNPV_INFO
                    GROUP BY BIZ_YR, BIZ_CD 
                  ) E
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND B.BIZ_CD         = E.BIZ_CD(+)
              AND B.BIZ_YR         = E.BIZ_YR(+)
              AND A.GVM_INSTN_CD = D.INSTN_CD
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
              AND B.BIZ_YR         = '2011'   /* 2011�� ����� */
              AND B.pnoti_yn       = 'Y'      /* ���ô�� ����� */
            )      D
      GROUP BY D.INSTN_TYP
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560101'
     , NVL(A.ATTR_VAL1,'�հ�')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3/100000,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5/100000,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7/100000,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.ATTR_VAL9/100000,'9,999,999,999,999')) ATTR_VAL9
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   
 

/**
*** �Ϲ�������� �� ���п� �� ������ ���� ������ ���������� ���� ��ȹ�� 14�� ����� ���ؿ����������� �����Ͽ���
**/

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )   
WITH TMP_A AS 
(
		     SELECT  F_GET_COMMN_NM(D.INSTN_TYP) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(nvl(D.THYR_YR_SURP_AMT1,0)+nvl(THYR_YR_SURP_AMT2,0)+nvl(THYR_YR_SURP_AMT3,0))       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY D.INSTN_TYP) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD, D.INSTN_TYP, F_GET_COMMN_NM(A.BIZ_FLAG)
                  , DECODE(A.BIZ_FLAG,'K042001',A.BIZ_CD) 	BIZ_CD1
                  , DECODE(A.BIZ_FLAG,'K042002',A.BIZ_CD) 	BIZ_CD2
                  , DECODE(A.BIZ_FLAG,'K042003',A.BIZ_CD) 	BIZ_CD3
                  , DECODE(A.BIZ_FLAG,'K042001',nvl(REAL_SURP_AMT, E.BIZT_MNPV_AMT) ) 		THYR_YR_SURP_AMT1
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
                       AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
                , T_INSTN_INFO D
                , (
                    SELECT BIZ_YR, BIZ_CD, SUM(BIZT_MNPV_AMT) BIZT_MNPV_AMT
                     FROM T_BIZ_MNPV_INFO
                    GROUP BY BIZ_YR, BIZ_CD 
                  ) E
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND B.BIZ_CD         = E.BIZ_CD(+)
              AND B.BIZ_YR         = E.BIZ_YR(+)
              AND A.GVM_INSTN_CD = D.INSTN_CD
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
              AND B.BIZ_YR         = '2011'   /* 2011�� ����� */
              AND B.pnoti_yn       = 'Y'      /* ���ô�� ����� */
            )      D
      GROUP BY D.INSTN_TYP
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560101'
     , NVL(A.ATTR_VAL1,'�հ�')
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3/100000,'9,999,999,999,999')) ATTR_VAL3
     , TRIM(TO_CHAR(A.ATTR_VAL4,'9,999,999,999,999')) ATTR_VAL4
     , TRIM(TO_CHAR(A.ATTR_VAL5/100000,'9,999,999,999,999')) ATTR_VAL5
     , TRIM(TO_CHAR(A.ATTR_VAL6,'9,999,999,999,999')) ATTR_VAL6
     , TRIM(TO_CHAR(A.ATTR_VAL7/100000,'9,999,999,999,999')) ATTR_VAL7
     , TRIM(TO_CHAR(A.ATTR_VAL8,'9,999,999,999,999')) ATTR_VAL8
     , TRIM(TO_CHAR(A.ATTR_VAL9/100000,'9,999,999,999,999')) ATTR_VAL9
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
 ;   
 
 






--õ������ ��ȸ
WITH TMP_A AS 
(
     SELECT GROUPING_ID(D.INSTN_TYP)   RN
          , F_GET_COMMN_NM(D.INSTN_TYP) ATTR_VAL1 
          , COUNT(D.BIZ_CD1)         			ATTR_VAL2
          , SUM(D.THYR_YR_SURP_AMT1)      ATTR_VAL3
          , COUNT(D.BIZ_CD2)         			ATTR_VAL4
          , SUM(D.THYR_YR_SURP_AMT2)      ATTR_VAL5
          , COUNT(D.BIZ_CD3)         			ATTR_VAL6
          , SUM(D.THYR_YR_SURP_AMT3)      ATTR_VAL7
          , COUNT(D.BIZ_CD)           		ATTR_VAL8
          , SUM(D.THYR_YR_SURP_AMT)       ATTR_VAL9
          , ROW_NUMBER() OVER(ORDER BY D.INSTN_TYP) ORDERED
       FROM (
            SELECT B.BIZ_YR, A.BIZ_CD, REAL_SURP_AMT THYR_YR_SURP_AMT , A.GVM_INSTN_CD, D.INSTN_TYP, F_GET_COMMN_NM(A.BIZ_FLAG)
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
                       AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
                       AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                       AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     GROUP BY TRGT.BIZ_CD, TRGT.BIZ_YR
                )C 
                , T_INSTN_INFO D
            WHERE A.BIZ_CD         = B.BIZ_CD 
              AND B.BIZ_CD         = C.BIZ_CD(+)
              AND B.BIZ_YR         = C.BIZ_YR(+)
              AND A.GVM_INSTN_CD = D.INSTN_CD
              AND A.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
              AND B.BIZ_YR         = '2011'   /* 2011�� ����� */
              AND B.pnoti_yn       = 'Y'      /* ���ô�� ����� */
            )      D
      GROUP BY ROLLUP (D.INSTN_TYP)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K0560101'
     , NVL(A.ATTR_VAL1,'�հ�')
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
 


