USE swiggydb;

-- Basic SQL Statements

-- 1.   Display all customer details. 
	SELECT * FROM Customers;
    
-- 2.   Display Customer ID, Customer Name, and City. 
	SELECT CustomerId,concat(FirstName,LastName) as Customer_Name,City FROM Customers;
    
-- 3.	Display customers from Chennai.
	SELECT * FROM Customers WHERE City in ('Chennai'); 
    
-- 4.	Display customers from Coimbatore.
	SELECT * FROM Customers WHERE City in ('Coimbatore');
    
-- 5.	Display the list of unique customer cities.
	SELECT DISTINCT City FROM Customers;
    
-- 6.	Display customers in alphabetical order. 
	SELECT concat(FirstName,LastName) as Customer_Name FROM Customers ORDER BY Customer_Name;
    
-- 7.	Display customers in reverse alphabetical order.
	SELECT concat(FirstName,LastName) as Customer_Name FROM Customers ORDER BY Customer_Name DESC;
    
-- 8.	Display the first 10 customer records.
	SELECT * FROM Customers LIMIT 10;
    
-- 9.	Display the first five restaurants.
	SELECT * FROM restaurants LIMIT 5;

-- 10.	Display restaurants located in Bengaluru.
	SELECT * FROM restaurants WHERE City in ('Bengaluru');
    
    
-- Filtering Records

-- 11.	Display all menu items. 
	SELECT ItemName FROM menuitems;
    
-- 12.	Display only vegetarian menu items. 
	SELECT * FROM menuitems WHERE IsVeg = True;
    
-- 13.	Display only non-vegetarian menu items.
	SELECT * FROM menuitems WHERE IsVeg = False;
    
-- 14.	Display menu items costing more than ₹300.
	SELECT * FROM menuitems WHERE Price > 300;
    
-- 15.	Display menu items costing less than ₹200. 
	SELECT * FROM menuitems WHERE Price < 200;
    
-- 16.	Display menu items priced between ₹200 and ₹400.
	SELECT  * FROM menuitems WHERE Price BETWEEN 200 AND 400;
    
-- 17.	Display the ten most expensive menu items.
	SELECT * FROM menuitems ORDER BY Price DESC LIMIT 10;
    
-- 18.	Display the ten least expensive menu items.
	SELECT * FROM menuitems ORDER BY Price  LIMIT 10;
    
-- 19.	Display customers whose names begin with the letter 'A'. 
	SELECT concat(Firstname,LastName) as customer_name
    FROM customers 
    WHERE FirstName LIKE 'A%';
    
-- 20.	Display customers whose names end with "Kumar". 
	SELECT concat(Firstname,LastName) as customer_name
    FROM customers 
    WHERE LastName LIKE '%Kumar';
    
    
-- Pattern Matching & Conditions
-- 21.	Display menu items containing the word "Chicken". 
	SELECT ItemName FROM menuitems WHERE ItemName LIKE '%Chicken%';
        
-- 22.	Display customers from Chennai, Coimbatore, and Madurai.
	SELECT * FROM customers WHERE City in ('Chennai','Coimbatore','Madurai');
    
-- 23.	Display customers who are not from Chennai.
	SELECT * FROM customers WHERE City not in ('Chennai');
    
-- 24.	Display deliveries where the delivery rating is not available.
	SELECT * FROM delivery WHERE DeliveryRating is null;
    
-- 25.	Display deliveries that have received ratings.
	SELECT * FROM delivery WHERE DeliveryRating is not null;
    
-- Orders, Payments & Reviews
-- 26.	Display all orders.
	SELECT * FROM orders;
    
-- 27.	Display delivered orders.
 SELECT * FROM orders WHERE OrderStatus = 'Delivered';
 
-- 28.	Display cancelled orders.
 SELECT * FROM orders WHERE OrderStatus = 'Cancelled';
 
