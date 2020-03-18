SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[DatabaseName] (
		[Id]               [int] IDENTITY(1, 1) NOT NULL,
		[DatabaseName]     [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]          [datetimeoffset](7) NOT NULL,
		[RowHash]          [dbo].[Hash] NOT NULL,
		[RowVersion]       [timestamp] NOT NULL,
		CONSTRAINT [PK_DatabaseName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[DatabaseName]
	ADD
	CONSTRAINT [DF__DatabaseN__RowTi__5165187F]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-DatabaseName]
	ON [ApexSQL].[DatabaseName] ([DatabaseName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[DatabaseName] SET (LOCK_ESCALATION = TABLE)
GO
