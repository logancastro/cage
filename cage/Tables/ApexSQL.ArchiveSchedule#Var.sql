SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ArchiveSchedule#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[Name]            [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Data]            [varbinary](max) NOT NULL,
		[Deleted]         [bit] NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__ArchiveS__59EC1A21CE5A398C]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ArchiveSchedule#Var]
	ADD
	CONSTRAINT [DF__ArchiveSc__RowTi__0B91BA14]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ArchiveSchedule#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ArchiveSched__Id__0A9D95DB]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ArchiveSchedule#Const] ([Id])
ALTER TABLE [ApexSQL].[ArchiveSchedule#Var]
	CHECK CONSTRAINT [FK__ArchiveSched__Id__0A9D95DB]

GO
ALTER TABLE [ApexSQL].[ArchiveSchedule#Var] SET (LOCK_ESCALATION = TABLE)
GO
