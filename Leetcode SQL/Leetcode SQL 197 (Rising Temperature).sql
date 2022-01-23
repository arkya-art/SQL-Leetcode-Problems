use sql_leetcode;

drop table if exists weather_197;
create table weather_197 ( Id INT NOT NULL,
							RecordDate DATE NOT NULL,
                            temperature INT NOT NULL,
                            primary key (Id )
						   );
                           
INSERT INTO weather_197 VALUES (1,'2015-01-01',10);    
INSERT INTO weather_197 VALUES (2,'2015-01-02',25);                           
INSERT INTO weather_197 VALUES (3,'2015-01-03',20);                           
INSERT INTO weather_197 VALUES (4,'2015-01-04',30);   

select * from  weather_197;   

# Query 1
Select w1.id from weather_197 w1
join weather_197 w2 on DATEDIFF(w1.RecordDate,w2.RecordDate) = 1 and w1.temperature > w2.temperature ;                      