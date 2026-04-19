
 create database examsystem;
 
 use examsystem;

Create Table students (
         student_Id INT PRIMARY KEY,
         Name VARCHAR(50),
         Class VARCHAR(20)
     );

Create Table subject (
         subject_Id INT PRIMARY KEY,
         subject_Name VARCHAR(50));

Create Table exams(
         exams_Id INT PRIMARY KEY,
         exams_Name VARCHAR(50),
         exams_Date Date
 );

select * from students;

select * from subject;

select * from exams;

create table mark(
          marks_Id INT PRIMARY KEY AUTO_INCREMENT,
          student_Id INT,
          subject_Id INT,
          exams_Id INT,
          mark INT,
          FOREIGN KEY (student_Id) REFERENCES students(student_Id),
          FOREIGN KEY (subject_Id) REFERENCES subject(subject_Id),
          FOREIGN KEY (exams_Id) REFERENCES exams(exams_Id));

insert into mark (student_Id,subject_Id,exams_Id,mark) VALUES
     (1,101,1,89);
insert into mark (student_Id,subject_Id,exams_Id,mark) VALUES
     (1,101,1,89);

select * from mark;

SELECT students.Name, subject.subject_Name, mark.mark
     FROM mark mark
     JOIN students students ON mark.student_Id = students.student_Id
     JOIN subject subject ON mark.subject_Id = subject.subject_Id;

SELECT students.Name, SUM(mark.mark) AS total_marks
     FROM mark mark
     JOIN students students ON mark.student_Id = students.student_Id
     GROUP BY students.Name;

SELECT students.Name, AVG(mark.mark) AS avg_marks
     FROM mark mark
     JOIN students students ON mark.student_Id = students.student_Id
     GROUP BY students.Name;

SELECT students.Name, SUM(mark.mark) AS total
         FROM mark mark
         JOIN students students ON mark.student_Id = students.student_Id
         GROUP BY students.Name
         ORDER BY total DESC
         LIMIT 1;

SELECT students.Name, mark.mark
     FROM mark mark
     JOIN students students ON mark.student_Id = students.student_Id
     WHERE mark.mark > 80;


 DELETE FROM mark
     WHERE marks_Id NOT IN (
         SELECT * FROM (
             SELECT MIN(marks_Id)
             FROM mark
             GROUP BY student_Id, subject_Id, exams_Id
              ) AS temp
     );

UPDATE mark
SET mark = 95
WHERE student_Id = 1 AND subject_Id = 101;


select * from mark;

DELETE FROM mark
WHERE student_Id = 1;












