CREATE DATABASE quan_ly_ban_hang;

use quan_ly_ban_hang;

create table Customer(
    cID int auto_increment,
    cName varchar(225),
    cAge int,
    primary key (cID)
);

create table Product(
    pId int auto_increment,
    pName text,
    pPrice DECIMAL(10, 2),
    primary key (pId)
);

create table OrderTable (
    oID int auto_increment,
    cID int ,
    oDate datetime,
    oTotalPrice DECIMAL(10, 2),
    primary key (oId),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

create table OrderDetail(
    oID int auto_increment,
    pID int ,
    odQTY int,
    primary key (oID,pID),
    FOREIGN KEY (oID) REFERENCES `OrderTable`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);



