SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[BeforeAfterChange] (
		[Id]                     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]                [datetimeoffset](7) NOT NULL,
		[RowHash]                [dbo].[Hash] NOT NULL,
		[RowVersion]             [timestamp] NOT NULL,
		[BeforeAfterEventId]     [uniqueidentifier] NOT NULL,
		[RowId]                  [int] NOT NULL,
		[ColumnNameId]           [int] NOT NULL,
		[BeforeValueCrypt]       [varbinary](max) NULL,
		[AfterValueCrypt]        [varbinary](max) NULL,
		CONSTRAINT [PK__BeforeAf__3214EC061BAA848C]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[BeforeAfterChange]
	ADD
	CONSTRAINT [DF__BeforeAft__RowTi__797309D9]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[BeforeAfterChange]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Befor__7A672E12]
	FOREIGN KEY ([BeforeAfterEventId]) REFERENCES [ApexSQL].[BeforeAfterEvent] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterChange]
	CHECK CONSTRAINT [FK__BeforeAft__Befor__7A672E12]

GO
ALTER TABLE [ApexSQL].[BeforeAfterChange]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Colum__7B5B524B]
	FOREIGN KEY ([ColumnNameId]) REFERENCES [ApexSQL].[ColumnName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterChange]
	CHECK CONSTRAINT [FK__BeforeAft__Colum__7B5B524B]

GO
ALTER TABLE [ApexSQL].[BeforeAfterChange] SET (LOCK_ESCALATION = TABLE)
GO