-- 29.	Display pending orders.
SELECT * FROM orders WHERE OrderStatus not in ('Delivered','Cancelled');

-- 30.	Display completed payments.
SELECT * FROM payments WHERE PaymentStatus in ('Success');

-- 31.	Display failed payments.
 SELECT  * FROM payments WHERE PaymentStatus in ('failed');
 
-- 32.	Display refunded payments. 

-- 33.	Display the ten highest payment amounts.
SELECT * FROM payments ORDER BY Amount DESC limit 10; 

-- 34.	Display the ten lowest payment amounts.
 SELECT * FROM payments ORDER BY Amount limit 10;
 
-- 35.	Display all five-star reviews.
SELECT * FROM reviews WHERE FoodRating = 5;
SELECT * FROM reviews WHERE DeliveryRating = 5;
 
-- 36.	Display reviews with ratings less than three.
SELECT * FROM reviews WHERE FoodRating < 3;
SELECT * FROM reviews WHERE DeliveryRating < 3;

-- 37.	Display customer names using the alias "Customer".
 SELECT concat(FirstName,LastName) as Customer
 FROM customers;
 
-- 38.	Display menu item names using the alias "Food Item".
SELECT ItemName as Food_Item FROM menuitems;

-- 39.	Display menu prices after adding a 5% service charge.
SELECT Price,(Price+(Price/100)*5)
FROM menuitems;
 
-- 40.	Display the latest ten registered customers.
SELECT * 
FROM customers
ORDER BY RegistrationDate DESC 
LIMIT 10;


-- PART B – Aggregate Functions (Questions 41–60)

-- 41.	Display the total number of registered customers.
SELECT count(*) FROM customers;

-- 42.	Display the total number of restaurants.
 SELECT count(*) FROM restaurants;
 
-- 43.	Display the total number of customer orders.
SELECT count(*) FROM orders; 

-- 44.	Display the total number of completed payments.
 SELECT count(PaymentStatus) FROM payments WHERE PaymentStatus = 'Success';
 
-- 45.	Display the total revenue generated through completed payments.
SELECT sum(Amount) FROM payments WHERE PaymentStatus = 'Success';
 
-- 46.	Display the average order amount.
 SELECT avg(TotalAmount)
 FROM orders;
 
-- 47.	Display the highest order amount.
SELECT max(TotalAmount)
FROM orders;
 
-- 48.	Display the lowest order amount.
 SELECT min(TotalAmount)
 FROM orders;
 
-- 49.	Display the average customer review rating.
SELECT avg(FoodRating),avg(DeliveryRating) FROM reviews;
 
-- 50.	Display the average review rating rounded to two decimal places.
SELECT round(avg(FoodRating)),round(avg(DeliveryRating)) FROM reviews;
 
-- 51.	Display the number of customers in each city.
SELECT city,count(City) 
FROM customers
GROUP BY City;

-- 52.	Display the number of restaurants in each city.
SELECT city,count(city)
FROM restaurants
GROUP BY City;
 
-- 53.	Display the total revenue generated by each payment method.
SELECT PaymentMethod,sum(Amount) as Total_Revenue
FROM payments
WHERE PaymentStatus = 'success'
GROUP BY PaymentMethod;

-- 54.	Display the number of transactions for each payment method.
SELECT PaymentMethod,count(*)
FROM payments
GROUP BY PaymentMethod; 

-- 55.	Display the number of reviews for each rating.
 SELECT FoodRating,count(FoodRating)
 FROM reviews
 GROUP BY FoodRating;

-- 56.	Display the number of menu items in each food category. 
SELECT CategoryID,count(ItemName)
FROM menuitems
GROUP BY CategoryID;

-- 57.	Display cities having more than five registered customers.
 SELECT City,count(*)
 FROM customers
 GROUP BY City 
 HAVING count(*) > 5;
 
