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