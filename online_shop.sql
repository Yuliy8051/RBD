create table Accounts
(
    ID       int primary key auto_increment,
    email    varchar(50) unique not null,
    password text               not null,
    username varchar(20) unique
);

create table Customers
(
    ID           int primary key auto_increment,
    first_name   varchar(30) not null,
    last_name    varchar(30) not null,
    phone_number varchar(20) not null,
    account_ID   int
);

create table Address
(
    ID           int primary key auto_increment,
    country      varchar(20) not null,
    city         varchar(20) not null,
    postcode     varchar(6)  not null,
    street       varchar(20) not null,
    house_number smallint    not null,
    local_number smallint
);

create table Orders
(
    ID                 int primary key auto_increment,
    purchase_date      datetime       not null,
    total_price        decimal(10, 2) not null,
    delivery_date      date           not null,
    delivery_status    varchar(40)    not null,
    payment_method     varchar(40)    not null,
    transaction_status varchar(40),
    discount_code      varchar(16),
    customer_ID        int            not null
);

create table Product
(
    ID          int primary key auto_increment,
    price       decimal(10, 2) not null,
    name        text           not null,
    description text
);

alter table Customers
    add foreign key (account_ID) references Accounts (ID);

create table Customers_Addresses
(
    customer_ID int not null,
    address_ID  int not null,
    primary key (customer_ID, address_ID),
    foreign key (customer_ID) references Customers (ID),
    foreign key (address_ID) references Accounts (ID)
);

alter table Orders
    add foreign key (customer_ID) references Customers (ID);

create table Addresses_Orders
(
    addresses_ID int not null,
    order_ID     int,
    primary key (addresses_ID, order_ID),
    foreign key (addresses_ID) references Address (ID),
    foreign key (order_ID) references Orders (ID)
);

create table Orders_Products
(
    order_ID   int,
    product_ID int not null,
    primary key (order_ID, product_ID),
    foreign key (order_ID) references Orders (ID),
    foreign key (product_ID) references Product (ID)
);

insert into Accounts (email, password, username)
values ('denn8051@gmail.com', 'password1', 'Yuliy8051'),
       ('denn8052@gmail.com', 'password2', 'Yuliy8052');

insert into Customers (first_name, last_name, phone_number, account_ID)
values ('Denys', 'Novikov', '+48793115951', 1),
       ('Kyrylo', 'Krainiuk', '+48793864848', 2),
       ('Olga', 'Manzhala', '+48793987654', 1),
       ('Maryna', 'Pasieka', '+48793123456', 2);

alter table Customers
    modify column account_ID int not null;

insert into Address (country, city, postcode, street, house_number, local_number)
values ('Poland', 'Gdańsk', '80-387', 'Lęborska', 21, 100),
       ('Poland', 'Gdańsk', '80-888', 'Pomorska', 94, 14);
insert into Address (country, city, postcode, street, house_number)
values ('Ukraine', 'Kalanchak', '75800', 'Komarova', 137),
       ('Poland', 'Gdańsk', '80-387', 'Asesora', 46);

alter table Customers_Addresses
    drop foreign key Customers_Addresses_ibfk_2;
alter table Customers_Addresses
    add foreign key (address_ID) references Address (ID);

insert into Customers_Addresses (customer_ID, address_ID)
values (1, 1),
       (1, 3),
       (2, 4),
       (3, 1),
       (4, 2);

insert into Orders (purchase_date, total_price, delivery_date, delivery_status, payment_method, transaction_status,
                    discount_code, customer_ID)
values ('2024-04-10 00:00:00', 3598.98, '2024-04-12', 'shipped', 'BLIK', 'completed', '1234567896270135', 1),
       ('2024-04-09 00:00:00', 1499.99, '2024-04-11', 'shipped', 'BLIK', 'completed', '1234567896270135', 2);

insert into Orders (purchase_date, total_price, delivery_date, delivery_status, payment_method, transaction_status,
                    customer_ID)
values ('2024-04-11 14:30:00', 319.99, '2024-04-12', 'shipped', 'BLIK', 'completed', 1),
       ('2024-04-11 09:40:00', 77.54, '2024-04-12', 'shipped', 'BLIK', 'completed', 3);

insert into Addresses_Orders (addresses_ID, order_ID)
VALUES (1, 1),
       (1, 3),
       (1, 4),
       (4, 2);

insert into Product (price, name, description)
values (1499.99, 'Telowizor Samsung',
        'A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from 1000-01-01 00:00:00 to 9999-12-31 23:59:59. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time'),
       (2099.99, 'PlayStation 5 slim', 'A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.
MySQL 8.0 does not support year in two-digit format.'),
       (319.99, 'God of War Ragnarök Gra PS5',
        'Wyrusz w epicką, poruszającą podróż, w czasie której Kratos i Atreus uczą się stawiać na swoim i odpuszczać'),
       (49.35, 'Kostyki 1', 'Jakieś kosmetyki. Nie jestem w tym specjalistą'),
       (18.19, 'Kostyki 2', 'Jakieś kosmetyki. Nie jestem w tym specjalistą');

insert into Orders_Products (order_ID, product_ID)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 3),
       (4, 4),
       (4, 5);

SELECT phone_number
FROM Customers
         JOIN Orders ON Orders.customer_ID = Customers.ID
WHERE Orders.discount_code = '1234567896270135';

SELECT house_number
FROM Address
         JOIN Addresses_Orders ON Address.ID = Addresses_Orders.addresses_ID
         JOIN Orders ON Addresses_Orders.order_ID = Orders.ID
WHERE Orders.ID = 2;

SELECT first_name, last_name
FROM Customers
         JOIN Orders ON Customers.ID = Orders.customer_ID
WHERE Orders.ID = 4;

SELECT total_price
FROM Orders
         JOIN Customers ON Customers.ID = Orders.customer_ID
WHERE Customers.first_name = 'Denys'
  AND Customers.last_name = 'Novikov';

select first_name, last_name
from Customers
         join Address on Address.ID = Customers.account_ID
where Address.street = 'Lęborska'
  and Address.house_number = 21
  and Address.local_number = 100;

select username
from Accounts
         join Customers on Customers.account_ID = Accounts.ID
         join Orders on Orders.customer_ID = Customers.ID
         join Orders_Products on Orders_Products.order_ID = Orders.ID
         join Product on Product.ID = Orders_Products.product_ID
         where Product.name = 'Telowizor Samsung'