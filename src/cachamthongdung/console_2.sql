CREATE DATABASE quan_ly_sinh_vien;

USE quan_ly_sinh_vien;

CREATE TABLE class(
                      class_id INT NOT NULL AUTO_INCREMENT,
                      class_name VARCHAR(60) NOT NULL,
                      start_date DATETIME NOT NULL,
                      status BIT,
                      PRIMARY KEY (class_id)
);

CREATE TABLE student(
                        student_id INT NOT NULL AUTO_INCREMENT,
                        student_name VARCHAR(30) NOT NULL,
                        address VARCHAR(50),
                        phone VARCHAR(20),
                        status BIT,
                        class_id INT NOT NULL,
                        PRIMARY KEY (student_id),
                        FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE subject(
                        sub_id INT NOT NULL AUTO_INCREMENT,
                        sub_name VARCHAR(30) NOT NULL,
                        credit TINYINT NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
                        status BIT DEFAULT 1,
                        PRIMARY KEY (sub_id)
);

CREATE TABLE mark(
                     mark_id INT NOT NULL AUTO_INCREMENT,
                     sub_id INT NOT NULL,
                     student_id INT NOT NULL,
                     mark FLOAT DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
                     exam_times TINYINT DEFAULT 1,
                     UNIQUE (sub_id, student_id),
                     PRIMARY KEY (mark_id),
                     FOREIGN KEY (sub_id) REFERENCES subject (sub_id),
                     FOREIGN KEY (student_id) REFERENCES student (student_id)
);

SELECT *
FROM subject
WHERE credit = (SELECT MAX(credit) FROM subject);

SELECT sub_name, MAX(mark) AS highest_mark
FROM subject
         JOIN mark ON mark.sub_id = subject.sub_id
GROUP BY sub_name
HAVING MAX(mark) = (SELECT MAX(mark) FROM mark);

-- Truy vấn 3: Lấy danh sách sinh viên và điểm trung bình
SELECT student.student_id, student.student_name, AVG(mark.mark) AS average_mark
FROM student
         JOIN mark ON mark.student_id = student.student_id
GROUP BY student.student_id, student.student_name
ORDER BY AVG(mark.mark) DESC;
