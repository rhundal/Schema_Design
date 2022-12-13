


-- 4. 
insert into location (city, state, country) values ('Nashville', 'Tennessee', 'United States'), ('Memphis', 'Tennessee', 'United States'), ('Phoenix', 'Arizona', 'United States'), ('Denver', 'Colorado', 'United States');

--ALTER SEQUENCE location_id_seq RESTART WITH 1;
--UPDATE location SET id=nextval('location_id_seq');

-- 5.

insert into person ("firstName", "lastName", age, location_id) values 
('Chickie', 'Ourtic', 21, 1), 
('Hilton', 'O’Hanley', 37, 1),
('Barbe', 'Purver', 50, 3), 
('Reeta','Sammons',	34,	2),
('Abbott', 'Fisbburne', 49,	1),
('Winnie', 'Whines', 19, 4),
('Samantha', 'Leese', 35, 2),
('Edouard',	'Lorimer', 29, 1),
('Mattheus', 'Shaplin', 27, 3),
('Donnell',	'Corney', 25, 3),
('Wallis',	'Kauschke', 28,	3),
('Melva', 'Lanham',	20,	2),
('Amelina',	'McNirlan', 22, 4),
('Courtney', 'Holley', 22, 1), 
('Sigismond', 'Vala', 21, 4), 
('Jacquelynn', 'Halfacre', 24, 2), 
('Alanna', 'Spino', 25, 3),
('Isa',	'Slight', 32, 1),
('Kakalina', 'Renne', 26, 3);



-- 6.
insert into interest (title) values ('Programming'), ('Gaming'), ('Computers'), ('Music'), ('Movies'), ('Cooking'), ('Sports');

-- 7.

insert into person_interest (person_id, interest_id) values
(1,	1),
(1,	2),
(1,	6),
(2,	1),
(2,	7),
(2,	4),
(3,	1),
(3,	3),
(3,	4),
(4,	1),
(4,	2),
(4,	7),
(5,	6),
(5,	3),
(5,	4),
(6,	2),
(6,	7),
(7,	1),
(7,	3),
(8,	2),
(8,	4),
(9,	5),
(9,	6),
(10, 7),
(10, 5),
(11, 1),
(11, 2),
(11, 5),
(12, 1), 
(12, 4),
(12, 5),
(13, 2),
(13, 3),
(13, 7),
(14, 2),
(14, 4),
(14, 6),
(15, 1),
(15, 5),
(15, 7),
(16, 2), 
(16, 3),
(16, 4),
(17, 1),
(17, 3),
(17, 5),
(17, 7),
(18, 2),
(18, 4),
(18, 6),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7);

-- 8.

update person 
set age = age + 1
where id in (1, 6, 8, 14, 12, 18, 5, 4);


-- 9.
-- wanted to delete record in person table which should cascade and delete
-- all the connected rows to that foreign key in other table - person_interest
-- couldn't achieve the above so doing it the simple way

delete from person_interest where person_id in (2, 17);	-- first delete foreign key constraints from this table

delete from person where id in (2, 17);	-- second delete persons in person table with respective ids


-- 1.

select ("firstName", "lastName") as firstandlast from person;

select ("firstName"), ("lastName"), location.city, location.state from   
person join location 
on person.location_id = location.id
where person.location_id = 1;

SELECT location.city, COUNT(person.id)
FROM location join person
on location.id = person.location_id 
group by city;


SELECT interest.title, COUNT(person_interest.person_id) 
FROM interest left join person_interest
on interest.id = person_interest.interest_id
join person 
on person_interest.person_id = person.id
group by title;



select * from person_interest;
select * from person;
select * from location;
select * from interest;


select distinct ("firstName", "lastName"), location.city, location.state, interest.title
from person join location 
on person.location_id = location.id
join interest
on interest.id = person.id
right join person_interest
on person_interest.interest_id = interest.id
where person.location_id = 1 and interest.title = 'Programming';


select (person.age) as range, count(person.id)
from (
select case 
	when person.age >= 20 and person.age < 30 then count += 1 else
	when person.age >= 30 and person.age < 40 then count += 1 else
	when person.age >= 40 and person.age < 50 then count += 1 else
	0
end as result1)
group by range;

