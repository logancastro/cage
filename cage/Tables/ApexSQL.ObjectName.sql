SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ObjectName] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[ObjectName]     [nvarchar](512) COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK_ObjectName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ObjectName]
	ADD
	CONSTRAINT [DF__ObjectNam__RowTi__571DF1D5]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-ObjectName]
	ON [ApexSQL].[ObjectName] ([ObjectName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[ObjectName] SET (LOCK_ESCALATION = TABLE)
GO
