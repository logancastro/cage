SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ApplicationName] (
		[Id]                  [int] IDENTITY(1, 1) NOT NULL,
		[ApplicationName]     [nvarchar](200) COLLATE Latin1_General_CS_AS NOT NULL,
		[RowTime]             [datetimeoffset](7) NOT NULL,
		[RowHash]             [dbo].[Hash] NOT NULL,
		[RowVersion]          [timestamp] NOT NULL,
		CONSTRAINT [PK_ApplicationName]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ApplicationName]
	ADD
	CONSTRAINT [DF__Applicati__RowTi__4BAC3F29]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-ApplicationName]
	ON [ApexSQL].[ApplicationName] ([ApplicationName])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[ApplicationName] SET (LOCK_ESCALATION = TABLE)
GO
