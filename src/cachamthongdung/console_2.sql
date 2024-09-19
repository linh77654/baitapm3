CREATE DATABASE quan_ly_sinh_vien;

USE quan_ly_sinh_vien;

CREATE TABLE class(
    ClassID INT NOT NULL AUTO_INCREMENT ,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    primary key (ClassID),
    Status BIT
);

CREATE TABLE student(
    StudentId INT NOT NULL AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassId INT NOT NULL,
    primary key (StudentId),
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);

CREATE TABLE subject(
    SubId INT NOT NULL AUTO_INCREMENT ,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status BIT DEFAULT 1,
    primary key (SubId)
);

CREATE TABLE mark(
    MarkId INT NOT NULL AUTO_INCREMENT,
    SubId INT NOT NULL,
    StudentId INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    primary key (MarkId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

SELECT *
FROM subject
WHERE credit = (SELECT MAX(credit) FROM subject);

select SubName, max(MarK)
from subject
         join
     mark on mark.SubId = subject.SubId
group by SubName
having max(Mark) = (select max(Mark) from Mark);


select student.StudentId, student.StudentName, avg(mark.MarK) as average_mark
from student
         join
     mark on mark.StudentId = student.StudentId
group by student.StudentId, student.StudentName
order by avg(mark.MarK) desc;