-- 58.	Display payment methods generating revenue greater than ₹20,000.
SELECT PaymentMethod,sum(Amount)
FROM payments
GROUP BY PaymentMethod
HAVING sum(Amount) > 20000;
 
-- 59.	Display the average menu price for each food category.
SELECT CategoryID,avg(Price) 
FROM menuitems
GROUP BY CategoryID;
 
-- 60.	Display payment-method-wise transaction count, total revenue, average payment, highest payment, and lowest payment.
SELECT 
PaymentMethod,count(*),sum(Amount),avg(Amount),max(Amount),min(Amount)
FROM payments
WHERE PaymentStatus = 'success' 
GROUP BY PaymentMethod;

-- PART C – JOIN Queries (Questions 61–90)
-- 61.	Display customer name, order ID, order date, and total amount.
SELECT
concat(c.FirstName,c.LastName) as CustomerName,
o.OrderID,
o.OrderDate,
o.TotalAmount
FROM orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID;
 
-- 62.	Display order ID, restaurant name, order date, and order amount.
SELECT
r.RestaurantName,
o.OrderID,
o.OrderDate,
o.TotalAmount
FROM orders as o
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID;
    
-- 63.	Display menu item name, category name, and price.
 SELECT
 c.CategoryName,
 m.ItemName,
 m.price
 FROM menuitems as m
 INNER JOIN menucategories as c
	ON m.CategoryID = c.CategoryID;
    
-- 64.	Display order ID, payment amount, payment method, and payment status.
 SELECT
 o.OrderID,
 p.PaymentMethod,
 p.Amount,
 p.PaymentStatus
 FROM payments as p
 INNER JOIN orders as o
	ON p.OrderID = o.OrderID;
    
-- 65.	Display order ID, delivery partner name, and delivery status.
SELECT 
d.OrderId,
p.PartnerName,
d.DeliveryStatus
FROM delivery aS d
INNER JOIN deliverypartners as p
ON d.PartnerID = p.PartnerID;

-- 66.	Display customer name, review rating, and review comment.
SELECT
concat(c.FirstName,c.LastName) as customer_name,
r.FoodRating,
r.DeliveryRating,
r.ReviewComment
FROM reviews as r
INNER JOIN customers as c
ON r.CustomerID = c.CustomerID;
 
-- 67.	Display restaurant name, review rating, and review comment.
SELECT
re.RestaurantName,
r.FoodRating,
r.DeliveryRating,
r.ReviewComment
FROM reviews as r
INNER JOIN restaurants as re
ON re.RestaurantID = re.RestaurantID;
 
-- 68.	Display restaurant name, menu item, and menu price.
SELECT 
r.RestaurantName,
m.ItemName,
m.Price
FROM menuitems as m
INNER JOIN restaurants as r
	ON m.RestaurantID = r.RestaurantID;
    
-- 69.	Display all customers along with their orders, including customers who have not placed any orders.
SELECT
c.firstname,
o.orderid
FROM customers as c
LEFT JOIN orders as o
	ON c.CustomerID = o.CustomerID;

-- 70.	Display all restaurants along with their menu items. 
SELECT * 
FROM restaurants AS r
INNER JOIN menuitems as m
	ON r.RestaurantID = m.RestaurantID;
    
-- 71.	Display all orders with their payment details, including unpaid orders.
 SELECT 
 o.*,
 p.*
 FROM orders as o
 LEFT JOIN payments as p
	ON o.OrderID = p.OrderID;
 
-- 72.	Display all orders with delivery information, including undelivered orders.
 SELECT 
 o.*,
 d.*
 FROM orders as o
 LEFT JOIN delivery as d
	ON o.OrderID = d.OrderID;
 
-- 73.	Display all restaurants along with their customer reviews.
SELECT 
r.*,
re.ReviewComment
FROM restaurants as r
LEFT JOIN reviews as re
	ON r.RestaurantID = re.RestaurantID;
    
