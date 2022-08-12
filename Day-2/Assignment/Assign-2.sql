-- Q Cocoa Confections
CREATE TABLE customers (
customer_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
address VARCHAR(255) DEFAULT NULL,
city VARCHAR(255) DEFAULT NULL,
state VARCHAR(2) DEFAULT NULL,
zip_code VARCHAR(5) DEFAULT NULL
);
INSERT INTO customers VALUES (1, "abc", "a", "abc@gmail.com", "1st street", "chennai", "TN", 60001 ),
(2, "efg", "e", "efg@mail.com", "2nd street", "Bangalore", "KA", 50002),
(3, "ijk", "i", "ijk@mail.com", "3rd street", "Mumbai", "MH", 40002);
SELECT * FROM customers;

CREATE TABLE orders (
order_id INT NOT NULL PRIMARY KEY,
customer_id INT NOT NULL,
order_placed_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers
(customer_id)
);
DROP TABLE orders;
INSERT INTO orders VALUES (1, 1, "2016-11-11"),
(2, 1, "2016-10-01"),
(3, 2, "2016-06-01"),
(4, 2, "2015-06-01"),
(5, 1, "2015-06-01");
SELECT * FROM orders;
-- Query
SELECT email, COUNT(*) AS order_count FROM customers JOIN orders ON customers.customer_id = orders.customer_id 
WHERE order_placed_date > "2015-12-31" AND order_placed_date < "2017-1-1"
GROUP BY email ORDER BY order_count DESC;