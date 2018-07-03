CREATE TABLE [dbo].[TourEvent]
(
	[eventID] INT NOT NULL,
	[eventDay] INT NOT NULL,
	[eventMonth] CHAR(3) NOT NULL,
	[eventYear] INT NOT NULL,
	[fee] MONEY NOT NULL,
	[tourID] INT NOT NULL,
	CONSTRAINT PK_TourEvent PRIMARY KEY (eventID),
	CONSTRAINT FK_TourEvent FOREIGN KEY (tourID) REFERENCES Tour (tourID),
	CONSTRAINT CK_TourEvent_EventDay CHECK (eventDay <= 31),
	CONSTRAINT CK_TourEvent_EventMonth CHECK (eventMonth in ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
)