-- 74.	Display all menu categories along with their menu items.
SELECT 
m.*,
me.ItemName
FROM menucategories as m
INNER JOIN menuitems as me
	ON m.CategoryID = me.CategoryID;
 
-- 75.	Display all payment records with their corresponding orders.
 SELECT 
 p.*,
 o.*
 FROM payments AS p
 LEFT JOIN orders as o
	ON p.OrderID = o.OrderID;

-- 76.	Display all reviews with restaurant details.
 SELECT 
 r.*,
 re.ReviewComment
 FROM restaurants as r
 RIGHT JOIN reviews as re
	ON r.RestaurantID = re.RestaurantID;
    
-- 77.	Display all delivery records with delivery partner details.
SELECT 
de.OrderID,
d.PartnerName,
de.DeliveryStatus
FROM deliverypartners as d
RIGHT JOIN delivery as de
	ON d.PartnerID = de.PartnerID;

-- 78.	Display customer name, restaurant name, order amount, and payment status.
SELECT
concat(c.firstname,c.lastname) as customer_name,
r.restaurantname,
o.totalamount,
p.paymentstatus
FROM  orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
INNER JOIN payments as p
	ON o.OrderID = p.OrderID;

-- 79.	Display customer name, restaurant name, delivery partner name, and delivery status.
SELECT
concat(c.firstname,c.lastname) as customer_name,
r.restaurantname,
p.PartnerName,
de.deliverystatus
FROM orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
INNER JOIN delivery as de
	ON o.OrderID= de.OrderID
INNER JOIN deliverypartners as p
	ON de.PartnerID = p.PartnerID;

-- 80.	Display customer name, restaurant name, payment amount, payment method, and review rating.
 SELECT
concat(c.firstname,c.lastname) as customer_name,
r.restaurantname,
p.Amount,
p.PaymentMethod,
foodrating,
DeliveryRating
FROM orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
INNER JOIN payments as p
	ON o.OrderID= p.OrderID
INNER JOIN reviews as re
	ON o.OrderID = re.OrderID;
    
-- 81.	Display each customer's total number of orders.
SELECT 
concat(c.firstname,c.lastname) as customer_name,
count(o.orderID)
FROM orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID;
 
 
-- 82.	Display each restaurant's total number of orders received.
SELECT 
r.Restaurantname,
count(o.OrderID)
FROM orders as o 
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
GROUP BY r.RestaurantID;

-- 83.	Display the total revenue generated by each restaurant.
SELECT 
r.Restaurantname,
sum(o.Totalamount) as Total_revenue
FROM orders as o
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
GROUP BY r.RestaurantID;

-- 84.	Display the average customer rating for each restaurant.
SELECT 
r.Restaurantname,
avg(re.foodrating),
avg(re.DeliveryRating)
FROM  restaurants as r
INNER JOIN reviews as re
	ON r.RestaurantID = re.RestaurantID
GROUP BY r.RestaurantID;
 
-- 85.	Display the total number of deliveries handled by each delivery partner.
 SELECT 
 de.partnername,
 count(d.PartnerID)
 FROM delivery as d
 INNER JOIN deliverypartners as de
	ON d.PartnerID = de.PartnerID
GROUP BY de.PartnerID;
 
-- 86.	Display the total payment collected through each payment method.
 SELECT 
 paymentmethod,
 sum(amount) as total
 FROM payments
 GROUP BY PaymentMethod;
 
-- 87.	Display customers along with the restaurants they reviewed.
SELECT 
concat(c.firstname,c.lastname) as customername,
r.restaurantname,
re.reviewcomment
FROM reviews as re
INNER JOIN customers AS c
	ON re.CustomerID = c.CustomerID
INNER JOIN restaurants as r
	ON re.RestaurantID = r.RestaurantID;

-- 88.	Display restaurant name, city, and average menu price.
 SELECT 
 r.restaurantname,
 r.city,
 avg(m.price)
 FROM restaurants as r
 INNER JOIN menuitems as m
	ON r.RestaurantID = m.RestaurantID
