SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.SchemaNameProxyView
AS
SELECT SchemaName FROM ApexSql.SchemaName
GO