--CREATE TABLE Halls
--(
--Id int identity(1,1) primary key,
--[Name] nvarchar(50) not null,
--SeatCount int
--)

--CREATE TABLE Customers
--(
--Id int identity(1,1) primary key,
--FullName nvarchar(50) not null
--)

--CREATE TABLE Seanses
--(
--Id int identity(1,1) primary key,
--SeansTime time default GetDate()
--)

--CREATE TABLE Movies
--(
--Id int identity(1,1) primary key,
--[Name] nvarchar(100) not null,
--ReleaseDate date default Getdate()
--)

--CREATE TABLE Actors
--(
--Id int identity(1,1) primary key,
--FullName nvarchar(50) not null
--)

--CREATE TABLE Genres
--(
--Id int identity(1,1) primary key,
--[Name] nvarchar(100) not null
--)

--CREATE TABLE MoviesGenres
--(
--Id int identity(1,1) primary key,
--MovieId int references Movies(Id),
--GenreId int references Genres(Id)
--)

--CREATE TABLE MoviesActors
--(
--Id int identity(1,1) primary key,
--MovieId int references Movies(Id),
--ActorId int references Actors(Id)
--)

--CREATE TABLE Tickets
--(
--Id int identity(1,1) primary key,
--MovieId int references Movies(Id),
--HallId int references Halls(Id),
--SeansId int references Seanses(Id),
--SeatId int not null,
--CustomerId int references Customers(Id),
--TicketId int references Tickets(Id),
--MovieTime datetime default Getdate(),
--Price money not null,
--)

  

--SELECT * FROM Ticktes AS t
--JOIN Halls As h
--t.HallId = h.Id
--JOIN Seanses As s
--t.SeansId = s.Id
--JOIN Seanses As s
--t.SeansId = s.Id

--yyyy-mm-dd hh:mm:ss