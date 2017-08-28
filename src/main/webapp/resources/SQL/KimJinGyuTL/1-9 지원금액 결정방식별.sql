/* ������������������� ���� */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN 
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
              , REAL_SURP_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
             AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
             AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
             AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'�հ�')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;   


     
/* ������������������� ���� */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN 
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
              , REAL_SURP_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
             AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
             AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ����ü ���, ������������������� ���� */
             AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601092'
     , NVL(A.ATTR_VAL1,'�հ�')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;   

/* ������������������� ����(���ô��, 20�� ����� �ش��׸� ���Է���) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601091' and stats_yr = '2011';

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN 
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
              , REAL_SURP_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
             AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
             --AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
             AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601091'
     , NVL(A.ATTR_VAL1,'�հ�')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;   


     
/* ������������������� ����(���ô��, 17�� ����� �ش��׸� ���Է���) */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';
--    DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'K05601092' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )    
WITH TMP_A AS 
(
     SELECT GROUPING_ID(A.SURP_AMT_DCISN_WAY) RN 
          , F_GET_COMMN_NM(A.SURP_AMT_DCISN_WAY)   ATTR_VAL1
          , COUNT(DISTINCT A.BIZ_CD)         ATTR_VAL2 
          , SUM(REAL_SURP_AMT)               ATTR_VAL3
          , ROW_NUMBER() OVER(ORDER BY A.SURP_AMT_DCISN_WAY) ORDERED
       FROM (
           SELECT TRGT.BIZ_YR
              , TRGT.BIZ_CD
              , BIZM.SURP_AMT_DCISN_WAY
              , REAL_SURP_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+) 
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
             AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
             --AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002')  /* ����ü ���, ������������������� ���� */
             AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
             AND BIZM.SURP_AMT_DCISN_WAY IS NOT NULL
             AND TRGT.BIZ_YR = '2011'
        ) A
      GROUP BY ROLLUP(A.SURP_AMT_DCISN_WAY)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601092'
     , NVL(A.ATTR_VAL1,'�հ�')                        ATTR_VAL1
     , TRIM(TO_CHAR(A.ATTR_VAL2,'9,999,999,999,999')) ATTR_VAL2
     , TRIM(TO_CHAR(A.ATTR_VAL3,'9,999,999,999,999')) ATTR_VAL3
     , DECODE(B.ATTR_VAL3,0,0,ROUND(A.ATTR_VAL3/B.ATTR_VAL3*100,1)) ATTR4_VAL
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
   FROM TMP_A A
       , (SELECT * FROM TMP_A WHERE RN=1) B
     ;   
     
     