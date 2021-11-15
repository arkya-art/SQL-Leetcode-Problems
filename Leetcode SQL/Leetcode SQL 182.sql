USE sql_leetcode;

CREATE TABLE Person_182
(   id INT NOT NULL,
	Email varchar(100) NOT NULL,
    primary key (id)
    );
    
INSERT INTO Person_182 Values (1,'a@b.com');  
INSERT INTO Person_182 Values (2,'c@d.com'); 
INSERT INTO Person_182 Values (3,'a@b.com'); 

select * from Person_182; 

# Query 1 (*Not a smart approach)
select email from  Person_182
group by email
order by count(email) DESC
limit 1;

# QUery 2 - using HAVING clause
select email from  Person_182
group by email
HAVING count(email) > 1;

# Query 3 - Using self join (using the concept; duplicate emails 2 different id's )
select distinct p1.email from Person_182 p1
join Person_182 p2 ON p1.email = p2.email and p1.id != p2.id;
 
