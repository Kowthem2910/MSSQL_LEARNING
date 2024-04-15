USE StudentInformationSystem;


CREATE TABLE Students
(
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Email VARCHAR(40) NOT NULL,
    Phone_Number BIGINT NOT NULL
);

INSERT INTO Students (Student_ID, First_Name, Last_Name, Date_of_Birth, Email, Phone_Number)
VALUES
(1, 'John', 'Cena', '2000-01-01', 'john@example.com', 1234567890),
(2, 'Alice', 'Smith', '1999-05-15', 'alice@example.com', 9876543210),
(3, 'Bob', 'Johnson', '2001-09-30', 'bob@example.com', 5555555555),
(4, 'Emily', 'Brown', '2002-03-20', 'emily@example.com', 6666666666),
(5, 'Michael', 'Davis', '2000-11-10', 'michael@example.com', 7777777777),
(6, 'Samantha', 'Wilson', '1998-07-05', 'samantha@example.com', 8888888888),
(7, 'David', 'Martinez', '2001-04-25', 'david@example.com', 9999999999),
(8, 'Jessica', 'Taylor', '1999-08-18', 'jessica@example.com', 1111111111),
(9, 'Matthew', 'Anderson', '2003-02-08', 'matthew@example.com', 2222222222),
(10, 'Olivia', 'Hernandez', '2000-06-12', 'olivia@example.com', 3333333333);



CREATE TABLE Courses
(
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(40),
    Credits INT,
    Teacher_ID INT REFERENCES Teacher(Teacher_ID)
);

INSERT INTO Courses (Course_ID, Course_Name, Credits, Teacher_ID)
VALUES
(1, 'Mathematics', 4, 1),
(2, 'Physics', 3, 2),
(3, 'History', 3, 3),
(4, 'Biology', 4, 4),
(5, 'Chemistry', 3, 5),
(6, 'English', 3, 6),
(7, 'Computer Science', 4, 7),
(8, 'Art', 2, 8),
(9, 'Music', 2, 9),
(10, 'Physical Education', 2, 10);

INSERT INTO Courses VALUES (11,'Architect',3,3)

CREATE TABLE Enrollments
(
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT REFERENCES Students(Student_ID) ON DELETE CASCADE,
    Course_ID INT REFERENCES Courses(Course_ID),
    Enrollment_Date DATE
);


INSERT INTO Enrollments (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date)
VALUES
(1, 1, 1, '2024-01-15'),
(2, 1, 2, '2024-01-20'),
(3, 2, 3, '2024-02-02'),
(4, 3, 4, '2024-02-10'),
(5, 4, 5, '2024-02-15'),
(6, 5, 6, '2024-03-01'),
(7, 6, 7, '2024-03-10'),
(8, 7, 8, '2024-04-05'),
(9, 8, 9, '2024-04-15'),
(10, 9, 10, '2024-05-01');

INSERT INTO Enrollments VALUES(19,10,4,'2024-02-22')
UPDATE Enrollments SET Course_ID = 10 WHERE Enrollment_ID = 19

CREATE TABLE Teacher
(
    Teacher_ID INT PRIMARY KEY,
    First_Name VARCHAR(40),
    Last_Name VARCHAR(40),
    Email VARCHAR(40)
);

INSERT INTO Teacher (Teacher_ID, First_Name, Last_Name, Email)
VALUES
(1, 'Dr. Robert', 'Johnson', 'robert.johnson@example.com'),
(2, 'Prof. Sarah', 'Clark', 'sarah.clark@example.com'),
(3, 'Mr. James', 'Williams', 'james.williams@example.com'),
(4, 'Dr. Elizabeth', 'Jones', 'elizabeth.jones@example.com'),
(5, 'Prof. Michael', 'Brown', 'michael.brown@example.com'),
(6, 'Ms. Jennifer', 'Miller', 'jennifer.miller@example.com'),
(7, 'Dr. William', 'Davis', 'william.davis@example.com'),
(8, 'Prof. Mary', 'Wilson', 'mary.wilson@example.com'),
(9, 'Mr. David', 'Garcia', 'david.garcia@example.com'),
(10, 'Ms. Emma', 'Martinez', 'emma.martinez@example.com');

CREATE TABLE Payments
(
    Payment_ID INT PRIMARY KEY,
    Student_ID INT REFERENCES Students(Student_ID),
    Amount INT,
    Payment_Date DATE
);

INSERT INTO Payments (Payment_ID, Student_ID, Amount, Payment_Date)
VALUES
(1, 1, 500, '2024-01-20'),
(2, 2, 600, '2024-02-05'),
(3, 3, 700, '2024-02-25'),
(4, 4, 800, '2024-03-10'),
(5, 5, 900, '2024-03-25'),
(6, 6, 1000, '2024-04-10'),
(7, 7, 1100, '2024-04-20'),
(8, 8, 1200, '2024-05-05'),
(9, 9, 1300, '2024-05-20'),
(10, 10, 1400, '2024-06-05');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Teacher;
SELECT * FROM Payments;
INSERT INTO Payments VALUES(20,2,11500,'2023-07-17',10)

