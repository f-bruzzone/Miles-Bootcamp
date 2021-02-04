drop table if exists RoomStatus;
drop table if exists Rooms;
drop table if exists RoomStay;
drop table if exists GuestClassLvl;
drop table if exists Class;
drop table if exists SupplySales;
drop table if exists Sales;
drop table if exists Guests;
drop table if exists GuestStatus;
drop table if exists TavernServices;
drop table if exists ServiceStatus;
drop table if exists [Services];
drop table if exists Recieved;
drop table if exists Inventory;
drop table if exists Supplies;
drop table if exists Users;
drop table if exists Roles;
drop table if exists Taverns;
drop table if exists Locations


create table[Locations](
	LocationID int identity(1,1),
	LocationName varChar(250)
	);

	insert into Locations(LocationName)
	values
		('Bikkini Bottom'),
		('Goldshire'),
		('Stormwind City'),
		('Dun Morogh'),
		('The Loch')


create table[Taverns](
	TavernID int identity(1,1),
	TavernName varChar(250),
	LocationID int,
	);

	insert into Taverns (TavernName, LocationID)
	values
		('The Salty Spitoon', 1),
		('Lions Pride Inn', 2),
		('The Slaughtered Lamb',3),
		('The Golden Keg', 3),
		('Thunderbrew Distillery', 4),
		('Stoutlager Inn', 5)


create table[Roles](
	RoleID int identity(1,1),
	RoleName varChar(250),
	RoleDescription varChar (500)
	);

	insert into Roles(RoleName, RoleDescription)
	values
		('Bartender', 'Serves beverages to customers.'),
		('Chef', 'Prepares food for customers.'),
		('Server', 'Serves the guests drinks and food. Cleans tables.'),
		('Housekeeper', 'Tends to the guestrooms, and keeps track of occupied lodgings.'),
		('Janitor', 'Maintains the buildings overall cleanliness.'),
		('Admin', 'Overseer of the tavern.')


create table[Users](
	UserID int identity(1,1),
	TavernID int,
	UserName varChar(50),
	Birthday date,
	RoleID int,
	);

	insert into Users(TavernID, UserName, Birthday, RoleID)
	values
		(2, 'John Wick', '1983-04-16', 2),
		(1, 'Ragnaros', '1990-09-03', 6),
		(5, 'Domo', '1978-05-18', 4),
		(3, 'Baron Geddon', '1995-01-28', 3),
		(6, 'Garr', '1988-05-12', 5),
		(3, 'Shazzrah', '2001-11-19', 3),
		(2, 'Lucifron', '1966-03-25', 2),
		(5, 'Golemagg', '1972-06-22', 1),
		(4, 'Razorgore', '1991-07-20', 6),
		(2, 'Vael', '2001-02-14', 3),
		(6, 'Broodlord', '1988-11-24', 6),
		(1, 'Ebonroc', '1999-05-17', 1),
		(2, 'Nefarian', '1968-03-08', 6)



create table[Supplies](
	SupplyID int identity(1,1),
	SupplyName varChar(50),
	Unit varChar(50),
	Cost smallmoney,
	UnitDescription varChar(250)
	);

	insert into Supplies(SupplyName, Unit, Cost, UnitDescription)
	values
		('Barrel Keg' , 'Item Count', 111.99, 'Large barrel for alcohol storage.'),
		('Bottles', '24 pack', 25.00, 'Bottles for storing brewed ale.'),
		('Pints', '5 Pack', 14.75, 'Pint glasses for on-tap brews.'),
		('Stool', 'Item Count', 34.20, 'Tall seat for cutomers around the bar.'),
		('Broom', 'Item Count', 8.99, 'Soft bristle broom for sweeping.'),
		('Strong Ale', 'Keg', 178, 'Strong beverage on tap sold in pints.'),
		('Quilt', 'Item Count', 42.68, 'Bedding for guests.'),
		('Silverware', '9 Pack', 3.24, 'Utensils for guests.'),
		('Plates', '5 Pack', 34.55, 'China for food service to guests.'),
		('Soap', '5 Pack', 5.99, 'Soap for cleaning all dishes/silverware/tables etc.'),
		('Dwarven Mead', 'Keg', 144.99, 'Popular beverage on tap sold in pints.')


