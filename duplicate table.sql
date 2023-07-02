CREATE DATABASE DWH_STAGING;

USE DWH_STAGING

-- duplicate customers 
SELECT
	customer_id AS customerid,
	CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS CustomerName,
	age,
	gender,
	city,
	no_hp INTO DWH_STAGING.dbo.DimCustomer
FROM Staging.dbo.customer

TRUNCATE TABLE DimCustomer

-- duplicate product
SELECT 
	product_id AS productid,
	product_name AS productname,
	product_category AS productcategory,
	product_unit_price as productunitprice INTO DWH_STAGING.dbo.DimProduct
FROM Staging.dbo.product

TRUNCATE TABLE DimProduct

-- duplicate status
SELECT 
	status_id as StatusID,
	status_order as StatusOrder,
	status_order_desc as StatusOrderDesc INTO DWH_STAGING.dbo.DimStatusOrder
FROM Staging.dbo.status_order

TRUNCATE TABLE DimStatusOrder

-- duplicate sales
SELECT 
	order_id AS OrderID,
	customer_id AS CustomerID,
	product_id AS ProductID,
	quantity,
	amount,
	status_id AS StatusID,
	order_date AS ORDER_DATE INTO DWH_STAGING.dbo.DimSalesOrder
FROM Staging.dbo.sales_order

TRUNCATE TABLE DimSalesOrder