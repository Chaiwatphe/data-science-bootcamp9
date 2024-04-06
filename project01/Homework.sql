CREATE TABLE customers (
  customer_id int primary key,
  customer_name text,
  area text
);

INSERT INTO customers values
  (120, "luffy", "south"),
  (121, "zoro", "each"),
  (122, "law", "south"),
  (123, "garp", "south"),
  (124, "rocinante", "north"),
  (125, "koby", "north"),
  (126, "kuma", "west"),
  (127, "ivankov", "west"),
  (128, "dargon", "north"),
  (129, "sanji", "south"),
  (130, "robin", "west"),
  (131, "vegapunk", "each"),
  (132, "mr.2", "each"),
  (133, "hiyori", "north"),
  (134, "chopper", "north");

.mode box
select * from customers;

CREATE TABLE orders (
  order_id int primary key,
  customer_id int,
  manu_id int,
  quantity int,
  transection_date date,
  total_price real
);

INSERT INTO orders values
  (1, 120, 11, 1, "2023-09-05", 500),
  (2, 121, 12, 2, "2023-09-07", 1400),
  (3, 120, 12, 2, "2023-09-07", 1400),
  (4, 122, 11, 1, "2023-09-12", 500),
  (5, 123, 13, 3, "2023-09-15", 3000),
  (6, 124, 14, 3, "2023-09-20", 1800),
  (7, 125, 15, 1, "2023-09-29", 1200),
  (8, 120, 11, 5, "2023-10-01", 2500),
  (9, 123, 15, 4, "2023-10-02", 2800),
  (10, 126, 14, 2, "2023-10-15", 1200),
  (11, 127, 11, 5, "2023-10-31", 2500),
  (12, 128, 11, 4, "2023-10-31", 2000),
  (13, 129, 11, 3, "2023-11-04", 1500),
  (14, 130, 12, 2, "2023-11-10", 1400),
  (15, 131, 15, 4, "2023-11-18", 4800),
  (16, 132, 14, 5, "2023-11-27", 3000),
  (17, 133, 14, 1, "2023-12-01", 600),
  (18, 134, 12, 3, "2023-12-01", 2100),
  (19, 121, 14, 3, "2023-12-01", 1800),
  (20, 120, 15, 5, "2023-12-05", 6000),
  (21, 130, 11, 2, "2023-12-12", 1000),
  (22, 124, 12, 5, "2023-12-19", 3500),
  (23, 127, 11, 3, "2023-12-25", 1500),
  (24, 126, 12, 2, "2023-12-29", 1400),
  (25, 122, 13, 2, "2023-12-31", 2000);

.mode box
select * from orders;

CREATE TABLE manus (
  manu_id int primary key,
  manu_name text,
  price real
);

INSERT INTO manus values
  (11, "hawaiian", 500),
  (12, "cheese", 700),
  (13, "vegetarian", 1000),
  (14, "seafood_cocktail", 600),
  (15, "pepperoni", 1200);

.mode box
select * from manus;


--JOIN
SELECT 
tb1.customer_name,
tb3.manu_name,
tb3.price,
tb2.quantity,
tb2.total_price
FROM customers AS tb1
JOIN orders    AS tb2 on tb1.customer_id = tb2.customer_id
JOIN manus     AS tb3 on tb2.manu_id = tb3.manu_id
WHERE STRFTIME("%Y-%m",tb2.transection_date) = "2023-12"
GROUP BY 1,2,3,4,5
ORDER BY 5 DESC;


--Aggregate function
SELECT
AVG(total_price) AS avg_total
FROM orders;


-- Subqueries
SELECT customer_name, area
FROM (SELECT * FROM customers)
WHERE area = 'north';
