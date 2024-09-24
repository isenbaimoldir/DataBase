insert into countries(countryId,regionid, countryName)
values (3, 33, 'Brazil');

insert into countries(countryId,regionid, countryName)
values (4, 124, 'USA');


insert into countries(countryName, regionid, population)
values 
('Egypt', 324, 111000000),
('Russia', 12, 130000000),
('Japan', 12, 140000000);

alter table countries
alter column countryName set default 'Kazakhstan';

insert into countries(regionid, population)
values (23, 20000000);

insert into countries default values;

create table countriesnew like countries;

insert into countriesnew select * from countries;

update countries
set regionid = 1
where regionid is null;


select countryName,
	population * 1.1 as 'New population'
from countries;

