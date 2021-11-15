
#DROP DATABASE IF EXISTS sql_leetcode;
#CREATE DATABASE IF NOT EXISTS sql_leetcode;
USE sql_leetcode;

#DROP TABLE IF EXISTS Departments_1350;

CREATE TABLE Departments_1350
(   id INT NOT NULL,
	name varchar(255) NOT NULL,
    primary key (id)
    );
    
CREATE TABLE Students_1350  
(
	id INT NOT NULL,
	name varchar(255) NOT NULL,
    department_id INT NOT NULL,
    primary key (id)

);  

INSERT INTO Departments_1350 Values (1,'Electrical Engineering');
INSERT INTO Departments_1350 Values (7,'Computer Engineering');
INSERT INTO Departments_1350 Values (13,'Business Administration');

INSERT INTO Students_1350 Values (23,'Alice',1);
INSERT INTO Students_1350 Values (1,'Bob',7);
INSERT INTO Students_1350 Values (5,'Jennifer',13);
INSERT INTO Students_1350 Values (2,'John',14);
INSERT INTO Students_1350 Values (4,'Jasmine',77);
INSERT INTO Students_1350 Values (3,'Steve',74);
INSERT INTO Students_1350 Values (6,'Luis',1);
INSERT INTO Students_1350 Values (8,'Jonathan',7);
INSERT INTO Students_1350 Values (7,'Daiana',33);
INSERT INTO Students_1350 Values (11,'MadeLynn',1);

select * from  Departments_1350;
select * from  Students_1350;


# Query1; using subquery with inner join
select id, name from students_1350 where id not in 
(select distinct s.id from students_1350 s 
join departments_1350 d on s.department_id = d.id)
order by id ASC;

# Query2; without using join
select name,id from students_1350 
where department_id not in (select distinct id from Departments_1350)
order by id ASC;

#Query3; using left join
select s.id,s.name from students_1350 s 
left join departments_1350 d on s.department_id = d.id
where d.id IS NULL;
