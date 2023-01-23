Drop table Student;

--Creating a table called student
CREATE TABLE Student(
Student_id int NOT NULL, 
First_name varchar(300) NOT NULL,
Last_name varchar(300),
Gender char(10),
Age int,
Graduated char(5),
);
--Populating the student table
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(1, 'Valerie', 'Osawe', 'Female', 19, 'No');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(2, 'Ivory', 'Ibironke', 'Female', 22, 'Yes');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(3, 'Percious', 'Odeh', 'Male', 23, 'Yes');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(4, 'John', 'Amughan', 'Male', 19, 'No');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(5, 'Godspower', 'Uche', 'Male', 20, 'No');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(6, 'Jasmine', 'Ero', 'Female', 21, 'No');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(7, 'Osmund', 'Osamuyi', 'Male', 22, 'Yes');
INSERT INTO Student (Student_id, First_name, Last_name, Gender, Age, Graduated) VALUES(8, 'Geraldine', 'Omoruyi', 'Female', 22, 'Yes');

--Using a built-in function on the student table
SELECT * ,
AVG(Age) OVER(
PARTITION BY Graduated
ORDER BY Student_id ASC
) AS Average_age
FROM Student
ORDER BY Student_id ASC;

--Performing table locking on student table
--Using UPDLOCK
BEGIN TRANSACTION
SELECT *
FROM Student WITH (UPDLOCK) 
UPDATE Student 
SET First_name = 'Precious'
WHERE Student_id = 3 
COMMIT TRANSACTION
--Using ROWLOCK
SELECT * 
FROM Student WITH (ROWLOCK) 
WHERE Graduated = 'No'



