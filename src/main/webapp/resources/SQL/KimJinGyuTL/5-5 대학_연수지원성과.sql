/* ������������(����) */

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CNT),0)             SCHL_CNT
         , 103  BIZ_CNT--, NVL(SUM(TOT_CNT),0)              BIZ_CNT
         , NVL(SUM(TOT_AMT),0)              BIZ_AMT
         , NVL(SUM(CNT1),0)                 CNT1
         , NVL(SUM(CNT2),0)                 CNT2
         , NVL(SUM(CNT3),0)                 CNT3
         , NVL(SUM(CNT4),0)                 CNT4
         , NVL(SUM(CNT5),0)                 CNT5
         , NVL(SUM(CNT6),0)                 CNT6
         , NVL(SUM(CNT7),0)                 CNT7
         , NVL(SUM(CNT8),0)                 CNT8
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT '��������' UNIV_ESTB, '������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '��������' UNIV_ESTB, '������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '��������' UNIV_ESTB, '�������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '��������' UNIV_ESTB, '�������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '�縳' UNIV_ESTB, '������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '�縳' UNIV_ESTB, '������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '�縳' UNIV_ESTB, '�������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '�縳' UNIV_ESTB, '�������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
           )A
         , (
                 SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , SUM(ATTR1_VAL) AS CNT1 
                     , SUM(ATTR2_VAL) AS CNT2
                     , SUM(ATTR3_VAL) AS CNT3
                     , SUM(ATTR4_VAL) AS CNT4
                     , SUM(ATTR5_VAL) AS CNT5 
                     , SUM(ATTR6_VAL) AS CNT6
                     , SUM(ATTR7_VAL) AS CNT7
                     , SUM(ATTR8_VAL) AS CNT8
                     , COUNT(DISTINCT A.BIZ_CD)     TOT_CNT
                     , SUM(REAL_SURP_AMT)           TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , REAL_SURP_AMT
                             , ACMMT_SNO
                             , ATTR1_VAL
                             , ATTR2_VAL
                             , ATTR3_VAL
                             , ATTR4_VAL
                             , ATTR5_VAL
                             , ATTR6_VAL
                             , ATTR7_VAL
                             , ATTR8_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                         AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* �Ϲ����� ����� ���� */
                         AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* �������б���θ� */
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030006' 
                     ) A
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
                    ) B
               WHERE A.BIZ_YR = B.SRY_YY
                 AND A.SCHL_CD = B.SCHL_CD
                 AND A.BIZ_YR = '2011'
               GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
           )B
           , (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CNT
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
           ) C
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
       AND A.UNIV_ESTB = C.UNIV_ESTB(+)
       AND A.UNIV_ZON  = C.UNIV_ZON(+)
       AND A.UNIV_SIZE = C.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) 
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'UK0560406' 
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE) UNIV_SIZE 
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     , TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT1/B.PER_AMT,1)) PER_AMT_CNT1
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT2/B.PER_AMT,1)) PER_AMT_CNT2
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT3/B.PER_AMT,1)) PER_AMT_CNT3
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT4/B.PER_AMT,1)) PER_AMT_CNT4
     /*, TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT5/B.PER_AMT,1)) PER_AMT_CNT5
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT6/B.PER_AMT,1)) PER_AMT_CNT6
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT7/B.PER_AMT,1)) PER_AMT_CNT7
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT8/B.PER_AMT,1)) PER_AMT_CNT8*/
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
;






/* ������������(����) */

