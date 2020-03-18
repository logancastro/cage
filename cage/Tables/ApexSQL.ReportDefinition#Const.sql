SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [ApexSQL].[ReportDefinition#Const] (
		[Id]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RowTime]        [datetimeoffset](7) NOT NULL,
		[RowHash]        [dbo].[Hash] NOT NULL,
		[RowVersion]     [timestamp] NOT NULL,
		CONSTRAINT [PK__ReportDe__3214EC070022E38E]
		PRIMARY KEY
		CLUSTERED
		([Id])
	ON [PRIMARY]
)
GO
ALTER TABLE [ApexSQL].[ReportDefinition#Const]
	ADD
	CONSTRAINT [DF__ReportDef__RowTi__35BCFE0A]
	DEFAULT (sysdatetimeoffset()) FOR [RowTime]
GO
ALTER TABLE [ApexSQL].[ReportDefinition#Const] SET (LOCK_ESCALATION = TABLE)
GO
