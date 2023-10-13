CREATE DATABASE guitar_shop;

\c guitar_shop;

CREATE TABLE guitars (
    id SERIAL PRIMARY KEY,
    shape VARCHAR(50) NOT NULL,
    fabrication_date TIMESTAMP NOT NULL,
    pickups VARCHAR(50) NOT NULL,
    stock INTEGER NOT NULL
);


CREATE TABLE amplifiers (
    id SERIAL PRIMARY KEY,
    voltage INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    price DOUBLE PRECISION NOT NULL
);

CREATE TABLE pedals (
    id SERIAL PRIMARY KEY,
    input_type VARCHAR(50) NOT NULL,
    effect VARCHAR(50) NOT NULL,
    stock INTEGER NOT NULL,
    price DOUBLE PRECISION NOT NULL
);

CREATE TABLE misc_items (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    stock INTEGER NOT NULL,
    price DOUBLE PRECISION NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(255) NOT NULL
); 

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(255) NOT NULL
);

CREATE TABLE guitar_rent (
    guitar_id SERIAL PRIMARY KEY,
    cusomer_id INTEGER REFERENCES customers (id),
    price_per_hour DOUBLE PRECISION NOT NULL,
    rent_start_date TIMESTAMP NOT NULL
);

CREATE TABLE amp_rent (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (id),
    price_per_hour DOUBLE PRECISION NOT NULL,
    rent_start_date TIMESTAMP NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    state varchar(20) NOT NULL,
    customer_id INTEGER REFERENCES customers (id)
);

CREATE TABLE order_details (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders (id),
    guitar_id INTEGER REFERENCES guitars (id),  
    quantity INTEGER NOT NULL
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (id),
    date TIMESTAMP NOT NULL
);

CREATE TABLE repair_schedule (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (id),
    employee_id INTEGER REFERENCES employees (id),
    date TIMESTAMP NOT NULL
);

INSERT INTO guitars (shape, fabrication_date, pickups, stock) VALUES
('Stratocaster', '2023-01-01 10:00:00', 'Single-coil', 10),
('Les Paul', '2023-01-02 14:30:00', 'Humbucker', 5),
('Telecaster', '2023-01-03 11:45:00', 'Single-coil', 8),
('SG', '2023-01-04 09:15:00', 'Humbucker', 7),
('Explorer', '2023-01-05 13:20:00', 'Humbucker', 4),
('Jazzmaster', '2023-01-06 10:45:00', 'P-90', 6),
('Precision Bass', '2023-01-07 14:10:00', 'Split-coil', 9),
('Jazz Bass', '2023-01-08 11:25:00', 'Single-coil', 7),
('Rickenbacker 330', '2023-01-09 13:55:00', 'Toaster', 3),
('ES-335', '2023-01-10 09:40:00', 'Humbucker', 5),
('Flying V', '2023-01-11 14:00:00', 'Humbucker', 2),
('Firebird', '2023-01-12 11:30:00', 'Mini-humbucker', 4),
('SG Bass', '2023-01-13 13:15:00', 'Humbucker', 6),
('Jaguar', '2023-01-14 10:05:00', 'Single-coil', 8),
('Dreadnought', '2023-01-15 14:50:00', 'None', 10);


INSERT INTO amplifiers (voltage, stock, price) VALUES
(120, 15, 199.99),
(100, 10, 149.99),
(50, 5, 99.99),
(30, 8, 79.99),
(200, 3, 249.99),
(150, 7, 179.99),
(75, 4, 129.99),
(20, 6, 69.99),
(60, 2, 109.99),
(90, 5, 139.99),
(40, 3, 89.99),
(10, 7, 59.99),
(80, 4, 119.99),
(25, 6, 69.99),
(70, 2, 109.99);


