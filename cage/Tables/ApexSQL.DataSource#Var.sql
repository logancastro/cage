SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[DataSource#Var] (
		[SurrogateId]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]              [uniqueidentifier] NOT NULL,
		[Name]            [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Data]            [varbinary](max) NOT NULL,
		[Deleted]         [bit] NOT NULL,
		[RowTime]         [datetimeoffset](7) NOT NULL,
		[RowHash]         [dbo].[Hash] NOT NULL,
		[RowVersion]      [timestamp] NOT NULL,
		CONSTRAINT [PK__DataSour__59EC1A21C0D1B8C4]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[DataSource#Var]
	ADD
	CONSTRAINT [DF__DataSourc__RowTi__2C3393D0]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[DataSource#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__DataSource#V__Id__2B3F6F97]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[DataSource#Const] ([Id])
ALTER TABLE [ApexSQL].[DataSource#Var]
	CHECK CONSTRAINT [FK__DataSource#V__Id__2B3F6F97]

GO
ALTER TABLE [ApexSQL].[DataSource#Var] SET (LOCK_ESCALATION = TABLE)
GO
