/*****************************************************************************
* 3-1-1 ���� ��������� ��Ȳ
******************************************************************************/

/* ������������������� ���� */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'UK05603011' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'UK05603011' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG 
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL
    , ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR14_VAL, ATTR15_VAL, ATTR16_VAL, ATTR17_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )   
WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
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
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
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
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
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
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'UK05603011'
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
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
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
  

/* ������������������� ���� */

-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'UK05603012' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'UK05603012' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG 
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL
    , ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR14_VAL, ATTR15_VAL, ATTR16_VAL, ATTR17_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )   
WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
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
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
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
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
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
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'UK05603012'
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
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
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
 
/*****************************************************************************
* 3-1-2 �������� ��������� ��Ȳ
******************************************************************************/

/* ������������������� ���� */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'CK05603011' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'CK05603011' and stats_yr = '2011';


INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG 
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL
    , ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR14_VAL, ATTR15_VAL, ATTR16_VAL, ATTR17_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )   
WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
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
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
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
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
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
                                               WHERE UNIV_GUBUN in ('C')
                                                 AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
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
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'CK05603011'
     , DECODE(A.RN,'7','�հ�','��������')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
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
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
  



/* ������������������� ���� */
-- SELECT * FROM T_STATS_STS WHERE STATS_FLAG = 'CK05603012' and stats_yr = '2011';
-- DELETE FROM T_STATS_STS WHERE STATS_FLAG = 'CK05603012' and stats_yr = '2011';



INSERT INTO T_STATS_STS
    ( STATS_YR, STATS_SNO, STATS_FLAG 
    , ATTR1_VAL, ATTR2_VAL, ATTR3_VAL , ATTR4_VAL
    , ATTR5_VAL, ATTR6_VAL, ATTR7_VAL
    , ATTR8_VAL, ATTR9_VAL, ATTR10_VAL
    , ATTR11_VAL, ATTR12_VAL, ATTR13_VAL
    , ATTR14_VAL, ATTR15_VAL, ATTR16_VAL, ATTR17_VAL
    , ATTR43_VAL
    , RGSTR_ID, RGST_DTTM
    )   
WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
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
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
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
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
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
                                               WHERE UNIV_GUBUN in ('C')
                                                 AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
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
                     GROUP BY  SRY_YY, UNIV_ESTB, UNIV_ZON, UNIV_SIZE
               ) C
          WHERE A.UNIV_ESTB = B.UNIV_ESTB(+)
            AND A.UNIV_ZON  = B.UNIV_ZON(+)
            AND A.UNIV_SIZE = B.UNIV_SIZE(+)
            AND A.UNIV_ESTB = C.UNIV_ESTB(+)
            AND A.UNIV_ZON  = C.UNIV_ZON(+)
            AND A.UNIV_SIZE = C.UNIV_SIZE(+)
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     ,  STATS_SNO_SQ.NEXTVAL
     , 'CK05603012'
     , DECODE(A.RN,'7','�հ�','��������')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
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
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 




/* ���п������� ���п� ���� */

