SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


-- EventView
CREATE VIEW ApexSQL.EventView
AS
SELECT
	E.Id
	,SN.ServerName
	,StartTime
	,E.RowVersion
	,Duration
	,AN.ApplicationName
	,CHN.ClientHostName
	,LN.LoginName
	,DN.DatabaseName
	,DatabaseId
	,Success
	,ObjectId
	,SCN.SchemaName
	,OBN.ObjectName
	,TransactionId
	,TextData
	,Operation
	,AccessedObjectsList
	,Error
	,0 EventSource
	,NULL EventTypeId
	,NULL BeforeValue
	,NULL AfterValue
	,NULL ColumnName
FROM
	ApexSQL.Event E
	LEFT JOIN ApexSQL.ServerName SN ON E.ServerNameId = SN.Id
	LEFT JOIN ApexSQL.ApplicationName AN ON E.ApplicationNameId = AN.Id
	LEFT JOIN ApexSQL.ClientHostName CHN ON E.ClientHostNameId = CHN.Id
	LEFT JOIN ApexSQL.LoginName LN ON E.LoginNameId = LN.Id
	LEFT JOIN ApexSQL.DatabaseName DN ON E.DatabaseNameId = DN.Id
	LEFT JOIN ApexSQL.SchemaName SCN ON E.SchemaNameId = SCN.Id
	LEFT JOIN ApexSQL.ObjectName OBN ON E.ObjectNameId = OBN.Id

UNION ALL

SELECT
	SE.Id
	,SE.ServerName
	,SE.StartTime
	,SE.RowVersion
	,NULL Duration
	,NULL ApplicationName
	,NULL ClientHostName
	,NULL LoginName
	,NULL DatabaseName
	,NULL DatabaseId
	,NULL Success
	,NULL ObjectId
	,NULL SchemaName
	,NULL ObjectName
	,NULL TransactionId
	,SE.TextData
	,NULL Operation
	,NULL AccessedObjectsList
	,NULL Error
	,1 EventSource
	,SE.EventTypeId
	,NULL BeforeValue
	,NULL AfterValue
	,NULL ColumnName
FROM
	ApexSQL.SystemEvent SE

UNION ALL

SELECT
	BEE.Id
	,SN.ServerName
	,BEE.StartTime
	,BEE.RowVersion
	,NULL Duration
	,AN.ApplicationName
	,CHN.ClientHostName
	,LN.LoginName
	,DN.DatabaseName
	,NULL DatabaseId
	,NULL Success
	,NULL ObjectId
	,SCN.SchemaName
	,OBN.ObjectName
	,TransactionId
	,NULL TextData
	,BEE.Operation
	,NULL AccessedObjectsList
	,NULL Error
	,2 EventSource
	,NULL EventTypeId
	,Convert(NVARCHAR(MAX), DECRYPTBYKEY(BAC.BeforeValueCrypt)) as BeforeValue
	,Convert(NVARCHAR(MAX), DECRYPTBYKEY(BAC.AfterValueCrypt)) as AfterValue
	,CN.ColumnName
FROM
	ApexSQL.BeforeAfterEvent BEE
	LEFT JOIN ApexSQL.ServerName SN ON BEE.ServerNameId = SN.Id
	LEFT JOIN ApexSQL.ApplicationName AN ON BEE.ApplicationNameId = AN.Id
	LEFT JOIN ApexSQL.ClientHostName CHN ON BEE.ClientHostNameId = CHN.Id
	LEFT JOIN ApexSQL.LoginName LN ON BEE.LoginNameId = LN.Id
	LEFT JOIN ApexSQL.DatabaseName DN ON BEE.DatabaseNameId = DN.Id
	LEFT JOIN ApexSQL.SchemaName SCN ON BEE.SchemaNameId = SCN.Id
	LEFT JOIN ApexSQL.ObjectName OBN ON BEE.ObjectNameId = OBN.Id
	LEFT JOIN ApexSQL.BeforeAfterChange BAC ON BEE.Id = BAC.BeforeAfterEventid
	LEFT JOIN ApexSql.ColumnName CN ON BAC.ColumnNameId = CN.Id
GO