INSERT INTO pedals (input_type, effect, stock, price) VALUES
('Mono', 'Delay', 15, 99.99),
('Stereo', 'Reverb', 10, 129.99),
('Mono', 'Overdrive', 5, 79.99),
('Stereo', 'Chorus', 8, 109.99),
('Mono', 'Phaser', 3, 69.99),
('Stereo', 'Tremolo', 7, 89.99),
('Mono', 'Fuzz', 4, 59.99),
('Stereo', 'Flanger', 6, 119.99),
('Mono', 'Compressor', 2, 49.99),
('Stereo', 'EQ', 5, 59.99),
('Mono', 'Wah', 3, 69.99),
('Stereo', 'Octaver', 7, 89.99),
('Mono', 'Looper', 4, 99.99),
('Stereo', 'Vibrato', 6, 79.99),
('Mono', 'Volume', 2, 49.99);


INSERT INTO misc_items (description, stock, price) VALUES
('Guitar Strings', 50, 5.99),
('Guitar Picks', 100, 0.99),
('Guitar Straps', 30, 12.99),
('Instrument Cables', 40, 9.99),
('Tuner', 20, 14.99),
('Metronome', 15, 19.99),
('Guitar Case', 10, 39.99),
('Amplifier Cover', 5, 19.99),
('Pedalboard', 8, 49.99),
('Capo', 25, 7.99),
('Guitar Stand', 20, 15.99),
('Microphone', 10, 29.99),
('Speaker Cable', 15, 11.99),
('Headphones', 12, 24.99),
('Music Stand', 18, 16.99);

