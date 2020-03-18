SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- dbo.BeforeAfterChangeMatrixSelectById
CREATE PROCEDURE dbo.BeforeAfterChangeMatrixSelectById
(  @BeforeAfterEventId uniqueidentifier )
AS
BEGIN
	SET NOCOUNT ON

	SELECT Id, BeforeAfterEventId, RowId, RowType, ColumnName, Value
	FROM [ApexSQL].[BeforeAfterChangeMatrixProxyView]
	WHERE  BeforeAfterEventId = @BeforeAfterEventId
	ORDER BY BeforeAfterEventId, RowId, RowType DESC
END
GO
