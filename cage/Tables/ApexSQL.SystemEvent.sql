SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[SystemEvent] (
		[Id]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		[EventTypeId]     [int] NOT NULL,
		[ServerName]      [sysname] COLLATE Latin1_General_CS_AS NOT NULL,
		[StartTime]       [datetimeoffset](7) NOT NULL,
		[TextData]        [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS SPARSE NULL,
		CONSTRAINT [PK__SystemEv__3214EC0672B0DF99]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[SystemEvent]
	ADD
	CONSTRAINT [DF__SystemEve__RowTi__6D0D32F4]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-RowVersion]
	ON [ApexSQL].[SystemEvent] ([RowVersion])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-StartTime-EventType-RowVersion]
	ON [ApexSQL].[SystemEvent] ([StartTime], [EventTypeId], [RowVersion])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[SystemEvent] SET (LOCK_ESCALATION = TABLE)
GO
