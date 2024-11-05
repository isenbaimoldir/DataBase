create table countries
(
    countryId serial primary key,
    countryName varchar(50) default 'Kazakhstan', 
    regionId int,
    population int
);

insert into countries(countryName, regionId, population)
values('France', 22, 68000000);

insert into countries(countryName, regionId, population)
values 
('Egypt', 324, 111000000),
('Russia', 12, 130000000),
('Japan', 12, 140000000);

insert into countries(regionId, population)
values (23, 20000000);

insert into countries default values;

create table countriesnew as
select * from countries;

update countries
set regionId = 1
where regionId is null;

select countryName,
    population * 1.1 as "New population"
from countries;

delete from countries
where population < 100000;

delete from countriesnew 
where countryId in (select countryId from countries)
returning *;

delete from countries
returning *;
