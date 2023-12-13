CREATE TABLE CUSTOMER
(
  customer_id INT IDENTITY(1,1) NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE ADMIN
(
  admin_id INT IDENTITY(1,1) NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (admin_id)
);

CREATE TABLE ORDERS
(
  order_id INT IDENTITY(1,1) NOT NULL,
  order_date DATE NOT NULL,
  required_date DATE NOT NULL,
  shipped_date DATE NOT NULL,
  order_status VARCHAR(255) NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DISCOUNT_VOUCHER
(
  voucher_id INT IDENTITY(1,1) NOT NULL,
  amount_discount FLOAT NOT NULL,
  expiry_date_of_discount DATE NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (voucher_id),
  FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CATEGORIES
(
  category_id INT IDENTITY(1,1) NOT NULL,
  category_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE BRANDS
(
  brand_id INT IDENTITY(1,1) NOT NULL,
  brand_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (brand_id)
);

CREATE TABLE STOCK
(
  stock_id INT IDENTITY(1,1) NOT NULL,
  stock_location VARCHAR(255) NOT NULL,
  PRIMARY KEY (stock_id)
);

CREATE TABLE PRODUCT
(
  product_id INT IDENTITY(1,1) NOT NULL,
  product_name VARCHAR(255) NOT NULL,
  price FLOAT NOT NULL,
  quantity INT NOT NULL,
  production_date DATE NOT NULL,
  expiry_date DATE NOT NULL,
  admin_id INT NOT NULL,
  category_id INT NOT NULL,
  stock_id INT NOT NULL,
  brand_id INT NOT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY (admin_id) REFERENCES ADMIN(admin_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (stock_id) REFERENCES STOCK(stock_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (brand_id) REFERENCES BRANDS(brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ORDER_ITEMS
(
  quantity INT NOT NULL,
  price FLOAT NOT NULL,
  item_id INT NOT NULL,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY (item_id, order_id),
  FOREIGN KEY (order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);