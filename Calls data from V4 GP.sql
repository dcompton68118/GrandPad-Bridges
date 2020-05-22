/****** Script for SelectTopNRows command from SSMS  ******/


  Select gh.franchise_number,sum(gh.help_calls_1_day) as 'Help Calls',sum(gh.hi_now_calls_1_day) as 'Home Instead Now'
        ,Sum(gh.rpn_calls_1_day) as 'RPN',SUM(gh.answered_incoming_partner_videochats_1_day) as 'answered video'
  FROM staging.GP_grandmas_hisc_v4 gh
  Where gh.franchise_number IN (116,124,148) and 
  gh.period_end_date between '2020-04-13' and '2020-04-20'
  and gh.modifier='real' and gh.status ='active'
  group by gh.franchise_number 
  order by gh.franchise_number