create table User_marks
(
    ID           int auto_increment primary key,
    behavior     smallint not null check (1 <= behavior <= 5),
    waiting_time int      not null,
    user_ID      int      not null
);

create table Users
(
    ID            int auto_increment primary key,
    name          varchar(50) not null,
    surname       varchar(50) not null,
    email         varchar(50) not null unique,
    date_of_birth date        not null,
    phone         varchar(50) not null unique
);

create table Orders
(
    ID              int auto_increment primary key,
    user_ID         int not null,
    star_address_ID int not null,
    end_address_ID  int not null,
    driver_ID       int not null,
    car_type_ID     int not null,
    payment_ID      int not null unique
);

create table Addresses
(
    ID           int auto_increment primary key,
    city         varchar(50) not null,
    postcode     varchar(10) not null,
    street       varchar(50) not null,
    house_number smallint    not null
);

create table Payments
(
    ID        int primary key auto_increment,
    method_ID smallint       not null check (method_ID between 1 and 3),
    price     decimal(10, 2) not null,
    date      datetime       not null
);

create table Methods
(
    ID   int primary key auto_increment,
    Type varchar(50) not null unique
);

create table Driver_marks
(
    ID            int primary key auto_increment,
    skills        smallint not null check (skills between 1 and 5),
    car_condition smallint not null check (skills between 1 and 5),
    rules         smallint not null check (skills between 1 and 5),
    driver_ID     int      not null
);

create table Drivers
(
    ID      int primary key auto_increment,
    name    varchar(50) not null,
    surname varchar(50) not null,
    age     smallint    not null,
    photo   text        not null,
    car_ID  int         not null unique
);

create table Cars
(
    ID                  int primary key auto_increment,
    make                varchar(50) not null,
    model               varchar(50) not null,
    color               varchar(50) not null,
    registration_number varchar(10) not null unique,
    type_ID             smallint    not null check (type_ID between 1 and 4)
);

create table Car_types
(
    ID   int primary key auto_increment,
    type varchar(20) not null unique
);

alter table User_marks
    add foreign key (user_ID) references Users (ID);

alter table Driver_marks
    add foreign key (driver_ID) references Drivers (ID);

alter table Drivers
    add foreign key (car_ID) references Cars (ID);

alter table Car_types
    modify column ID smallint auto_increment;

alter table Cars
    add foreign key (type_ID) references Car_types (ID);

alter table Methods
    modify column ID smallint auto_increment;

alter table Payments
    add foreign key (method_ID) references Methods (ID);

alter table Orders
    add foreign key (user_ID) references Users (ID);

alter table Orders
    add foreign key (star_address_ID) references Addresses (ID);

alter table Orders
    add foreign key (end_address_ID) references Addresses (ID);

alter table Orders
    add foreign key (driver_ID) references Drivers (ID);

alter table Orders
    modify column car_type_ID smallint not null;

alter table Orders
    add foreign key (car_type_ID) references Car_types (ID);

alter table Orders
    add foreign key (payment_ID) references Payments (ID);

alter table Driver_marks
    modify column car_condition smallint not null check (car_condition between 1 and 5);
alter table Driver_marks
    modify column rules smallint not null check (rules between 1 and 5);

insert into Users (name, surname, email, date_of_birth, phone)
VALUES ('Denys1', 'Novikov1', 'denn8051@gmail.com', '2006-04-16', '793115951'),
       ('Denys2', 'Novikov2', 'denn8052@gmail.com', '2006-04-17', '793115952'),
       ('Denys3', 'Novikov3', 'denn8053@gmail.com', '2006-04-18', '793115953'),
       ('Denys4', 'Novikov4', 'denn8054@gmail.com', '2006-04-19', '793115954'),
       ('Denys5', 'Novikov5', 'denn8055@gmail.com', '2006-04-20', '793115955');

insert into User_marks (behavior, waiting_time, user_ID)
values (5, 0, 1),
       (4, 5, 1),
       (2, 20, 1),
       (4, 4, 2),
       (14, 2, 2),
       (3, 3, 3),
       (4, 3, 4),
       (4, 3, 4),
       (1, 45, 5);

