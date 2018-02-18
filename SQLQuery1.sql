create database lab10
use lab10
create table Unclassified(id decimal(9,0) CONSTRAINT PK_Unclassified PRIMARY KEY IDENTITY, info varchar(max) not null)
create table Confidential(id decimal(9,0) CONSTRAINT PK_Confidential PRIMARY KEY IDENTITY, info varchar(max) not null)
create table Secret(id decimal(9,0) CONSTRAINT PK_Secret PRIMARY KEY IDENTITY, info varchar(max) not null)
create table TopSecret(id decimal(9,0) CONSTRAINT PK_TopSecret PRIMARY KEY IDENTITY, info varchar(max) not null)

use master
go 
CREATE LOGIN User1 WITH PASSWORD='123456';
CREATE LOGIN User2 WITH PASSWORD='123456';
CREATE LOGIN User3 WITH PASSWORD='123456';
CREATE LOGIN User4 WITH PASSWORD='123456';

use lab10
go
CREATE USER User1 FOR LOGIN User1;
CREATE USER User2 FOR LOGIN User2;
CREATE USER User3 FOR LOGIN User3;
CREATE USER User4 FOR LOGIN User4;

CREATE ROLE Unclassified;
CREATE ROLE Confidential;
CREATE ROLE Secret;
CREATE ROLE TopSecret;
CREATE ROLE Grate;

EXECUTE sp_addrolemember "Unclassified", "User1";
EXECUTE sp_addrolemember "Confidential", "User2";
EXECUTE sp_addrolemember "Secret", "User3";
EXECUTE sp_addrolemember "TopSecret", "User4";
EXECUTE sp_addrolemember "Grate", "UserLvl5"; 

use lab10
go
GRANT SELECT ON OBJECT::Unclassified TO Unclassified;
GRANT INSERT ON OBJECT::Unclassified TO Unclassified;
GRANT INSERT ON OBJECT::Confidential TO Unclassified;
GRANT INSERT ON OBJECT::Secret TO Unclassified;
GRANT INSERT ON OBJECT::TopSecret TO Unclassified;

GRANT SELECT ON OBJECT::Unclassified TO Confidential;
GRANT SELECT ON OBJECT::Confidential TO Confidential;
GRANT INSERT ON OBJECT::Confidential TO Confidential;
GRANT INSERT ON OBJECT::Secret TO Confidential;
GRANT INSERT ON OBJECT::TopSecret TO Confidential;

GRANT SELECT ON OBJECT::Unclassified TO Secret;
GRANT SELECT ON OBJECT::Confidential TO Secret;
GRANT SELECT ON OBJECT::Secret TO Secret;
GRANT INSERT ON OBJECT::Secret TO Secret;
GRANT INSERT ON OBJECT::TopSecret TO Secret;

GRANT SELECT ON OBJECT::Unclassified TO TopSecret;
GRANT SELECT ON OBJECT::Confidential TO TopSecret;
GRANT SELECT ON OBJECT::Secret TO TopSecret;
GRANT SELECT ON OBJECT::TopSecret TO TopSecret;
GRANT INSERT ON OBJECT::TopSecret TO TopSecret;

--Biba
create table Unclassified_Biba(id decimal(9,0) CONSTRAINT PK_Unclassified_Biba PRIMARY KEY IDENTITY, info varchar(max) not null)
create table Confidential_Biba(id decimal(9,0) CONSTRAINT PK_Confidential_Biba PRIMARY KEY IDENTITY, info varchar(max) not null)
create table Secret_Biba(id decimal(9,0) CONSTRAINT PK_Secret_Biba PRIMARY KEY IDENTITY, info varchar(max) not null)
create table TopSecret_Biba(id decimal(9,0) CONSTRAINT PK_TopSecret_Biba PRIMARY KEY IDENTITY, info varchar(max) not null)

GRANT SELECT ON OBJECT::Unclassified_Biba TO TopSecret; 
GRANT INSERT ON OBJECT::Unclassified_Biba TO TopSecret;
GRANT INSERT ON OBJECT::Confidential_Biba TO TopSecret;
GRANT INSERT ON OBJECT::Secret_Biba TO TopSecret;
GRANT INSERT ON OBJECT::TopSecret_Biba TO TopSecret;

GRANT SELECT ON OBJECT::Unclassified_Biba TO Secret; 
GRANT SELECT ON OBJECT::Confidential_Biba TO Secret;
GRANT INSERT ON OBJECT::Confidential_Biba TO Secret;
GRANT INSERT ON OBJECT::Secret_Biba TO Secret;
GRANT INSERT ON OBJECT::TopSecret_Biba TO Secret;

GRANT SELECT ON OBJECT::Unclassified_Biba TO Confidential;
GRANT SELECT ON OBJECT::Confidential_Biba TO Confidential;
GRANT SELECT ON OBJECT::Secret_Biba TO Confidential;
GRANT INSERT ON OBJECT::Secret_Biba TO Confidential;
GRANT INSERT ON OBJECT::TopSecret_Biba TO Confidential;

GRANT SELECT ON OBJECT::Unclassified_Biba TO Unclassified;
GRANT SELECT ON OBJECT::Confidential_Biba TO Unclassified;
GRANT SELECT ON OBJECT::Secret_Biba TO Unclassified;
GRANT SELECT ON OBJECT::TopSecret_Biba TO Unclassified;
GRANT INSERT ON OBJECT::TopSecret_Biba TO Unclassified;

--grate

use master
go
CREATE LOGIN UserLvl5 WITH PASSWORD='123456';
CREATE LOGIN UserLvl60 WITH PASSWORD='123456';

use lab10
go
CREATE USER UserLvl5 FOR LOGIN UserLvl5
CREATE USER UserLvl60 FOR LOGIN UserLvl60

CREATE TABLE Users(Id int CONSTRAINT PK_Users PRIMARY KEY IDENTITY, UserName varchar(32) NOT NULL, Lvl int NOT NULL)
CREATE TABLE InformLvl(Id int CONSTRAINT PK_Inform PRIMARY KEY IDENTITY, Info varchar(max) not null, InfoLvl int not null)

Insert into Users values('UserLvl60', 60)
Insert into Users values('UserLvl5', 5)

INSERT into InformLvl values('some text lvl 1', 1)
INSERT into InformLvl values('some text lvl 2', 2)
INSERT into InformLvl values('some text lvl 3', 3)
INSERT into InformLvl values('some text lvl 4', 4)
INSERT into InformLvl values('some text lvl 5', 5)
INSERT into InformLvl values('some text lvl 6', 6)
INSERT into InformLvl values('some text lvl 7', 7)
INSERT into InformLvl values('some text lvl 8', 8)
INSERT into InformLvl values('some text lvl 9', 9)
INSERT into InformLvl values('some text lvl 10', 10)
INSERT into InformLvl values('some text lvl 11', 11)
INSERT into InformLvl values('some text lvl 12', 12)
INSERT into InformLvl values('some text lvl 13', 13)
INSERT into InformLvl values('some text lvl 15', 15)
INSERT into InformLvl values('some text lvl 30', 30)
INSERT into InformLvl values('some text lvl 20', 20)

select * from InformLvl

GRANT SELECT ON OBJECT::Secret_Biba TO User;

select * from InformLvl