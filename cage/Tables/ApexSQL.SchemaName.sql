SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[SchemaName] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[SchemaName]     [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK_SchemaName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[SchemaName]
	ADD
	CONSTRAINT [DF__SchemaNam__RowTi__5CD6CB2B]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-SchemaName]
	ON [ApexSQL].[SchemaName] ([SchemaName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[SchemaName] SET (LOCK_ESCALATION = TABLE)
GO