GROUP BY r.RestaurantID;

-- 89.	Display each food category with the number of menu items.
 SELECT
 m.categoryname,
 count(me.itemname)
 FROM menucategories as m
 INNER JOIN menuitems as me
	ON m.CategoryID = me.CategoryID
GROUP BY m.CategoryID;

-- 90.	Prepare a consolidated order report containing customer, restaurant, payment, and delivery details.
SELECT 
o.OrderID,
concat(c.firstname,c.lastname) as customername,c.Gender,
r.RestaurantName,
o.OrderStatus,
d.DeliveryRating,
p.PaymentMethod,
p.Amount
FROM orders as o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
INNER JOIN delivery as d
	ON o.OrderID = d.OrderID
INNER JOIN payments as p
	ON o.OrderID = p.OrderID;

-- 91.	Display the current system date.
SELECT current_date() as currentdate;

-- 92.	Display the current system time.
SELECT current_time() as  currenttime;

-- 93.	Display the current date and time. 
SELECT current_date() as curr_date,current_time() as curr_time;

-- 94.	Display the system timestamp.
 SELECT current_timestamp() as time_stamp;
 
-- 95.	Display today's date using the CURRENT_DATE() function.
SELECT curdate() as currentdate;
 
-- 96.	Display the current timestamp using CURRENT_TIMESTAMP().
SELECT current_timestamp() as curr_timestamp;
 
-- 97.	Display the order year for every order.
 SELECT orderid,year(orderdate) FROM orders;
 
-- 98.	Display the order month for every order.
SELECT orderid,month(orderdate) FROM orders;
 
-- 99.	Display the month name for every order.
SELECT orderid,monthname(orderdate) FROM orders;
 
-- 100.	Display the day of the month for every order.
SELECT orderid,day(orderdate) FROM orders;
 
-- 101.	Display the weekday name for every order.
SELECT orderid, dayname(orderdate) FROM orders;
 
-- 102.	Display the weekday number for every order.
 SELECT orderid, weekday(orderdate) FROM orders;
 
-- 103.	Display the week number for every order.
SELECT orderid, weekday(orderdate) FROM orders; 

-- 104.	Display the quarter for every order.
SELECT quarter(orderdate) FROM orders;
 
-- 105.	Display the day number within the year for every order.
SELECT orderid,dayofyear(orderdate) FROM orders;

-- 106.	Calculate the number of days between the order date and delivery date.
SELECT datediff(orderdate,estimateddelivery) FROM orders;
 
-- 107.	Calculate the delivery duration in minutes.
 SELECT timediff(orderdate,estimateddelivery) FROM orders;
 
-- 108.	Display the expected delivery date by adding two days to the order date.
SELECT OrderDate,date_add(orderdate,interval 2 day) as add_2_days FROM orders;

-- 109.	Display a reminder date three days before the order date.
SELECT orderdate,date_sub(orderdate,interval 3 day) as reminder_date FROM orders;
 
-- 110.	Add seven days to each order date.
SELECT OrderDate,date_add(orderdate,interval 7 day) as add_2_days FROM orders;
 
-- 111.	Subtract five days from each order date.
SELECT orderdate,date_sub(orderdate,interval 5 day) as reminder_date FROM orders;
 
-- 112.	Display all orders placed during the last thirty days.
SELECT *
FROM orders
WHERE OrderDate BETWEEN (date_sub((SELECT max(orderdate) FROM orders),interval 29 day)) AND (SELECT max(OrderDate) FROM orders);
 

-- 113.	Display the order date in DD-MM-YYYY format.
SELECT date_format(date(orderdate),'%d-%m-%Y') as dateformet FROM orders;

-- 114.	Display the order month and year in "Month YYYY" format.
 SELECT date_format(date(orderdate),'%M-%Y') as dateformet FROM orders;
 
