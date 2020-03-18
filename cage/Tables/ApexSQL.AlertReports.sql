SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[AlertReports] (
		[Id]                     [uniqueidentifier] NOT NULL,
		[AlertName]              [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Severity]               [int] NOT NULL,
		[TriggeredOn]            [datetimeoffset](7) NOT NULL,
		[ComplyInstanceName]     [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Summary]                [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[UserTitle]              [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[UserSummary]            [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Resolved]               [bit] NOT NULL,
		[AlertId]                [uniqueidentifier] NOT NULL,
		[EventId]                [uniqueidentifier] NOT NULL,
		[Deleted]                [bit] NOT NULL,
		[RowTime]                [datetimeoffset](7) NOT NULL,
		[RowHash]                [dbo].[Hash] NOT NULL,
		[RowVersion]             [timestamp] NOT NULL
)
GO
ALTER TABLE [ApexSQL].[AlertReports]
	ADD
	CONSTRAINT [DF__AlertRepo__RowTi__48CFD27E]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[AlertReports] SET (LOCK_ESCALATION = TABLE)
GO
