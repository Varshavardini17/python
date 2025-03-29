create table books1 (bookid int primary key,title varchar(50) not null,author varchar(30),genre varchar(50),price decimal(10,2),stock int );

create table customers2 (customerid int primary key,firstname varchar(50) not null,lastname varchar(50) not null,city varchar(50));

create table orders2 (orderid int primary key,customerid int,bookid int,orderdate date,quantity int,foreign key (customerid) references customers2(customerid),foreign key (bookid) references books1(bookid));

create table auditlog (logid int identity primary key,bookid int,old_price decimal(10,2),new_price decimal(10,2),change_date datetime default getdate());

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

insert into auditlog (bookid, old_price, new_price)values(1, 100.00, 120.00);
insert into auditlog (bookid, old_price, new_price)values(2, 200.00, 180.00);
insert into auditlog (bookid, old_price, new_price)values(3, 400.00, 450.00);


create view customerview as select c.firstname  as customer_name,b.title as book_title,o.orderdate
from orders2 o
join customers2 c on o.customerid = c.customerid
join books1 b on o.bookid = b.bookid;


create view sales_per_genre as select b.genre, sum(o.quantity * b.price) as total_sales from orders2 o
join books1 b on o.bookid = b.bookid
group by b.genre;

create procedure insert_order
    @customerid int,
    @bookid int,
    @orderdate date,
    @quantity int
as begin insert into orders2 (customerid, bookid, orderdate, quantity)values (@customerid, @bookid, @orderdate, @quantity);
end;

create procedure get_customer_orders
    @customerid int
as begin select o.orderid, o.orderdate, b.title, o.quantity from orders2 o join books1 b on o.bookid = b.bookid where o.customerid = @customerid;
end;