create table[Inventory](
	TavernID int,
	SupplyID int,
	SupplyCount int,
	DateUpdated date
	);

	insert into Inventory(TavernID, SupplyID, SupplyCount, DateUpdated)
	values
		(2, 4, 10, '2020-12-16'),
		(1, 1, 2, '2021-01-04'),
		(2, 2, 4, '2021-01-02'),
		(5, 6, 3, '2020-12-29'),
		(4, 3, 6, '2021-01-12'),
		(6, 7, 8, '2020-10-09'),
		(3, 9, 6, '2020-07-15'),
		(6, 5, 3, '2020-09-21'),
		(5, 1, 2, '2021-01-02'),
		(3, 10, 4, '2020-11-27'),
		(4, 4, 12, '2019-03-26'),
		(1, 8, 10, '2019-06-09'),
		(5, 4, 6, '2020-02-10')


create table[Recieved](
	TavernID int,
	SupplyID int,
	SupplyCount int,
	DateRecieved date
	);

	insert into Recieved(TavernID, SupplyID, SupplyCount, DateRecieved)
	values
		(2, 11, 4, '2018-10-11'),
		(6, 10, 4, '2021-01-04'),
		(3, 6, 2, '2020-11-20'),
		(2, 2, 2, '2021-01-02'),
		(1, 5, 2, '2019-04-13'),
		(4, 11, 5, '2017-08-26'),
		(1, 3, 4, '2018-04-20'),
		(5, 6, 3, '2019-06-10')


create table[Services](
	ServiceID int identity(1,1),
	TavernService varChar(50)
	);

	insert into [Services](TavernService)
	values
		('Weapon Sharpening'),
		('Armor Polishing'),
		('Horse Tending'),
		('Lodging'),
		('Bathing')


create table[ServiceStatus](
	StatusID int identity(1,1),
	[Status] varChar(50)
	);
	
	insert into [ServiceStatus]([Status])
	values
		('Active'),
		('Inactive'),
		('Discontinued')
		

create table[TavernServices](
	TavernID int,
	ServiceID int,
	StatusID int,
	);

	insert into TavernServices(TavernID, ServiceID, StatusID)
	values
		(1, 3, 1),
		(1, 1, 1),
		(1, 2, 2),
		(2, 4, 1),
		(2, 5, 1),
		(2, 1, 2),
		(3, 2 ,1),
		(3, 1, 2),
		(3, 4, 1),
		(4, 5, 1),
		(4, 2, 3),
		(4, 4, 2),
		(5, 1, 1),
		(5, 2, 1),
		(5, 3, 1),
		(6, 2, 2),
		(6, 4, 1)

create table GuestStatus(
	GuestStatusID int identity(1,1),
	StatusName varChar(50)
	);

	insert into GuestStatus (StatusName)
	values
		('Sick'),
		('Fine'),
		('Hangry'),
		('Raging'),
		('Placid');

create table Guests(
	GuestID int identity(1,1),
	GuestName varchar(50),
	Notes varchar(200),
	Birthday date,
	Cakeday date,
	GuestStatusID int
	);

	insert into Guests (GuestName, Notes, Birthday, Cakeday, GuestStatusID)
	values 
		('Leeroy Jenkins', 'Absolute savage', '1982-07-14', '1997-11-06', 3),
		('Invader Zim', 'Out of this world', '2000-05-11', '2005-02-20', 4),
		('Skimpy', 'Very average and nothing special', '1993-07-02', '2011-06-18', 2),
		('Hasty', 'He is fast', '2008-10-05', '2015-01-26', 5),
		('The Dirty Bubble', 'Evil.', '1998-06-22', '2009-08-01', 1),
		('Missappear', 'Now you see her', '2002-02-15', '2009-09-23', 2)


