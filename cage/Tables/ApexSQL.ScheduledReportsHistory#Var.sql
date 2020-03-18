SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ScheduledReportsHistory#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[ScheduleId]      [uniqueidentifier] NOT NULL,
		[JobResult]       [int] NULL,
		[ReportName]      [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FileFormat]      [int] NULL,
		[FileName]        [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Machine]         [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StartTime]       [datetimeoffset](7) NULL,
		[EndTime]         [datetimeoffset](7) NULL,
		[Summary]         [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Deleted]         [bit] NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__Schedule__59EC1A21774F26DB]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var]
	ADD
	CONSTRAINT [DF__Scheduled__RowTi__10566F31]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ScheduledRep__Id__0E6E26BF]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ScheduledReportsHistory#Const] ([Id])
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var]
	CHECK CONSTRAINT [FK__ScheduledRep__Id__0E6E26BF]

GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__Scheduled__Sched__0F624AF8]
	FOREIGN KEY ([ScheduleId]) REFERENCES [ApexSQL].[ScheduleDefinition#Const] ([Id])
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var]
	CHECK CONSTRAINT [FK__Scheduled__Sched__0F624AF8]

GO
ALTER TABLE [ApexSQL].[ScheduledReportsHistory#Var] SET (LOCK_ESCALATION = TABLE)
GO
