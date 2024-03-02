/*1) You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the
E-commerce with the schema definition given below.
2) You are required to develop SQL based programs (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in
summarized format - The Data Retrieval needs are described below.
*/
# DATABASE
create database lab4dbmsgreatlearningecommercewebsite;

use lab4dbmsgreatlearningecommercewebsite;

# TABLE:category
CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT(5) NOT NULL DEFAULT '0',
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);

# TABLE:product
CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT(5) NOT NULL DEFAULT '0',
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT '"Dummy"',
    PRO_DESC VARCHAR(60) DEFAULT NULL,
    CAT_ID INT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);

# TABLE:supplier
CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT(5) NOT NULL DEFAULT '0',
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL,
    PRIMARY KEY (SUPP_ID)
);

# TABLE:supplier_pricing
CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT(5) NOT NULL DEFAULT '0',
    PRO_ID INT(5) NOT NULL DEFAULT '0',
    SUPP_ID INT(5) NOT NULL DEFAULT '0',
    SUPP_PRICE INT(5) DEFAULT '0',
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

# TABLE:customer
CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT(5) NOT NULL DEFAULT '0',
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR(1),
    PRIMARY KEY (CUS_ID)
);

# TABLE:orders
/*In Problem statement the table name is mentioned as order however as it is a keyword in MySQL modified the table name to orders */
CREATE TABLE IF NOT EXISTS orders (
    ORD_ID INT(5) NOT NULL DEFAULT '0',
    ORD_AMOUNT INT(5) NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT(5) NOT NULL DEFAULT '0',
    PRICING_ID INT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

# TABLE:rating
CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT(5) NOT NULL DEFAULT '0',
    ORD_ID INT(5) NOT NULL DEFAULT '0',
    RAT_RATSTARS INT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES orders (ORD_ID)
);

/*3) Insert the following data in the table created above*/

# DATE ENTRY INTO TABLE:category
INSERT INTO category (CAT_ID, CAT_NAME) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

# DATE ENTRY INTO TABLE:product
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen ', 1);

# DATE ENTRY INTO TABLE:supplier
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

# DATE ENTRY INTO TABLE:supplier_pricing
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

# DATE ENTRY INTO TABLE:customer
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

# DATE ENTRY INTO TABLE:orders
/*In Problem statement which was given on Olympus dashboard the record where ORD_ID=109 the date is mentioned as 2021-00-10 and it was thrwoing 
error as month is 00 so modified it to 2021-09-10*/
INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)  VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000,'2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);

# DATE ENTRY INTO TABLE:rating
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

# 4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
/*as the column ORD_AMOUNT data was considered ambiguous during the live Lab4 session have tried both the queries;
worth at least Rs.3000--> as it is mentioned as atleast which means minimum 3000 so have included 3000 as well in the SQL*/

SELECT 
    CUS_GENDER, COUNT(*)
FROM
    customer
        JOIN
    orders USING (CUS_ID)
WHERE
    ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;

SELECT 
    CUS_GENDER, COUNT(*)
FROM
    customer
        JOIN
    orders USING (CUS_ID)
        JOIN
    supplier_pricing USING (PRICING_ID)
WHERE
    SUPP_PRICE >= 3000
GROUP BY CUS_GENDER;

# 5) Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT 
    ORD_ID, PRO_NAME, PRO_DESC
FROM
    customer
        JOIN
    orders USING (CUS_ID)
        JOIN
    supplier_pricing USING (PRICING_ID)
        JOIN
    product USING (PRO_ID)
WHERE
    CUS_ID = 2;

# 6) Display the Supplier details who can supply more than one product.

SELECT 
    SUPP_NAME, COUNT(*)
FROM
    supplier
        JOIN
    supplier_pricing USING (SUPP_ID)
        JOIN
    product USING (PRO_ID)
GROUP BY SUPP_NAME
HAVING COUNT(*) > 1;

# 7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
# was facing Error Code: 1055 so set the sql_mode to tradtional as suggested online while searching on google

SET sql_mode = 'TRADITIONAL';
SELECT 
    CAT_NAME, PRO_NAME, PRO_DESC, MIN(SUPP_PRICE)
FROM
    category
        JOIN
    product USING (CAT_ID)
        JOIN
    supplier_pricing USING (PRO_ID)
GROUP BY CAT_NAME;

# 8) Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT 
    PRO_ID, PRO_NAME
FROM
    orders
        JOIN
    supplier_pricing USING (PRICING_ID)
        JOIN
    product USING (PRO_ID)
WHERE
    ORD_DATE > '2021-10-05';
    
# 9) Display customer name and gender whose names start or end with character 'A'.

SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    (CUS_NAME LIKE '%A' OR CUS_NAME LIKE 'A%');
    
SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    CUS_NAME LIKE '%A%';

/* 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

SELECT 
    SUPP_ID,
    SUPP_NAME,
    AVG(RAT_RATSTARS),
    CASE
        WHEN AVG(RAT_RATSTARS) = 5 THEN ' Excellent Service'
        WHEN AVG(RAT_RATSTARS) > 4 THEN ' Good Service'
        WHEN AVG(RAT_RATSTARS) > 2 THEN ' Average Service'
        ELSE 'Poor Service'
    END AS 'Supplier Category'
FROM
    supplier
        JOIN
    supplier_pricing USING (SUPP_ID)
        JOIN
    orders USING (PRICING_ID)
        JOIN
    rating USING (ORD_ID)
GROUP BY SUPP_NAME;

