SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[Accounts#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[Data]            [varbinary](max) NOT NULL,
		[Deleted]         [bit] NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__Accounts__59EC1A219EEB56A4]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[Accounts#Var]
	ADD
	CONSTRAINT [DF__Accounts#__RowTi__02084FDA]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[Accounts#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__Accounts#Var__Id__01142BA1]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[Accounts#Const] ([Id])
ALTER TABLE [ApexSQL].[Accounts#Var]
	CHECK CONSTRAINT [FK__Accounts#Var__Id__01142BA1]

GO
ALTER TABLE [ApexSQL].[Accounts#Var] SET (LOCK_ESCALATION = TABLE)
GO
