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

INSERT INTO Products(ProductId, ProductName) VALUES(1, 'Лисенок');
INSERT INTO Products(ProductId, ProductName) VALUES(2, 'Пирог клубничный');
INSERT INTO Products(ProductId, ProductName) VALUES(3, 'Каша рисовая');
INSERT INTO Products(ProductId, ProductName) VALUES(4, 'Машинка');
INSERT INTO Products(ProductId, ProductName) VALUES(5, 'Стиральный порошок');
INSERT INTO Products(ProductId, ProductName) VALUES(6, 'Ластик');
INSERT INTO Products(ProductId, ProductName) VALUES(7, 'Вода');
INSERT INTO Products(ProductId, ProductName) VALUES(8, 'Детские влажные салфетки');

INSERT INTO Categories(CategoryId, CategoryName) VALUES(1, 'Продукты');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(2, 'Торты');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(3, 'Хлебобулочные изделия');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(4, 'Каши');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(5, 'Крупы');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(7, 'Игрушки');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(8, 'Товары для дома');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(9, 'Бытовая химия');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(10, 'Детские товары');
INSERT INTO Categories(CategoryId, CategoryName) VALUES(11, 'Лимонад');

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
