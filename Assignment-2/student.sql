-- Grades table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    grade_name VARCHAR(10)
);

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    student_age INT,
    student_grade_id INT,
    FOREIGN KEY (student_grade_id) REFERENCES Grades(grade_id)
);


-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



-- Insert into Grades table
INSERT INTO Grades (grade_id, grade_name) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- Insert into Courses table
INSERT INTO Courses (course_id, course_name) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'History');

-- Insert into Students table
INSERT INTO Students (student_id, student_name, student_age, student_grade_id) VALUES
(1, 'Alice', 17, 1),
(2, 'Bob', 16, 2),
(3, 'Charlie', 18, 1),
(4, 'David', 16, 2),
(5, 'Eve', 17, 1),
(6, 'Frank', 18, 3),
(7, 'Grace', 17, 2),
(8, 'Henry', 16, 1),
(9, 'Ivy', 18, 2),
(10, 'Jack', 17, 3);

-- Insert into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-09-01'),
(2, 1, 102, '2023-09-01'),
(3, 2, 102, '2023-09-01'),
(4, 3, 101, '2023-09-01'),
(5, 3, 103, '2023-09-01'),
(6, 4, 101, '2023-09-01'),
(7, 4, 102, '2023-09-01'),
(8, 5, 102, '2023-09-01'),
(9, 6, 101, '2023-09-01'),
(10, 7, 103, '2023-09-01');

--Questions
--1.Find all students enrolled in the Math course.
SELECT student_name
FROM Students, Enrollments, Courses
WHERE Students.student_id = Enrollments.student_id
  AND Enrollments.course_id = Courses.course_id
  AND Courses.course_name = 'Math';


--2. List all courses taken by students named Bob.
SELECT c.course_name  From  Courses c,Enrollments e,students s WHERE s.student_id =e.student_id  AND c.course_id =e.course_id  AND s.student_name ='Bob'
--3.Find the names of students who are enrolled in more than one course.
SELECT student_name From students s,courses c,enrollments e WHERE s.student_id =e.student_id AND c.course_id =e.course_id  GROUP BY s.student_id having count(c.course_id)>1

--4.List all students who are in Grade A
SELECT student_name From students s,grades g WHERE s.student_grade_id=g.grade_id  AND g.grade_name ='A'
--5.Find the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS student_count FROM Enrollments e, Courses c WHERE e.course_id = c.course_id GROUP BY c.course_name;
--6.Retrieve the course with the highest number of enrollments.
SELECT max(e.course_id),count(e.course_id),c.course_name  From courses c ,enrollments e WHERE e.course_id =c.course_id GROUP BY c.course_id order by count(e.course_id)desc limit 1
--7.List students who are enrolled in all available courses.
SELECT student_name FROM Students WHERE student_id IN (SELECT student_id  FROM Enrollments  GROUP BY student_id  HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(*) FROM Courses)
);

--8.Find students who are not enrolled in any courses.
SELECT student_name FROM Students WHERE student_id NOT IN (
  SELECT student_id
  FROM Enrollments
);

--9. Retrieve the average age of students enrolled in the Science course.
SELECT avg(student_age) From students s ,enrollments e ,courses c WHERE c.course_id =e.course_id AND s.student_id =e.student_id AND c.course_name ='Science'
--10. Find the grade of students enrolled in the History course.
SELECT s.student_name, g.grade_name,course_name  From grades g ,students s,enrollments e,courses c WHERE s.student_grade_id=g.grade_id AND s.student_id =e.student_id AND  e.course_id =c.course_id AND c.course_name ='History'



