SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[SystemSettings#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[Data]            [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__SystemSe__59EC1A21438FA725]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[SystemSettings#Var]
	ADD
	CONSTRAINT [DF__SystemSet__RowTi__46E78A0C]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[SystemSettings#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__SystemSettin__Id__45F365D3]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[SystemSettings#Const] ([Id])
ALTER TABLE [ApexSQL].[SystemSettings#Var]
	CHECK CONSTRAINT [FK__SystemSettin__Id__45F365D3]

GO
ALTER TABLE [ApexSQL].[SystemSettings#Var] SET (LOCK_ESCALATION = TABLE)
GO
