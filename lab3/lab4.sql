--1 
select * from warehouses;

--2
select * from boxes where value >150;

--3
select distinct contents from boxes;

--4
select warehouse, count(*) as num from boxes group by warehouse;

--5
select warehouse, count(*) as num from boxes group by warehouse 
having count(*) > 2;

--6
insert into warehouses(code, location, capacity)
values(6, 'New York', 3);

--7
insert into boxes(code, contents, value, warehouse)
values('H5RT', 'Papers', 200, 2);

--8
update boxes set value = value * 0.85
where value = (select value from boxes order by valuse desc offset 2 limit 1)

--9
delete from boxes where value < 150;

--10
delete from boxes
where warehouse in (select code from warehouses where location = 'New York')
returning *;