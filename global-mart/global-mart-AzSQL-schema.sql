CREATE TABLE customers
(
	customer_id VARCHAR(14) PRIMARY KEY NOT NULL,
	customer_email VARCHAR(50),
	customer_name VARCHAR(128),
	segment VARCHAR(16),
	country VARCHAR(16),
	city VARCHAR(50),
	state VARCHAR(25),
	postal_code INT,
	region VARCHAR(12)
	);

CREATE TABLE orders
(
	order_id VARCHAR(14) PRIMARY KEY NOT NULL,
	customer_id VARCHAR(8),
	vendor_id VARCHAR(5),
	ship_mode VARCHAR(14),
	order_status VARCHAR(16),
	order_purchase_date DATETIME,
	order_approved_at DATETIME,
	order_delivered_carrier_date DATETIME,
	order_delivered_customer_date DATETIME,
	order_estimated_delivery_date DATE
	);

CREATE TABLE returns
(
	order_id VARCHAR(14) PRIMARY KEY NOT NULL,
	return_reason VARCHAR(20),
	);

CREATE TABLE vendors
(
	vendor_id VARCHAR(5) PRIMARY KEY NOT NULL,
	vendor_name VARCHAR(25),
	);

CREATE TABLE reviews
(
	review_id INT PRIMARY KEY NOT NULL,
	review_text VARCHAR(3000),
	order_id VARCHAR(14),
	customer_id VARCHAR(8),
	reviews_rating INT
	);


CREATE TABLE transactions
(
	transaction_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	order_id VARCHAR(14),
	product_id VARCHAR(20),
	sales FLOAT,
	quantity INT,
	discount FLOAT,
	profit FLOAT,
	payment_type VARCHAR(14),
	payment_installments INT,
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
	);
