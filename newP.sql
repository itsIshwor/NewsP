/*create database named practice*/
create database practice;
/*use named practice for further action*/
use practice;
/*show all the tables*/
show tables;
/*create tables  named categoris with id and name colums */
create table categories(
	cid int(20) primary key auto_increment,
    cname varchar(255)
) ; 
/*select all colums and rows from categories table*/
select * from categories;
 select  *, count(*) as total 
 from categories;
/*Create table news with colum news nid primary key newsTitle news and Category*/
create table news(
	nid int(20) primary key auto_increment,
    newstitle varchar(300),
    news varchar(1000),
    category varchar(255)
);
/*Describe news Table*/
select * from  news 
;
select *,count(news) as count
 from  news 
where category = "Sports";


desc news;
/*select all record from news table*/
select * from news;
drop table newsi;
create table admin(
	aid int(3) primary key auto_increment,
    email varchar(30),
    passwordn varchar(12)
);
/* i have inserted one values for admin */
insert into admin values(1,'upretyishwor71@gmail.com','password');
select * from admin;

create table semailList(
	sid int(4) primary key auto_increment,
    s_email varchar(40)
);
select * from semailList;


