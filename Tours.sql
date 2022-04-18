--CREATE DATABASE Tours
--GO

--USE Tours
--GO

--CREATE TABLE DepartureCities
--   (DepartureCityID int PRIMARY KEY NOT NULL,  
--   DepartureCityName varchar(max) NOT NULL)
--GO

----DROP TABLE DepartureCities
----GO
--SELECT * FROM DepartureCities
--GO

--CREATE TABLE Countries
--   (CountryID int PRIMARY KEY NOT NULL,  
--   CountryName varchar(max) NOT NULL)
--GO

----DROP TABLE Countries
----GO
--SELECT * FROM Countries
--GO

--CREATE TABLE Tours
--   (TourID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
--   Price int NOT NULL,
--   NumberOfDays int NOT NULL,
--   DepartureCityID int FOREIGN KEY REFERENCES DepartureCities(DepartureCityID) NOT NULL,
--   CountryID int FOREIGN KEY REFERENCES Countries(CountryID) NOT NULL)
--   GO

----DROP TABLE Tours
----GO
--SELECT * FROM Tours
--GO

--INSERT INTO DepartureCities (DepartureCityID, DepartureCityName)
--VALUES
--  (832,'Moscow'),
--  (1266,'Kazan'),
--  (1264,'Saint Petersburg');

--INSERT INTO Countries (CountryID, CountryName)
--VALUES
--  (139,'Japan'),
--  (50,'Spain'),
--  (2,'Australia'),
--  (59,'China');

--INSERT INTO Tours (Price, NumberOfDays, DepartureCityID, CountryID)
--VALUES
--  (150000,7,832,139),
--  (160000,8,1266,139),
--  (155000,11,1264,139),
--  (84000,14,832,50),
--  (85000,24,1266,50),
--  (86000,20,1264,50),
--  (250000,9,832,2),
--  (240000,11,1266,2),
--  (260000,12,1264,2),
--  (130000,11,832,59);

------------ЗАПРОСЫ
------------1 Вывести список туров, отсортированных по убыванию стоимости
--SELECT TourID, Price FROM Tours ORDER BY Price DESC
--GO
------------2 Вывести список туров, отсортированных по возрастанию стоимости дня пребывания
--SELECT TourID, Price, NumberOfDays FROM Tours ORDER BY Price/NumberOfDays ASC
--GO
------------3 Вывести список туров, стоимостью "выше среднего по базе"
--SELECT TourID, Price FROM Tours WHERE Price > (SELECT AVG(Price) FROM Tours)
--GO
------------4 Вывести пары: {город, число туров}, используя группировку (GroupBy, Count)
--SELECT DepartureCityID, COUNT(*) AS NumberOfTours FROM Tours GROUP BY DepartureCityID
--GO
------------5 Извлечь тур с максимальной ценой, уценить его в полтора раза. Результат сохранить
--UPDATE Tours SET Price = Price/2 WHERE Price = (SELECT MAX(Price) FROM Tours)
--GO

--select * from Tours;
------------------откатить
--UPDATE Tours SET Price = Price*2 WHERE TourID = 8
--GO
------------6 Найти тур с минимальной ценой и удалить из базы
--DELETE FROM Tours WHERE Price = (SELECT MIN(Price) FROM Tours)
--GO
------------7 Найти страну с наименьшим числом туров и добавить в неё новый

--DECLARE @minNumberOfToursCountryID INT = (SELECT TOP(1) CountryID
--FROM Tours
--GROUP BY CountryID
--ORDER BY COUNT(*));

--SELECT @minNumberOfToursCountryID;

--INSERT INTO Tours (Price, NumberOfDays, DepartureCityID, CountryID)
--VALUES (135000,14,1266,@minNumberOfToursCountryID);

----------откат
--SELECT * FROM Tours
--DELETE FROM Tours WHERE TourID=11;

--DROP DATABASE Tours;
--DROP Table Tours;