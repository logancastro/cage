SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[EncryptionKey] (
		[Id]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Name]              [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BelongTo]          [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[EncryptionKey]     [varbinary](max) NOT NULL,
		[RowTime]           [datetimeoffset](7) NOT NULL,
		[RowHash]           [dbo].[Hash] NOT NULL,
		[RowVersion]        [timestamp] NOT NULL,
		CONSTRAINT [PK__Encrypti__3214EC074A8CA6EF]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[EncryptionKey]
	ADD
	CONSTRAINT [DF__Encryptio__RowTi__1DE57479]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[EncryptionKey] SET (LOCK_ESCALATION = TABLE)
GO
