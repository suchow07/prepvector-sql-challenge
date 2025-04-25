-- Prepvector SQL Challenge Day 4: 
-- Difficulty: Medium

-- Problem:Most Recent Transaction

-- Write a query to get the last transaction for each day.
-- The output should include the ID of the transaction, datetime of the transaction, 
-- and the transaction amount. Order the transactions by datetime.


CREATE TABLE customer_sales (
id INT PRIMARY KEY,
transaction_value DECIMAL(10, 2),
created_at DATETIME
);

INSERT INTO customer_sales (id, transaction_value, created_at)
VALUES
(1, 50.00, '2025-01-23 10:15:00'),
(2, 30.00, '2025-01-23 15:45:00'),
(3, 20.00, '2025-01-23 18:30:00'),
(4, 45.00, '2025-01-24 09:20:00'),
(5, 60.00, '2025-01-24 22:10:00'),
(6, 25.00, '2025-01-25 11:30:00'),
(7, 35.00, '2025-01-25 14:50:00'),
(8, 55.00, '2025-01-25 19:05:00');

select * from customer_sales;

with rankings as (
select id	
		, transaction_value
		, created_at
		, row_number() over(partition by cast(created_at as date) order by created_at DESC) as rn
from customer_sales)
select id
, transaction_value
, created_at 
from rankings
where rn = 1
order by created_at