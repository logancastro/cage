SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[SystemSettings#Const] (
		[Id]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK__SystemSe__3214EC078921BC92]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[SystemSettings#Const]
	ADD
	CONSTRAINT [DF__SystemSet__RowTi__4316F928]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[SystemSettings#Const] SET (LOCK_ESCALATION = TABLE)
GO
