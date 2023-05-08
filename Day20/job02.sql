mysql> CREATE TABLE Floor (
    -> Id       int     NOT NULL AUTO_INCREMENT,
    -> Nom      varchar(255) NOT NULL,
    -> Numero   int     NOT NULL,
    -> Area     int,
    -> PRIMARY KEY (Id)
    -> );

mysql> create table rooms (
    -> Id       int     NOT NULL AUTO_INCREMENT,
    -> Nom      varchar(255),
    -> Floor_id int,
    -> Capacity int,
    -> PRIMARY KEY (Id)
    -> );