SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[CentralRepository#Var] (
		[SurrogateId]                       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                                [uniqueidentifier] NOT NULL,
		[Name]                              [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Version]                           [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[PreviousVersion]                   [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DefaultEncryptionKeyId]            [uniqueidentifier] NULL,
		[EvidenceLockerEncryptionKeyId]     [uniqueidentifier] NULL,
		[RowTime]                           [datetimeoffset](7) NOT NULL,
		[RowHash]                           [dbo].[Hash] NOT NULL,
		[RowVersion]                        [timestamp] NOT NULL,
		CONSTRAINT [PK__CentralR__59EC1A202B37B536]
		PRIMARY KEY
		NONCLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[CentralRepository#Var]
	ADD
	CONSTRAINT [DF__CentralRe__RowTi__145C0A3F]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[CentralRepository#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__CentralRepos__Id__1367E606]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[CentralRepository#Const] ([Id])
ALTER TABLE [ApexSQL].[CentralRepository#Var]
	CHECK CONSTRAINT [FK__CentralRepos__Id__1367E606]

GO
CREATE UNIQUE CLUSTERED INDEX [CentralRepository#VarIndex]
	ON [ApexSQL].[CentralRepository#Var] ([Id], [RowVersion])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[CentralRepository#Var] SET (LOCK_ESCALATION = TABLE)
GO
