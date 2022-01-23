use sql_leetcode;

drop table if exists table_184;
create table employee_184 ( Id INT NOT NULL,
							Name varchar(100) NOT NULL,
                            Salary INT  NOT NULL,
                            DepartmentId INT NOT NULL,
                            primary key (Id )
						   );
CREATE TABLE department_184 ( Id INT NOT NULL,
							  Name VARCHAR(100) not null );

INSERT INTO employee_184 VALUES (1,'Joe',70000,1);
INSERT INTO employee_184 VALUES (2,'Jim',90000,1);
INSERT INTO employee_184 VALUES (3,'Henry',80000,2);
INSERT INTO employee_184 VALUES (4,'Sam',60000,2);
INSERT INTO employee_184 VALUES (5,'Max',90000,1);

INSERT INTO department_184 VALUES (1,'IT');
INSERT INTO department_184 VALUES (2,'Sales');

select * from employee_184;

# query 1 (using window function)
select Department, Employee, Salary from
(select d.Name as Department, e.Name as Employee, e.Salary, dense_rank() over(partition by d.Name order by Salary desc) as rnk
from department_184 d join employee_184 e ON d.Id = e.DepartmentId ) x
where x.rnk < 2;

# query 2
select d.Name as Department, e.Name as Employee, e.Salary from department_184 d
join employee_184 e ON d.Id = e.DepartmentId
where (departmentId,Salary) IN (select departmentid, MAX(salary) from Employee_184
								group by departmentid);

