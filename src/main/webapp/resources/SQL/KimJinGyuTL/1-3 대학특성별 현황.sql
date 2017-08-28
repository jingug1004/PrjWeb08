/* Ȩ�������� */
/* ����Ư���� ��Ȳ_���� */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601141' and stats_yr = '2011';
 

INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )  
 WITH TMP_A AS 
(                  
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 10000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('U','G')  /* ���и� */
                           AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , ( 
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
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
                       )A
                     , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 10000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN in ('U', 'G')
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601141'
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','�հ�',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
 
 
 
 
 
/* ����Ư���� ��Ȳ_�������� */
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601142' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )  
 WITH TMP_A AS 
(                  
    SELECT GROUPING_ID(A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('C')  /* �������и� */
                                   AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ZON, UNIV_SIZE
           )A
         , ( 
                SELECT B.UNIV_ZON, B.UNIV_SIZE 
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
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
                       )A
                     , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN in ('C')
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
     GROUP BY ROLLUP(A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601142'
     , DECODE(A.RN,'3','�հ�','��������')
     , DECODE(A.RN,'1','�Ұ�','3','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'1','�Ұ�','3','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 3) B
 ;
 
 -- ���������߰�
 WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV
                                            ELSE ''
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD
                                            ELSE ''
                                        END ZON_CD
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE  UNIV_GUBUN IN ('C')  /* �������и� */
                           AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
                             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                             AND TRGT.BIZ_YR = SCH.SRY_YY
                             AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
                             AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                             AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                             AND TRGT.BIZ_CD = BIZM.BIZ_CD
                             AND TRGT.BIZ_YR = BIZM.BIZ_YR
                             AND BIZM.BIZ_CD = BIZ.BIZ_CD
                             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ���, ������������������� ���� */
                             AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
                          --   AND BIZ.GVM_INSTN_CD <> '1341000' /* ������ ��� ���� */
                       )A
                     , (
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV
                                                      ELSE ''
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD
                                                      ELSE ''
                                                  END ZON_CD
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN IN ('C')  /* �������и� */
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601142'
     , DECODE(A.RN,'7','�հ�','��������')
     , DECODE(A.RN,'7','�հ�',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
 
/** ����Ư����(������������������)_���� **/
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601151' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )  
 WITH TMP_A AS 
(                  
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 10000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('U','G')  /* ���и� */
                           AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , ( 
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
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
                       )A
                     , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 10000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='U' THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN in ('U', 'G')
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601151'
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','�հ�',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
 
 
 
 
 
/** ����Ư����(������������������)_�������� **/
--SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'K05601152' and stats_yr = '2011';


 INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG , ATTR1_VAL
    , ATTR2_VAL, ATTR3_VAL, ATTR4_VAL, ATTR5_VAL, ATTR6_VAL
    , ATTR7_VAL, ATTR8_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )  
 WITH TMP_A AS 
(                  
    SELECT GROUPING_ID(A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                            ELSE '' 
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                            ELSE '' 
                                        END ZON_CD 
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE UNIV_GUBUN IN ('C')  /* �������и� */
                                   AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      ) 
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ZON, UNIV_SIZE
           )A
         , ( 
                SELECT B.UNIV_ZON, B.UNIV_SIZE 
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT    
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
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
                       )A
                     , ( 
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV 
                                                      ELSE '' 
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD 
                                                      ELSE '' 
                                                  END ZON_CD 
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN in ('C')
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
     GROUP BY ROLLUP(A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601152'
     , DECODE(A.RN,'3','�հ�','��������')
     , DECODE(A.RN,'1','�Ұ�','3','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'1','�Ұ�','3','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1 
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1 
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2 
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2 
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 3) B
 ;


--�������� �߰�
WITH TMP_A AS
(
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
         , NVL(SUM(SCHL_CD),0)  BIZ_CNT1
         , NVL(SUM(RE_STD_NUM),0)  BIZ_AMT1
         , NVL(SUM(BIZ_CNT2),0)  BIZ_CNT2
         , NVL(SUM(BIZ_AMT2),0)  BIZ_AMT2
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CD
                  , SUM(RE_STD_NUM) RE_STD_NUM
                FROM (
                      SELECT SRY_YY, SCHL_CD
                         , MAX(SCHL_HG_NM)        SCHL_HG_NM
                         , MAX(ESTB_SC_DIV)       RE_ESTB_SC_DIV
                         , MAX(ZON_CD)            RE_ZON_CD
                         , SUM(STD_NUM)           RE_STD_NUM
                         , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                         , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                         , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                      FROM (
                                SELECT SRY_YY, SCHL_HG_NM
                                     , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                     , ORGCODE
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV
                                            ELSE ''
                                        END ESTB_SC_DIV
                                     , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD
                                            ELSE ''
                                        END ZON_CD
                                     , STD_NUM
                                  FROM T_SCH_INFO_HIST
                                 WHERE  UNIV_GUBUN IN ('C')  /* �������и� */
                           AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                            )
                     GROUP BY SRY_YY, SCHL_CD
                      )
                 WHERE SRY_YY = '2011'
                 GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
           )A
         , (
                SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
                     , COUNT(DISTINCT A.BIZ_CD)                                         BIZ_CNT2
                     , SUM(REAL_SURP_AMT)                                               BIZ_AMT2
                  FROM (
                            SELECT TRGT.BIZ_YR
                                 , TRGT.BIZ_CD
                                 , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                                 , REAL_SURP_AMT
                              FROM T_BIZ_SURP_TRGT_INFO TRGT
                                 , T_BIZT_INFO          BIZT
                                 , T_SCH_INFO_HIST      SCH
                                 , T_BIZ_MNG_INFO       BIZM
                                 , T_BIZ_INFO           BIZ
                            WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
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
                          --   AND BIZ.GVM_INSTN_CD <> '1341000' /* ������ ��� ���� */
                       )A
                     , (
                              SELECT SRY_YY, SCHL_CD
                                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                                   , CASE WHEN SUM(STD_NUM) >= 4000            THEN '��Ը�' ELSE '�ߡ��ұԸ�'END        UNIV_SIZE
                                FROM (
                                          SELECT SRY_YY, SCHL_HG_NM
                                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                                               , ORGCODE
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ESTB_SC_DIV
                                                      ELSE ''
                                                  END ESTB_SC_DIV
                                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN ='C' THEN ZON_CD
                                                      ELSE ''
                                                  END ZON_CD
                                               , STD_NUM
                                            FROM T_SCH_INFO_HIST
                                           WHERE UNIV_GUBUN IN ('C')  /* �������и� */
                                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                      )
                               GROUP BY SRY_YY, SCHL_CD
                         )B
                   WHERE A.BIZ_YR = B.SRY_YY
                     AND A.SCHL_CD = B.SCHL_CD
                     AND A.BIZ_YR = '2011'
                   GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
         ) B
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601152'
     , DECODE(A.RN,'7','�հ�','��������')
     , DECODE(A.RN,'7','�հ�',A.UNIV_ESTB)            UNIV_ESTB
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','�Ұ�','7','�հ�',A.UNIV_SIZE) UNIV_SIZE
     , TRIM(TO_CHAR(A.BIZ_CNT1,'9,999,999,999,999'))  BIZ_CNT1
     , TRIM(TO_CHAR(A.BIZ_AMT1,'9,999,999,999,999'))  BIZ_AMT1
     , TRIM(TO_CHAR(A.BIZ_CNT2,'9,999,999,999,999'))  BIZ_CNT2
     , TRIM(TO_CHAR(A.BIZ_AMT2/100000,'9,999,999,999,999'))  BIZ_AMT2
     , DECODE(B.BIZ_AMT2,0,0,ROUND(A.BIZ_AMT2/B.BIZ_AMT2*100,1)) PER2
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
 FROM TMP_A A
    , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
 INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG 
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL, ATTR8_VAL, ATTR9_VAL
    , ATTR43_VAL
    , RGSTR_ID
    ,RGST_DTTM
    )  


/****************************************************************
* Ȩ������������ ���ܵ�. ��Ȳ�м�(1)������ ��� 
*****************************************************************/


/* ������������������� ���� */
WITH TMP_A AS
(
      SELECT SRY_YY, SCHL_CD
           , MAX(SCHL_HG_NM)        SCHL_HG_NM
           , MAX(ESTB_SC_DIV)       ESTB_SC_DIV
           , MAX(ZON_CD)            ZON_CD
           , SUM(STD_NUM)           STD_NUM
           , MAX(UNIV_GUBUN)        UNIV_GUBUN
           , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
           , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
           , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '��Ը�' 
                  WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '��Ը�' 
                  ELSE '�ߡ��ұԸ�'
             END        UNIV_SIZE 
        FROM (
                  SELECT SRY_YY, SCHL_HG_NM
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV 
                              ELSE '' 
                          END ESTB_SC_DIV
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD 
                              ELSE '' 
                          END ZON_CD 
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
              )
       WHERE SRY_YY = '2011'
       GROUP BY SRY_YY, SCHL_CD
)
, TMP_B AS
(
   SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
       , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
       , REAL_SURP_AMT
    FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
                   , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                   , REAL_SURP_AMT    
                FROM T_BIZ_SURP_TRGT_INFO TRGT
                   , T_BIZT_INFO          BIZT
                   , T_SCH_INFO_HIST      SCH
                   , T_BIZ_MNG_INFO       BIZM
                   , T_BIZ_INFO           BIZ
              WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
               AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
               AND TRGT.BIZ_YR = SCH.SRY_YY
               AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
               AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
               AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
               AND TRGT.BIZ_CD = BIZM.BIZ_CD
               AND TRGT.BIZ_YR = BIZM.BIZ_YR
               AND BIZM.BIZ_CD = BIZ.BIZ_CD
               AND BIZ.BIZ_FLAG in ( 'K042001','K042002' ,'K042003')  /* ����ü ��� ���� */
               AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
         )A
       , ( 
                SELECT SRY_YY, SCHL_CD
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                   , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '��Ը�' 
                          WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '��Ը�' 
                          ELSE '�ߡ��ұԸ�'
                     END        UNIV_SIZE 
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                      )
               GROUP BY SRY_YY, SCHL_CD
           )B
     WHERE A.BIZ_YR = B.SRY_YY
       AND A.SCHL_CD = B.SCHL_CD
       AND A.BIZ_YR = '2011'
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601111'
     , ATTR1
     , NVL(ATTR2,'�հ�') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(ATTR6,'9,999,999,999,999')) ATTR6
     , TRIM(TO_CHAR(ATTR5,'9,999,999,999,999')) ATTR5
     , DECODE(TOT,0,0, ROUND(ATTR5/TOT*100,1)) PER  
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB)  ORDERED
                 , '����'                                 ATTR1
                 , A.UNIV_ESTB                            ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ESTB, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ESTB) A
                 , (SELECT BIZ_YR, UNIV_ESTB, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ESTB) B
              WHERE A.UNIV_ESTB=B.UNIV_ESTB
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ESTB) 
             UNION 
            SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'��') DESC)   ORDERED
                 , '������'                               ATTR1
                 , A.UNIV_ZON                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ZON, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ZON) A
                 , (SELECT BIZ_YR, UNIV_ZON, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ZON) B
              WHERE A.UNIV_ZON=B.UNIV_ZON
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ZON)
             UNION 
            SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_SIZE)  ORDERED
                 , '�Ը�'                                 ATTR1
                 , A.UNIV_SIZE                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_SIZE, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_SIZE) A
                 , (SELECT BIZ_YR, UNIV_SIZE, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_SIZE) B
              WHERE A.UNIV_SIZE=B.UNIV_SIZE
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_SIZE) 
     ) 
 ;






