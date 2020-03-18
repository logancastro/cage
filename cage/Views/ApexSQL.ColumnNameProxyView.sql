SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.ColumnNameProxyView
AS
SELECT Id
,DatabaseName
,ObjectName
,ColumnName FROM ApexSql.ColumnNameView
GO
