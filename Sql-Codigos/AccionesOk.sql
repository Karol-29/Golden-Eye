-- Insertar registros de prueba
INSERT INTO Payments (id, paymentDate, method) VALUES (1, TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'Tarjeta');
INSERT INTO TypesDelivery (id, method) VALUES (1, 'Envío estándar');
INSERT INTO Addresses (id, country, city, state) VALUES (1, 'Colombia', 'Bogotá', 'Cundinamarca');
INSERT INTO Users (id, name, mail, address) VALUES (1, 'Juan Perez', 'juanperez@example.com', 1);
INSERT INTO Users (id, name, mail, address) VALUES (2, 'Maria Lopez', 'marialopez@example.com', 1);
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)VALUES (1, 10000, 15000, 'A', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 1, 1, 2, 1, 1);
INSERT INTO Categories (id, name, description) VALUES (1, 'Electrónica', 'Productos electrónicos');
INSERT INTO Products (id, name, condition, url, category) VALUES (1, 'Laptop', 'Nuevo', 'http://example.com/laptop', 1);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (1, 1);
INSERT INTO Bids (id, amount, status, idauction,owner) VALUES (1, 5000, 'A', 1,1);

-- Verificar que hay registros
SELECT * FROM Bids WHERE idAuction = 1;  -- Debería devolver el bid con id = 1

-- Verificar que hay registros en AuctionByProduct
SELECT * FROM AuctionByProduct WHERE idAuction = 1;  -- Debería devolver el registro con idAuction = 1

-- Eliminamos la subasta con id = 1
DELETE FROM Auctions WHERE id = 1;

-- Verificamos que el registro en Bids ha sido eliminado
SELECT * FROM Bids WHERE idAuction = 1; 

-- Verificamos que el registro en AuctionByProduct ha sido eliminado
SELECT * FROM AuctionByProduct WHERE idAuction = 1;  


--borrar product
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)VALUES (1, 10000, 15000, 'A', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 1, 1, 2, 1, 1);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (1, 1);

SELECT * FROM AuctionByProduct WHERE idProduct = 1;  -- Debería devolver un registro

DELETE FROM Products WHERE id = 1;
SELECT * FROM AuctionByProduct WHERE idProduct = 10;  -- No debería devolver resultados

