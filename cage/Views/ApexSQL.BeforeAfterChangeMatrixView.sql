SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- BeforeAfterChangeMatrixView
CREATE VIEW ApexSQL.BeforeAfterChangeMatrixView
AS
SELECT
	BAC.Id
	,BeforeAfterEventId
	,RowId
	,'Inserted' RowType
	,CN.ColumnName
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(AfterValueCrypt)) Value
FROM
	ApexSQL.BeforeAfterChange BAC
	INNER JOIN ApexSQL.BeforeAfterEvent BAE ON BAC.BeforeAfterEventId = BAE.Id
	LEFT JOIN ApexSQL.ColumnName CN ON BAC.ColumnNameId = CN.Id
WHERE
	BAE.Operation = 7

UNION

SELECT
	BAC.Id
	,BeforeAfterEventId
	,RowId
	,'Before' RowType
	,CN.ColumnName
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(BAC.BeforeValueCrypt)) Value
FROM
	ApexSQL.BeforeAfterChange BAC
	INNER JOIN ApexSQL.BeforeAfterEvent BAE ON BAC.BeforeAfterEventId = BAE.Id
	LEFT JOIN ApexSQL.ColumnName CN ON BAC.ColumnNameId = CN.Id
WHERE
	BAE.Operation = 8

UNION

SELECT
	BAC.Id
	,BeforeAfterEventId
	,RowId
	,'After' RowType
	,CN.ColumnName
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(BAC.AfterValueCrypt)) Value
FROM
	ApexSQL.BeforeAfterChange BAC
	INNER JOIN ApexSQL.BeforeAfterEvent BAE ON BAC.BeforeAfterEventId = BAE.Id
	LEFT JOIN ApexSQL.ColumnName CN ON BAC.ColumnNameId = CN.Id
WHERE
	BAE.Operation = 8

UNION

SELECT
	BAC.Id
	,BeforeAfterEventId
	,RowId
	,'Deleted' RowType
	,CN.ColumnName
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(BAC.BeforeValueCrypt)) Value
FROM
	ApexSQL.BeforeAfterChange BAC
	INNER JOIN ApexSQL.BeforeAfterEvent BAE ON BAC.BeforeAfterEventId = BAE.Id
	LEFT JOIN ApexSQL.ColumnName CN ON BAC.ColumnNameId = CN.Id
WHERE
	BAE.Operation = 9
GO
