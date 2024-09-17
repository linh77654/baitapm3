CREATE database C0624;


use C0624;

create table account_codegym (
                                 username varchar(50),
                                 password_account varchar(50),
                                 primary key(username)
);
INSERT INTO account_codegym (username, password_account) VALUES ('linh77564', 'password123');


create table class_type(
                           id_type_class int auto_increment,
                           name_type varchar(50),
                           primary key(id_type_class)
);

create table class (
                       id_class int auto_increment,
                       name_class varchar(50),
                       id_type_class int,
                       primary key(id_class),
                       FOREIGN KEY (id_type_class) REFERENCES class_type(id_type_class)
);

create table student (
                         id_student int auto_increment,
                         name_student varchar(50),
                         id_class int,
                         username varchar(50) unique,
                         primary key(id_student),
                         FOREIGN KEY (username) REFERENCES account_codegym(username),
                         FOREIGN KEY (id_class) REFERENCES class(id_class)
);
insert into student(id_student, name_student, id_class, username) VALUE (1, 'Nguyễn Hoàng Linh', 1, 'linh77564');
SELECT * FROM account_codegym;
INSERT INTO student (name_student, id_class, username) VALUES ('Hải TT', 1, 'haiTT@gmail.com');

create table teacher (
                         id_teacher int auto_increment,
                         name_teacher varchar(50),
                         username varchar(50) unique,
                         primary key(id_teacher),
                         FOREIGN KEY (username) REFERENCES account_codegym(username)
);
SELECT * FROM class;
INSERT IGNORE INTO class (name_class, id_type_class) VALUES ('C0624h1', 1);


create table phone (
                       id_phone int auto_increment,
                       phone_number varchar(20),
                       id_student int,
                       id_teacher int,
                       primary key(id_phone),
                       FOREIGN KEY (id_student) REFERENCES student(id_student),
                       FOREIGN KEY (id_teacher) REFERENCES teacher(id_teacher)
);

create table teacher_class (
                               id_teacher int,
                               id_class int,
                               primary key(id_teacher, id_class),
                               FOREIGN KEY (id_teacher) REFERENCES teacher(id_teacher),
                               FOREIGN KEY (id_class) REFERENCES class(id_class)
)

SELECT s.name_student, c.name_class
FROM student s
         JOIN class c ON s.id_class = c.id_class;

SELECT s.name_student, c.name_class, ct.name_type
FROM student s
         JOIN class c ON s.id_class = c.id_class
         JOIN class_type ct ON c.id_type_class = ct.id_type_class;

SELECT s.name_student, c.name_class
FROM student s
         LEFT JOIN class c ON s.id_class = c.id_class;

SELECT * FROM student WHERE name_student IN ('Tien', 'Toan');

SELECT c.name_class, COUNT(s.id_student) AS number_of_students
FROM class c
         LEFT JOIN student s ON c.id_class = s.id_class
GROUP BY c.name_class;

SELECT name_student FROM student ORDER BY name_student;