--TASK-2

--1.Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890

INSERT INTO Students VALUES(11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890);

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
--insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments VALUES(11, 2,4,'2023-07-05');

--3.Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

SELECT * FROM Teacher
UPDATE Teacher
SET Email = 'alice@gmail.com' WHERE Teacher_ID = 1;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. 
--   Select an enrollment record based on the student and course.
SELECT * FROM Enrollments
DELETE FROM Enrollments 
WHERE Student_ID = 1 AND Course_ID = 2;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
SELECT * FROM Courses
UPDATE Courses
SET Teacher_ID = 1 
WHERE Course_ID = 2;

--6.Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. 
--Be sure to maintain referential integrity.
ALTER TABLE Payments
ADD CONSTRAINT fk_Payments_Students FOREIGN KEY (Student_id)
REFERENCES Students(Student_id)
ON DELETE CASCADE;

DELETE FROM Students WHERE Student_ID = 1;

--7.Update the payment amount for a specific payment record in the "Payments" table. 
--Choose any payment record and modify the payment amount

UPDATE Payments 
SET Amount=773 WHERE Payment_ID = 3;




--TASK-3

--1. Write an SQL query to calculate the total payments made by a specific student. 
--You will need to join the "Payments" table with the "Students" table based on the student's ID.

SELECT s.first_name,s.last_name,SUM(p.Amount) AS Total_Payments
FROM Students s
INNER JOIN Payments p
ON s.student_id = p.student_id
WHERE s.Student_ID = 2
GROUP BY s.first_name,s.last_name;


--2.Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. 
--Use a JOIN operation between the "Courses" table and the "Enrollments" table.

SELECT c.Course_Name, COUNT(e.Student_ID) AS StudentsCount
FROM Courses c
LEFT JOIN Enrollments e ON c.Course_ID = e.Course_ID
GROUP BY c.Course_Name;

--3.Write an SQL query to find the names of students who have not enrolled in any course. 
--Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify 
--students without enrollments.

SELECT s.Student_ID,s.first_name,s.last_name
FROM Students s
LEFT JOIN Enrollments e
ON s.Student_ID = e.Student_ID
WHERE e.Student_ID IS NULL;

--4.Write an SQL query to retrieve the first name, last name of students, and the names 
--of the courses they are enrolled in. Use JOIN operations between the "Students" table 
--and the "Enrollments" and "Courses" tables.

SELECT s.First_Name, s.Last_Name, c.Course_Name
FROM Students s
INNER JOIN Enrollments e ON s.Student_ID = e.Student_ID
INNER JOIN Courses c ON e.Course_ID = c.Course_ID;

--5. Create a query to list the names of teachers and the courses they are assigned to. 
--Join the "Teacher" table with the "Courses" table.

SELECT t.First_Name,t.Last_Name, c.Course_Name
FROM Teacher t
INNER JOIN Courses c
ON t.Teacher_ID =  c.Teacher_ID;

--6.Retrieve a list of students and their enrollment dates for a specific course. 
--You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

SELECT s.First_Name, s.Last_Name, e.Enrollment_Date
FROM Students s
INNER JOIN Enrollments e ON s.Student_ID = e.Student_ID
INNER JOIN Courses c ON e.Course_ID = c.Course_ID
WHERE c.Course_Name = 'Music';

--7.Find the names of students who have not made any payments. 
--Use a LEFT JOIN between the "Students" table and the "Payments" table 
--and filter for students with NULL payment records.

SELECT s.Student_ID,s.First_Name, s.Last_Name
FROM Students s
LEFT JOIN Payments p ON s.Student_ID = p.Student_ID
WHERE p.Student_ID IS NULL;




--8.Write a query to identify courses that have no enrollments. 
--You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table 
--and filter for courses with NULL enrollment records.

SELECT c.Course_ID,c.Course_Name
FROM Courses c
LEFT JOIN Enrollments e
ON c.Course_ID = e.Course_ID
WHERE e.Course_ID IS NULL;


--9.Identify students who are enrolled in more than one course. 
--Use a self-join on the "Enrollments" table to find students with multiple enrollment records.

SELECT e1.Student_ID, COUNT(*) AS EnrolledCount
FROM Enrollments e1
INNER JOIN Enrollments e2 ON e1.Student_ID = e2.Student_ID
WHERE e1.Course_ID <> e2.Course_ID
GROUP BY e1.Student_ID
HAVING COUNT(e1.Student_ID) > 1;


