SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ClientHostName] (
		[Id]                 [int] IDENTITY(1, 1) NOT NULL,
		[ClientHostName]     [nvarchar](200) COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]            [datetimeoffset](7) NOT NULL,
		[RowHash]            [dbo].[Hash] NOT NULL,
		[RowVersion]         [timestamp] NOT NULL,
		CONSTRAINT [PK_ClientHostName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ClientHostName]
	ADD
	CONSTRAINT [DF__ClientHos__RowTi__4E88ABD4]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-ClientHostName]
	ON [ApexSQL].[ClientHostName] ([ClientHostName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[ClientHostName] SET (LOCK_ESCALATION = TABLE)
GO
