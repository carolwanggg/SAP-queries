SELECT T1."Project",TL."Name",TB."UniqueID",T1."OcrCode",T0."DocNum",T0."DocStatus", 
T0."NumAtCard",T0."DocDate", T1."LineVendor", T2."CardName", T1."ItemCode", T1."Dscription",T1."ShipDate", T1."PQTReqDate" as "Required Date",   
T1."LineTotal" as "Valore riga", ( (T1."OpenQty"*T1."PriceBefDi") * (case when T1."Rate" = 0 then 1 else T1."Rate" end ) ) as "Valore residuo",T1."U_VAR_CCOGE"


FROM OPRQ T0 
INNER JOIN PRQ1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OCRD T2 ON T1."LineVendor" = T2."CardCode"

LEFT JOIN OPMG T0  ON T1."Project" = T0."FIPROJECT"
LEFT JOIN PMG4 T4   ON T0."AbsEntry" = T4."AbsEntry" and  T0."DocNum"=T4."DOCNUM" and  T4."TYP"= T0."ObjType" and T4."LineNum"=T1."LineNum" 
LEFT JOIN PMG1 TB   ON T0."AbsEntry" = TB."AbsEntry" and TB."POS" = T4."StageID"
LEFT JOIN PMC2 TL   ON TB."StageID" = TL."StageID"

WHERE T0."CANCELED" ='N' 
AND T1."PQTReqDate" BETWEEN [%1%] AND [%2%] 

ORDER BY T1."Project", T1."DocEntry"
