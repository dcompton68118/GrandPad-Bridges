--query to use for Franchise Level reports for all CC franchise details


SELECT  df.Franchise_Number,df.Franchise_Status,df.email_address1, fo.Full_Name,fo.Is_Primary_Owner,t.City,t.State_Code, Count(*) as active_client
FROM edw.dim_franchise df
Join staging.franchise_Owner fo ON substring(fo.franchise_number,11,3) =df.Franchise_Number
Join Staging.Client_Franchise_Bridge cb ON cb.CRM_Franchise_Number = df.Franchise_Number
join staging.Client C ON c.Client_Key=cb.Client_Key
join edw.Bridge_Franchise_Location b ON b.Franchise_Key=df.Franchise_Key
join edw.Dim_Location t ON t.Location_Key =b.Location_Key
WHERE Is_International = 0 and Franchise_Status='Active' and len(df.franchise_number)=3 and fo.Is_Primary_Owner=1
and C.Is_Client=1 and c.Is_Deactivated=0
Group by df.Franchise_Number,df.Franchise_Status,df.email_address1, fo.Full_Name,fo.Is_Primary_Owner,t.City,t.State_Code
order by Franchise_Number