-- 115.	Display monthly revenue generated from completed payments.
SELECT
monthname(paymentdate) as month_name,
sum(amount) as revenue
FROM payments
WHERE PaymentStatus = 'success'
GROUP BY monthname(paymentdate);

-- 116.	Display the daily order count.
SELECT 
date(orderdate),count(orderid)
FROM orders
GROUP BY date(OrderDate);
 
-- 117.	Display the total number of orders placed each month.
 SELECT 
 monthname(orderdate),count(orderid)
 FROM orders
 GROUP BY monthname(orderdate);
 
-- 118.	Display the total number of orders placed on each weekday.
SELECT
weekday(orderdate),count(OrderID)
FROM orders
GROUP BY weekday(orderdate); 

-- 119.	Display the average delivery time in minutes.
SELECT 
avg(timediff(estimateddelivery,orderdate)) as time
FROM orders;
 
-- 120.	Prepare a monthly business summary showing total orders, revenue, and average order value. 
SELECT 
monthname(orderdate),
count(orderid),
sum(totalamount),
avg(totalamount)
FROM orders
GROUP BY monthname(orderdate);


-- PART E – Advanced SQL (Questions 121–150)
-- 121. Display all customers with a row number based on their total spending.
SELECT row_number() OVER(ORDER BY sum(o.TotalAmount) desc) as row_numbers,
concat(c.firstname,c.lastname) as customer_name,
sum(o.TotalAmount) as total
FROM orders o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

-- 122. Rank restaurants according to total revenue.
SELECT row_number() OVER(ORDER BY sum(o.totalamount) desc) as row_numbers,
r.restaurantname,
sum(o.TotalAmount)
FROM orders o
INNER JOIN restaurants r
	ON o.RestaurantID = r.RestaurantID
GROUP BY o.RestaurantID ;

-- 123. Assign a dense rank to customers based on lifetime spending.
SELECT dense_rank() OVER(ORDER BY sum(o.TotalAmount)desc) as row_numbers,
concat(c.firstname,c.lastname) as customer_name,
sum(o.TotalAmount) as total
FROM orders o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
;

-- 124. Divide customers into four spending groups using NTILE().
SELECT ntile(4) OVER(ORDER BY sum(o.TotalAmount)desc) as row_numbers,
concat(c.firstname,c.lastname) as customer_name,
sum(o.TotalAmount) as total
FROM orders o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

-- 125. Display each payment along with the previous payment amount.
 SELECT
    c.firstname,
    p.paymentid,
    p.amount as current_payment,
    LAG(p.amount) OVER (
        PARTITION BY c.customerid
		ORDER BY p.paymentID
    ) as previous_payment
FROM customers c
JOIN orders o
    on c.customerid = o.customerid
JOIN payments p
    on p.orderid = o.orderid;
    
-- 126. Display each payment along with the next payment amount.
SELECT
    c.firstname,
    p.paymentid,
    p.amount as current_payment,
    LEAD(p.amount) OVER (
        PARTITION BY c.customerid
        ORDER BY p.paymentdate
    ) as Next_payment
FROM customers c
JOIN orders o
    on c.customerid = o.customerid
JOIN payments p
    on p.orderid = o.orderid;
 
-- 127. Calculate the running total of completed payments.
SELECT PaymentStatus,
sum(Amount) as complete_payement
FROM payments
WHERE PaymentStatus = 'success'
GROUP BY PaymentStatus;

select
    paymentid,
    amount,
    sum(amount) over (
        order by paymentdate
    ) as running_total_payments
from payments
where paymentstatus = "Success";
 
-- 128. Calculate the moving average of payment amounts.
SELECT 
paymentdate,
amount,
avg(amount) OVER(ORDER BY PaymentDate)  as avg_amount
FROM payments; 
 
