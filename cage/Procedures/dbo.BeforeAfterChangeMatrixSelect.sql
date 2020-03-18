SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- dbo.BeforeAfterChangeMatrixSelect
CREATE PROCEDURE dbo.BeforeAfterChangeMatrixSelect
AS
BEGIN
	SET NOCOUNT ON

	SELECT Id, BeforeAfterEventId, RowId, RowType, ColumnName, Value
	FROM [ApexSQL].[BeforeAfterChangeMatrixProxyView]
	ORDER BY BeforeAfterEventId, RowId, RowType DESC
END
GO
