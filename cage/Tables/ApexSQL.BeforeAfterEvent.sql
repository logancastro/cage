SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[BeforeAfterEvent] (
		[Id]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]               [datetimeoffset](7) NOT NULL,
		[RowHash]               [dbo].[Hash] NOT NULL,
		[RowVersion]            [timestamp] NOT NULL,
		[Operation]             [int] NULL,
		[ServerNameId]          [int] NULL,
		[StartTime]             [datetimeoffset](7) NULL,
		[ApplicationNameId]     [int] NULL,
		[ClientHostNameId]      [int] NULL,
		[DatabaseNameId]        [int] NULL,
		[LoginNameId]           [int] NULL,
		[SchemaNameId]          [int] NULL,
		[ObjectNameId]          [int] NULL,
		[TransactionId]         [bigint] NULL,
		CONSTRAINT [PK__BeforeAf__3214EC066E6E25C1]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	ADD
	CONSTRAINT [DF__BeforeAft__RowTi__6FE99F9F]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Serve__70DDC3D8]
	FOREIGN KEY ([ServerNameId]) REFERENCES [ApexSQL].[ServerName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Serve__70DDC3D8]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Appli__71D1E811]
	FOREIGN KEY ([ApplicationNameId]) REFERENCES [ApexSQL].[ApplicationName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Appli__71D1E811]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Clien__72C60C4A]
	FOREIGN KEY ([ClientHostNameId]) REFERENCES [ApexSQL].[ClientHostName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Clien__72C60C4A]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Datab__73BA3083]
	FOREIGN KEY ([DatabaseNameId]) REFERENCES [ApexSQL].[DatabaseName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Datab__73BA3083]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Login__74AE54BC]
	FOREIGN KEY ([LoginNameId]) REFERENCES [ApexSQL].[LoginName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Login__74AE54BC]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Schem__75A278F5]
	FOREIGN KEY ([SchemaNameId]) REFERENCES [ApexSQL].[SchemaName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Schem__75A278F5]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	WITH CHECK
	ADD CONSTRAINT [FK__BeforeAft__Objec__76969D2E]
	FOREIGN KEY ([ObjectNameId]) REFERENCES [ApexSQL].[ObjectName] ([Id])
ALTER TABLE [ApexSQL].[BeforeAfterEvent]
	CHECK CONSTRAINT [FK__BeforeAft__Objec__76969D2E]

GO
ALTER TABLE [ApexSQL].[BeforeAfterEvent] SET (LOCK_ESCALATION = TABLE)
GO
