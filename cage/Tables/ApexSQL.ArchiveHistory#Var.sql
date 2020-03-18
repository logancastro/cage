SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ArchiveHistory#Var] (
		[SurrogateId]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                      [uniqueidentifier] NOT NULL,
		[ArchiveName]             [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ArchiveScheduleType]     [int] NOT NULL,
		[ArchiveFinishedDate]     [datetimeoffset](7) NULL,
		[Success]                 [bit] NULL,
		[Deleted]                 [bit] NOT NULL,
		[RowTime]                 [datetimeoffset](7) NOT NULL,
		[RowHash]                 [dbo].[Hash] NOT NULL,
		[RowVersion]              [timestamp] NOT NULL,
		CONSTRAINT [PK__ArchiveH__59EC1A21F6699545]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Var]
	ADD
	CONSTRAINT [DF__ArchiveHi__Delet__17036CC0]
	DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Var]
	ADD
	CONSTRAINT [DF__ArchiveHi__RowTi__17F790F9]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ArchiveHisto__Id__160F4887]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ArchiveHistory#Const] ([Id])
ALTER TABLE [ApexSQL].[ArchiveHistory#Var]
	CHECK CONSTRAINT [FK__ArchiveHisto__Id__160F4887]

GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Var] SET (LOCK_ESCALATION = TABLE)
GO
