-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
from "Product" as p
JOIN Category as c 
on p.CategoryId = c.Id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, orderdate, companyname
FROM [Order] AS o
    join Shipper AS s
    on o.shipvia = s.id
where o.orderdate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.Quantity
From OrderDetail as o
JOIN Product as p 
on o.ProductId = p.Id
WHERE o.OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as "Order ID",  c.CompanyName , e.LastName as "Employee Last Name"
From [Order] as o
join Customer as c on o.CustomerId = c.Id
Join Employee as e on o.EmployeeId = e.ID;
