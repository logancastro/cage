SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.BeforeAfterChangeProxyView
AS
SELECT Id
,BeforeAfterEventId
,RowId
,ColumnName
,BeforeValue
,AfterValue FROM ApexSql.BeforeAfterChangeView
GO
