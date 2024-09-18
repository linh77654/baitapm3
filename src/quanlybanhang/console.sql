CREATE DATABASE quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
    cID int auto_increment,
    cName varchar(225),
    cAge int,
    primary key (cID)
);

insert into customer(cID, cName, cAge) VALUE
    (1,'minh Quân',10),
    (2,'Ngọc Anh', 20),
    (3,'Hong Ha',30);

create table product(
    pId int auto_increment,
    pName text,
    pPrice DECIMAL(10, 2),
    primary key (pId)
);


create table ordertable (
    oID int auto_increment,
    cID int ,
    oDate datetime,
    oTotalPrice DECIMAL(10, 2),
    primary key (oId),
    FOREIGN KEY (cID) REFERENCES customer(cID)
);
insert into ordertable(cID, oDate, oTotalPrice) VALUE
    (1,'2006-3-21',null),
    (2,'2006-3-23',null),
    (1,'2006-3-16',null);


create table orderdetail(
    oID int auto_increment,
    pID int ,
    odQTY int,
    primary key (oID,pID),
    FOREIGN KEY (oID) REFERENCES `ordertable`(oID),
    FOREIGN KEY (pID) REFERENCES product(pID)
);

insert into orderdetail(oID, pID, odQTY) values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

