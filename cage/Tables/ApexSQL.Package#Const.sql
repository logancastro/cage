SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[Package#Const] (
		[Id]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK__Package#__3214EC0770A6F694]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[Package#Const]
	ADD
	CONSTRAINT [DF__Package#C__RowTi__173876EA]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
CREATE NONCLUSTERED INDEX [Package#ConstIdIndex]
	ON [ApexSQL].[Package#Const] ([Id])
	INCLUDE ([RowVersion])
	ON [PRIMARY]
GO
ALTER TABLE [ApexSQL].[Package#Const] SET (LOCK_ESCALATION = TABLE)
GO
