CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date DATE NOT NULL,
  order_total DECIMAL(10, 2) NOT NULL
);

INSERT INTO orders (customer_id, order_date, order_total)
VALUES
  (1, '2022-01-01', 100.00),
  (1, '2022-02-01', 50.00),
  (1, '2022-03-01', 75.00),
  (2, '2022-01-15', 200.00),
  (2, '2022-02-15', 150.00),
  (3, '2022-01-31', 75.00),
  (3, '2022-02-28', 100.00),
  (3, '2022-03-31', 50.00);


-- CUMULATIVE SUM
SELECT order_id, customer_id, order_date, order_total,
       SUM(order_total) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_total
FROM orders;

-- CUMULATIVE SUM
SELECT order_id, customer_id, order_date, order_total,
       SUM(order_total) OVER (PARTITION BY extract('month' FROM order_date) ORDER BY order_date) AS cumulative_total
FROM orders;


SELECT order_id, customer_id, order_date, order_total
FROM orders
HAVING row_number() OVER (PARTITION BY customer_id ORDER BY order_total desc) = 1 ;