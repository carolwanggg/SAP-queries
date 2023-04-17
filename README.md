# SAP-queries

1. Objects:

Write a tailer query to extract all the purchase request details and supplier info, linked with each projects details.
IMPORTANT: include also the delivery date to see the expired order and purchase order residuo amount for each request.

2.Database
Cloud: SAP HANA data warehouse
Table:


       1. OPRQ Purchase request
       2. OPMG Project Management
       3. OCRD Business Partner
       
       Please also refer to here the all 2546 tables in SAP database.
       https://sap.erpref.com/?schema=BusinessOne9.3

SELECT T1."Project",TL."Name",TB."UniqueID",T1."OcrCode",T0."DocNum",T0."DocStatus", 
T0."NumAtCard",T0."DocDate", T1."LineVendor", T2."CardName", T1."ItemCode", T1."Dscription",T1."ShipDate", T1."PQTReqDate" as "Required Date",   
T1."LineTotal" as "Valore riga", ( (T1."OpenQty"*T1."PriceBefDi") * (case when T1."Rate" = 0 then 1 else T1."Rate" end ) ) as "Valore residuo",T1."U_VAR_CCOGE"


FROM OPRQ T0 
INNER JOIN PRQ1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OCRD T2 ON T1."LineVendor" = T2."CardCode"

LEFT JOIN OPMG TO   ON T1."Project" = TO."FIPROJECT"
LEFT JOIN PMG4 T4   ON TO."AbsEntry" = T4."AbsEntry" and  T0."DocNum"=T4."DOCNUM" and  T4."TYP"= T0."ObjType" and T4."LineNum"=T1."LineNum" 
LEFT JOIN PMG1 TB   ON TO."AbsEntry" = TB."AbsEntry" and TB."POS" = T4."StageID"
LEFT JOIN PMC2 TL   ON TB."StageID" = TL."StageID"

WHERE T0."CANCELED" ='N' 
AND T1."PQTReqDate" BETWEEN [%1%] AND [%2%] 

ORDER BY T1."Project", T1."DocEntry"

Join the project details(project code, project name) in project management table OPMG with purchase request detials (order code, document number, shipment date, product required date
