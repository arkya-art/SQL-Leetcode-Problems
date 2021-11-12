USE sql_leetcode;

#DROP TABLE IF EXISTS Departments_1350;

CREATE TABLE Students_1412
(   student_id INT NOT NULL,
	student_name varchar(255) NOT NULL,
    primary key (student_id)
    );
    
CREATE TABLE Exams_1412  
(
	exam_id INT NOT NULL,
    student_id INT NOT NULL,
    score INT NOT NULL,
    primary key (exam_id,student_id)

);  

INSERT INTO Students_1412 Values (1,'Daniel');
INSERT INTO Students_1412 Values (2,'Jade');
INSERT INTO Students_1412 Values (3,'Stella');
INSERT INTO Students_1412 Values (4,'Jonathan');
INSERT INTO Students_1412 Values (5,'Will');

INSERT INTO Exams_1412 Values (10,1,70);
INSERT INTO Exams_1412 Values (10,2,80);
INSERT INTO Exams_1412 Values (10,3,90);
INSERT INTO Exams_1412 Values (20,1,80);
INSERT INTO Exams_1412 Values (30,1,70);
INSERT INTO Exams_1412 Values (30,3,80);
INSERT INTO Exams_1412 Values (30,4,90);
INSERT INTO Exams_1412 Values (40,1,60);
INSERT INTO Exams_1412 Values (40,2,70);
INSERT INTO Exams_1412 Values (40,4,80);

select * from  Students_1412;
select * from  Exams_1412;

# Query 1

select Students_1412.student_id, student_name
from Students_1412 join exams_1412  on Students_1412.student_id = Exams_1412.student_id
group by Students_1412.student_id

having SUM(IF((exam_id, score) IN 
       (select exam_id,MIN(score) as score 
		from exams_1412 group by exam_id
        
		UNION
        
        select exam_id,MAX(score) as score 
        from exams_1412 group by exam_id),1,0) )=0;