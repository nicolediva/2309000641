-- 2309000641_INEZA_Aimee_Nicole
show databases;
create database Contact_Management_Sys;

create user 'Nicole'@'127.0.0.1' identified by '2309000641';
grant all privileges on Contact_Management_Sys .* to 'Nicole'@'127.0.0.1';
flush privileges;

use Contact_Management_Sys;
create table  Contacts (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(200) NOT NULL,
    date_added DATE NOT NULL
);
CREATE TABLE Groups(
   group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(100) NOT NULL,
   description  varchar(20) NOT NULL
);
 CREATE TABLE Communications (
    c_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    contact_id INT NOT NULL,
    date_of_interaction DATE NOT NULL,
    communication_type VARCHAR(50),
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);
-- crud
-- insert into books
INSERT INTO Contacts (contact_id,first_name ,last_name ,email ,phone_number ,address ,date_added )
VALUES 
(1, 'INEZA', 'Nicole', 'inezanicole@gmail.com', '0786355726','Musanze','2020-1-2'),
(2, 'UMWALI', 'Aline', 'umwalialine@gmail.com', '0784555726','Kigali','2020-1-3'),
(3, 'KEZA', 'Lyse', 'kezalyse@gmail.com', '0786765726','Rubavu','2020-1-4'),
(4, 'ISHEMA', 'Semu', 'ishemasemu@gmail.com', '0786645726','Karongi','2020-1-5'),
(5, 'MULISA', 'Alno', 'mulisaalno@gmail.com', '0788765726','Huye','2020-1-6');
select * from Contacts;
select sum(contact_id) from Contacts;
select avg(contact_id) from Contacts;
select count(contact_id) from Contacts;

-- insert into Groups
INSERT INTO Groups ( group_id,group_name,description  )
VALUES 
(4, 'Love', 'Family'),
(5, 'Helplers', 'Friends'),
(6, 'Money', 'Clients');
select * from Groups;
select sum(group_id) from Groups;
select avg(group_id) from Groups;
select count(group_id) from Groups;

show tables;

-- insert into Communications
INSERT INTO Communications ( C_id,contact_id ,date_of_interaction ,communication_type )
VALUES 
(1, 1, '2020-01-03', 'call'),
(2, 2, '2020-01-04', 'Whatsapp'),
(3, 3, '2020-01-05', 'Email'),
(4, 4, '2020-01-06', 'Message');
select * from Communications;
select sum(contact_id) from Communications;
select avg(contact_id) from Communications;
select count(contact_id) from Communications;

-- view creation
-- first view of list_of_contact. from Contacts table
create view list_of_contact AS select first_name,last_name from Contacts;
select * from list_of_contact;

-- second view of lesscontact from  Contacts table
create view lesscontact AS select contact_id,first_name,last_name from Contacts where phone_number=0786355726;
select * from lesscontact;

-- third view of group_name from Groups table
create view group_names AS select group_name from Groups;
select * from group_names;

-- fourh view of contact_id and their phone number only
create view contact_id_and_phone_number AS select contact_id,phone_number from Contacts;
select * from contact_id_and_phone_number;

-- firth view of C_id_and_contact_id from loan table
create view  C_id_and_contact_id AS select C_id,contact_id from Communications;
select * from C_id_and_contact_id ;

-- sixth view from Groups table
create view group_id_and_group_name AS select group_id,group_name from Groups;
select * from group_id_and_group_name;

-- stored procedure
-- stored procedure  for insert in Contacts table
DELIMITER $$
CREATE PROCEDURE insertcontact(
in contactidparam int,
in contactfirstnameparam varchar(50),
in contactlastnameparam varchar(50),
in numberparam varchar(15))
begin
insert into Contacts values(contactidparam,contactfirstnameparam,contactlastnameparam,numberparam);
end $$
delimiter ;
call insertcontact(7, 'INEZA', 'Nicole', '0786355726'); 
select * from Contacts;

-- stored procedure to delete in Contacts table
DELIMITER $$
CREATE PROCEDURE delcontact(in contactparam int)
begin
update Contacts set contact_name='nicole' where contact_id=contactparam;
end $$
delimiter ;
call delcontact(5);
select * from Contacts;


-- stored procedure for delete in Groups

DELIMITER $$
CREATE PROCEDURE delGroups(in groupidparam int)
begin
delete from Groups where group_id=groupidparam;
end $$
delimiter ;
call delGroups(2);
select * from Groups;

-- stored procedure select in Groups
DELIMITER $$
CREATE PROCEDURE selgroup(in groupidparam int)
begin
select * from Groups where group_id=groupidparam;
end $$
delimiter ;
call selgroup(1);

-- stored procedure to select in Contacts
DELIMITER $$
CREATE PROCEDURE selcontact(in contactidparam int)
begin
select * from Contacts where contact_id=contactidparam;
end $$
delimiter ;
call selcontact(2);
call selcontact(4);

-- stored procedure to update Contacts table
DELIMITER $$
CREATE PROCEDURE upcontacts(in contactidparam int)
begin
update  Contacts set first_name='KEZA' where contact_id=contactidparam;
end $$
delimiter ;
call upcontacts(6);
select * from  Contacts;

-- triger after insert in Contacts
delimiter $$
create trigger insertcontact
after insert on Contacts
for each row
begin
update Contacts set contact_id=contact_id+5;
end $$
delimiter ;
insert into Contacts values(6, 'MULISA', 'Ben', 'mulisaben@gmail.com', '0784765726','Kanombe','01-07-2010');
select * from Contacts;

-- 2309000641_INEZA_Aimee_Nicole

