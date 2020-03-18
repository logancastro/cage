SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ComplyInstance#Var] (
		[SurrogateId]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Id]                    [uniqueidentifier] NOT NULL,
		[ServerName]            [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsCentralInstance]     [bit] NOT NULL,
		[IsCluster]             [bit] NOT NULL,
		[ClusterName]           [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsAlwaysOn]            [bit] NOT NULL,
		[AlwaysOnListener]      [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EncryptionKeyId]       [uniqueidentifier] NOT NULL,
		[Data]                  [varbinary](max) NOT NULL,
		[Deleted]               [bit] NOT NULL,
		[RowTime]               [datetimeoffset](7) NOT NULL,
		[RowHash]               [dbo].[Hash] NOT NULL,
		[RowVersion]            [timestamp] NOT NULL,
		CONSTRAINT [PK__ComplyIn__59EC1A215B3798EC]
		PRIMARY KEY
		CLUSTERED
		([SurrogateId])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ComplyInstance#Var]
	ADD
	CONSTRAINT [DF__ComplyIns__RowTi__25869641]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ComplyInstance#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ComplyInstan__Id__239E4DCF]
	FOREIGN KEY ([Id]) REFERENCES [ApexSQL].[ComplyInstance#Const] ([Id])
ALTER TABLE [ApexSQL].[ComplyInstance#Var]
	CHECK CONSTRAINT [FK__ComplyInstan__Id__239E4DCF]

GO
ALTER TABLE [ApexSQL].[ComplyInstance#Var]
	WITH CHECK
	ADD CONSTRAINT [FK__ComplyIns__Encry__24927208]
	FOREIGN KEY ([EncryptionKeyId]) REFERENCES [ApexSQL].[EncryptionKey] ([Id])
ALTER TABLE [ApexSQL].[ComplyInstance#Var]
	CHECK CONSTRAINT [FK__ComplyIns__Encry__24927208]

GO
ALTER TABLE [ApexSQL].[ComplyInstance#Var] SET (LOCK_ESCALATION = TABLE)
GO
