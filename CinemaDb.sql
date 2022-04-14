--Create Database CinemaDb
--Use CinemaDb
--CREATE TABLE Halls
--(
--Id int identity(1,1) primary key,
--[Name] nvarchar(250) not null,
--SeatCount int
--)

--CREATE TABLE Customers
--(
--Id int identity(1,1) primary key,
--FullName nvarchar(80) not null,
--Age int Check(Age > 0) not null
--)

--CREATE TABLE [Sessions]
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
--FullName nvarchar(80) not null,
--Age int Check(Age > 0) not null
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
--ActorId int references Actors(Id),
--MovieId int references Movies(Id)
--)

--CREATE TABLE Tickets
--(
--Id int identity(1,1) primary key,
--SoldDate datetime default GetDate(),
--Price money not null,
--Place int not null,
--MovieId int references Movies(Id),
--HallId int references Halls(Id),
--SessionsId int references [Sessions](Id),
--CustomerId int references Customers(Id)
--)

--1
--Alter Procedure usp_BuyTicket @HallId int, @SessionId int, @MovieId int, @CustomerId int
--As
--Begin
--If(Select GetEmptySeat(@HallId, @SessionId) != 0)
--Begin
--Select h.Name, t.Place From Tickets as t
--Join Halls As h
--On
--h.Id = t.HallId
--Group by h.Name, t.Place
--End
--End

--2
--ALTER Function GetEmptySeat (@HallId int, @SessionId int)
--Returns int
--As
--Begin
--Declare @Count int
--Select @Count = h.SeatCount - Count(s.Id) From Tickets as t
--Join Halls As h
--On
--h.Id = t.HallId
--Join [Sessions] as s
--On
--s.Id = t.SessionsId
--Where @HallId = h.Id and @SessionId = t.SessionsId
--Group by h.SeatCount, s.Id
--IF @COUNT IS NULL
--BEGIN
--	SELECT @Count =Halls.SeatCount FROM Tickets
--	JOIN Halls
--	ON Halls.Id=@HallId
--	JOIN [Sessions]
--	ON [Sessions].Id =@SessionId
--END
--	Return @Count
--End

Select dbo.GetEmptySeat (5, 5)