SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ReportDefinition#Var] (
		[SurrogateId]        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                 [uniqueidentifier] NOT NULL,
		[UserName]           [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DefinitionName]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DefinitionData]     [varbinary](max) NULL,
		[Deleted]            [bit] NOT NULL,
		[RowTime]            [datetimeoffset](7) NOT NULL,
		[RowHash]            [dbo].[Hash] NOT NULL,
		[RowVersion]         [timestamp] NOT NULL,
		CONSTRAINT [PK__ReportDe__59EC1A2190654736]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ReportDefinition#Var]
	ADD
	CONSTRAINT [DF__ReportDef__RowTi__398D8EEE]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ReportDefinition#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ReportDefini__Id__38996AB5]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ReportDefinition#Const] ([Id])
ALTER TABLE [ApexSQL].[ReportDefinition#Var]
	CHECK CONSTRAINT [FK__ReportDefini__Id__38996AB5]

GO
ALTER TABLE [ApexSQL].[ReportDefinition#Var] SET (LOCK_ESCALATION = TABLE)
GO
