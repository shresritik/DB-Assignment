--Book (with attributes like book_id, title, author, genre, publisher, publication_year)
--Author (with attributes like author_id, author_name, birth_date, nationality)
--Publisher (with attributes like publisher_id, publisher_name, country)
--Customer (with attributes like customer_id, customer_name, email, address)
--Order (with attributes like order_id, order_date, customer_id, total_amount)
CREATE SCHEMA Book;
set search_path to Book;
create table Publisher (
publisher_id SERIAL primary key , 

publisher_name VARCHAR(50) not NULL, 
country VARCHAR(50) not NULL


);
create table Book (
book_id SERIAL primary key , 
title VARCHAR(50) not NULL,
author VARCHAR(50) not NULL, 
genre VARCHAR(50) not NULL, 
publisher_id int not NULL, 
publication_year DATE not NULL,  
foreign key (publisher_id) references Publisher(publisher_id)
);
create table Author (
author_id SERIAL primary key , 
author_name VARCHAR(50) not NULL, 
nationality VARCHAR(50) not NULL, 
birth_date DATE 
);

create table Customer (
customer_id SERIAL primary key , 

customer_name VARCHAR(50) not NULL, 
email VARCHAR(50) not NULL, 
address VARCHAR(50) not NULL

);


create table Orders (
order_id SERIAL primary key, 
customer_id int not NULL,
total_amount int not NULL, 
order_date Date not NULL,
foreign key (customer_id) references Customer(customer_id)
);

create table Book_Author(
book_id int not null,
author_id int not null,
foreign key (book_id) references Book(book_id),
foreign key (author_id) references Author(author_id)
);
create table Order_Items(
order_id int not null,
book_id int not null,
foreign key (book_id) references Book(book_id),
foreign key (order_id) references Orders(order_id)
)