create table[Sales](
	SaleID int identity(1,1),
	ServiceID int,
	GuestID int,
	Price smallmoney,
	DatePurchased date,
	AmtPurchased int,
	TavernID int
	);

	insert into Sales(ServiceID, GuestID, Price, DatePurchased, AmtPurchased, TavernID)
	values
		(3, 2, 30.00, '2020-07-04', 1, 1),
		(1, 3, 10.75, '2020-02-27', 1, 1),
		(4, 1, 50.00, '2020-12-27', 2, 3),
		(2, 4, 25.50, '2021-01-03', 1, 5),
		(5, 3, 20.00, '2020-04-17', 1, 2),
		(2, 5, 18.40, '2019-06-09', 3, 4),
		(4, 1, 43.25, '2018-01-25', 2, 3),
		(3, 6, 22.20, '2020-08-15', 1, 2),
		(1, 2, 45.90, '2017-04-08', 2, 4),
		(5, 5, 46.75, '2018-10-16', 2, 5),
		(1, 3, 28.25, '2019-05-11', 3, 2),
		(2, 6, 33.99, '2018-03-25', 1, 3),
		(4, 4, 25.75, '2017-06-20', 2, 4)


create table SupplySales(
	SaleID int identity(1,1),
	TavernID int,
	SupplyID int,
	Unit varChar(20),
	Amt int,
	UnitSale smallmoney,
	TotalSales smallmoney
	);

	insert into SupplySales(TavernID, SupplyID, Unit, Amt, UnitSale, TotalSales)
	values
		(3, 6, 'Pints', 46, 4.50, 207),
		(2, 11, 'Pints', 73, 3.25, 237.25),
		(6, 11, 'Pints', 58, 3.25, 188.50),
		(5, 6, 'Pints', 41, 4.50, 184.50)


create table Class(
	ClassID int identity(1,1),
	ClassName varChar(50)
	);

	insert into Class (ClassName)
	values
		('Mage'),
		('Rogue'),
		('Hunter'),
		('Warrior'),
		('Druid');

create table GuestClassLvl(
	GuestID int,
	ClassID int,
	Lvl int
	);

	insert into GuestClassLvl (GuestID, ClassID, Lvl)
	values
		(3, 4, 2),
		(3, 1, 60),
		(1, 4, 5),
		(1, 5, 44),
		(4, 2, 27),
		(4, 3, 35),
		(4, 1, 8),
		(2, 5, 12),
		(2, 2, 31),
		(6, 5, 22),
		(5, 2, 09)


CREATE TABLE RoomStatus(
	RoomStatusID int identity(1,1),
	[Status] varchar(20)
	);

	INSERT INTO RoomStatus([Status])
	VALUES
		('Available'),
		('Occupied'),
		('Not Available')


CREATE TABLE Rooms(
	RoomID int identity(1,1),
	TavernID int,
	RoomStatusID int,
	Rate smallmoney
	);

	INSERT INTO Rooms(TavernID, RoomStatusID, Rate)
	VALUES
		(1, 2, 150),
		(1, 1, 150),
		(1, 2, 110),
		(1, 1, 110),
		(2, 1, 160),
		(2, 1, 140),
		(2, 2, 140),
		(2, 3, 100),
		(3, 2, 150),
		(3, 2, 120),
		(3, 1, 115),
		(4, 1, 90),
		(4, 2, 100),
		(4, 1, 110),
		(4, 1, 85),
		(5, 1, 180),
		(5, 2, 160),
		(5 ,2, 190),
		(6, 1, 115),
		(6, 2, 130),
		(6, 3, 90)


