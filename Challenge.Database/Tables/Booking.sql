CREATE TABLE [dbo].[Booking]
(
	[bookingID] INT NOT NULL,
	[payment] MONEY NOT NULL,
	[dateBooked] DATE NOT NULL,
	[clientID] INT NOT NULL,
	[eventID] INT NOT NULL,
	CONSTRAINT PK_Booking PRIMARY KEY (bookingID),
	CONSTRAINT FK_Booking_Client FOREIGN KEY (clientID) REFERENCES [Client] (clientID),
	CONSTRAINT FK_Booking_TourEvent FOREIGN KEY (eventID) REFERENCES TourEvent (eventID)
)
