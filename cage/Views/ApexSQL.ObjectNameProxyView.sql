SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW ApexSQL.ObjectNameProxyView
AS
SELECT ObjectName FROM ApexSql.ObjectName
GO
