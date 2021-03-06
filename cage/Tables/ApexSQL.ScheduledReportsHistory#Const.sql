SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ScheduledReportsHistory#Const] (
		[Id]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK__Schedule__3214EC077295962E]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Const]
	ADD
	CONSTRAINT [DF__Scheduled__RowTi__04E4BC85]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Const] SET (LOCK_ESCALATION = TABLE)
GO
