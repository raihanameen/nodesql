/*
This Script is to initialise the database for the first time
****WARNING******
Do not run this script in production on a database host that already has you test/prod data
*/



Create DATABASE node_api
Go

USE node_api
GO

Create SCHEMA env ;
GO

CREATE TABLE [env].[applicationEnvironment](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[environmentVariable] [nvarchar](20) NOT NULL,
	[environmentName] [nvarchar](200) NOT NULL,
	[talismanClient] [nvarchar](20) NULL,
	[talismanDb] [nvarchar](20) NOT NULL,
	[talisServer] [nvarchar](200) NULL,
	[talisBatch] [nvarchar](20) NULL,
	[talismanWebServices] [nvarchar](20) NULL,
	[ceApp] [nvarchar](20) NULL,
	[ceBatch] [nvarchar](20) NULL,
	[protectApp] [nvarchar](20) NOT NULL,
	[protectRuleSet] [nvarchar](20) NOT NULL,
	[environmentOwner] [nvarchar](200) NOT NULL,
	[environmentStatusId] [numeric](1, 0) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [env].[applicationEnvironment] ADD  CONSTRAINT [PK_ApplicationEnvironment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [env].[environmentStatus](
	[id] [numeric](1, 0) IDENTITY(1,1) NOT NULL,
	[shortDescription] [nvarchar](20) NOT NULL,
	[description] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [env].[environmentStatus] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [env].[applicationEnvironment]  WITH CHECK ADD  CONSTRAINT [fk_env_status] FOREIGN KEY([environmentStatusId])
REFERENCES [env].[environmentStatus] ([id])
GO
ALTER TABLE [env].[applicationEnvironment] CHECK CONSTRAINT [fk_env_status]
GO