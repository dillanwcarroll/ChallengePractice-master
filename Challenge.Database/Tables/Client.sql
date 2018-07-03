CREATE TABLE [dbo].[Client]
(
	[clientID] INT NOT NULL,
	[firstName] VARCHAR(30) NOT NULL,
	[lastName] VARCHAR(30) NOT NULL,
	[gender] CHAR(1) NOT NULL,
	CONSTRAINT PK_Client PRIMARY KEY (clientID),
	CONSTRAINT CK_Client_Gender CHECK (gender in ('M', 'F'))
)
