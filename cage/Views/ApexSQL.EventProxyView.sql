SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.EventProxyView
AS
SELECT Id
,ServerName
,StartTime
,RowVersion
,Duration
,ApplicationName
,ClientHostName
,LoginName
,DatabaseName
,DatabaseId
,Success
,ObjectId
,SchemaName
,ObjectName
,TransactionId
,TextData
,Operation
,AccessedObjectsList
,Error
,EventSource
,EventTypeId
,BeforeValue
,AfterValue
,ColumnName FROM ApexSql.EventView
GO
