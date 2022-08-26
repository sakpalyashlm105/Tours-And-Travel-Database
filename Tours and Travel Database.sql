Create database Group5_Project

Use Group5_Project

-- CUSTOMER TABLE
Create Table Customer(
Customer_id INT PRIMARY KEY NOT NULL,
Customer_FirstName Varchar(45) NOT NULL,
Customer_LastName Varchar(45),
Mobile_Number BIGINT NOT NULL,
Street_Address Varchar(45) NOT NULL,
City Varchar(45) NOT NULL,
State Varchar(45) NOT NULL,
Country_Zipcode Varchar(45) NOT NULL,
)

INSERT INTO CUSTOMER VALUES(101, 'Daksh', 'Palsana', 9867905482,'Park Drive', 'Boston', 'Massachusetts', 02145)
INSERT INTO CUSTOMER VALUES(102, 'Surabhi', 'Shende', 9967903491,'773 Bolyston Street', 'Boston', 'Massachusetts', 02138)
INSERT INTO CUSTOMER VALUES(103, 'Rishabh', 'Patil', 8574379616,'75 Saint Alphonsus Street', 'Boston', 'Massachusetts', 02120)
INSERT INTO CUSTOMER VALUES(104, 'Yash', 'Sakpal', 8867548901,'Smith Street', 'Boston', 'Massachusetts', 02121)
INSERT INTO CUSTOMER VALUES(105, 'Shraddha', 'Padalkar', 8572690817,'75 Saint Alphonsus Street', 'Boston', 'Massachusetts', 02120)
INSERT INTO CUSTOMER VALUES(106, 'Jigna', 'V', 5768903212,'Hungtinton Avenue', 'Boston', 'Massachusetts', 02130)
INSERT INTO CUSTOMER VALUES(107, 'Mayuri', 'Jadhav', 8390491380,'Time Square', 'New York', 'New York', 44756)
INSERT INTO CUSTOMER VALUES(108, 'John', 'Doe', 9087654321,'Journal Square', 'Jersey City', 'New Jersey', 56789)
INSERT INTO CUSTOMER VALUES(109, 'Danny', 'Gomez', 6607895436,'119 Broadway', 'Jersey City', 'New Jersey', 67890)
INSERT INTO CUSTOMER VALUES(110, 'Sana', 'Patel', 7823232324,'Seaport', 'Boston', 'Massachusetts', 02456)
ALTER TABLE Customer ADD DateofBirth DATETIME
UPDATE Customer
SET DateofBirth = DATEADD(day, (ABS(CHECKSUM(NEWID())) % 365), '01/01/1998')
Select * from CUSTOMER 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PACKAGE TABLE
Create Table Package(
Customer_id INT NOT NULL references Customer (Customer_id),
Package_Name Varchar(45),
Package_id INT PRIMARY KEY,
)

INSERT INTO Package VALUES(101, 'MiddleEast', 0021)
INSERT INTO Package VALUES(102, 'Europe', 0022)
INSERT INTO Package VALUES(101, 'Wild Wild west', 0023)
INSERT INTO Package VALUES(104, 'Hawai ki Jawaani', 0024)
INSERT INTO Package VALUES(102, 'Southeast Asia', 0025)
INSERT INTO Package VALUES(103, 'South America', 0026)
INSERT INTO Package VALUES(104, 'Japan', 0027)
INSERT INTO Package VALUES(105, 'North Korea', 0028)
INSERT INTO Package VALUES(106, 'Pakistan to Syria', 0029)
INSERT INTO Package VALUES(105, 'Dubai', 0030)
INSERT INTO Package VALUES(107, 'MiddleWest', 0031)
INSERT INTO Package VALUES(108, 'Australia', 0032)
INSERT INTO Package VALUES(108, 'Cold Cold North', 0033)
INSERT INTO Package VALUES(109, 'Badland Thailand', 0034)
INSERT INTO Package VALUES(110, 'Southwest Asia', 0035)


Update Package set customer_id = 102 where Package_id = 0033

Select * from Package order by customer_id 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PAYMENT TABLE 
Create Table Payment(
Paymnet_id INT PRIMARY KEY,
Payment_mode Varchar(45),
customer_id INT NOT NULL References Customer(Customer_id),
Booking_id INT NOT NUll References Booking(Booking_id)
)
Insert INTO Payment VALUES(606901, 'Credit card' ,101,51 )
Insert INTO Payment VALUES(606902, 'Debit card' ,102,52 )
Insert INTO Payment VALUES(606903, ' E-check' , 102,61)
Insert INTO Payment VALUES(606987, ' E-check' , 102,66)
Insert INTO Payment VALUES(606904, 'Wire Transfer' ,103,63 )
Insert INTO Payment VALUES(606905, 'Cash' ,103,53 )
Insert INTO Payment VALUES(606906, 'Credit card' ,104,54 )
Insert INTO Payment VALUES(606907, 'Debit card' , 105,55)
Insert INTO Payment VALUES(606908, 'Credit card' ,106,56 )
Insert INTO Payment VALUES(606909, 'E-check' , 107,57)
Insert INTO Payment VALUES(606955, 'E-check' , 107,62)
Insert INTO Payment VALUES(606910, 'Cash' ,108,58 )
Insert INTO Payment VALUES(606911, 'E-check' ,109,59 )
Insert INTO Payment VALUES(606912, 'Credit-card' ,109,64 )
Insert INTO Payment VALUES(606913, 'Cash' ,110,65)
Insert INTO Payment VALUES(606914, 'Debit card' ,110,60 )

Select * from Payment Order by Customer_id 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--BOOKING TABLE
Create Table Booking(
Customer_id INT NOT NULL references Customer (Customer_id),
Package_id INT NOT NULL references Package (Package_id),
Flight_id INT NOT NULL references Flights (Flight_id),
Booking_id INT PRIMARY KEY,
)

INSERT INTO Booking VALUES(101,0021,11139,0051)
INSERT INTO Booking VALUES(102,0022,11174,0052)
INSERT INTO Booking VALUES(103,0023,11104,0053)
INSERT INTO Booking VALUES(104,0024,11128,0054)
INSERT INTO Booking VALUES(105,0025,11125,0055)
INSERT INTO Booking VALUES(106,0026,11130,0056)
INSERT INTO Booking VALUES(107,0027,11132,0057)
INSERT INTO Booking VALUES(108,0028,11141,0058)
INSERT INTO Booking VALUES(109,0029,11157,0059)
INSERT INTO Booking VALUES(110,0030,11133,0060)
INSERT INTO Booking VALUES(102,0024,11128,0061)
INSERT INTO Booking VALUES(107,0025,11122,0062)
INSERT INTO Booking VALUES(103,0021,11140,0063)
INSERT INTO Booking VALUES(109,0025,11126,0064)
INSERT INTO Booking VALUES(110,0026,11129,0065)
INSERT INTO Booking VALUES(102,0030,11134,0066)

