SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ScheduleDefinition#Var] (
		[SurrogateId]        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                 [uniqueidentifier] NOT NULL,
		[DefinitionName]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DefinitionData]     [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Deleted]            [bit] NOT NULL,
		[RowTime]            [datetimeoffset](7) NOT NULL,
		[RowHash]            [dbo].[Hash] NOT NULL,
		[RowVersion]         [timestamp] NOT NULL,
		CONSTRAINT [PK__Schedule__59EC1A21F0CAACE7]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ScheduleDefinition#Var]
	ADD
	CONSTRAINT [DF__ScheduleD__RowTi__403A8C7D]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ScheduleDefinition#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ScheduleDefi__Id__3F466844]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ScheduleDefinition#Const] ([Id])
ALTER TABLE [ApexSQL].[ScheduleDefinition#Var]
	CHECK CONSTRAINT [FK__ScheduleDefi__Id__3F466844]

GO
ALTER TABLE [ApexSQL].[ScheduleDefinition#Var] SET (LOCK_ESCALATION = TABLE)
GO
