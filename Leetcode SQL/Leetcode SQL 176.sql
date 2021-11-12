
use sql_leetcode;

DROP TABLE IF EXISTS Employee_176;

CREATE TABLE Employee_176 ( Id INT NOT NULL,
							Salary INT NOT NULL,
                            primary key (Id)
                           );
INSERT INTO Employee_176 VALUES (1,100);       
INSERT INTO Employee_176 VALUES (2,200); 
INSERT INTO Employee_176 VALUES (3,300);                     

SELECT * FROM Employee_176;

# Query 1 : Using Sub-Query
SELECT MAX(salary) FROM Employee_176 WHERE Salary NOT IN
(SELECT MAX(Salary) FROM Employee_176);

# Query 2: Using self Join (General rule for nth highest salary)
SELECT Id, Salary from Employee_176 e1
where 1 = (SELECT COUNT(DISTINCT Salary) FROM Employee_176 e2 WHERE e1.Salary < e2.Salary );

# SELECT Id, Salary from Employee_176 e1
# where N-1 = (SELECT COUNT(DISTINCT Salary) FROM Employee_176 e2 WHERE e1.Salary < e2.Salary )
# Logic : count number of salaries which is smaller than given salaries and match with rank

# Query 3: Using Offset
SELECT id, Salary from Employee_176 
ORDER BY Salary ASC
LIMIT 1 OFFSET 1; 
# SELECT id, Salary from Employee_176 ORDER BY Salary ASC
#LIMIT 1 OFFSET N-1; 