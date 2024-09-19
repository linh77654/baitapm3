CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;


CREATE TABLE customer(
                         customer_id INT AUTO_INCREMENT,
                         customer_name VARCHAR(225),
                         customer_age INT,
                         PRIMARY KEY (customer_id)
);


INSERT INTO customer(customer_id, customer_name, customer_age) VALUES
                                                                   (1, 'minh Quân', 10),
                                                                   (2, 'Ngọc Anh', 20),
                                                                   (3, 'Hong Ha', 30);


CREATE TABLE product(
                        product_id INT AUTO_INCREMENT,
                        product_name TEXT,
                        product_price DECIMAL(10, 2),
                        PRIMARY KEY (product_id)
);


CREATE TABLE order_table (
                             order_id INT AUTO_INCREMENT,
                             customer_id INT,
                             order_date DATETIME,
                             total_price DECIMAL(10, 2),
                             PRIMARY KEY (order_id),
                             FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


INSERT INTO order_table(customer_id, order_date, total_price) VALUES
                                                                  (1, '2006-03-21', NULL),
                                                                  (2, '2006-03-23', NULL),
                                                                  (1, '2006-03-16', NULL);


CREATE TABLE order_detail (
                              order_id INT,
                              product_id INT,
                              quantity INT,
                              PRIMARY KEY (order_id, product_id),
                              FOREIGN KEY (order_id) REFERENCES order_table(order_id),
                              FOREIGN KEY (product_id) REFERENCES product(product_id)
);


INSERT INTO order_detail(order_id, product_id, quantity) VALUES
                                                             (1, 1, 3),
                                                             (1, 3, 7),
                                                             (1, 4, 2),
                                                             (2, 1, 1),
                                                             (3, 1, 8),
                                                             (2, 5, 4),
                                                             (2, 3, 3);