WITH TMP_A AS 
(       
    SELECT GROUPING_ID(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE )RN
         , A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE 
         , NVL(SUM(SCHL_CNT),0)             SCHL_CNT
         , 103  BIZ_CNT--, NVL(SUM(TOT_CNT),0)              BIZ_CNT
         , NVL(SUM(TOT_AMT),0)              BIZ_AMT
         , NVL(SUM(CNT1),0)                 CNT1
         , NVL(SUM(CNT2),0)                 CNT2
         , NVL(SUM(CNT3),0)                 CNT3
         , NVL(SUM(CNT4),0)                 CNT4
         , NVL(SUM(CNT5),0)                 CNT5
         , NVL(SUM(CNT6),0)                 CNT6
         , NVL(SUM(CNT7),0)                 CNT7
         , NVL(SUM(CNT8),0)                 CNT8
         , NVL(TRUNC(SUM(TOT_AMT)/1000000),0) PER_AMT
         , ROW_NUMBER() OVER(ORDER BY A.UNIV_ESTB, NVL(A.UNIV_ZON,'1') DESC, A.UNIV_SIZE) ORDERED
      FROM (
                SELECT '��������' UNIV_ESTB, '������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '��������' UNIV_ESTB, '������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '��������' UNIV_ESTB, '�������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '��������' UNIV_ESTB, '�������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '�縳' UNIV_ESTB, '������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '�縳' UNIV_ESTB, '������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
                 UNION 
                SELECT '�縳' UNIV_ESTB, '�������' UNIV_ZON, '��Ը�' UNIV_SIZE FROM DUAL
                 UNION 
                SELECT '�縳' UNIV_ESTB, '�������' UNIV_ZON, '�ߡ��ұԸ�' UNIV_SIZE FROM DUAL 
           )A
         , (
                 SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                     , SUM(ATTR1_VAL) AS CNT1 
                     , SUM(ATTR2_VAL) AS CNT2
                     , SUM(ATTR3_VAL) AS CNT3
                     , SUM(ATTR4_VAL) AS CNT4
                     , SUM(ATTR5_VAL) AS CNT5 
                     , SUM(ATTR6_VAL) AS CNT6
                     , SUM(ATTR7_VAL) AS CNT7
                     , SUM(ATTR8_VAL) AS CNT8
                     , COUNT(DISTINCT A.BIZ_CD)     TOT_CNT
                     , SUM(REAL_SURP_AMT)           TOT_AMT
                   FROM (
                        SELECT TRGT.BIZ_YR
                             , TRGT.BIZ_CD
                             , SUBSTR(SCHL_CD,1,5) ||'000' SCHL_CD
                             , REAL_SURP_AMT
                             , ACMMT_SNO
                             , ATTR1_VAL
                             , ATTR2_VAL
                             , ATTR3_VAL
                             , ATTR4_VAL
                             , ATTR5_VAL
                             , ATTR6_VAL
                             , ATTR7_VAL
                             , ATTR8_VAL
                          FROM T_BIZ_SURP_TRGT_INFO TRGT
                             , T_BIZT_INFO          BIZT
                             , T_SCH_INFO_HIST      SCH
                             , T_BIZ_MNG_INFO       BIZM
                             , T_BIZ_INFO           BIZ
                             , T_ACMMT_STS          ACMMT
                        WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID(+)
                         AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
                         AND TRGT.BIZ_YR = SCH.SRY_YY
                         AND SCH.PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                         AND SCH.UNIV_GUBUN <> 'H'   /* ���п����� ���� */
                         AND TRGT.BIZ_CD = BIZM.BIZ_CD
                         AND TRGT.BIZ_YR = BIZM.BIZ_YR
                         AND BIZM.BIZ_CD = BIZ.BIZ_CD
                         AND BIZ.BIZ_FLAG in ( 'K042001')  /* �Ϲ����� ����� ���� */
                         AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
                         AND BIZ.GVM_INSTN_CD = '1341000'  /* �������б���θ� */
                         AND TRGT.BIZ_SURP_INFO_ID = ACMMT.BIZ_SURP_INFO_ID(+)
                         AND TRGT.BIZ_YR = ACMMT.ACMMT_YR(+)
                         AND ACMMT.ACMMT_FLAG(+)   = 'K030006' 
                     ) A
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
                    ) B
               WHERE A.BIZ_YR = B.SRY_YY
                 AND A.SCHL_CD = B.SCHL_CD
                 AND A.BIZ_YR = '2011'
               GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
           )B
           , (
                SELECT SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
                  , COUNT(DISTINCT SCHL_CD) SCHL_CNT
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
           ) C
     WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
       AND A.UNIV_ZON  = B.UNIV_ZON(+)
       AND A.UNIV_SIZE = B.UNIV_SIZE(+) 
       AND A.UNIV_ESTB = C.UNIV_ESTB(+)
       AND A.UNIV_ZON  = C.UNIV_ZON(+)
       AND A.UNIV_SIZE = C.UNIV_SIZE(+)
     GROUP BY ROLLUP(A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE) 
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'UK0560406' 
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)            UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)  UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE) UNIV_SIZE 
     , TRIM(TO_CHAR(A.SCHL_CNT,'9,999,999,999,999')) SCHL_CNT 
     , TRIM(TO_CHAR(A.BIZ_CNT,'9,999,999,999,999'))   BIZ_CNT 
     , TRIM(TO_CHAR(A.BIZ_AMT,'9,999,999,999,999'))   BIZ_AMT
     /*, TRIM(TO_CHAR(A.CNT1,'9,999,999,999,999'))      CNT1 
     , TRIM(TO_CHAR(A.CNT2,'9,999,999,999,999'))      CNT2 
     , TRIM(TO_CHAR(A.CNT3,'9,999,999,999,999'))      CNT3 
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999'))      CNT4 
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT1/B.PER_AMT,1)) PER_AMT_CNT1
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT2/B.PER_AMT,1)) PER_AMT_CNT2
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT3/B.PER_AMT,1)) PER_AMT_CNT3
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT4/B.PER_AMT,1)) PER_AMT_CNT4*/
     , TRIM(TO_CHAR(A.CNT5,'9,999,999,999,999'))      CNT5
     , TRIM(TO_CHAR(A.CNT6,'9,999,999,999,999'))      CNT6
     , TRIM(TO_CHAR(A.CNT7,'9,999,999,999,999'))      CNT7
     , TRIM(TO_CHAR(A.CNT8,'9,999,999,999,999'))      CNT8
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT5/B.PER_AMT,1)) PER_AMT_CNT5
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT6/B.PER_AMT,1)) PER_AMT_CNT6
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT7/B.PER_AMT,1)) PER_AMT_CNT7
     , DECODE(B.PER_AMT,0,0,ROUND(A.CNT8/B.PER_AMT,1)) PER_AMT_CNT8
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
;