-- 129. Using a Common Table Expression (CTE), display restaurants with revenue greater than ₹20,000.
 WITH RESTAURANT_REVENUE AS 
 (SELECT 
 r.RestaurantName,
 sum(o.TotalAmount) as amount
 FROM restaurants r
 INNER JOIN orders o
	ON r.RestaurantID = o.RestaurantID
 GROUP BY r.RestaurantName) 
SELECT * from RESTAURANT_REVENUE
WHERE amount > 20000;
 
-- 130. Using a Common Table Expression (CTE), display customer-wise total spending. 
with  total_spend as (SELECT 
c.CustomerID,
c.Firstname,
sum(o.TotalAmount) as amount
FROM orders o 
INNER JOIN customers c 
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID,
		c.FirstName)
SELECT * FROM total_spend;

-- 131. Display customers whose total spending is greater than the average customer spending.
WITH total_spend as(
SELECT 
c.CustomerID,
c.Firstname,
sum(o.TotalAmount) as amount
FROM orders o 
INNER JOIN customers c 
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID)
SELECT * FROM total_spend 
WHERE amount > (select avg(amount) from total_spend);

-- 132. Display orders whose value is greater than the average order value of the same restaurant. 
WITH restaurants_avg as(
SELECT 
r.restaurantid,
avg(o.totalamount) as avg_amount
FROM orders as o
INNER JOIN restaurants as r
	ON o.RestaurantID = r.RestaurantID
GROUP BY r.Restaurantid)
SELECT * FROM orders o
WHERE TotalAmount > (select avg_amount from restaurants_avg r
						where o.RestaurantID = r.RestaurantID);

-- 133. Categorize orders as Low, Medium, or High value using the CASE statement.
 SELECT *,
 CASE
	WHEN TotalAmount < 300 THEN 'Low'
    WHEN TotalAmount BETWEEN 300 AND 900 THEN 'Medium'
    ELSE 'High'
END as price_categorize
FROM orders;

-- 134. Display the total number of completed, pending, failed, and refunded payments using conditional aggregation.
SELECT PaymentStatus,
 CASE
	WHEN PaymentStatus = 'success' THEN count(PaymentStatus)
    WHEN PaymentStatus = 'pending' THEN count(PaymentStatus)
    ELSE count(PaymentStatus)
END as Total_count
FROM payments
GROUP BY PaymentStatus;

-- 135. Display customers who have placed at least one order.
SELECT c.CustomerID,
count(c.CustomerID)
FROM customers c 
INNER JOIN orders o
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- 136. Display customers who have never placed any order.
 SELECT c.CustomerID,
count(c.CustomerID)
FROM customers c 
INNER JOIN orders o
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING count(c.CustomerID) < 1;

-- 137. Display the top five restaurants based on revenue.
SELECT 
r.restaurantname,
sum(o.TotalAmount) as amount
FROM restaurants r
INNER JOIN orders o 
	ON r.RestaurantID = o.RestaurantID
GROUP BY r.RestaurantName
order by amount desc
limit 5;

-- 138. Display the top ten customers based on lifetime spending.
SELECT dense_rank() OVER(ORDER BY sum(o.TotalAmount)desc) as row_numbers,
concat(c.firstname,c.lastname) as customer_name,
sum(o.TotalAmount) as total
FROM orders o
INNER JOIN customers as c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
limit 10;
 
-- 139. Display restaurants having an average customer rating greater than 4.5.
 SELECT 
 r.restaurantid,
 r.restaurantname,
 avg(re.FoodRating) as rating
 FROM restaurants r
 INNER JOIN reviews re
	ON  r.RestaurantID = re.RestaurantID
GROUP BY r.RestaurantID
HAVING rating > 4.5;