/* ������������������� ���� */

WITH TMP_A AS
(
      SELECT SRY_YY, SCHL_CD
           , MAX(SCHL_HG_NM)        SCHL_HG_NM
           , MAX(ESTB_SC_DIV)       ESTB_SC_DIV
           , MAX(ZON_CD)            ZON_CD
           , SUM(STD_NUM)           STD_NUM
           , MAX(UNIV_GUBUN)        UNIV_GUBUN
           , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
           , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
           , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '��Ը�' 
                  WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '��Ը�' 
                  ELSE '�ߡ��ұԸ�'
             END        UNIV_SIZE 
        FROM (
                  SELECT SRY_YY, SCHL_HG_NM
                       , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                       , ORGCODE
                       , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV 
                              ELSE '' 
                          END ESTB_SC_DIV
                       , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD 
                              ELSE '' 
                          END ZON_CD 
                       , STD_NUM
                    FROM T_SCH_INFO_HIST
                   WHERE UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                     AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
              )
       WHERE SRY_YY = '2011'
       GROUP BY SRY_YY, SCHL_CD
)
, TMP_B AS
(
   SELECT A.BIZ_YR, A.BIZ_CD, A.SCHL_CD
       , B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
       , REAL_SURP_AMT
    FROM (
              SELECT TRGT.BIZ_YR
                   , TRGT.BIZ_CD
                   , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                   , REAL_SURP_AMT    
                FROM T_BIZ_SURP_TRGT_INFO TRGT
                   , T_BIZT_INFO          BIZT
                   , T_SCH_INFO_HIST      SCH
                   , T_BIZ_MNG_INFO       BIZM
                   , T_BIZ_INFO           BIZ
              WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
               AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
               AND TRGT.BIZ_YR = SCH.SRY_YY
               AND BIZ_EXE_END_YN = 'Y'    /* ������Ͽ� ���� ���� */
               AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
               AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
               AND TRGT.BIZ_CD = BIZM.BIZ_CD
               AND TRGT.BIZ_YR = BIZM.BIZ_YR
               AND BIZM.BIZ_CD = BIZ.BIZ_CD
               AND BIZ.BIZ_FLAG in ( 'K042001','K042002' )  /* ����ü ���, ������������������� ���� */
               AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
         )A
       , ( 
                SELECT SRY_YY, SCHL_CD
                   , CASE WHEN MAX(ESTB_SC_DIV) = '3'           THEN '�縳'   ELSE '��������'    END        UNIV_ESTB
                   , CASE WHEN MAX(ZON_CD) IN ('11','23','41')  THEN '������' ELSE '�������'  END        UNIV_ZON
                   , CASE WHEN MAX(UNIV_GUBUN) = 'U' AND SUM(STD_NUM) >= 10000           THEN '��Ը�' 
                          WHEN MAX(UNIV_GUBUN) = 'C' AND SUM(STD_NUM) >= 4000            THEN '��Ը�' 
                          ELSE '�ߡ��ұԸ�'
                     END        UNIV_SIZE 
                FROM (
                          SELECT SRY_YY, SCHL_HG_NM
                               , SUBSTR(SCHL_CD,1,5) || '000' SCHL_CD
                               , ORGCODE
                               , DECODE(UNIV_GUBUN,'G','U',UNIV_GUBUN) UNIV_GUBUN
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ESTB_SC_DIV 
                                      ELSE '' 
                                  END ESTB_SC_DIV
                               , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U', 'C') THEN ZON_CD 
                                      ELSE '' 
                                  END ZON_CD 
                               , STD_NUM
                            FROM T_SCH_INFO_HIST
                           WHERE UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                             AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                      )
               GROUP BY SRY_YY, SCHL_CD
           )B
     WHERE A.BIZ_YR = B.SRY_YY
       AND A.SCHL_CD = B.SCHL_CD
       AND A.BIZ_YR = '2011'
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'K05601111'
     , ATTR1
     , NVL(ATTR2,'�հ�') ATTR2
     , TRIM(TO_CHAR(ATTR3,'9,999,999,999,999')) ATTR3
     , TRIM(TO_CHAR(ATTR4,'9,999,999,999,999')) ATTR4
     , TRIM(TO_CHAR(ATTR6,'9,999,999,999,999')) ATTR6
     , TRIM(TO_CHAR(ATTR5,'9,999,999,999,999')) ATTR5
     , DECODE(TOT,0,0, ROUND(ATTR5/TOT*100,1)) PER  
     , ROW_NUMBER() OVER(ORDER BY RN , ORDERED)  ORDERED
     , 'SQL'
  FROM (
            SELECT 'A'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB)  ORDERED
                 , '����'                                 ATTR1
                 , A.UNIV_ESTB                            ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ESTB, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ESTB) A
                 , (SELECT BIZ_YR, UNIV_ESTB, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ESTB) B
              WHERE A.UNIV_ESTB=B.UNIV_ESTB
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ESTB) 
             UNION 
            SELECT 'B'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY NVL(A.UNIV_ZON,'��') DESC)   ORDERED
                 , '������'                               ATTR1
                 , A.UNIV_ZON                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_ZON, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_ZON) A
                 , (SELECT BIZ_YR, UNIV_ZON, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_ZON) B
              WHERE A.UNIV_ZON=B.UNIV_ZON
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_ZON)
             UNION 
            SELECT 'C'                                    RN 
                 , ROW_NUMBER() OVER(ORDER BY A.UNIV_SIZE)  ORDERED
                 , '�Ը�'                                 ATTR1
                 , A.UNIV_SIZE                              ATTR2
                 , NVL(SUM(A.RE_SCHL_CD),0)               ATTR3
                 , NVL(SUM(A.RE_STD_NUM),0)               ATTR4
                 , NVL(SUM(B.RE_BIZ_CD),0)                ATTR6
                 , NVL(SUM(B.REAL_SURP_AMT),0)            ATTR5 
                 , (SELECT SUM(REAL_SURP_AMT) FROM TMP_A A, TMP_B B WHERE A.SCHL_CD=B.SCHL_CD AND A.SRY_YY = B.BIZ_YR) TOT
              FROM (SELECT SRY_YY, UNIV_SIZE, COUNT( SCHL_CD) RE_SCHL_CD, SUM(STD_NUM) RE_STD_NUM FROM TMP_A GROUP BY SRY_YY, UNIV_SIZE) A
                 , (SELECT BIZ_YR, UNIV_SIZE, COUNT( DISTINCT BIZ_CD) RE_BIZ_CD, SUM(REAL_SURP_AMT) REAL_SURP_AMT FROM TMP_B GROUP BY BIZ_YR, UNIV_SIZE) B
              WHERE A.UNIV_SIZE=B.UNIV_SIZE
                AND A.SRY_YY = B.BIZ_YR
             GROUP BY ROLLUP(A.UNIV_SIZE) 
     ) 
 ;

