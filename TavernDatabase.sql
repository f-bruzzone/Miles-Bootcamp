drop table if exists Sales;
drop table if exists ServiceStatus;
drop table if exists TavernServices;
drop table if exists [Services];
drop table if exists Recieved;
drop table if exists Inventory;
drop table if exists Supplies;
drop table if exists BasementRats;
drop table if exists Roles;
drop table if exists Users;
drop table if exists Locations;
drop table if exists Taverns;


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

create table[Users](
	UserID int identity(1,1),
	UserName varChar(50),
	Birthday date,
	RoleID int,
	);

	insert into Users(UserName, Birthday, RoleID)
	values
		('John Wick', '1983-04-16', 2),
		('Ragnaros', '1990-09-03', 1),
		('Domo', '1978-05-18', 4),
		('Baron Geddon', '1995-01-28', 3),
		('Garr', '1988-05-12', 5),
		('Shazzrah', '2001-11-19', 3),
		('Lucifron', '1966-03-25', 2),
		('Golemagg', '1972-06-22', 1)

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
		('Janitor', 'Maintains the buildings overall cleanliness.')
		

create table[BasementRats](
	RatID int identity(1,1),
	RatName varChar(50),
	TavernID int
	);

	insert into BasementRats(RatName, TavernID)
	values
		('Dasher', 3),
		('Vixen', 5),
		('Donner', 1),
		('Comet', 3),
		('Blitzen', 4),
		('Cupid', 2),
		('Prancer', 1)


create table[Supplies](
	SupplyID int identity(1,1),
	SupplyName varChar(50),
	Unit varChar(50),
	Cost float,
	UnitDescription varChar(250)
	);

	insert into Supplies(SupplyName, Unit, Cost, UnitDescription)
	values
		('Barrel Keg' , 'Item Count', 111.99, 'Large barrel for alcohol storage.'),
		('Bottles', '24 pack', 25.00, 'Bottles for storing brewed ale.'),
		('Pints', '5 Pack', 14.75, 'Pint glasses for on-tap brews.'),
		('Stool', 'Item Count', 34.20, 'Tall seat for cutomers around the bar.'),
		('Broom', 'Item Count', 8.99, 'Soft bristle broom for sweeping.'),
		('Strong Ale', 'Keg', 178, 'Strong beverage on tap.'),
		('Quilt', 'Item Count', 42.68, 'Bedding for guests.'),
		('Silverware', '9 Pack', 3.24, 'Utensils for guests.'),
		('Plates', '5 Pack', 34.55, 'China for food service to guests.'),
		('Soap', '5 Pack', 5.99, 'Soap for cleaning all dishes/silverware/tables etc.')


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
		(2, 7, 4, '2018-10-11'),
		(6, 10, 4, '2021-01-04'),
		(3, 4, 2, '2020-11-20'),
		(2, 2, 2, '2021-01-02'),
		(1, 5, 2, '2019-04-13'),
		(4, 9, 5, '2017-08-26'),
		(1, 3, 4, '2018-04-20'),
		(5, 8, 3, '2019-06-10')


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

create table[Sales](
	SaleID int identity(1,1),
	ServiceID int,
	Guest varChar(50),
	Price float,
	DatePurchased date,
	AmtPurchased int,
	TavernID int
	);

	insert into Sales(ServiceID, Guest, Price, DatePurchased, AmtPurchased, TavernID)
	values
		(3, 'John Wick', 30.00, '2020-07-04', 1, 1),
		(1, 'Abraham Lincoln', 10.75, '2020-02-27', 1, 1),
		(4, 'Johnny Appleseed', 50.00, '2020-12-27', 2, 3),
		(2, 'Jon Snow', 25.50, '2021-01-03', 1, 5),
		(5, 'Rob Stark', 20.00, '2020-04-17', 1, 2)