CREATE TABLE RoomStay(
	GuestID int,
	TavernID int,
	RoomID int,
	DateStayed date,
	Rate smallmoney
	);
	
	INSERT INTO RoomStay(GuestID, TavernID, RoomID, DateStayed, Rate)
	VALUES 
		(1, 3, 2, '2010-10-11', 120),
		(1, 3, 2, '2010-10-12', 120),
		(2, 1, 4, '2015-06-19', 150),
		(2, 1, 4, '2015-06-20', 150),
		(2, 1, 4, '2015-06-21', 150),
		(3, 1, 1, '2012-04-03', 150),
		(3, 1, 1, '2012-04-04', 150),
		(4, 4, 3, '2019-09-14', 90),
		(4, 4, 3, '2019-09-15', 90),
		(4, 4, 3, '2019-09-16', 90)


alter table Taverns ADD PRIMARY KEY([TavernID])
alter table Inventory ADD FOREIGN KEY([TavernID]) REFERENCES Taverns([TavernID])
alter table Recieved ADD FOREIGN KEY([TavernID]) REFERENCES Taverns([TavernID])
alter table TavernServices ADD FOREIGN KEY([TavernID]) REFERENCES Taverns([TavernID])
alter table Sales ADD FOREIGN KEY([TavernID]) REFERENCES Taverns([TavernID])
alter table SupplySales ADD FOREIGN KEY([TavernID]) REFERENCES Taverns([TavernID])

alter table Locations ADD PRIMARY KEY([LocationID])
alter table Taverns ADD FOREIGN KEY([LocationID]) REFERENCES Locations([LocationID])

alter table Users ADD PRIMARY KEY([UserID])

alter table Roles ADD PRIMARY KEY([RoleID])
alter table Users ADD FOREIGN KEY([RoleID]) REFERENCES Roles([RoleID])

alter table Supplies ADD PRIMARY KEY([SupplyID])
alter table Inventory ADD FOREIGN KEY([SupplyID]) REFERENCES Supplies([SupplyID])
alter table Recieved ADD FOREIGN KEY([SupplyID]) REFERENCES Supplies([SupplyID])
alter table SupplySales ADD FOREIGN KEY([SupplyID]) REFERENCES Supplies([SupplyID])

alter table [Services] ADD PRIMARY KEY([ServiceID])
alter table TavernServices ADD FOREIGN KEY([ServiceID]) REFERENCES [Services]([ServiceID])
alter table Sales ADD FOREIGN KEY([ServiceID]) REFERENCES [Services]([ServiceID])

alter table ServiceStatus ADD PRIMARY KEY([StatusID])
alter table TavernServices ADD FOREIGN KEY([StatusID]) REFERENCES ServiceStatus([StatusID])

alter table Sales ADD PRIMARY KEY([SaleID])

alter table SupplySales ADD PRIMARY KEY([SaleID])

alter table Guests ADD PRIMARY KEY([GuestID])
alter table Sales ADD FOREIGN KEY([GuestID]) REFERENCES Guests([GuestID])
alter table GuestClassLvl ADD FOREIGN KEY([GuestID]) REFERENCES Guests([GuestID])

alter table GuestStatus ADD PRIMARY KEY([GuestStatusID])
alter table Guests ADD FOREIGN KEY([GuestStatusID]) REFERENCES GuestStatus([GuestStatusID])

alter table Class ADD PRIMARY KEY([ClassID])
alter table GuestClassLvl ADD FOREIGN KEY([ClassID]) REFERENCES Class([ClassID])

alter table Rooms ADD PRIMARY KEY([RoomID])


/* 
	The location ID:6 does not exist, creating a Foreign Key error.

insert into Taverns (TavernName, LocationID)
values ('The New Tavern', 6);


	The TavernID does not exist, creating a Foreign Key error.

insert into TavernServices(TavernID, ServiceID, StatusID)
values (8, 4, 2)


	The StatusID does not exist, creating a Foreign Key error.

insert into TavernServices(TavernID, ServiceID, StatusID)
values (1, 4, 4)
*/