select * from booking order by Customer_id 

Update booking set Package_id = 25 where booking_id = 61
Update booking set Package_id = 33 where booking_id = 66
 Update Booking SET Package_id= 26 where Flight_id = 11140
  Update Booking SET Package_id= 28 where Flight_id = 11125
    Update Booking SET Package_id= 29 where Flight_id = 11130
Update Booking SET Package_id= 31 where Flight_id = 11132
Update Booking SET Package_id= 32 where Flight_id = 11141
Update Booking SET Package_id= 34 where Flight_id = 11157
Update Booking SET Package_id= 35 where Flight_id = 11129


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FLIGHTS TABLE 
Create Table Flights(
Flight_id INT PRIMARY KEY NOT NULL,
Flight_name VARCHAR(45) NOT NULL,
Place_id INT NOT NULL References Places(place_id),
Package_id INT NOT NULL References Package(Package_id))

--india
INSERT INTO Flights VALUES(11115, 'Vistara', 11,25)
INSERT INTO Flights VALUES(11116, 'Air India', 11,25)
-- Brazil
INSERT INTO Flights VALUES(11113, 'Southwest', 12,26)
INSERT INTO Flights VALUES(11114, 'United', 12,26)
-- China
INSERT INTO Flights VALUES(11111, 'Delta', 13,25)
INSERT INTO Flights VALUES(11122, 'Vistara', 13,25)
-- Paris
INSERT INTO Flights VALUES(11123, 'France Airlines', 14,22)
INSERT INTO Flights VALUES(11124, 'Air France', 14,22)
--Thailand 
INSERT INTO Flights VALUES(11125, 'Malaysian Airlines', 15,25)
INSERT INTO Flights VALUES(11126, 'Jet Thai', 15,25)
-- Hawai
INSERT INTO Flights VALUES(11127, 'Hawaiian Airlines', 16,24)
INSERT INTO Flights VALUES(11128, 'Jet HAwai', 16,24)
-- Rio 
INSERT INTO Flights VALUES(11129, 'Southwest', 17,26)
INSERT INTO Flights VALUES(11130, 'UnitedRio', 17,26)
-- North Korea 
INSERT INTO Flights VALUES(11141, 'NorthKorea', 18,28)
INSERT INTO Flights VALUES(11142, 'UnitedKorea', 18,28)
INSERT INTO Flights VALUES(11131, 'Japan Airlines', 17,27)
INSERT INTO Flights VALUES(11132, 'Air Japan', 17,26)
Update flights SEt Place_id= 19 where Flight_id = 11131
Update flights SEt Place_id= 19  where Flight_id = 
Update flights SEt Package_id= 27  where Flight_id = 1113
INSERT INTO Flights VALUES(11133, 'Emirates', 20,30)
INSERT INTO Flights VALUES(11134, 'Dubai Airlines', 20,30)
INSERT INTO Flights VALUES(11193, 'Qatar', 23,21)
INSERT INTO Flights VALUES(11104, 'Israel Air', 23,21)
Update flights SEt Place_id= 21 where Flight_id = 11139
Update flights SEt Place_id= 21  where Flight_id = 11140
INSERT INTO Flights VALUES(11137, 'Southwest', 17,26)
INSERT INTO Flights VALUES(11138, 'UnitedRio', 17,26)
INSERT INTO Flights VALUES(11139, 'Southwest', 17,26)
INSERT INTO Flights VALUES(11140, 'UnitedRio', 17,26)
INSERT INTO Flights VALUES(11174, 'German Air', 24,22)
INSERT INTO Flights VALUES(11147, 'Munich Airlines', 24,22)
INSERT INTO Flights VALUES(11144, 'AAirlines', 25,22)
INSERT INTO Flights VALUES(11145, 'Air Austria', 25,22)
INSERT INTO Flights VALUES(11146, 'France Airlines', 26,22)
INSERT INTO Flights VALUES(11148, 'AirNetherland', 26,22)
INSERT INTO Flights VALUES(11149, 'Canadian Airlines', 27,23)
INSERT INTO Flights VALUES(11150, 'AirCanada', 27,23)
INSERT INTO Flights VALUES(11151, 'SouthAirlines', 28,23)
INSERT INTO Flights VALUES(11152, 'AirMexico', 28,23)
INSERT INTO Flights VALUES(11153, 'Delta Airlines', 29,23)
INSERT INTO Flights VALUES(11154, 'American Airlines', 29,23)
INSERT INTO Flights VALUES(11157, 'Luftansa', 31,29)
INSERT INTO Flights VALUES(11158, 'Ethiad', 31,29)
INSERT INTO Flights VALUES(11153, 'Delta Airlines', 29,23)
INSERT INTO Flights VALUES(11154, 'American Airlines', 29,23)
INSERT INTO Flights VALUES(11155, 'Afgani Airlines', 32,31)
INSERT INTO Flights VALUES(11156, 'Emirates', 32,31)
INSERT INTO Flights VALUES(11186, 'Delta Airlines', 33,31)
INSERT INTO Flights VALUES(11158, 'Afgani Airlines', 32,31)
INSERT INTO Flights VALUES(11159, 'Singapore Airlines', 34,32)
INSERT INTO Flights VALUES(11160, 'Singapore Airlines', 34,32)/
INSERT INTO Flights VALUES(11161, 'Delta Airlines', 35,33)
INSERT INTO Flights VALUES(11162, 'VP airlines', 35,33)
INSERT INTO Flights VALUES(11163, 'Air Asia', 36,34)
INSERT INTO Flights VALUES(11165, 'Malysian Airlines', 36,34
INSERT INTO Flights VALUES(11166, 'Singapore Airlines', 37,34)
INSERT INTO Flights VALUES(11167, 'Singapore Airlines', 37,34)
INSERT INTO Flights VALUES(11168, 'Vistara', 38,35)
INSERT INTO Flights VALUES(11169, 'Spice Jet', 39,35)
INSERT INTO Flights VALUES(11109, 'Spice Jet', 22,21)
INSERT INTO Flights VALUES(11169, 'Spice Jet', 39,35)

Select * from FLights order by Place_id

delete from Flights where flight_id = 11138

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Payment Table
Use Group5_Project
Create Table Payment(
Paymnet_id INT PRIMARY KEY,
Payment_mode Varchar(45),
customer_id INT NOT NULL References Customer(Customer_id),
Booking_id INT NOT NUll References Booking(Booking_id)
)

Insert INTO Payment VALUES(606901, 'Credit card' ,101,51 )
Insert INTO Payment VALUES(606902, 'Debit card' ,102,52 )
Insert INTO Payment VALUES(606903, ' E-check' , 102,61)
Insert INTO Payment VALUES(606987, ' E-check' , 102,66)
Insert INTO Payment VALUES(606904, 'Wire Transfer' ,103,63 )
Insert INTO Payment VALUES(606905, 'Cash' ,103,53 )
Insert INTO Payment VALUES(606906, 'Credit card' ,104,54 )
Insert INTO Payment VALUES(606907, 'Debit card' , 105,55)
Insert INTO Payment VALUES(606908, 'Credit card' ,106,56 )
Insert INTO Payment VALUES(606909, 'E-check' , 107,57)
Insert INTO Payment VALUES(606955, 'E-check' , 107,62)
Insert INTO Payment VALUES(606910, 'Cash' ,108,58 )
Insert INTO Payment VALUES(606911, 'E-check' ,109,59 )
Insert INTO Payment VALUES(606912, 'Credit-card' ,109,64 )
Insert INTO Payment VALUES(606913, 'Cash' ,110,65)
Insert INTO Payment VALUES(606914, 'Debit card' ,110,60 )

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PLACE TABLE 
Create Table Places(
place_id INT PRIMARY KEY NOT NULL,
place_name Varchar(45) NOT NULL, 
PackageId INT NOT NULL References Package(Package_id))


Insert into Places Values (11, 'India', 25)
Insert into Places Values (12, 'Brazil', 26)
Insert into Places Values (13, 'China', 25)
Insert into Places Values (14, 'Paris', 22)
Insert into Places Values (15, 'Thailand', 25)
Insert into Places Values (16, 'Hawai', 24)
Insert into Places Values (17, 'Rio di janerio', 26)
Insert into Places Values (18, 'North Korea', 28)
Insert into Places Values (19, 'Japan', 27)
Insert into Places Values (20, 'Dubai', 30)
Insert into Places Values (21, 'Bahrain', 21)
Insert into Places Values (22, 'Qatar', 21)
Insert into Places Values (23, 'Israel', 21)
Insert into Places Values (24, 'Germany', 22)
Insert into Places Values (25, 'France', 22)
Insert into Places Values (26, 'Netherland', 22)
Insert into Places Values (27, 'Canada', 23)
Insert into Places Values (28, 'Mexico', 23)
Insert into Places Values (29, 'USA', 23)
Insert into Places Values (30, 'Pakistan', 29)
Insert into Places Values (31, 'Syria', 29)
Insert into Places Values (32, 'Afghanistan', 31)
Insert into Places Values (33, 'Algerbian', 31)
Insert into Places Values (34, 'Australia', 32)
Insert into Places Values (35, 'Russia', 33)
Insert into Places Values (36, 'Malaysia', 34)
Insert into Places Values (37, 'Singapore', 34)
Insert into Places Values (38, 'Nepal', 35)

Select * from Places

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EMPLOYEE Table 

Create Table Employee(
Employee_id INT not null PRIMARY KEY,
Employeename Varchar(45) not null,
Street_address Varchar(45) not null,
City Varchar(45) not null,
State Varchar(45) not null,
Country Varchar(45) not null,
Zipcode Varchar(45) not null,
Roles_employee_id INT not null references Roles(Roles_employee_id))

INSERT INTO Employee VALUES('100','Joe Anderson','Smith Street','Boston','Massachusetts','USA','02215', '202101')
INSERT INTO Employee VALUES('102','Jasmine Mintz','Lambert Street','Boston','Massachusetts','USA','02215', '202102')
INSERT INTO Employee VALUES('104','Jose Yu','Alphonsus Street','Boston','Massachusetts','USA','02120', '202103')
INSERT INTO Employee VALUES('120','Emma Finn','Calumet Street','Boston','Massachusetts','USA','02120', '202104')
INSERT INTO Employee VALUES('152','Sophia Singh','Saint Street','Boston','Massachusetts','USA','02215', '202105')
INSERT INTO Employee VALUES('144','Julie Harper','Park Street','Boston','Massachusetts','USA','02120', '202106')
INSERT INTO Employee VALUES('126','Juhi Bennet','Baxton Street','Boston','Massachusetts','USA','02215', '202107')
INSERT INTO Employee VALUES('130','Sun Gang','Lambert Street','Boston','Massachusetts','USA','02215', '202108')
INSERT INTO Employee VALUES('155','Lilly Bond','Government Street','Boston','Massachusetts','USA','02120', '202109')
INSERT INTO Employee VALUES('160','Juan Holmes','Alphonsus Street','Boston','Massachusetts','USA','02120', '202110')
ALTER TABLE Employee ADD DateofBirth DATETIME
UPDATE Employee
SET DateofBirth = DATEADD(day, (ABS(CHECKSUM(NEWID())) % 365), '01/01/1997')
Select * from Employee

Select * from Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EMPLOYEELOGIN TABLE 
Create Table employeeLogin(
email Varchar(255) not null PRIMARY KEY,
password Varchar(32) not null,
Employee_id INT not null references 
Employee(Employee_id)
)

INSERT INTO employeeLogin VALUES('joe@gmail.com', 'joe123', '100')
INSERT INTO employeeLogin VALUES('jasmine@gmail.com', 'jas243', '102')
INSERT INTO employeeLogin VALUES('jose@gmail.com', 'jose@43', '104')
INSERT INTO employeeLogin VALUES('emma@gmail.com', 'emm@985', '120')
INSERT INTO employeeLogin VALUES('sophia@gmail.com', 'sop#43', '152')
INSERT INTO employeeLogin VALUES('julie@gmail.com', 'julia@999', '144')
INSERT INTO employeeLogin VALUES('juhi@gmail.com', 'juhianderson243', '126')
INSERT INTO employeeLogin VALUES('sun@gmail.com', 'sun@333!', '130')
INSERT INTO employeeLogin VALUES('lilly@gmail.com', 'lilly@1009', '155')
INSERT INTO employeeLogin VALUES('juan@gmail.com', 'juan$243', '160')
Select * from Employee 

-- Encryption of EmployeePassword 
ALter Table employeeLogin ADD EmployeePassword VARBINARY(MAX)
	-- Create Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'NEUHuskyy!'

-- Create certificate For symmetric key
CREATE CERTIFICATE TestCertificate 
WITH SUBJECT = 'Password _protection';

-- Create symmetric key for data Encryption
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

--  Encrypt using Symmertic Key
UPDATE employeeLogin
        SET EmployeePassword = EncryptByKey (Key_GUID('TestSymmetricKey'), password)
        FROM employeeLogin
        GO

-- Close the Symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey ;
            Go

	                                                                                                                 
Select * from employeeLogin

-- Decryption of Employee Password
-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

-- Use DecruptByKey to show the Decrypted Password
SELECT email,employee_id,EmployeePassword AS 'Encrypted data',
            CONVERT(varchar, DecryptByKey(EmployeePassword)) AS 'Decrypted Password'
            FROM employeelogin;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--USER LOGIN TABLE
Create Table userLogin(
user_email Varchar(255) not null PRIMARY KEY,
password Varchar(32) not null,
Customer_id  INT not null references 
Customer(Customer_id)
)

INSERT INTO userLogin VALUES('daksh@gmail.com', 'dak@1998','101')
INSERT INTO userLogin VALUES('surabhi09@gmail.com', 'sura@1098','102')
INSERT INTO userLogin VALUES('rishi@yahoo.com', 'rishabh12','103')
INSERT INTO userLogin VALUES('yashsak@gmail.com', 'yash123@71','104')
INSERT INTO userLogin VALUES('shradzz@yahoo.com','shradz99','105')
INSERT INTO userLogin VALUES('jigna@gmail.com','jigzz99','106')
INSERT INTO userLogin VALUES('mayuri@gmail.com','mayurr@99','107')
INSERT INTO userLogin VALUES('doejohn@gmail.com','john@123','108')
INSERT INTO userLogin VALUES('danny@yahoo.com','dann#456', '109')
INSERT INTO userLogin VALUES('patelsana@yahoo.com','sana@999','110')

Select * from userLogin

-- Encryption of the User Password
ALter Table userLogin ADD userPassword VARBINARY(MAX)

-- Symmectric Key is already created
-- Open Symmectric Key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

-- Encryption using symmectric key
UPDATE userLogin
        SET userPassword = EncryptByKey (Key_GUID('TestSymmetricKey'), password)
        FROM userLogin
        GO
Select * from userLogin

-- close Symmectric Key
CLOSE SYMMETRIC KEY TestSymmetricKey ;
-- Decrpytion of Userpassword
-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

-- Use DecruptByKey to show the Decrypted Password
SELECT user_email,Customer_id,userPassword AS 'Encrypted data',
            CONVERT(varchar, DecryptByKey(userPassword)) AS 'Decrypted Password'
            FROM userLogin;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--ROLES TABLE

Create Table Roles(
Roles_employee_id INT PRIMARY KEY,
Role_name Varchar(45),)

Insert INTO Roles VALUES(202101, 'Manager')
Insert INTO Roles VALUES(202102, 'Assistant')
Insert INTO Roles VALUES(202103, 'Driver')
Insert INTO Roles VALUES(202104, 'Consultant')
Insert INTO Roles VALUES(202105, 'Guide')
Insert INTO Roles VALUES(202106, 'Travel Agent')
Insert INTO Roles VALUES(202107, 'Tour operator')
Insert INTO Roles VALUES(202108, 'Secretary')
Insert INTO Roles VALUES(202109, 'IT consultany')
Insert INTO Roles VALUES(202110 ,'Finance Manager')
 Select * from Roles
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 --GUIDE TABLE
Create Table Guide(
Guide_id INT PRIMARY KEY NOT NULL,
Guide_name VARCHAR(45) NOT NULL,
Package_id INT NOT NULL References Package(Package_id)) 

INSERT INTO Guide VALUES(111, 'Trishank A',21)
INSERT INTO Guide VALUES(112, 'Vinay A',22)
INSERT INTO Guide VALUES(113, 'Shyam P',23)
INSERT INTO Guide VALUES(114, 'Parth C',24)
INSERT INTO Guide VALUES(115, 'Ankit G',25)
INSERT INTO Guide VALUES(116, 'Ashish D',26)
INSERT INTO Guide VALUES(117, 'Anuj D',27)
INSERT INTO Guide VALUES(118, 'Paul P',28)
INSERT INTO Guide VALUES(119, 'Jignesh K',29)
INSERT INTO Guide VALUES(120, 'Ramesh D',30)
INSERT INTO Guide VALUES(121, 'Trisha M',21)
INSERT INTO Guide VALUES(122, 'Samauel G',22)
INSERT INTO Guide VALUES(123, 'Shakira J',23)
INSERT INTO Guide VALUES(124, 'Meena C',24)
INSERT INTO Guide VALUES(125, 'Ajinkya G',25)
INSERT INTO Guide VALUES(126, 'Manasi D',26)
INSERT INTO Guide VALUES(127, 'Aditya D',27)
INSERT INTO Guide VALUES(128, 'Paula P',28)
INSERT INTO Guide VALUES(129, 'Jigna J',29)
INSERT INTO Guide VALUES(130, 'Ramyata S',30)
INSERT INTO Guide VALUES(120, 'Ramesh D',30)

INSERT INTO Guide VALUES(131, 'John M',31)
INSERT INTO Guide VALUES(132, 'Dawn G',31)
INSERT INTO Guide VALUES(133, 'Shaheen J',32)
INSERT INTO Guide VALUES(134, 'Sagar C',33)
INSERT INTO Guide VALUES(135, 'Jeena S',33)
INSERT INTO Guide VALUES(136, 'Elena D',34)
INSERT INTO Guide VALUES(137, 'Damon D',34)
INSERT INTO Guide VALUES(138, 'Stefan P',32)
INSERT INTO Guide VALUES(139, 'Jeremy J',35)
INSERT INTO Guide VALUES(140, 'Bonnie S',35)


select * from guide order by package_id

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOTEL TABLE
Create Table Hotel(
Hotel_id INT PRIMARY KEY NOT NULL,
Hotel_Name Varchar(45) NOT NULL, 
Place_id INT NOT NULL References Places(place_id),
Package_id INT NOT NULL References Package(Package_id))

INSERT INTO Hotel VALUES(1, 'Hilton', 11,25)
INSERT INTO Hotel VALUES(2, 'MainStays', 12,26)
INSERT INTO Hotel VALUES(3, 'Sofitel', 14,22)
INSERT INTO Hotel VALUES(4, 'Marriott', 14,22)
INSERT INTO Hotel VALUES(5, 'EcoStay', 24,22)
INSERT INTO Hotel VALUES(6, 'Taj', 24,22)
INSERT INTO Hotel VALUES(7, 'EverGreen', 25,22)
INSERT INTO Hotel VALUES(8, 'Hampton Inn', 25,22)
INSERT INTO Hotel VALUES(9, 'Conrad', 26,22)
INSERT INTO Hotel VALUES(10, 'Grand Hyatt', 26,22)
INSERT INTO Hotel VALUES(11, 'Pasha', 11,25)
INSERT INTO Hotel VALUES(12, 'Pasha by AC hotels', 13,25)
INSERT INTO Hotel VALUES(13, 'Grand Taj', 13,25)
INSERT INTO Hotel VALUES(14, 'JW Marriott', 15,25)
INSERT INTO Hotel VALUES(15, 'Ajanta Hotels', 15,25)
INSERT INTO Hotel VALUES(16, 'Rama Hotel', 12,26)
INSERT INTO Hotel VALUES(17, 'Waterstones', 12,26)
INSERT INTO Hotel VALUES(18, 'Orchard', 17,26)
INSERT INTO Hotel VALUES(19, 'Lalit', 17,26)
INSERT INTO Hotel VALUES(20, 'W Hotels', 16,24)
INSERT INTO Hotel VALUES(21, 'Hotel Hawaii Inn', 16,24)
INSERT INTO Hotel VALUES(22, 'Sahara Star', 18,28)
INSERT INTO Hotel VALUES(23, 'Tropicana Villas', 18,28)
INSERT INTO Hotel VALUES(24, 'Quality Inn', 19,27)
INSERT INTO Hotel VALUES(25, 'Green Leaf', 19,27)
INSERT INTO Hotel VALUES(26, 'CVM Hotels', 20,30)
INSERT INTO Hotel VALUES(27, 'Courtyard by Marriott', 20,30)
INSERT INTO Hotel VALUES(28, 'Residence Inn', 21,21)
INSERT INTO Hotel VALUES(29, 'The Verb Hotel', 21,21)
INSERT INTO Hotel VALUES(30, 'The Inn at Longwood', 22,21)
INSERT INTO Hotel VALUES(31, 'Merwana', 22,21)
INSERT INTO Hotel VALUES(32, 'The Inn at Longwood', 23,21)
INSERT INTO Hotel VALUES(33, 'Sun and Sands', 23,21)
INSERT INTO Hotel VALUES(34, 'The Verb Hotel', 30,29)
INSERT INTO Hotel VALUES(35, 'The Inn at Longwood', 31,29)
INSERT INTO Hotel VALUES(36, 'Merwana', 30,29)
INSERT INTO Hotel VALUES(37, 'The Inn at Longwood', 31,29)
INSERT INTO Hotel VALUES(38, 'Sun and Sands', 27,23)
INSERT INTO Hotel VALUES(39, 'CVM Hotels', 27,23)
INSERT INTO Hotel VALUES(40, 'Sun and Sands', 28,23)
INSERT INTO Hotel VALUES(41, 'Hotel Renaisance Inn',29 ,23)
INSERT INTO Hotel VALUES(42, 'Sahara Star', 29,23)
INSERT INTO Hotel VALUES(43, 'Tropicana Villas', 28,23)

INSERT INTO Hotel VALUES(44, 'The V Hotel', 32,31)
INSERT INTO Hotel VALUES(45, 'The Inn at Longwood', 32,31)

INSERT INTO Hotel VALUES(46, 'Merwana by Pasha', 33,31)
INSERT INTO Hotel VALUES(47, 'The Inn at Downtown', 33,31)
INSERT INTO Hotel VALUES(48, 'Sun and Sands by Beach', 34,32)
INSERT INTO Hotel VALUES(49, 'RM Hotels', 34,32)
INSERT INTO Hotel VALUES(50, 'Sun and Sands', 35,33)
INSERT INTO Hotel VALUES(51, 'Renaisance Inn',36 ,34)
INSERT INTO Hotel VALUES(52, 'Sahara Hotels', 36,34)
INSERT INTO Hotel VALUES(53, 'T Villas', 37,34)
INSERT INTO Hotel VALUES(54, 'Jeju Villas', 37,34)
INSERT INTO Hotel VALUES(55, 'Marriott Suites', 38,35)
INSERT INTO Hotel VALUES(56, 'Hotel Nero', 38,35)


Select * from Hotel order by package_id

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FEEDBACK TABLE 

Create Table Feedback(
Customer_id INT NOT NULL references Customer (Customer_id),
Feedback_id INT Primary Key,
Feedback_Name Varchar(45),
)

INSERT INTO Feedback VALUES(101,0071,'Amazing customer service')
INSERT INTO Feedback VALUES(102,0072,'Needs improvement')
INSERT INTO Feedback VALUES(103,0073,'Average')
INSERT INTO Feedback VALUES(104,0074,'Great')
INSERT INTO Feedback VALUES(105,0075,'Loved the service')
INSERT INTO Feedback VALUES(106,0076,'Happy')
INSERT INTO Feedback VALUES(107,0077,'Cute')
INSERT INTO Feedback VALUES(108,0078,'Smooth')
INSERT INTO Feedback VALUES(109,0079,'Crazy service')
INSERT INTO Feedback VALUES(110,0080,'Sweet')
INSERT INTO Feedback VALUES(106,0081,'Awesome')
INSERT INTO Feedback VALUES(107,0082,'Loved the Service')
INSERT INTO Feedback VALUES(108,0083,'Amazing Service')
INSERT INTO Feedback VALUES(109,0084,'Nice')
INSERT INTO Feedback VALUES(110,0085,'Great Service')
INSERT INTO Feedback VALUES(101,0086,'Great Service')
INSERT INTO Feedback VALUES(102,0087,'Average')
INSERT INTO Feedback VALUES(103,0088,'Needs improvement')
INSERT INTO Feedback VALUES(104,0089,'Loved the service')

select * from Feedback order by customer_id 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Restaurants TABLE
Create Table Restaurants(
Restaurant_id INT PRIMARY KEY,
Restaurant_name Varchar(45),
Hotel_id INT NOT NULL References Hotel(Hotel_id)
)

Insert INTO Restaurants VALUES(101201, 'Dharas ka Dhaba' ,6 )
Insert INTO Restaurants VALUES(101202, 'puneri misal' ,2 )
Insert INTO Restaurants VALUES(101203, 'Punjabi Chaska' , 7)
Insert INTO Restaurants VALUES(101204, 'Crappy Crab' ,1 )
Insert INTO Restaurants VALUES(101205, 'Mikes' ,8 )
Insert INTO Restaurants VALUES(101206, 'don Juilos Oyesterbar' , 9)
Insert INTO Restaurants VALUES(101207, 'Curlies' ,10 )
Insert INTO Restaurants VALUES(101208, 'Malibu Club' , 4)
Insert INTO Restaurants VALUES(101209, 'hooters' ,3 )
Insert INTO Restaurants VALUES(101210, 'Wings over boston' , 5)

Insert INTO Restaurants VALUES(101211, 'Dharas ka Dhaba' ,7 )
Insert INTO Restaurants VALUES(101212, 'puneri misal' ,6 )
Insert INTO Restaurants VALUES(101213, 'Punjabi Chaska' , 2)
Insert INTO Restaurants VALUES(101214, 'Crappy Crab' ,8)
Insert INTO Restaurants VALUES(101215, 'Mikes' ,1)
Insert INTO Restaurants VALUES(101216, 'don Juilos Oyesterbar' , 4)
Insert INTO Restaurants VALUES(101217, 'Curlies' ,9 )
Insert INTO Restaurants VALUES(101218, 'Malibu Club' , 3)
Insert INTO Restaurants VALUES(101219, 'hooters' ,5 )
Insert INTO Restaurants VALUES(101220, 'Wings over boston' , 10)


--20
Insert INTO Restaurants VALUES(101221, 'Dharavi Dhaba' ,11 )
Insert INTO Restaurants VALUES(101222, 'sadhana misal' ,12 )
Insert INTO Restaurants VALUES(101223, 'Punjab Express' , 13)
Insert INTO Restaurants VALUES(101224, 'Encore' ,14 )
Insert INTO Restaurants VALUES(101225, 'Milkweed' ,15 )
Insert INTO Restaurants VALUES(101226, 'don Juilos Oyesterbar' , 16)
Insert INTO Restaurants VALUES(101227, 'Curls' ,17 )
Insert INTO Restaurants VALUES(101228, 'Miami Club' , 18)
Insert INTO Restaurants VALUES(101229, 'hawli' ,19 )
Insert INTO Restaurants VALUES(101230, 'Wings over chicken' , 20)

Insert INTO Restaurants VALUES(101231, 'Dharavi Dhaba' ,12 )
Insert INTO Restaurants VALUES(101232, 'sadhana misal' ,11 )
Insert INTO Restaurants VALUES(101233, 'Punjab Express' , 14)
Insert INTO Restaurants VALUES(101234, 'Encore' ,15)
Insert INTO Restaurants VALUES(101235, 'Milkweed' ,16 )
Insert INTO Restaurants VALUES(101236, 'don Juilos Oyesterbar' , 13)
Insert INTO Restaurants VALUES(101237, 'Curls' ,19 )
Insert INTO Restaurants VALUES(101238, 'Miami Club' , 20)
Insert INTO Restaurants VALUES(101239, 'hawli' ,18 )
Insert INTO Restaurants VALUES(101240, 'Wings over chicken' , 17)

--30
Insert INTO Restaurants VALUES(101241, 'Dharas ka Dhaba' ,21)
Insert INTO Restaurants VALUES(101242, 'puneri misal' ,22 )
Insert INTO Restaurants VALUES(101243, 'Punjabi Chaska' , 23)
Insert INTO Restaurants VALUES(101244, 'Crappy Crab' ,24 )
Insert INTO Restaurants VALUES(101245, 'Mikes' ,25)
Insert INTO Restaurants VALUES(101246, 'don Juilos Oyesterbar' , 26)
Insert INTO Restaurants VALUES(101247, 'Curlies' ,27 )
Insert INTO Restaurants VALUES(101248, 'Malibu Club' , 28)
Insert INTO Restaurants VALUES(101249, 'hooters' ,29)
Insert INTO Restaurants VALUES(101250, 'Wings over boston' , 30)

Insert INTO Restaurants VALUES(101251, 'Dharavi Dhaba' ,22 )
Insert INTO Restaurants VALUES(101252, 'sadhana misal' ,21 )
Insert INTO Restaurants VALUES(101253, 'Punjab Express' , 24)
Insert INTO Restaurants VALUES(101254, 'Encore' ,25)
Insert INTO Restaurants VALUES(101255, 'Milkweed' ,26 )
Insert INTO Restaurants VALUES(101256, 'don Juilos Oyesterbar' , 23)
Insert INTO Restaurants VALUES(101257, 'Curls' ,29 )
Insert INTO Restaurants VALUES(101258, 'Miami Club' , 30)
Insert INTO Restaurants VALUES(101259, 'hawli' ,28 )
Insert INTO Restaurants VALUES(101260, 'Wings over chicken' , 27)

--40
Insert INTO Restaurants VALUES(101261, 'Dharas ka Dhaba' ,31 )
Insert INTO Restaurants VALUES(101262, 'puneri misal' ,32 )
Insert INTO Restaurants VALUES(101263, 'Punjabi Chaska' , 37)
Insert INTO Restaurants VALUES(101264, 'Crappy Crab' ,33 )
Insert INTO Restaurants VALUES(101265, 'Mikes' ,38 )
Insert INTO Restaurants VALUES(101266, 'don Juilos Oyesterbar' , 39)
Insert INTO Restaurants VALUES(101267, 'Curlies' ,40 )
Insert INTO Restaurants VALUES(101268, 'Malibu Club' , 34)
Insert INTO Restaurants VALUES(101269, 'hooters' ,36 )
Insert INTO Restaurants VALUES(101270, 'Wings over boston' , 35)

Insert INTO Restaurants VALUES(101271, 'Mama ka Dhaba' ,37 )
Insert INTO Restaurants VALUES(101272, 'pune misal' ,36 )
Insert INTO Restaurants VALUES(101273, 'Marathi Chaska' , 32)
Insert INTO Restaurants VALUES(101274, 'Crappy Crab' ,38)
Insert INTO Restaurants VALUES(101275, 'Mily Resto and Bar' ,31)
Insert INTO Restaurants VALUES(101276, 'don Italia' , 34)
Insert INTO Restaurants VALUES(101277, 'Pearls' ,39 )
Insert INTO Restaurants VALUES(101278, 'Mali Club' , 33)
Insert INTO Restaurants VALUES(101279, 'hoopers' ,35 )
Insert INTO Restaurants VALUES(101280, 'Wings' , 40)


-- 50

Insert INTO Restaurants VALUES(101281, 'Dharas ka Dhaba' ,41 )
Insert INTO Restaurants VALUES(101282, 'puneri misal' ,42 )
Insert INTO Restaurants VALUES(101283, 'Punjabi Chaska' , 47)
Insert INTO Restaurants VALUES(101284, 'Crappy Crab' ,43 )
Insert INTO Restaurants VALUES(101285, 'Mikes' ,48 )
Insert INTO Restaurants VALUES(101286, 'don Juilos Oyesterbar' , 49)
Insert INTO Restaurants VALUES(101287, 'Curlies' ,50 )
Insert INTO Restaurants VALUES(101288, 'Malibu Club' , 44)
Insert INTO Restaurants VALUES(101289, 'hooters' ,46 )
Insert INTO Restaurants VALUES(101290, 'Wings over boston' , 45)

Insert INTO Restaurants VALUES(101291, 'Mama ka Dhaba' ,47 )
Insert INTO Restaurants VALUES(101292, 'pune misal' ,46 )
Insert INTO Restaurants VALUES(101293, 'Marathi Chaska' , 42)
Insert INTO Restaurants VALUES(101294, 'Crappy Crab' ,48)
Insert INTO Restaurants VALUES(101295, 'Mily Resto and Bar' ,41)
Insert INTO Restaurants VALUES(101296, 'don Italia' , 44)
Insert INTO Restaurants VALUES(101297, 'Pearls' ,49 )
Insert INTO Restaurants VALUES(101298, 'Mali Club' , 43)
Insert INTO Restaurants VALUES(101299, 'hoopers' ,45 )
Insert INTO Restaurants VALUES(101300, 'Wings' , 50)


Insert INTO Restaurants VALUES(101301, 'Dharas ka Dhaba' ,51 )
Insert INTO Restaurants VALUES(101302, 'puneri misal' ,52 )
Insert INTO Restaurants VALUES(101303, 'Punjabi Chaska' , 53)
Insert INTO Restaurants VALUES(101304, 'Crappy Crab' ,54 )
Insert INTO Restaurants VALUES(101305, 'Mikes' ,55 )
Insert INTO Restaurants VALUES(101306, 'don Juilos Oyesterbar' , 56)

--56
Insert INTO Restaurants VALUES(101307, 'Dharas ka Dhaba' ,56 )
Insert INTO Restaurants VALUES(101308, 'puneri misal' ,55 )
Insert INTO Restaurants VALUES(101309, 'Punjabi Chaska' , 54)
Insert INTO Restaurants VALUES(101310, 'Crappy Crab' ,53 )
Insert INTO Restaurants VALUES(101311, 'Mikes' ,52 )
Insert INTO Restaurants VALUES(101312, 'don Juilos Oyesterbar' , 51)


Select * from Restaurants order by Hotel_id 

Select * from hotel
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TAXI TABLE

Create Table Taxi(
Taxi_id INT PRIMARY KEY NOT NULL,
Taxi_number VARCHAR(45) NOT NULL,
Hotel_id INT NOT NULL References Hotel(Hotel_id))

--10
INSERT INTO Taxi VALUES(30, 'ABC123',1)
INSERT INTO Taxi VALUES(31, 'EFG234',2)
INSERT INTO Taxi VALUES(32, 'RTY235',3)
INSERT INTO Taxi VALUES(33, 'GHT654',4)
INSERT INTO Taxi VALUES(34, 'LKJ567',5)
INSERT INTO Taxi VALUES(35, 'NVB567',6)
INSERT INTO Taxi VALUES(36, 'LKA987',7)
INSERT INTO Taxi VALUES(37, 'PLM549',8)
INSERT INTO Taxi VALUES(38, 'YUF908',9)
INSERT INTO Taxi VALUES(39, 'DHR653',10)


INSERT INTO Taxi VALUES(40, 'ABC125',1)
INSERT INTO Taxi VALUES(41, 'E5RTHY',2)
INSERT INTO Taxi VALUES(42, 'RTWU97',3)
INSERT INTO Taxi VALUES(43, 'GEDB78',4)
INSERT INTO Taxi VALUES(44, 'LMNO67',5)
INSERT INTO Taxi VALUES(45, 'ZXC567',6)
INSERT INTO Taxi VALUES(46, 'PML987',7)
INSERT INTO Taxi VALUES(47, 'DSL549',8)
INSERT INTO Taxi VALUES(48, 'YUE908',9)
INSERT INTO Taxi VALUES(49, 'FBN653',10)

--20

INSERT INTO Taxi VALUES(50, 'NBC123',11)
INSERT INTO Taxi VALUES(51, 'EFM434',12)
INSERT INTO Taxi VALUES(52, 'RGY235',13)
INSERT INTO Taxi VALUES(53, 'MNT654',14)
INSERT INTO Taxi VALUES(54, 'BKJ567',15)
INSERT INTO Taxi VALUES(55, 'UEB567',16)
INSERT INTO Taxi VALUES(56, 'LKA998',17)
INSERT INTO Taxi VALUES(57, 'PLG549',18)
INSERT INTO Taxi VALUES(58, 'YUF771',19)
INSERT INTO Taxi VALUES(59, 'DHR775',20)


INSERT INTO Taxi VALUES(60, 'BCD125',11)
INSERT INTO Taxi VALUES(61, 'E5RTHR',12)
INSERT INTO Taxi VALUES(62, 'RTWU67',13)
INSERT INTO Taxi VALUES(63, 'GED889',14)
INSERT INTO Taxi VALUES(64, 'LMNO56',15)
INSERT INTO Taxi VALUES(65, 'ZXC542',16)
INSERT INTO Taxi VALUES(66, 'PML990',17)
INSERT INTO Taxi VALUES(67, 'DSL534',18)
INSERT INTO Taxi VALUES(68, 'YUE997',19)
INSERT INTO Taxi VALUES(69, 'FBN668',20)


select * from taxi order by hotel_id


--30


INSERT INTO Taxi VALUES(70, 'BKC123',21)
INSERT INTO Taxi VALUES(71, 'MEM434',22)
INSERT INTO Taxi VALUES(72, 'RGB235',23)
INSERT INTO Taxi VALUES(73, 'MOT654',24)
INSERT INTO Taxi VALUES(74, 'BNN567',25)
INSERT INTO Taxi VALUES(75, 'UKV567',26)
INSERT INTO Taxi VALUES(76, 'LMO998',27)
INSERT INTO Taxi VALUES(77, 'NQR549',28)
INSERT INTO Taxi VALUES(78, 'YUF790',29)
INSERT INTO Taxi VALUES(79, 'DHR795',30)


INSERT INTO Taxi VALUES(80, 'BCD125',21)
INSERT INTO Taxi VALUES(81, 'E5RTHR',22)
INSERT INTO Taxi VALUES(82, 'RTWU67',23)
INSERT INTO Taxi VALUES(83, 'GED889',24)
INSERT INTO Taxi VALUES(84, 'LMNO56',25)
INSERT INTO Taxi VALUES(85, 'ZXC542',26)
INSERT INTO Taxi VALUES(86, 'PML990',27)
INSERT INTO Taxi VALUES(87, 'DSL534',28)
INSERT INTO Taxi VALUES(88, 'YUE997',29)
INSERT INTO Taxi VALUES(89, 'FBN668',30)


--40


INSERT INTO Taxi VALUES(90, 'NBC123',31)
INSERT INTO Taxi VALUES(91, 'EFM434',32)
INSERT INTO Taxi VALUES(92, 'RGY235',33)
INSERT INTO Taxi VALUES(93, 'MNT654',34)
INSERT INTO Taxi VALUES(94, 'BKJ567',35)
INSERT INTO Taxi VALUES(95, 'UEB567',36)
INSERT INTO Taxi VALUES(96, 'LKA998',37)
INSERT INTO Taxi VALUES(97, 'PLG549',38)
INSERT INTO Taxi VALUES(98, 'YUF771',39)
INSERT INTO Taxi VALUES(99, 'DHR775',40)


INSERT INTO Taxi VALUES(100, 'BCD146',31)
INSERT INTO Taxi VALUES(101, 'E5RTHS',32)
INSERT INTO Taxi VALUES(102, 'RTWU68',33)
INSERT INTO Taxi VALUES(103, 'GED880',34)
INSERT INTO Taxi VALUES(104, 'LMNO57',35)
INSERT INTO Taxi VALUES(105, 'ZXC543',36)
INSERT INTO Taxi VALUES(106, 'PML998',37)
INSERT INTO Taxi VALUES(107, 'DSL532',38)
INSERT INTO Taxi VALUES(108, 'YUE991',39)
INSERT INTO Taxi VALUES(109, 'FBN667',40)

--50


INSERT INTO Taxi VALUES(110, 'BCD145',41)
INSERT INTO Taxi VALUES(111, 'E5RTHE',42)
INSERT INTO Taxi VALUES(112, 'RTWU66',43)
INSERT INTO Taxi VALUES(113, 'GED884',44)
INSERT INTO Taxi VALUES(114, 'LMNO53',45)
INSERT INTO Taxi VALUES(115, 'ZXC542',46)
INSERT INTO Taxi VALUES(116, 'PML991',47)
INSERT INTO Taxi VALUES(117, 'DSL539',48)
INSERT INTO Taxi VALUES(118, 'YUE990',49)
INSERT INTO Taxi VALUES(119, 'FBN666',50)

INSERT INTO Taxi VALUES(132, 'BCD148',41)
INSERT INTO Taxi VALUES(133, 'E5RTEM',42)
INSERT INTO Taxi VALUES(134, 'RTWU67',43)
INSERT INTO Taxi VALUES(135, 'GED888',44)
INSERT INTO Taxi VALUES(136, 'LMNO83',45)
INSERT INTO Taxi VALUES(137, 'ZXC592',46)
INSERT INTO Taxi VALUES(138, 'PML994',47)
INSERT INTO Taxi VALUES(139, 'DSL566',48)
INSERT INTO Taxi VALUES(140, 'YUE909',49)
INSERT INTO Taxi VALUES(141, 'FBN676',50)

--56
INSERT INTO Taxi VALUES(120, 'CCD146',51)
INSERT INTO Taxi VALUES(121, 'F5RTHS',52)
INSERT INTO Taxi VALUES(122, 'STWU68',53)
INSERT INTO Taxi VALUES(123, 'KED880',54)
INSERT INTO Taxi VALUES(124, 'OMNO57',55)
INSERT INTO Taxi VALUES(125, 'XMC543',56)

INSERT INTO Taxi VALUES(126, 'MLN998',51)
INSERT INTO Taxi VALUES(127, 'DSP532',52)
INSERT INTO Taxi VALUES(128, 'YUU991',53)
INSERT INTO Taxi VALUES(129, 'FBI667',54)
INSERT INTO Taxi VALUES(130, 'OMNO57',55)
INSERT INTO Taxi VALUES(131, 'XMC543',56)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Constraints

-- Employee Login              Checks if password Length is greater then or equal to 5
ALTER TABLE employeeLogin
  ADD CONSTRAINT passwordchk CHECK (len(password)>=5);


-- User Login              Checks if password Length is greater then or equal to 5
ALTER TABLE userLogin
  ADD CONSTRAINT passwordchkuser CHECK (len(password)>=5);
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  -- TABLE VIEWS
Use Group5_Project
/* 1. To View Most Vistied Destination of the company */
    CREATE VIEW mostvisiteddestination1
    AS
    (
    	SELECT TOP 1 Package_id,COUNT(*) AS Mostvisited FROM Booking
    	GROUP BY Package_id 
    	ORDER BY Mostvisited DESC
    
    );
    SELECT * FROM mostvisiteddestination1
    
    /* 2. To ViewCustomer who has booked for more than 1 packages of the company */
    CREATE VIEW highestcustomerpackage1
    AS
    (
    	SELECT TOP 1 Customer_id,COUNT(*) AS Mostvisitedplaceofcustome1r FROM Package
    	GROUP BY Customer_id
    	ORDER BY Mostvisitedplaceofcustomer DESC
    
    );
    SELECT * FROM highestcustomerpackage1

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----Computed Columns based on a function-----

USE Group5_Project

Go
CREATE FUNCTION AGE(@DateofBirth AS DATETIME)
RETURNS INT
AS
BEGIN
DECLARE @Years AS INT
DECLARE @BirthdayDate AS DATETIME
DECLARE @Age AS INT
--Calculate difference in years
SET @Years = DATEDIFF(YY,@DateOfBirth,GETDATE())
--Add years to DateOfBirth
SET @BirthdayDate = DATEADD(YY,@Years,@DateOfBirth)
--Subtract a year if birthday is after today
SET @Age = @Years -
CASE
WHEN @BirthdayDate>GETDATE() THEN 1
ELSE 0
END
--Return the result
RETURN @Age
END
Go
select * from Customer
go
Select Customer_id, Customer_FirstName,Customer_LastName,Street_Address,City,Country_Zipcode,[State], [dbo].[AGE](dateofbirth) as Age from Customer
go
select * from Employee
go
Select e.Employee_id, e.Employeename,e.Street_address,e.City,e.[State],e.Country,e.Zipcode,e.Roles_employee_id, [dbo].[AGE](DateofBirth) as Age from Employee e

