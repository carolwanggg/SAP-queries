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
 
 3. Query explanation

The company wants to take the purchase request detail also link to each projects to communicate with project manager, this query takes the useful info from purchase request: document number, document status, vendor code, item code etc, project code) to link with project management table(uniqueID,DocStatus,NumatCard, DocDate) and Business partner table(CardName).

I troduce also the file in SAP to insert the delivery date requirement to let the end-users to insert the dates fit their need.

![image](https://user-images.githubusercontent.com/129491801/232595993-185b4654-2f2d-4999-9f04-140b8b85f7c6.png)






