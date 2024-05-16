CREATE TABLE employees
(
    id     INT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    email  VARCHAR(255) UNIQUE,
    age    INT CHECK (age >= 18),       -- CHECK!!!!!!!!!!!!!!!!!!!!!!!!!! --
    status VARCHAR(10) DEFAULT 'active' -- DEFAULT!!!!!!!!!!!!!!!!!!!!!!!!! --
);


ALTER TABLE Customers
    MODIFY COLUMN CustomerID INT AUTO_INCREMENT PRIMARY KEY; -- MODIFY COLUMN!!!!!!!!!!!!!!!!!!!!!!--


ALTER TABLE ID RENAME To Customers; -- RENAME TO!!!!!!!!!!!!!!!!!!!!!!!!!! --


UPDATE Payments
SET Amount=199.98
WHERE ID = 1; -- UPDATE ... WHERE !!!!!!!!!!!!!!!! --


ALTER TABLE Orders
    ADD CONSTRAINT orders_customerid_fk FOREIGN KEY (CustomerID) REFERENCES Customers (ID) ON DELETE CASCADE; -- CONSTRAINT
#RESTRICT
#NO ACTION
#CASCADE
#SET NULL
#SET DEFAULT