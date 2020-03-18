SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.BeforeAfterChangeMatrixProxyView
AS
SELECT Id
,BeforeAfterEventId
,RowId
,RowType
,ColumnName
,Value FROM ApexSql.BeforeAfterChangeMatrixView
GO
