USE sql_leetcode;

#DROP TABLE IF EXISTS Departments_1350;

CREATE TABLE Scores_178
(   id INT NOT NULL,
	scores float NOT NULL,
    primary key (id)
    );
    
INSERT INTO Scores_178 Values (1,3.50);    
INSERT INTO Scores_178 Values (2,3.65);   
INSERT INTO Scores_178 Values (3,4.00);   
INSERT INTO Scores_178 Values (4,3.85);   
INSERT INTO Scores_178 Values (5,4.00);   
INSERT INTO Scores_178 Values (6,3.65);

select * from Scores_178 ;

# Query 1: Using Window function
SELECT scores, DENSE_RANK() OVER(order by scores DESC) as "Rank" from Scores_178;  

# query 2: Using sub queries
select scores, (select count(distinct scores)+1 from Scores_178 s2 where s2.scores > s1.scores) as "Rank" 
from Scores_178 s1
order by s1.scores DESC;