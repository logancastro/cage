SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[Event] (
		[Id]                      [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[PackageId]               [uniqueidentifier] NOT NULL,
		[RowTime]                 [datetimeoffset](7) NOT NULL,
		[RowHash]                 [dbo].[Hash] NOT NULL,
		[RowVersion]              [timestamp] NOT NULL,
		[Operation]               [int] NULL,
		[ServerNameId]            [int] NULL,
		[StartTime]               [datetimeoffset](7) NULL,
		[Duration]                [int] NULL,
		[ApplicationNameId]       [int] NULL,
		[ClientHostNameId]        [int] NULL,
		[DatabaseNameId]          [int] NULL,
		[DatabaseId]              [int] NULL,
		[Success]                 [bit] NULL,
		[LoginNameId]             [int] NULL,
		[SchemaNameId]            [int] NULL,
		[ObjectNameId]            [int] NULL,
		[ObjectId]                [int] SPARSE NULL,
		[TransactionId]           [bigint] SPARSE NULL,
		[TextData]                [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS SPARSE NULL,
		[AccessedObjectsList]     [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS SPARSE NULL,
		[Error]                   [int] SPARSE NULL,
		CONSTRAINT [PK__Event__3214EC06A43232D9]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[Event]
	ADD
	CONSTRAINT [DF__Event__RowTime__6383C8BA]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__PackageId__628FA481]
	FOREIGN KEY ([PackageId]) REFERENCES [ApexSQL].[Package#Const] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__PackageId__628FA481]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__ServerNam__6477ECF3]
	FOREIGN KEY ([ServerNameId]) REFERENCES [ApexSQL].[ServerName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__ServerNam__6477ECF3]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__Applicati__656C112C]
	FOREIGN KEY ([ApplicationNameId]) REFERENCES [ApexSQL].[ApplicationName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__Applicati__656C112C]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__ClientHos__66603565]
	FOREIGN KEY ([ClientHostNameId]) REFERENCES [ApexSQL].[ClientHostName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__ClientHos__66603565]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__DatabaseN__6754599E]
	FOREIGN KEY ([DatabaseNameId]) REFERENCES [ApexSQL].[DatabaseName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__DatabaseN__6754599E]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__LoginName__68487DD7]
	FOREIGN KEY ([LoginNameId]) REFERENCES [ApexSQL].[LoginName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__LoginName__68487DD7]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__SchemaNam__693CA210]
	FOREIGN KEY ([SchemaNameId]) REFERENCES [ApexSQL].[SchemaName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__SchemaNam__693CA210]

GO
ALTER TABLE [ApexSQL].[Event]
	WITH CHECK
	ADD CONSTRAINT [FK__Event__ObjectNam__6A30C649]
	FOREIGN KEY ([ObjectNameId]) REFERENCES [ApexSQL].[ObjectName] ([Id])
ALTER TABLE [ApexSQL].[Event]
	CHECK CONSTRAINT [FK__Event__ObjectNam__6A30C649]

GO
CREATE CLUSTERED INDEX [ClusteredIndex-StartTime-RowVersion]
	ON [ApexSQL].[Event] ([StartTime] DESC, [RowVersion] DESC)
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-StartTime-Operation-RowVersion]
	ON [ApexSQL].[Event] ([StartTime], [Operation], [RowVersion])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-PackageId-RowVersion]
	ON [ApexSQL].[Event] ([PackageId], [RowVersion])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[Event] SET (LOCK_ESCALATION = TABLE)
GO
