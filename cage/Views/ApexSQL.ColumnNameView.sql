SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- ColumnNameView
CREATE VIEW ApexSQL.ColumnNameView
AS
SELECT 
COL.Id AS Id,
DB.DatabaseName AS DatabaseName, 
OBJ.ObjectName AS ObjectName, 
COL.ColumnName AS ColumnName 
FROM
(SELECT BAC.ColumnNameId, BAE.DatabaseNameId, BAE.ObjectNameId FROM [ApexSQL].[BeforeAfterEvent] BAE
JOIN ApexSQL.BeforeAfterChange BAC ON BAE.Id = BAC.BeforeAfterEventId
GROUP BY BAC.ColumnNameId, BAE.DatabaseNameId, BAE.ObjectNameId) G
INNER JOIN ApexSQL.ObjectName AS OBJ ON OBJ.Id = G.ObjectNameId
INNER JOIN ApexSQL.DatabaseName AS DB ON DB.Id = G.DatabaseNameId
INNER JOIN ApexSQL.ColumnName AS COL ON COL.Id = G.ColumnNameId
GO
