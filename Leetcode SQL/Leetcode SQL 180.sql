USE sql_leetcode;

CREATE TABLE Logs_180
(   id INT NOT NULL,
	num INT NOT NULL,
    primary key (id)
    );
    
INSERT INTO Logs_180 Values (1,1);  
INSERT INTO Logs_180 Values (2,1); 
INSERT INTO Logs_180 Values (3,1); 
INSERT INTO Logs_180 Values (4,2); 
INSERT INTO Logs_180 Values (5,1); 
INSERT INTO Logs_180 Values (6,2); 
INSERT INTO Logs_180 Values (7,2); 

select * from logs_180;

select l1.num AS ConsecutiveNums from logs_180 l1
JOIN logs_180 l2 ON l1.num = l2.num and l1.id = l2.id + 1
JOIN logs_180 l3 ON l1.num = l3.num and l1.id = l3.id + 2;