--10.Find teachers who are not assigned to any courses.
--Use a LEFT JOIN between the "Teacher" table and the "Courses" table 
--and filter for teachers with NULL course assignments.

SELECT *
FROM Teacher t
LEFT JOIN Courses c ON t.Teacher_ID = c.Teacher_ID
WHERE c.Teacher_ID IS NULL;


--TASK-4

--1.Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.

SELECT c.Course_ID,c.Course_Name,AVG(num_students) AS "Average_Students_enrolled"
FROM Courses c
LEFT JOIN
(
     SELECT course_id,COUNT(*) AS num_students
     FROM Enrollments
     GROUP BY course_id
    ) AS e ON c.Course_ID = e.Course_Id
GROUP BY c.Course_ID, c.Course_Name;

--2.Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.
SELECT * 
FROM Students s
WHERE s.Student_ID IN
(
	SELECT p.Student_ID
	FROM Payments p
	WHERE Amount = 
	(
	SELECT MAX(Amount)
	FROM Payments
	)
);

--3.Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count.

SELECT c.Course_Name,
(
SELECT COUNT(Enrollment_ID) 
FROM Enrollments e
WHERE e.Course_ID = c.Course_ID
GROUP BY e.Course_ID
) AS Enrolled_Count
From Courses c
ORDER BY Enrolled_Count DESC;

--4.Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses.

ALTER TABLE Payments ADD Course_ID INT
SELECT * FROM Enrollments
SELECT * FROM Payments

UPDATE Payments SET Course_ID = 8 WHERE Payment_ID = 10

SELECT c.Course_id, c.Course_name, t.First_name AS Teacher_First_Name, 
    (
	SELECT SUM(p.Amount) 
     FROM Payments p 
     WHERE p.Course_id = c.Course_id) AS Total_Amount_Spent
FROM Courses c
JOIN Teacher t ON c.Teacher_id = t.Teacher_id
ORDER BY t.First_name;


 --5.Identify students who are enrolled in all available courses. Use subqueries to compare a
--student's enrollments with the total number of courses.

SELECT s.Student_ID, s.First_Name, s.Last_Name
FROM Students s
WHERE (SELECT COUNT(*) FROM Enrollments e WHERE e.Student_ID = s.Student_ID) = 
(SELECT COUNT(*) FROM Courses);

--6.Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
--find teachers with no course assignments.

SELECT t.Teacher_ID,t.First_Name
FROM Teacher t
WHERE t.Teacher_ID NOT IN (SELECT c.Teacher_ID FROM Courses c WHERE c.Teacher_ID IS NOT NULL);

--7.Calculate the average age of all students. Use subqueries to calculate the age of each student
--based on their date of birth.
SELECT * FROM Students
SELECT AVG(Age) AS AVERAGE_AGE
FROM(
  SELECT DATEDIFF(YEAR,Date_of_Birth,GETDATE()) AS Age
  FROM Students
) AS Student_age

--8.Identify courses with no enrollments. Use subqueries to find courses without enrollment
--records.

SELECT c.Course_ID,c.Course_Name
FROM Courses c
WHERE c.Course_ID NOT IN (SELECT e.Course_ID FROM Enrollments e WHERE e.Course_ID IS NOT NULL);

--9.Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.

SELECT s.Student_ID, s.first_name, s.Last_Name,
(
	SELECT SUM(p.Amount)
	From Payments p
	WHERE p.Student_ID = s.Student_ID
)AS TOTAL_PAYMENTS
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.Student_ID, s.first_name, s.Last_Name;

--10.Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.

SELECT s.Student_ID,s.First_Name,s.Last_Name
FROM Students s
WHERE (SELECT COUNT(*) FROM Payments p WHERE s.Student_ID = p.Student_ID) > 1

--11.Write an SQL query to calculate the total payments made by each student. Join the "Students"
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
--student.

SELECT s.Student_ID, s.first_name, s.Last_Name,
(
        SELECT SUM(p.Amount)
        FROM Payments p
        WHERE p.Student_ID = s.Student_ID
    ) AS Total_Payments
FROM Students s


--12.Retrieve a list of course names along with the count of students enrolled in each course. Use
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
--count enrollments.

SELECT c.Course_Name, 
(
	SELECT COUNT(*)
	FROM Enrollments e
	WHERE e.Course_ID = c.Course_ID
) AS Count_Enrolled
FROM Courses c;

--13.Calculate the average payment amount made by students. Use JOIN operations between the
--"Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT s.Student_ID,s.First_Name,
    (SELECT AVG(p.Amount) 
     FROM Payments p 
     WHERE p.Student_ID = s.Student_ID) AS Average_Payment_Amount
FROM 
    Students s;
--OR--
SELECT 
    AVG(p.Amount) AS Average_Payment_Amount
FROM 
    Payments p;
