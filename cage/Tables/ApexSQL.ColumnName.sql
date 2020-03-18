SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ColumnName] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[ColumnName]     [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK_ColumnName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ColumnName]
	ADD
	CONSTRAINT [DF__ColumnNam__RowTi__59FA5E80]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-ColumnName]
	ON [ApexSQL].[ColumnName] ([ColumnName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[ColumnName] SET (LOCK_ESCALATION = TABLE)
GO
