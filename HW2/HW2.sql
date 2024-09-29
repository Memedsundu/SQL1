use birdstrikes;
select * from birdstrikes;
create table new_birdstrikes like birdstrikes;
show tables;
describe new_birdstrikes;
select * from new_birdstrikes;
drop table if exists new_birdstrikes;

##Exercise 1
create table employee (
id integer not null, employee_name varchar(50) not null, primary key (id));
show tables;
##

drop table emloyee;
show tables;
insert into employee (id, employee_name) values(1, 'Student');
insert into employee (id, employee_name) values(2, 'Student2');
insert into employee (id, employee_name) values(3, 'Student3');
SET SQL_SAFE_UPDATES = 0;
update employee set employee_name = 'Student1' where id = '1';
select * from employee;
insert into employee (id, employee_name) values (3, 'Student4');
select * from employee;
update employee set employee_name= 'Arnold Schwarzenegger' where id='1';
update employee set employee_name= 'The Other Arnold' where id = '2';
select * from employee;
delete from employee where id = 3;
select * from employee;
truncate employee;
select * from employee;
create user 'laszlosallo'@'%' identified by 'laszlosallo1';
grant all on birdstrikes.employee to 'laszlosallo'@'%';
grant select (state) on birdstrikes.birdstrikes to 'laszlosallo'@'%';
drop user 'laszlosallo'@'%';
create user 'memed'@'%' identified by '1234';
grant all on birdstrikes.employee to 'memed'@'%';
grant select (state) on birdstrikes.birdstrikes to 'memed'@'%';
select *, speed/2 from birdstrikes;
select *, speed/2 as halfspeed from birdstrikes;
SELECT * FROM birdstrikes LIMIT 10;
SELECT * FROM birdstrikes LIMIT 10,1;

##Exercise 2: What state figures in the 145th line of our database?
select state from birdstrikes limit 144,1;
## Result: Tennessee

#Exercise 3: What is flight_date of the latest birstrike in this database?
select flight_date from birdstrikes order by flight_date desc limit 1;
## Result: '2000-04-18'


#Exercise 4: What was the cost of the 50th most expensive damage?
select distinct damage from birdstrikes;
select distinct airline, damage from birdstrikes;
select distinct damage, cost from birdstrikes order by cost desc limit 49,1;
## Result : 'Caused damage', '5345'

select * from birdstrikes where state = 'Alabama';
SELECT aircraft
FROM birdstrikes
WHERE cost = (
    SELECT DISTINCT cost,damage
    FROM birdstrikes
    ORDER BY cost DESC
    LIMIT 49, 1
);


select * from birdstrikes where state != 'Alabama';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'A%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'a%';
SELECT DISTINCT state FROM birdstrikes WHERE state  LIKE 'ala%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'North _a%';
SELECT DISTINCT state FROM birdstrikes WHERE state NOT LIKE 'a%' ORDER BY state desc;
select * from birdstrikes where state = 'Alabama' and bird_size = 'Small';
SELECT * FROM birdstrikes WHERE state = 'Alabama' OR state = 'Missouri';

#Exercise 5: What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
select state from birdstrikes where state is not null and bird_size is not null order by id limit 1,1;
## Result : () 

SELECT * FROM birdstrikes WHERE state IN ('Alabama', 'Missouri','New York','Alaska');
select distinct state from birdstrikes where length(state) = 5;
select * from birdstrikes where speed = 300;
select * from birdstrikes where speed >= 10000;
select round(sqrt(speed/2)*10) as synthetic_speed from birdstrikes;
select * from birdstrikes where cost between 20 and 40;
select state from birdstrikes where state is not null and bird_size != '' limit 1;
select state from birdstrikes where state is not null and  state != '' and bird_size is not null and  bird_size != ''limit 10;
SELECT * FROM birdstrikes WHERE flight_date = "2000-01-02";
SELECT * FROM birdstrikes WHERE flight_date >= '2000-01-01' AND flight_date <= '2000-01-03';
select * from birdstrikes where flight_date between now() and weekofyear(52) and state = 'Colorado';

##Exercise 6: How many days elapsed between the current date and the flights happening in week 7, for incidents from Colorado? (Hint: use NOW, DATEDIFF, WEEKOFYEAR)
SELECT flight_date, DATEDIFF(NOW(), flight_date) AS days_elapsed FROM birdstrikes WHERE WEEKOFYEAR(flight_date) = 7 AND state = 'Colorado';
## Result:  '2000-02-15', '8993'