-- 140. Calculate the Customer Lifetime Value (CLV) for every customer.
WITH Metrics AS
(
    SELECT 
    CustomerID,
    SUM(TotalAmount) AS cus_spent,
    AVG(TotalAmount) AS spent_avg,
    COUNT(OrderID) AS orders_count,
    DATEDIFF(MAX(OrderDate),MIN(OrderDate)) As days_existing
FROM Orders
GROUP BY CustomerID
),
Cus_cte As
(
    SELECT 
    *,
    ROUND(spent_avg * (orders_count / GREATEST(days_existing, 1)) * 365 ) AS CLV
FROM Metrics
)
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName , " " , c.LastName) AS Name,
    cte.*
FROM Customers AS c 
JOIN Cus_cte AS cte 
    ON c.CustomerID = cte.CustomerID
ORDER BY cte.CLV DESC;

-- 141. Display monthly revenue generated through completed payments.
SELECT
monthname(paymentdate),
sum(amount) as revenue
FROM payments
WHERE PaymentStatus = 'success'
GROUP BY monthname(paymentdate);

-- 142. Display the total number of orders placed during each hour of the day.
SELECT 
hour(orderdate),
count(*) as total
FROM orders
GROUP BY hour(OrderDate);
 
-- 143. Display the average delivery time for each delivery partner.
SELECT
d.partnerid,
de.partnername,
avg(timediff(deliverytime,assignedtime)) as avg_time
FROM delivery d
INNER JOIN deliverypartners de
ON d.PartnerID = de.PartnerID
GROUP BY de.PartnerID;

-- 144. Identify the delivery partner with the lowest average delivery time.
SELECT
d.partnerid,
de.partnername,
avg(timediff(deliverytime,assignedtime)) as avg_time
FROM delivery d
INNER JOIN deliverypartners de
ON d.PartnerID = de.PartnerID
GROUP BY de.PartnerID
ORDER BY avg_time
LIMIT 1;
 
-- 145. Rank payment methods based on completed transactions.
SELECT
paymentmethod,
sum(Amount),
RANK() OVER(ORDER BY sum(Amount) desc)
FROM payments
WHERE PaymentStatus = 'success'
GROUP BY PaymentMethod;

-- 146.Display each restaurant's revenue along with its percentage contribution to total revenue.
SELECT 
RestaurantID,
sum(TotalAmount),
(
	(sum(TotalAmount)/
    (SELECT sum(TotalAmount)
    FROM orders))
    *100) as contribution_percent
FROM orders
GROUP BY RestaurantID;

-- 147. Display customers who have placed more than five orders.
SELECT 
o.CustomerID,
count(RestaurantID)
FROM orders o
GROUP BY o.CustomerID
HAVING count(o.OrderID) >= 5;

-- 148.Display customers who have ordered from more than one restaurant.
SELECT
CustomerID,
count(RestaurantID)
FROM orders
GROUP BY CustomerID
HAVING count(RestaurantID);
 
-- 149.Prepare a KPI dashboard showing total customers, restaurants, orders, completed payments, and reviews.
WITH cus_tab as
( SELECT
	count(*) as cus_count
    FROM customers),
res_tab as
(SELECT
	count(*) as res_count
    FROM restaurants),
order_tab as
(SELECT
	count(*) as order_tab
    FROM orders),
pay_tab as
(SELECT
	count(*) as pay_tab
    FROM payments
WHERE PaymentStatus = 'success'),
rew_tab as
(SELECT
	count(*) as review_count
    FROM reviews)
SELECT * FROM cus_tab,res_tab,order_tab,pay_tab,rew_tab;

-- 150.Prepare an executive business report showing restaurant name, total orders, total revenue, average customer rating, and average delivery time.
SELECT
	r.restaurantname,
    count(o.orderID),
    sum(o.totalamount),
    avg(r.rating),
    sec_to_time(avg(time_to_sec(timediff(d.deliverytime,d.assignedtime)))) as average_time
FROM orders as o
INNER JOIN restaurants as r
	ON r.restaurantID = o.restaurantID
INNER JOIN delivery as d
	ON d.orderID = o.orderID
GROUP BY o.restaurantID;




