SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[Package#Var] (
		[SurrogateId]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                        [uniqueidentifier] NOT NULL,
		[ComplyInstanceName]        [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ServerName]                [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NoOfEvents]                [bigint] NOT NULL,
		[CreateTime]                [datetimeoffset](7) NOT NULL,
		[StartTime]                 [datetimeoffset](7) NOT NULL,
		[EndTime]                   [datetimeoffset](7) NOT NULL,
		[Status]                    [int] NOT NULL,
		[ReferencingEventsHash]     [dbo].[Hash] NULL,
		[RowTime]                   [datetimeoffset](7) NOT NULL,
		[RowHash]                   [dbo].[Hash] NOT NULL,
		[RowVersion]                [timestamp] NOT NULL,
		CONSTRAINT [PK__Package#__59EC1A205020F3AB]
		PRIMARY KEY
		NONCLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[Package#Var]
	ADD
	CONSTRAINT [DF__Package#V__RowTi__1B0907CE]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[Package#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__Package#Var__Id__1A14E395]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[Package#Const] ([Id])
ALTER TABLE [ApexSQL].[Package#Var]
	CHECK CONSTRAINT [FK__Package#Var__Id__1A14E395]

GO
CREATE UNIQUE CLUSTERED INDEX [Package#VarIndex]
	ON [ApexSQL].[Package#Var] ([Id], [RowVersion])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Package#VarConstIdRowVersionIndex]
	ON [ApexSQL].[Package#Var] ([Id], [RowVersion])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Package#VarReferencingEventsHashIndex]
	ON [ApexSQL].[Package#Var] ([Id])
	INCLUDE ([ComplyInstanceName], [ServerName], [NoOfEvents], [CreateTime], [ReferencingEventsHash], [RowVersion])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[Package#Var] SET (LOCK_ESCALATION = TABLE)
GO
