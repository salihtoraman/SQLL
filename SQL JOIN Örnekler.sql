--ÖDEVLER
--Hangi müþteri hangi üründen kaç dolarlýk satýþ almýþtýr (Products,[Order Details],Orders,Customers)
--SELECT c.ContactName, p.ProductName, SUM(od.Quantity * od.UnitPrice * (1-Discount)) FROM Products p 
--INNER JOIN [Order Details] od ON p.ProductID = od.ProductID 
--INNER JOIN Orders o ON o.OrderID = od.OrderID 
--INNER JOIN Customers c ON c.CustomerID = o.CustomerID GROUP BY C.ContactName , p.ProductName


--Hangi personel hangi kategoriden hangi ürünleri satmýþtýr.(Employees,Orders,Order Details],Products,Categories,)
--SELECT LEFT (FirstName,1)+ '.' + e.LastName AS 'Personel Adý Soyadý' , p.ProductName , c.CategoryName FROM Employees e
--INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID 
--INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
--INNER JOIN Products p ON p.ProductID = od.ProductID 
--INNER JOIN Categories c ON c.CategoryID = p.CategoryID GROUP BY c.CategoryName,p.ProductName,e.FirstName , E.LastName


--Ürünlerin adlarýný ve kategori adlarýný bir raporda gösteriniz. (Products , Categories)
--SELECT p.ProductName , c.CategoryName FROM Products p LEFT JOIN Categories c ON c.CategoryID = p.CategoryID GROUP BY p.ProductName , c.CategoryName

--Beverages kategorisine ait stoklarda bulunan ürünleri raporla (Categories,Products)
--SELECT p.ProductName AS 'Ürün Adý', c.CategoryName AS 'Kategori Adý', p.UnitsInStock AS 'Stok Miktarý' FROM Categories c 
--INNER JOIN Products p ON p.CategoryID = c.CategoryID 
--WHERE c.CategoryName = 'Beverages' GROUP BY p.UnitsInStock , c.CategoryName , p.ProductName

-- Federal Shipping ile taþýnmýþ ve Nelsonun almýþ olduðu sipariþleri göster
--SELECT * FROM Employees e INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID 
--INNER JOIN Shippers s ON s.ShipperID = o.ShipVia WHERE s.CompanyName = 'Federal Shipping' AND e.FirstName = 'Nancy' 

-- Company name'ler arasýnda içerisinde A harfi geçen müþterilerin vermiþ olduðu Nelson , Andrew ve Janot tarafýndan satýlmýþ spedy expresle taþýnmamýþ sipariþlere toplam ne kadarlýk kargo ödemesi yapýlmýþtýr.
--SELECT SUM(o.Freight) AS 'Toplam' FROM Shippers s INNER JOIN Orders o ON s.ShipperID = o.ShipVia 
--INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID 
--INNER JOIN Customers c ON c.CustomerID = o.CustomerID WHERE s.CompanyName != 'Speedy Express' AND c.CompanyName 
--LIKE '%A%' AND (e.FirstName = 'Nancy' OR e.FirstName = 'Salih' OR e.FirstName = 'Janet') 

-- En çok ürün aldýðýmýz 3 toptancýyý almýþ olduðumuz ürün miktarýna göre raporlayýn
--SELECT TOP 3  s.CompanyName AS 'Toptancý',SUM(Quantity)  AS 'Toplam' FROM [Order Details] od INNER JOIN Products p ON p.ProductID=od.ProductID INNER JOIN Suppliers s ON s.SupplierID=p.SupplierID GROUP BY s.CompanyName ORDER BY 'Toplam' DESC

-- Her bir üründen toplam ne kadarlýk satýþ yapýlmýþtýr ve o ürünler hangi kategorilere aittir.
--SELECT p.ProductName AS 'Ürün adý', SUM(od.Quantity * od.UnitPrice * (1-Discount)) AS 'Toplam Satýþ' FROM Categories c INNER JOIN Products p ON p.CategoryID = c.CategoryID 
--INNER JOIN [Order Details] od ON od.ProductID = p.ProductID GROUP BY p.ProductName