SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[LoginName] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[LoginName]      [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK_LoginName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[LoginName]
	ADD
	CONSTRAINT [DF__LoginName__RowTi__5441852A]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-LoginName]
	ON [ApexSQL].[LoginName] ([LoginName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[LoginName] SET (LOCK_ESCALATION = TABLE)
GO
