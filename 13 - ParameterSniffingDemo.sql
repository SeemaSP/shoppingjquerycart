-- Demonstration 13 - Parameter Sniffing

USE peoplePS
GO
-- Show query and run to reset demo
ALTER procedure [dbo].[usp_countrysearch]
@country varchar(80)
AS
SELECT p.lastname, p.dob, p.sex, c.country
FROM people p join country c
ON p.personid = c.personid
WHERE c.country = @country
GO

-- Show query plan for UK
DBCC FREEPROCCACHE
GO
EXEC usp_countrysearch 'UK'
GO

-- Show query plan for US
DBCC FREEPROCCACHE
GO
EXEC usp_countrysearch 'US'
GO

-- Don't clear plan cache. Show bad plan and parameter sniffing
EXEC usp_countrysearch 'UK'
GO


-- Options to fix
-- 1 Run stored procedure with recompile
EXEC usp_countrysearch 'UK' WITH RECOMPILE
GO

EXEC usp_countrysearch 'US' WITH RECOMPILE
GO

-- 2 changed stored procedure and use statement level recompile
ALTER procedure [dbo].[usp_countrysearch]
@country varchar(80)
AS
SELECT p.lastname, p.dob, p.sex, c.country
FROM people p join country c
ON p.personid = c.personid
WHERE c.country = @country
OPTION (RECOMPILE);
GO

EXEC usp_countrysearch 'UK'
GO

EXEC usp_countrysearch 'US'
GO

-- 3 changed stored procedure and use optimize for
ALTER procedure [dbo].[usp_countrysearch]
@country varchar(80)
AS
SELECT p.lastname, p.dob, p.sex, c.country
FROM people p join country c
ON p.personid = c.personid
WHERE c.country = @country
OPTION (OPTIMIZE FOR (@country = 'UK') );
GO

DBCC FREEPROCCACHE
GO
EXEC usp_countrysearch 'US'
GO

DBCC FREEPROCCACHE
GO
EXEC usp_countrysearch 'UK'
GO

use AdventureWorks
Go:


SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = 897;
SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = 945; 
SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = 870;
go;


CREATE PROCEDURE Get_OrderID_OrderQty
 @ProductID INT
AS 
SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = @ProductID;


EXEC Get_OrderID_OrderQty @ProductID=870;

EXEC Get_OrderID_OrderQty @ProductID=897;

drop PROCEDURE Get_OrderID_OrderQty;

ALTER PROCEDURE Get_OrderID_OrderQty
 @ProductID INT
AS 
SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = @ProductID
OPTION (OPTIMIZE FOR (@ProductID=945));
go

ALTER PROCEDURE Get_OrderID_OrderQty
 @ProductID INT
 WITH RECOMPILE
AS 
SELECT SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = @ProductID;