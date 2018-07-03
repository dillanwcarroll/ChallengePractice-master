/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF '$(LoadTestData)' = 'true'

BEGIN

DELETE FROM [Booking];
DELETE FROM [TourEvent];
DELETE FROM [Client];
DELETE FROM [Tour];

INSERT INTO Tour (tourID, [name], [description]) VALUES
(1, 'West', 'Tour of wineries and outlets of the Geelong and Otways region'),
(2, 'East', 'Tour of wineries and outlets of the Yarra Valley'),
(3, 'South', 'Tour of wineries and outlets of the Mornington Peninsula'),
(4, 'North', 'Tour of wineries and outlets of the Bendigo and Castlemaine region');

INSERT INTO Client (clientID, firstName, lastName, gender) VALUES
(1, 'Taylor', 'Price', 'M'),
(2, 'Ellyse', 'Gamble', 'F'),
(3, 'Tilly', 'Tan', 'F');

INSERT INTO TourEvent (eventID, eventDay, eventMonth, eventYear, fee, tourID) VALUES
(1, 9, 'Jan', 2016, $200, 4),
(2, 13, 'Feb', 2016, $225, 4),
(3, 16, 'Jan', 2016, $200, 3),
(4, 29, 'Jan', 2016, $225, 1);

INSERT INTO Booking (bookingID, payment, dateBooked, clientID, eventID) VALUES
(1, $200, '12/10/2015', 1, 1),
(2, $200, '12/16/2015', 2, 1),
(3, $225, '01/08/2016', 1, 2),
(4, $225, '01/14/2016', 2, 2),
(5, $225, '02/03/2016', 3, 2),
(6, $200, '12/10/2015', 1, 3),
(7, $200, '12/18/2015', 2, 3),
(8, $200, '01/09/2016', 3, 3),
(9, $200, '12/17/2015', 2, 4),
(10, $200, '12/18/2015', 3, 4);

END;