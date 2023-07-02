CREATE PROCEDURE summary_order_status @id_status int
AS
BEGIN
	SELECT
		dso.OrderID,
		dc.CustomerName,
		dp.productname,
		dso.quantity,
		dst.StatusOrder
	FROM
		DimSalesOrder dso
	INNER JOIN DimCustomer dc ON dso.CustomerID=dc.customerid
	INNER JOIN DimProduct dp ON dso.ProductID=dp.productid
	INNER JOIN DimStatusOrder dst ON dso.StatusID=dst.StatusID
	WHERE 
		dso.StatusID = @id_status

END;