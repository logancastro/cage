SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ArchiveHistory#Const] (
		[Id]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK__ArchiveH__3214EC074BADF111]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Const]
	ADD
	CONSTRAINT [DF__ArchiveHi__RowTi__1332DBDC]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ArchiveHistory#Const] SET (LOCK_ESCALATION = TABLE)
GO
