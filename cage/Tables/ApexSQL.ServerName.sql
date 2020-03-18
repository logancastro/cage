SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ServerName] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[ServerName]     [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK_ServerName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ServerName]
	ADD
	CONSTRAINT [DF__ServerNam__RowTi__5FB337D6]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-ServerName]
	ON [ApexSQL].[ServerName] ([ServerName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[ServerName] SET (LOCK_ESCALATION = TABLE)
GO
