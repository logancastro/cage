SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- BeforeAfterChangeView
CREATE VIEW ApexSQL.BeforeAfterChangeView
AS
SELECT
	BAC.Id
	,BeforeAfterEventId
	,RowId
	,CN.ColumnName
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(BeforeValueCrypt)) AS BeforeValue
	,CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(AfterValueCrypt)) AS AfterValue
FROM
	ApexSQL.BeforeAfterChange BAC
	LEFT JOIN ApexSQL.ColumnName CN ON BAC.ColumnNameId = CN.Id

GO
