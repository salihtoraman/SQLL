--�DEVLER
--Hangi m��teri hangi �r�nden ka� dolarl�k sat�� alm��t�r (Products,[Order Details],Orders,Customers)
--SELECT c.ContactName, p.ProductName, SUM(od.Quantity * od.UnitPrice * (1-Discount)) FROM Products p 
--INNER JOIN [Order Details] od ON p.ProductID = od.ProductID 
--INNER JOIN Orders o ON o.OrderID = od.OrderID 
--INNER JOIN Customers c ON c.CustomerID = o.CustomerID GROUP BY C.ContactName , p.ProductName


--Hangi personel hangi kategoriden hangi �r�nleri satm��t�r.(Employees,Orders,Order Details],Products,Categories,)
--SELECT LEFT (FirstName,1)+ '.' + e.LastName AS 'Personel Ad� Soyad�' , p.ProductName , c.CategoryName FROM Employees e
--INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID 
--INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
--INNER JOIN Products p ON p.ProductID = od.ProductID 
--INNER JOIN Categories c ON c.CategoryID = p.CategoryID GROUP BY c.CategoryName,p.ProductName,e.FirstName , E.LastName


--�r�nlerin adlar�n� ve kategori adlar�n� bir raporda g�steriniz. (Products , Categories)
--SELECT p.ProductName , c.CategoryName FROM Products p LEFT JOIN Categories c ON c.CategoryID = p.CategoryID GROUP BY p.ProductName , c.CategoryName

--Beverages kategorisine ait stoklarda bulunan �r�nleri raporla (Categories,Products)
--SELECT p.ProductName AS '�r�n Ad�', c.CategoryName AS 'Kategori Ad�', p.UnitsInStock AS 'Stok Miktar�' FROM Categories c 
--INNER JOIN Products p ON p.CategoryID = c.CategoryID 
--WHERE c.CategoryName = 'Beverages' GROUP BY p.UnitsInStock , c.CategoryName , p.ProductName

-- Federal Shipping ile ta��nm�� ve Nelsonun alm�� oldu�u sipari�leri g�ster
--SELECT * FROM Employees e INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID 
--INNER JOIN Shippers s ON s.ShipperID = o.ShipVia WHERE s.CompanyName = 'Federal Shipping' AND e.FirstName = 'Nancy' 

-- Company name'ler aras�nda i�erisinde A harfi ge�en m��terilerin vermi� oldu�u Nelson , Andrew ve Janot taraf�ndan sat�lm�� spedy expresle ta��nmam�� sipari�lere toplam ne kadarl�k kargo �demesi yap�lm��t�r.
--SELECT SUM(o.Freight) AS 'Toplam' FROM Shippers s INNER JOIN Orders o ON s.ShipperID = o.ShipVia 
--INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID 
--INNER JOIN Customers c ON c.CustomerID = o.CustomerID WHERE s.CompanyName != 'Speedy Express' AND c.CompanyName 
--LIKE '%A%' AND (e.FirstName = 'Nancy' OR e.FirstName = 'Salih' OR e.FirstName = 'Janet') 

-- En �ok �r�n ald���m�z 3 toptanc�y� alm�� oldu�umuz �r�n miktar�na g�re raporlay�n
--SELECT TOP 3  s.CompanyName AS 'Toptanc�',SUM(Quantity)  AS 'Toplam' FROM [Order Details] od INNER JOIN Products p ON p.ProductID=od.ProductID INNER JOIN Suppliers s ON s.SupplierID=p.SupplierID GROUP BY s.CompanyName ORDER BY 'Toplam' DESC

-- Her bir �r�nden toplam ne kadarl�k sat�� yap�lm��t�r ve o �r�nler hangi kategorilere aittir.
--SELECT p.ProductName AS '�r�n ad�', SUM(od.Quantity * od.UnitPrice * (1-Discount)) AS 'Toplam Sat��' FROM Categories c INNER JOIN Products p ON p.CategoryID = c.CategoryID 
--INNER JOIN [Order Details] od ON od.ProductID = p.ProductID GROUP BY p.ProductName