INSERT INTO employees (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Smith', 'bob@example.com'),
('Charlie', 'Williams', 'charlie@example.com'),
('David', 'Brown', 'david@example.com'),
('Eve', 'Davis', 'eve@example.com'),
('Frank', 'Miller', 'frank@example.com'),
('Grace', 'Wilson', 'grace@example.com'),
('Henry', 'Lee', 'henry@example.com'),
('Ivy', 'Anderson', 'ivy@example.com'),
('Jack', 'White', 'jack@example.com'),
('Katie', 'Harris', 'katie@example.com'),
('Liam', 'Jackson', 'liam@example.com'),
('Mia', 'Clark', 'mia@example.com'),
('Noah', 'Moore', 'noah@example.com'),
('Olivia', 'Martin', 'olivia@example.com');


INSERT INTO employees (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Smith', 'bob@example.com'),
('Charlie', 'Williams', 'charlie@example.com'),
('David', 'Brown', 'david@example.com'),
('Eve', 'Davis', 'eve@example.com'),
('Frank', 'Miller', 'frank@example.com'),
('Grace', 'Wilson', 'grace@example.com'),
('Henry', 'Lee', 'henry@example.com'),
('Ivy', 'Anderson', 'ivy@example.com'),
('Jack', 'White', 'jack@example.com'),
('Katie', 'Harris', 'katie@example.com'),
('Liam', 'Jackson', 'liam@example.com'),
('Mia', 'Clark', 'mia@example.com'),
('Noah', 'Moore', 'noah@example.com'),
('Olivia', 'Martin', 'olivia@example.com');


INSERT INTO customers (first_name, last_name, email) VALUES
('Michael', 'Smith', 'michael@example.com'),
('Jennifer', 'Johnson', 'jennifer@example.com'),
('William', 'Brown', 'william@example.com'),
('Sarah', 'Davis', 'sarah@example.com'),
('Daniel', 'Wilson', 'daniel@example.com'),
('Emily', 'Lee', 'emily@example.com'),
('Matthew', 'Anderson', 'matthew@example.com'),
('Jessica', 'White', 'jessica@example.com'),
('James', 'Harris', 'james@example.com'),
('Lily', 'Jackson', 'lily@example.com'),
('David', 'Clark', 'david@example.com'),
('Sophia', 'Martin', 'sophia@example.com'),
('John', 'Moore', 'john@example.com'),
('Emma', 'Williams', 'emma@example.com'),
('Oliver', 'Miller', 'oliver@example.com');

INSERT INTO guitar_rent (cusomer_id, price_per_hour, rent_start_date) VALUES
(1, 10.00, '2023-10-13 10:00:00'),
(2, 12.00, '2023-10-14 11:30:00'),
(3, 8.00, '2023-10-15 09:45:00'),
(4, 15.00, '2023-10-16 14:15:00'),
(5, 10.00, '2023-10-17 12:30:00'),
(6, 12.00, '2023-10-18 11:00:00'),
(7, 8.00, '2023-10-19 09:15:00'),
(8, 15.00, '2023-10-20 14:45:00'),
(9, 10.00, '2023-10-21 13:00:00'),
(10, 12.00, '2023-10-22 10:30:00'),
(11, 8.00, '2023-10-23 08:45:00'),
(12, 15.00, '2023-10-24 13:15:00'),
(13, 10.00, '2023-10-25 12:30:00'),
(14, 12.00, '2023-10-26 11:00:00');

INSERT INTO amp_rent (customer_id, price_per_hour, rent_start_date) VALUES
(1, 5.00, '2023-10-13 10:00:00'),
(2, 7.00, '2023-10-14 11:30:00'),
(3, 4.00, '2023-10-15 09:45:00'),
(4, 6.00, '2023-10-16 14:15:00'),
(5, 5.00, '2023-10-17 12:30:00'),
(6, 7.00, '2023-10-18 11:00:00'),
(7, 4.00, '2023-10-19 09:15:00'),
(8, 6.00, '2023-10-20 14:45:00'),
(9, 5.00, '2023-10-21 13:00:00'),
(10, 7.00, '2023-10-22 10:30:00'),
(11, 4.00, '2023-10-23 08:45:00'),
(12, 6.00, '2023-10-24 13:15:00'),
(13, 5.00, '2023-10-25 12:30:00'),
(14, 7.00, '2023-10-26 11:00:00');

INSERT INTO orders (state, customer_id) VALUES
('Pending', 1),
('Shipped', 2),
('Pending', 3),
('Shipped', 4),
('Pending', 5),
('Shipped', 6),
('Pending', 7),
('Shipped', 8),
('Pending', 9),
('Shipped', 10),
('Pending', 11),
('Shipped', 12),
('Pending', 13),
('Shipped', 14);

INSERT INTO order_details (order_id, guitar_id, quantity) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 3, 1),
(2, 4, 4),
(3, 5, 2),
(3, 6, 2),
(4, 7, 1),
(4, 8, 3),
(5, 9, 2),
(5, 10, 1),
(6, 11, 3),
(6, 12, 2),
(7, 13, 2),
(7, 14, 2),
(8, 15, 1);

INSERT INTO payments (customer_id, date) VALUES
(1, '2023-10-13 10:30:00'),
(2, '2023-10-14 12:00:00'),
(3, '2023-10-15 10:15:00'),
(4, '2023-10-16 15:45:00'),
(5, '2023-10-17 13:00:00'),
(6, '2023-10-18 11:30:00'),
(7, '2023-10-19 10:45:00'),
(8, '2023-10-20 16:15:00'),
(9, '2023-10-21 13:30:00'),
(10, '2023-10-22 11:00:00'),
(11, '2023-10-23 10:15:00'),
(12, '2023-10-24 15:45:00'),
(13, '2023-10-25 13:00:00'),
(14, '2023-10-26 11:30:00');

INSERT INTO repair_schedule (customer_id, employee_id, date) VALUES
(1, 1, '2023-10-13 10:30:00'),
(2, 2, '2023-10-14 12:00:00'),
(3, 3, '2023-10-15 10:15:00'),
(4, 4, '2023-10-16 15:45:00'),
(5, 5, '2023-10-17 13:00:00'),
(6, 6, '2023-10-18 11:30:00'),
(7, 7, '2023-10-19 10:45:00'),
(8, 8, '2023-10-20 16:15:00'),
(9, 9, '2023-10-21 13:30:00'),
(10, 10, '2023-10-22 11:00:00'),
(11, 11, '2023-10-23 10:15:00'),
(12, 12, '2023-10-24 15:45:00'),
(13, 13, '2023-10-25 13:00:00'),
(14, 14, '2023-10-26 11:30:00');

