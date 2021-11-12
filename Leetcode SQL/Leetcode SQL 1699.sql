USE sql_leetcode;

CREATE TABLE Calls_1699
(   from_id INT NOT NULL,
	to_id INT NOT NULL,
    duration INT NOT NULL
    );

INSERT INTO Calls_1699 Values (1,2,59);   
INSERT INTO Calls_1699 Values (2,1,11);  
INSERT INTO Calls_1699 Values (1,3,20);  
INSERT INTO Calls_1699 Values (3,4,100);  
INSERT INTO Calls_1699 Values (3,4,200);  
INSERT INTO Calls_1699 Values (3,4,200);  
INSERT INTO Calls_1699 Values (4,3,499); 

select * from Calls_1699;  

# Query 1    
select LEAST(from_id, to_id) AS person1, GREATEST(from_id, to_id) AS person2, COUNT(*) AS call_count, SUM(duration) AS total_duration
from Calls_1699
group by person1, person2