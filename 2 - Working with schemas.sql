-- Demonstration 2 - Working with Schemas

-- Step 1: Open a query window to the SQLTraining database

USE SQLTraining;
GO

-- Step 2: Create a schema

CREATE SCHEMA Reportingseemap AUTHORIZATION dbo;
GO

-- Step 3: Create a schema with an included object

CREATE SCHEMA Operationsseemap AUTHORIZATION dbo
  CREATE TABLE Flightsseemap (FlightID int IDENTITY(1,1) PRIMARY KEY,
                        Origin nvarchar(3),
                        Destination nvarchar(3));
GO

-- Step 4: Use object explorer to work out which schema 
--         the table has been created in

-- Step 5: Drop the table

DROP TABLE Operationsseemap.Flightsseemap;
GO

-- Step 6: Drop the schema

DROP SCHEMA Operationsseemap;
GO

-- Step 7: Use the same syntax but execute each part of the 
--         statement separately

CREATE SCHEMA Operationsseemap AUTHORIZATION dbo
CREATE TABLE Flightsseemap (FlightID int IDENTITY(1,1) PRIMARY KEY,
                      Origin nvarchar(3),
                      Destination nvarchar(3));

-- Step 8: Again, use object explorer to work out which schema 
--         the table has been created in


-- Step 9: Create the same table in a different schema:allowed
CREATE TABLE Reportingseemap.Flightsseemap (FlightID int IDENTITY(1,1) PRIMARY KEY,
                      Origin nvarchar(3),
                      Destination nvarchar(3));

