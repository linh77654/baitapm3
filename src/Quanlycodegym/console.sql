CREATE database quan_ly_codegym;

use quan_ly_codegym;

CREATE TABLE Student(
    MaHs VARCHAR(20) primary key ,
    TenHs varchar(50),
    ngay_sinh datetime,
    SĐT varchar(11),
    lop varchar(30)
);

CREATE TABLE teacher(
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(50),
    SDT VARCHAR(10)
);

CREATE TABLE class(
    Tenlop varchar(20) PRIMARY KEY ,
    ngay_bat_dau date,
    ngay_ket_thuc date,
    number_of_students int,
    MaGv varchar(20),
    FOREIGN KEY (MaGV) REFERENCES Teacher(MaGV)
);

CREATE TABLE Account(
    AccountID VARCHAR(20) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Role VARCHAR(20),
    MaHs VARCHAR(20),
    MaGV VARCHAR(20),
    FOREIGN KEY (MaHs) REFERENCES Student(MaHs),
    FOREIGN KEY (MaGV) REFERENCES Teacher(MaGV)
);