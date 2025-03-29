create table books1(bookid int primary key,title varchar(50)not null,author varchar(30),genre varchar(50),price decimal(10,2));
create table customers2(customerid int primary key,firstname varchar(50)not null,lastname varchar(50) not null,city varchar(50));
create table orders2(orderid int primary key,customerid int,bookid int,orderdate date,quantity int,foreign key(customerid)references customers2(customerid),foreign key(bookid)references books1(bookid));

insert into books1(bookid,title,author,genre,price)values(1,'harry potter','j.k.rowling','fiction',100);
insert into books1(bookid,title,author,genre,price)values(2,'my gita','tharun','mystery',200);
insert into books1(bookid,title,author,genre,price)values(3,'life after death','dinesh','non-fiction',400);
insert into books1(bookid,title,author,genre,price)values(4,'barbie','varun',' non-fiction',500);

insert into customers2(customerid,firstname,lastname,city)values(01,'varsha','vardini','pondy');
insert into customers2(customerid,firstname,lastname,city)values(02,'balaji','sakthivel','chennai');
insert into customers2(customerid,firstname,lastname,city)values(03,'thiru','velmurugan','pune');
insert into customers2(customerid,firstname,lastname,city)values(04,'kalpana','guna','mumbai');

insert into orders2(orderid,customerid,bookid,orderdate,quantity)values(001, 01, 1, '2024-03-01', 2);
insert into orders2(orderid,customerid,bookid,orderdate,quantity)values(002, 02, 3, '2024-03-02', 1);
insert into orders2(orderid,customerid,bookid,orderdate,quantity)values(003, 03, 2, '2024-03-05', 3);
insert into orders2(orderid,customerid,bookid,orderdate,quantity)values(004, 01, 4, '2024-03-07', 1);


select O.orderid, C.firstname  as CustomerName, B.title, O.orderdate
from orders2 O inner join customers2 C on O.customerid = C.customerid inner join books1 B on O.bookid = B.bookid;


select C.firstname  as CustomerName, B.title, O.quantity
from orders2 O inner join customers2 C on O.customerid = C.customerid inner join books1 B on O.bookid = B.bookid;


select distinct B.title from books1 B inner join orders2 O on B.bookid = O.bookid inner join customers2 C on O.customerid = C.customerid
where C.city = 'Pondy';  


select distinct C.firstname  as CustomerName from customers2 C inner join orders2 O on C.customerid = O.customerid inner join books1 B on O.bookid = B.bookid
where B.genre = 'Mystery';


select title from books1 where price > (select AVG(price) from books1);


select C.customerid, C.firstname  as CustomerName from customers2 C
where (select COUNT(*) from orders2 O where O.customerid = C.customerid) > 
      (select AVG(OrderCount) from(select customerid, COUNT(*) as OrderCount from orders2 group by customerid) as AvgOrders);