WITH TMP_A AS 
(          
SELECT GROUPING_ID(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)RN
   , UNIV_ESTB
   , UNIV_ZON
   , UNIV_SIZE
   , NVL(SUM(SCHL_CNT),0) SCHL_CNT
   , NVL(SUM(HRD_CNT1),0) CNT1
   , NVL(SUM(HRD_AMT1),0) AMT1
   , NVL(SUM(HRD_CNT2),0) CNT2
   , NVL(SUM(HRD_AMT2),0) AMT2
   , NVL(SUM(HRD_CNT3),0) CNT3
   , NVL(SUM(HRD_AMT3),0) AMT3
   , NVL(SUM(TOT_CNT),0)  CNT4
   , NVL(SUM(TOT_AMT),0)  AMT4
   , ROW_NUMBER() OVER(ORDER BY UNIV_ESTB, NVL(UNIV_ZON,'1') DESC, UNIV_SIZE) ORDERED
FROM (
        SELECT A.UNIV_ESTB, A.UNIV_ZON, A.UNIV_SIZE
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT1)HRD_CNT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT1)HRD_AMT1
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT2)HRD_CNT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT2)HRD_AMT2
             , DECODE(B.UNIV_ESTB,'',0, HRD_CNT3)HRD_CNT3
             , DECODE(B.UNIV_ESTB,'',0, HRD_AMT3)HRD_AMT3
             , DECODE(B.UNIV_ESTB,'',0, TOT_CNT)TOT_CNT
             , DECODE(B.UNIV_ESTB,'',0, TOT_AMT)TOT_AMT
             , SCHL_CNT
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
               ) A
              , ( 
                    SELECT B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE 
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027001', BIZ_CD))        HRD_CNT1
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027001', REAL_SURP_AMT, 0))  HRD_AMT1
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027002', BIZ_CD))        HRD_CNT2
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027002', REAL_SURP_AMT, 0))  HRD_AMT2
                         , COUNT (DISTINCT DECODE(BIZ_PRPS_TYP, 'K027003', BIZ_CD))        HRD_CNT3
                         , SUM(DECODE(BIZ_PRPS_TYP, 'K027003', REAL_SURP_AMT, 0))  HRD_AMT3
                         , COUNT(DISTINCT A.BIZ_CD)                                         TOT_CNT
                         , SUM(REAL_SURP_AMT)                                               TOT_AMT
                      FROM (
                                SELECT TRGT.BIZ_YR
                                     , TRGT.BIZ_CD
                                     , BIZ.BIZ_PRPS_TYP
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
                                 AND TRGT.BIZ_CD = BIZM.BIZ_CD
                                 AND TRGT.BIZ_YR = BIZM.BIZ_YR
                                 AND BIZM.BIZ_CD = BIZ.BIZ_CD
                                 AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* ����ü ��� ���� */
                                 AND BIZM.pnoti_yn     = 'Y'  /* ���ô�� ����� */
                                 AND BIZ.BIZ_PRPS_TYP IS NOT NULL
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
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','H') THEN ESTB_SC_DIV 
                                                          ELSE '' 
                                                      END ESTB_SC_DIV
                                                   , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','H') THEN ZON_CD 
                                                          ELSE '' 
                                                      END ZON_CD 
                                                   , STD_NUM
                                                FROM T_SCH_INFO_HIST
                                               WHERE UNIV_GUBUN in ('U', 'G', 'H')
                                                 AND PNOTI_YN = 'Y'      /* ����ô�� ���� ���� */
                                          )
                                   GROUP BY SRY_YY, SCHL_CD
                             )B
                       WHERE A.BIZ_YR = B.SRY_YY
                         AND A.SCHL_CD = B.SCHL_CD
                         AND A.BIZ_YR = '2011'
                       GROUP BY  B.UNIV_ESTB, B.UNIV_ZON, B.UNIV_SIZE
               ) B
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
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','H') THEN ESTB_SC_DIV 
                                                ELSE '' 
                                            END ESTB_SC_DIV
                                         , CASE WHEN ORGCODE= '1' AND UNIV_GUBUN in ('U','H') THEN ZON_CD 
                                                ELSE '' 
                                            END ZON_CD 
                                         , STD_NUM
                                      FROM T_SCH_INFO_HIST
                                     WHERE UNIV_GUBUN IN ('U','G','H')  /* ���и� */
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
   )
GROUP BY ROLLUP(UNIV_ESTB, UNIV_ZON, UNIV_SIZE)
)
SELECT '2011'
     , DECODE(A.RN,'7','�հ�','����')
     , DECODE(A.RN,'7','',A.UNIV_ESTB)UNIV_ESTB 
     , DECODE(A.RN,'3','�Ұ�','7','',A.UNIV_ZON)UNIV_ZON
     , DECODE(A.RN,'3','','7','',A.UNIV_SIZE)UNIV_SIZE
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
     , TRIM(TO_CHAR(A.CNT4,'9,999,999,999,999')) CNT4
     , TRIM(TO_CHAR(A.AMT4,'9,999,999,999,999')) AMT4
     , TO_CHAR(DECODE(B.AMT4,0,0,ROUND(A.AMT4/B.AMT4*100,1)),'FM999,990.0') PER4
     , A.ORDERED
     , 'SQL'
     , TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
  FROM TMP_A A
     , (SELECT * FROM TMP_A WHERE RN = 7) B
 WHERE A.RN IN ('0','3','7')
 ;
 
