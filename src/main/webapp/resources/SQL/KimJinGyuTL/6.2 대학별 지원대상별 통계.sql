     SELECT A.BIZ_YR, A.SCHL_CD, decode(A.SCHL_CD, '53018000' ,'1', '53080000' ,'2', '51003000' ,'3', '51017000' ,'4', '5') rn
         , F_GET_SCHL_INFO('SCHL_HG_NM',A.BIZ_YR, A.SCHL_CD)  SCHL_HG_NM
         , F_GET_SCHL_INFO('UNIV_GUBUN',A.BIZ_YR, A.SCHL_CD)  UNIV_GUBUN
         , F_GET_SCHL_INFO('ESTB_SC_DIV',A.BIZ_YR, A.SCHL_CD)  ESTB_SC_DIV
         , F_GET_SCHL_INFO('ZON_CD',A.BIZ_YR, A.SCHL_CD)  ZON_CD
         , F_GET_SCHL_INFO('STD_NUM',A.BIZ_YR, A.SCHL_CD)  STD_NUM
         , NVL(SUM(BIZ_CNT1),0) CNT1
         , NVL(SUM(BIZ_AMT1),0) AMT1
         , TO_CHAR(DECODE(NVL(SUM(TOT_AMT),0),0,0,ROUND(NVL(SUM(BIZ_AMT1),0)/NVL(SUM(TOT_AMT),0)*100,1)),'FM999,990.0') PER1
         , NVL(SUM(BIZ_CNT2),0) CNT2
         , NVL(SUM(BIZ_AMT2),0) AMT2
         , TO_CHAR(DECODE(NVL(SUM(TOT_AMT),0),0,0,ROUND(NVL(SUM(BIZ_AMT2),0)/NVL(SUM(TOT_AMT),0)*100,1)),'FM999,990.0') PER2
         , NVL(SUM(BIZ_CNT3),0) CNT3
         , NVL(SUM(BIZ_AMT3),0) AMT3
         , TO_CHAR(DECODE(NVL(SUM(TOT_AMT),0),0,0,ROUND(NVL(SUM(BIZ_AMT3),0)/NVL(SUM(TOT_AMT),0)*100,1)),'FM999,990.0') PER3
         , NVL(SUM(TOT_CNT),0)  CNT4
         , NVL(SUM(TOT_AMT),0)  AMT4
         , '100' PER4
       FROM (
           SELECT TRGT.BIZ_YR
               , SUBSTR(SCH.SCHL_CD,1,5) || '000' SCHL_CD
               , DECODE(SURP_UNIT_TYP, 'K020001', COUNT (DISTINCT TRGT.BIZ_CD))        BIZ_CNT1
               , DECODE(SURP_UNIT_TYP, 'K020001', SUM(REAL_SURP_AMT))  BIZ_AMT1
               , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN TRGT.BIZ_CD ELSE NULL END) BIZ_CNT2
               , SUM (CASE WHEN SURP_UNIT_TYP in ('K020002', 'K020005') THEN REAL_SURP_AMT ELSE 0 END) BIZ_AMT2
               , COUNT (DISTINCT CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN TRGT.BIZ_CD ELSE NULL END) BIZ_CNT3
               , SUM (CASE WHEN SURP_UNIT_TYP in ('K020003', 'K020004') THEN REAL_SURP_AMT ELSE 0 END) BIZ_AMT3
               , COUNT (DISTINCT TRGT.BIZ_CD)                              TOT_CNT
               , SUM(REAL_SURP_AMT)                                   TOT_AMT
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
             AND TRGT.SURP_UNIT_TYP IS NOT NULL
             AND BIZM.BIZ_YR = '2011'
             AND SUBSTR(SCHL_CD,1,5)||'000' in ('53018000' , '53080000' , '51003000' , '51017000' )
          GROUP BY TRGT.BIZ_YR, SUBSTR(SCH.SCHL_CD,1,5) || '000', TRGT.SURP_UNIT_TYP
        ) A
      GROUP BY A.BIZ_YR, A.SCHL_CD
      ORDER BY 3