/*

SELECT Birthday FROM Guests WHERE Birthday < '2000'

SELECT DISTINCT TavernID, RoomID, Rate FROM RoomStay WHERE Rate > 100

SELECT DISTINCT GuestName FROM Guests

SELECT GuestName FROM Guests ORDER BY GuestName ASC

SELECT TOP(10) Price FROM Sales ORDER BY Price DESC

SELECT * FROM Locations
UNION ALL
SELECT * FROM [Services]
UNION ALL
SELECT * FROM ServiceStatus
UNION ALL
SELECT * FROM GuestStatus
UNION ALL
SELECT * FROM Class
UNION ALL
SELECT * FROM RoomStatus

SELECT ClassID, Lvl, (CASE
						WHEN Lvl <= 20 THEN '1-20'
						WHEN Lvl <= 40 THEN '21-40'
						WHEN Lvl <= 60 THEN '41-60'
						END) AS LvlGroup FROM GuestClassLvl




SELECT CONCAT('INSERT INTO ', TABLE_NAME, ' (',(SELECT TOP 1 COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GuestStatus'),
 ', ', (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GuestStatus' AND ORDINAL_POSITION = 2), ')') FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'GuestStatus'
 UNION ALL
SELECT CONCAT('SELECT ', (SELECT TOP 1 COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ServiceStatus'), ', ',
 (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ServiceStatus' AND ORDINAL_POSITION = 2))
 UNION ALL
SELECT CONCAT('FROM ', (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ServiceStatus'))

*/


/*	:::::::: Homework 4 :::::::::: */

/* 1 */
SELECT UserName FROM Users WHERE RoleID = 6

/* 2 */
SELECT UserName, Users.TavernID, Taverns.TavernName, Locations.LocationName FROM Users JOIN Taverns ON (USERS.TavernID = Taverns.TavernID) 
JOIN Locations ON (Taverns.LocationID = Locations.LocationID) WHERE RoleID = 6

/* 3 */
SELECT GuestClassLvl.ClassID, Lvl, Guests.GuestName, Class.ClassName FROM GuestClassLvl JOIN Guests ON (GuestClassLvl.GuestID = Guests.GuestID)
JOIN Class ON (GuestClassLvl.ClassID = Class.ClassID)
ORDER BY GuestName ASC

/* 4 */
SELECT TOP(10) Price, [Services].TavernService FROM Sales JOIN [Services] ON (Sales.ServiceID = [Services].ServiceID) ORDER BY Price DESC

/* 5 */
SELECT GuestName, COUNT(ClassID) AS MultiClasses FROM GuestClassLvl JOIN Guests ON(Guests.GuestID = GuestClassLvl.GuestID) GROUP BY GuestName HAVING COUNT(ClassID) >= 2

/* 6 */
SELECT GuestName, COUNT(ClassID) AS MultiClasses FROM GuestClassLvl JOIN Guests ON(Guests.GuestID = GuestClassLvl.GuestID) WHERE Lvl > 5 GROUP BY GuestName HAVING COUNT(ClassID) >= 2

/* 7 */
SELECT GuestName, MAX(Lvl) AS HighestLvl FROM GuestClassLvl JOIN Guests ON (GuestClassLvl.GuestID = Guests.GuestID) GROUP BY GuestName

/* 8 */
SELECT GuestName, DateStayed FROM RoomStay JOIN Guests ON (RoomStay.GuestID = Guests.GuestID) WHERE DateStayed BETWEEN '2010-10-12' AND '2015-06-20'

/* 9 */
SELECT CONCAT('CREATE TABLE ', TABLE_NAME, ' (') AS queryPiece
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Supplies'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME,' ', cols.DATA_TYPE, 
(CASE 
	WHEN CHARACTER_MAXIMUM_LENGTH IS NULL THEN ''
	ELSE CONCAT('(', (SELECT CHARACTER_MAXIMUM_LENGTH), ')')
	END)
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	THEN
		(CONCAT('FOREIGN KEY REFERENCES', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')'))
	ELSE ''
	END
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NULL AND keys.COLUMN_NAME IS NOT NULL
	THEN
		' PRIMARY KEY'
	ELSE ''
	END
