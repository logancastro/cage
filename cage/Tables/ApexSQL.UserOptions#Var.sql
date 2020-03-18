SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[UserOptions#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[UserName]        [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Data]            [varbinary](max) NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__UserOpti__59EC1A218F2B23FC]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[UserOptions#Var]
	ADD
	CONSTRAINT [DF__UserOptio__RowTi__32E0915F]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[UserOptions#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__UserOptions#__Id__31EC6D26]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[UserOptions#Const] ([Id])
ALTER TABLE [ApexSQL].[UserOptions#Var]
	CHECK CONSTRAINT [FK__UserOptions#__Id__31EC6D26]

GO
ALTER TABLE [ApexSQL].[UserOptions#Var] SET (LOCK_ESCALATION = TABLE)
GO
