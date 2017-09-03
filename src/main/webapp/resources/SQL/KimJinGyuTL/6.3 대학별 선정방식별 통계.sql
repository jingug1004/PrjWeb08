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
         , NVL(SUM(BIZ_CNT4),0) CNT4
         , NVL(SUM(BIZ_AMT4),0) AMT4
         , TO_CHAR(DECODE(NVL(SUM(TOT_AMT),0),0,0,ROUND(NVL(SUM(BIZ_AMT4),0)/NVL(SUM(TOT_AMT),0)*100,1)),'FM999,990.0') PER4
         , NVL(SUM(TOT_CNT),0)  CNT5
         , NVL(SUM(TOT_AMT),0)  AMT5
         , '100' PER5
       FROM (
           SELECT TRGT.BIZ_YR
               , SUBSTR(SCH.SCHL_CD,1,5) || '000' SCHL_CD
               , DECODE(SURP_TRGT_SLCT_STND, 'K017001', COUNT (DISTINCT TRGT.BIZ_CD))    BIZ_CNT1
               , DECODE(SURP_TRGT_SLCT_STND, 'K017001', SUM(REAL_SURP_AMT))              BIZ_AMT1
               , DECODE(SURP_TRGT_SLCT_STND, 'K017002', COUNT (DISTINCT TRGT.BIZ_CD))    BIZ_CNT2
               , DECODE(SURP_TRGT_SLCT_STND, 'K017002', SUM(REAL_SURP_AMT))              BIZ_AMT2
               , DECODE(SURP_TRGT_SLCT_STND, 'K017003', COUNT (DISTINCT TRGT.BIZ_CD))    BIZ_CNT3
               , DECODE(SURP_TRGT_SLCT_STND, 'K017003', SUM(REAL_SURP_AMT))              BIZ_AMT3
               , DECODE(SURP_TRGT_SLCT_STND, 'K017004', COUNT (DISTINCT TRGT.BIZ_CD))    BIZ_CNT4
               , DECODE(SURP_TRGT_SLCT_STND, 'K017004', SUM(REAL_SURP_AMT))              BIZ_AMT4
               , COUNT (DISTINCT TRGT.BIZ_CD)                         TOT_CNT
               , SUM(REAL_SURP_AMT)                                   TOT_AMT
           FROM T_BIZ_SURP_TRGT_INFO TRGT
              , T_BIZT_INFO          BIZT
              , T_SCH_INFO_HIST      SCH
              , T_BIZ_MNG_INFO       BIZM
              , T_BIZ_INFO           BIZ
          WHERE TRGT.BIZ_SURP_INFO_ID = BIZT.BIZ_SURP_INFO_ID
             AND F_GET_BLN_SCHL_CD(TRGT.EXE_INSTN_CD) = SCH.INSTN_CD
             AND TRGT.BIZ_YR = SCH.SRY_YY
             AND BIZ_EXE_END_YN = 'Y'    /* 성과등록용 과제 제외 */
             AND SCH.PNOTI_YN = 'Y'      /* 비공시대상 대학 제외 */
             AND SCH.UNIV_GUBUN <> 'H'   /* 대학원대학 제외 */
             AND TRGT.BIZ_CD = BIZM.BIZ_CD
             AND TRGT.BIZ_YR = BIZM.BIZ_YR
             AND BIZM.BIZ_CD = BIZ.BIZ_CD
             AND BIZ.BIZ_FLAG in ( 'K042001','K042002','K042003')  /* 지자체 사업 제외 */
             AND BIZM.pnoti_yn     = 'Y'  /* 공시대상 사업만 */
             AND SURP_TRGT_SLCT_STND IS NOT NULL
             AND BIZM.BIZ_YR = '2011'
             AND SUBSTR(SCHL_CD,1,5)||'000' in ('53018000' , '53080000' , '51003000' , '51017000' )
          GROUP BY TRGT.BIZ_YR, SUBSTR(SCH.SCHL_CD,1,5) || '000', SURP_TRGT_SLCT_STND
        ) A
      GROUP BY A.BIZ_YR, A.SCHL_CD
      ORDER BY 3
