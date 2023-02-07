SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID
LEFT JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
WHERE Customers.Country="USA"