insert into Car_types (type)
values ('usual'), ('suv'), ('mini-van'), ('luxury');

insert into Cars (make, model, color, registration_number, type_ID)
values ('make1', 'model1', 'blue', 'WH 43442', 1),
       ('make1', 'model2', 'red', 'GD 43442', 1),
       ('make2', 'model4', 'black', 'GD 45668', 4),
       ('make3', 'model3', 'black', 'GD 45678', 2),
       ('make3', 'model3', 'black', 'GD 45677', 2),
       ('make4', 'model5', 'white', 'GD 45679', 3);

insert into Drivers (name, surname, age, photo, car_ID)
values ('Kyrylo1', 'Krainiuk1', 20, 'photo1', 1),
       ('Kyrylo2', 'Krainiuk2', 40, 'photo2', 2),
       ('Kyrylo3', 'Krainiuk3', 35, 'photo3', 3),
       ('Kyrylo4', 'Krainiuk4', 24, 'photo4', 4),
       ('Kyrylo5', 'Krainiuk5', 39, 'photo5', 5),
       ('Kyrylo6', 'Krainiuk6', 19, 'photo6', 6);

insert into Driver_marks (skills, car_condition, rules, driver_ID)
values (5,5,5,1),
       (5,5,5,1),
       (5,5,5,1),
       (3,4,5,2),
       (3,4,3,2),
       (3,2,3,2),
       (3,2,3,3),
       (4,3,5,3),
       (1,2,3,4),
       (4,2,3,4),
       (4,3,3,5),
       (4,3,3,6);

insert into Methods (Type)
values ('credit card'), ('debit card'), ('cash');

insert into Payments (method_ID, price, date)
values (1, 50, '2024-05-16 13:20:00'),
       (2, 37, '2024-05-17 14:20:00'),
       (3, 27, '2024-05-18 14:30:00'),
       (3, 23, '2024-05-15 10:30:00'),
       (2, 32, '2024-05-14 10:28:00'),
       (1, 30, '2024-05-14 11:59:00'),
       (1, 50, '2024-05-14 11:48:00'),
       (2, 45, '2024-05-25 11:48:00'),
       (3, 39, '2024-04-16 07:45:00');

insert into Addresses (city, postcode, street, house_number)
values ('Gdańsk', '80-378', 'Lęborska', 100),
       ('Gdańsk', '80-378', 'Lęborska', 88),
       ('Gdańsk', '80-387', 'Pomorska', 2),
       ('Gdańsk', '80-387', 'Pomorska', 10),
       ('Gdańsk', '80-387', 'Pomorska', 94),
       ('Gdańsk', '80-333', 'Chłopska', 20),
       ('Gdańsk', '80-333', 'Chłopska', 22),
       ('Gdańsk', '80-333', 'Chłopska', 35),
       ('Gdańsk', '80-333', 'Chłopska', 40),
       ('Gdańsk', '80-333', 'Chłopska', 74),
       ('Gdańsk', '80-258', 'Mickiewicza', 10),
       ('Gdańsk', '80-258', 'Mickiewicza', 11),
       ('Gdańsk', '80-258', 'Mickiewicza', 12),
       ('Gdańsk', '80-258', 'Mickiewicza', 13),
       ('Gdańsk', '80-258', 'Mickiewicza', 14),
       ('Gdańsk', '80-258', 'Mickiewicza', 42);

insert into Orders (user_ID, star_address_ID, end_address_ID, driver_ID, car_type_ID, payment_ID)
values (5, 1, 16, 2, 1, 1),
       (4, 2, 15, 3, 4, 2),
       (3, 3, 14, 4, 2, 3),
       (2, 4, 13, 5, 2, 4),
       (1, 5, 12, 6, 3, 5),
       (1, 6, 11, 1, 1, 6),
       (2, 7, 10, 2, 1, 7),
       (3, 8, 9, 3, 4, 8),
       (4, 9, 8, 4, 2, 9);