,

',') AS queryPiece FROM INFORMATION_SCHEMA.COLUMNS AS cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS keys ON
(keys.TABLE_NAME = cols.TABLE_NAME AND keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS refConst ON
(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN (SELECT DISTINCT CONSTRAINT_NAME, COLUMN_NAME, TABLE_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) AS constKeys
ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
WHERE cols.TABLE_NAME = 'Supplies'
UNION ALL
SELECT')'




/* :::::::: Homework 5 :::::::: */ 
/* 1 */
SELECT UserName, RoleName, RoleDescription FROM Users JOIN Roles ON (Users.RoleID = Roles.RoleID)

/* 2 */
SELECT Class.ClassName, COUNT(Class.ClassID) AS TotalClasses FROM Class JOIN GuestClassLvl ON (Class.ClassID = GuestClassLvl.ClassID) GROUP BY Class.ClassName

/* 3 */
SELECT GuestName, Class.ClassName, Lvl,
(CASE
	WHEN Lvl <= 5 THEN 'Beginner'
	WHEN Lvl <= 10 THEN 'Intermediate'
	WHEN Lvl > 10 THEN 'Expert'
	END) AS Experience FROM Guests
JOIN GuestClassLvl ON (Guests.GuestID = GuestClassLvl.GuestID)
JOIN Class ON (GuestClassLvl.ClassID = Class.ClassID) ORDER BY GuestName ASC

/* 4 */
IF OBJECT_ID(N'dbo.groupLevel', N'FN') IS NOT NULL
	DROP FUNCTION dbo.groupLevel;
GO
CREATE FUNCTION dbo.groupLevel (@Lvl int)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @group varchar(50);
	SELECT @group = (CASE
						WHEN @Lvl <= 5 THEN '1-5'
						WHEN @Lvl <= 10 THEN '6-10'
						WHEN @Lvl > 10 THEN '10+'
						END)
	FROM GuestClassLvl as g
	WHERE g.Lvl = @Lvl;
	IF(@group IS NULL)
		SET @group = CONCAT('No classes with corresponding Lvl of ', @Lvl);
	RETURN @group
END;
SELECT dbo.groupLevel(12)

/* 5 */
IF OBJECT_ID(N'dbo.openRooms', N'FN') IS NOT NULL
	DROP FUNCTION dbo.openRooms;
GO
CREATE FUNCTION dbo.openRooms (@date DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT s.TavernID, r.RoomID FROM Rooms AS r JOIN RoomStay AS s ON(r.RoomID = s.RoomID) WHERE DateStayed != @date
);
	
/* Not sure how to return ALL rooms. This will only return rooms that have a date associated
	with them that do not match the date entered into the function */
SELECT * FROM dbo.openRooms('2010-10-11')

/* 6 */
IF OBJECT_ID(N'dbo.roomPrice', N'FN') IS NOT NULL
	DROP FUNCTION dbo.roomPrice;
GO
CREATE FUNCTION dbo.roomPrice (@status varchar(20))
RETURNS TABLE
AS
RETURN
(
	SELECT TavernID, MAX(Rate) AS MaxRate, MIN(Rate) AS MinRate FROM Rooms AS r JOIN RoomStatus AS s ON (r.RoomStatusID = s.RoomStatusID) WHERE s.Status = @status  GROUP BY TavernID
);
/* RoomStay table and Rooms table weren't initially created to handle the query you were actually looking for I think.
	Instead I ignored the date input and made it return the Max/Min price of rooms where the input is room status ('Available', 'Occupied') */
SELECT * FROM dbo.roomPrice('Available')

/* 7 */
SELECT TavernID, MaxRate, MinRate, MinRate - .01 AS Cheapest FROM dbo.roomPrice('Available')