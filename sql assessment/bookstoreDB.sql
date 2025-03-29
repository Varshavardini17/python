create table authors(authorId int primary key,firstname varchar(50),lastname varchar(50));
create table books(bookid int primary key,title varchar(100),authorid int foreign key references authors(authorid),isbn varchar(20),price decimal(10));
create table customers(customerid int primary key,firstname varchar(50),lastname varchar(50),email varchar(100),address varchar(200));
create table orders (orderid int primary key,customerid int foreign key references customers(customerid),orderdate date);
create table orderitems(orderitemid int primary key,orderid  int foreign key references orders(orderid),bookid int foreign key references books(bookid),quantity int);
select * from authors;
select * from books;
select * from customers;
select * from orders;
select * from orderitems;
alter table authors add biogarghy text;
EXEC sp_rename 'books', 'bookinventory';
select * from bookinventory;
drop table orderitems;


insert into authors (authorid,firstname,lastname,biogarghy)values(1,'varsha','vardini','first book');
insert into authors (authorid,firstname,lastname,biogarghy)values(2,'kalpana','velmurugan','second book');
insert into authors (authorid,firstname,lastname,biogarghy)values(3,'thiru','venkata','third book');
insert into authors (authorid,firstname,lastname,biogarghy)values(4,'balaji','sakthivel','fourth book');
insert into authors (authorid,firstname,lastname,biogarghy)values(5,'afsaru','nissa','fifth book');

insert into bookinventory(bookid,title,authorid,isbn,price)values(123,'dreamy world',1,123-345-567,77.0);
insert into bookinventory(bookid,title,authorid,isbn,price)values(124,'fanatsy world',2,123-345-577,80.1);
insert into bookinventory(bookid,title,authorid,isbn,price)values(125,'competitive world',3,123-345-587,78.0);
insert into bookinventory(bookid,title,authorid,isbn,price)values(126,'web world',4,123-445-567,60.0);
insert into bookinventory(bookid,title,authorid,isbn,price)values(127,'best world',5,223-345-567,33.3);

insert into customers(customerid,firstname,lastname,email,address)values(001,'varsha','vardini','varsha@gamil.com','no 1 gandhi street bangalore');
insert into customers(customerid,firstname,lastname,email,address)values(002,'kalpana','velmurugan','kalpana@gamil.com','no 3 gandhi street pune');
insert into customers(customerid,firstname,lastname,email,address)values(003,'thiru','venkata','thiru@gamil.com','no 4 good street kashmir');
insert into customers(customerid,firstname,lastname,email,address)values(004,'balaji','sakthivel','balaji@gamil.com','no 7 women street chennai');
insert into customers(customerid,firstname,lastname,email,address)values(005,'afsaru','nissa','afsar@gamil.com','no 3 insha street kerala');


insert into orders(orderid,customerid,orderdate)values(10,001,'2025-03-15');
insert into orders(orderid,customerid,orderdate)values(20,002,'2025-03-16');
insert into orders(orderid,customerid,orderdate)values(30,003,'2025-03-17');
insert into orders(orderid,customerid,orderdate)values(40,004,'2025-03-18');
insert into orders(orderid,customerid,orderdate)values(50,005,'2025-03-19');


update  bookinventory set  price=77.7 where bookid=123;
select title, price from bookinventory;
select firstname,lastname from customers;
select title from bookinventory where authorid=1;
select orderdate from orders where customerid=10;
select title from bookinventory where price>20;
select distinct lastname from customers;
select lastname from customers where lastname like's%';
select title from bookinventory where price between 60 and 70;
select orderid from orders where year(orderdate)=2025;