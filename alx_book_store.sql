CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Authors (author_id, author_name) VALUES (1, 'Mary Shelley');

INSERT INTO Books (book_id, title, author_id, price, publication_date)
VALUES (1, 'Frankenstein', 1, 19.99, '1818-01-01');

INSERT INTO Customers (customer_id, customer_name, email, address)
VALUES (1, 'Alice Johnson', 'alice@example.com', '123 Book Street');

INSERT INTO Orders (order_id, customer_id, order_date)
VALUES (1, 1, '2026-01-01');

INSERT INTO Order_Details (orderdetailid, order_id, book_id, quantity)
VALUES (1, 1, 1, 2);
SELECT * FROM Authors;
SELECT * FROM Books; SELECT * FROM Customers; SELECT * FROM Orders; SELECT * FROM Order_Details;
SELECT
    Customers.customer_name,
    Orders.order_id,
    Books.title,
    Order_Details.quantity,
    Orders.order_date
FROM Order_Details
JOIN Orders ON Order_Details.order_id = Orders.order_id
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Books ON Order_Details.book_id = Books.book_id;
