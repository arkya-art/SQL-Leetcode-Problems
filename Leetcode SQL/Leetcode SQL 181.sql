USE sql_leetcode;

DROP TABLE IF EXISTS Employee_181;
CREATE TABLE Employee_181
(   id INT,
	Name varchar(100),
	Salary INT,
    ManagerId INT,
    primary key (id)
    );
    
INSERT INTO Employee_181 Values (1,'Joe',70000,3);  
INSERT INTO Employee_181 Values (2,'Henry',80000,4);  
INSERT INTO Employee_181 (id,name,Salary) Values (3,'Sam',60000);  
INSERT INTO Employee_181 Values (4,'Max',90000,NULL);  

select * from Employee_181;

select e2.name from Employee_181 e1
left JOIN Employee_181 e2 ON e1.id= e2.ManagerId
Where e1.Salary < e2.salary;