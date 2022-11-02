DROP TABLE IF EXISTS ProductsCategories;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;


CREATE TABLE Products(
	ProductId INT PRIMARY KEY, 
	ProductName VARCHAR(50) not null
);

CREATE TABLE Categories(
	CategoryId INT PRIMARY KEY, 
	CategoryName VARCHAR(50) not null
);

CREATE TABLE ProductsCategories(
ProductId INT,
CategoryId INT,
FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
CONSTRAINT PK_ProductIdCategoryId PRIMARY KEY (ProductId, CategoryId)
);

INSERT INTO Products(ProductId, ProductName) VALUES(1, '�������');
INSERT INTO Products(ProductId, ProductName) VALUES(2, '����� ����������');
INSERT INTO Products(ProductId, ProductName) VALUES(3, '���� �������');
INSERT INTO Products(ProductId, ProductName) VALUES(4, '�������');
INSERT INTO Products(ProductId, ProductName) VALUES(5, '���������� �������');
INSERT INTO Products(ProductId, ProductName) VALUES(6, '������');
INSERT INTO Products(ProductId, ProductName) VALUES(7, '����');
INSERT INTO Products(ProductId, ProductName) VALUES(8, '������� ������� ��������');

INSERT INTO Categories(CategoryId, CategoryName) VALUES(1, '��������');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(2, '�����');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(3, '������������� �������');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(4, '����');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(5, '�����');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(7, '�������');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(8, '������ ��� ����');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(9, '������� �����');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(10, '������� ������');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(11, '�������');

INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (1, 7);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (2, 1);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (2, 2);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (2, 3);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (3, 1);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (3, 4);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (3, 5);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (4, 7);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (4, 10);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (5, 8);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (5, 9);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (7, 1);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (8, 10);
INSERT INTO ProductsCategories(ProductId, CategoryId) VALUES (1, 10);

SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN ProductsCategories ON Products.ProductId=ProductsCategories.ProductId
LEFT JOIN Categories ON ProductsCategories.CategoryId=Categories.CategoryId
ORDER BY Products.ProductId;
