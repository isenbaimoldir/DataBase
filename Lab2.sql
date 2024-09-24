create database lab2;

create table countries
(
	countryId serial primary key,
	countryName varchar(50),
	regionId int,
	population int
);

insert into countries(countryName, regionId, population)
values('France', 22, 68000000);

