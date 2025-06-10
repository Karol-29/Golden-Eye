-- TRIGGER TGR_DELETE_AUCTIONS_PENALTIES
-- 1. Insertar valores requeridos en tablas relacionadas
INSERT INTO Addresses (country, city, state)
VALUES ('México', 'Guadalajara', 'CDMX');
INSERT INTO Users (name, mail, address)
VALUES ('Juan Pérez', 'juan@mail.com', 1);
INSERT INTO Payments (paymentDate, method)
VALUES (SYSDATE, 'Tarjeta');
INSERT INTO PickUp(pickupDate)
VALUES (SYSDATE);
-- 2. Insertar subasta de prueba
INSERT INTO Auctions (
  id, initialPrice, finalPrice, status,
  startTime, endTime, payment,
  organizer, winner, address, idDelivery
)
VALUES (
  1, -- id único para la subasta
  100, -- initialPrice
  150, -- finalPrice
  'A', -- status
  TO_TIMESTAMP('2025-05-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  TO_TIMESTAMP('2025-05-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  (SELECT MAX(id) FROM Payments),
  (SELECT MAX(id) FROM Users),
  (SELECT MAX(id) FROM Users), 
  (SELECT MAX(id) FROM Addresses),
  (SELECT MAX(id) FROM TypesDelivery) 
);
-- 3. Insertar penalización relacionada a la subasta
INSERT INTO Penalties (
    amount, reason, type, status,
    idBid, idAuction, idAuctionBid, owner
) VALUES (
    50, 'Falta grave', 'A', 'A',
    NULL, (SELECT MAX(id) FROM AUCTIONS), NULL, (SELECT MAX(id) FROM Users))
;
-- Verificaciones antes del DELETE
SELECT *
FROM AUCTIONS 
WHERE ID=(SELECT MAX(id) FROM AUCTIONS);
SELECT *
FROM Penalties 
WHERE ID=(SELECT MAX(id) FROM Penalties);
-- Eliminar la subasta (debe activarse el trigger)
DELETE FROM Auctions WHERE id =(SELECT MAX(id) FROM AUCTIONS);
--debe aparecer vacia
SELECT * FROM Penalties WHERE idAuction = (SELECT MAX(id) FROM AUCTIONS);

-- TRIGGER TRG_BEFORE_INSERT_BIDS AND TRG_BEFORE_INSERT_AUCTIONS AND TRG_BEFORE_INSERT_PRODUCTS AND TRG_BEGORE INSERT_PAYMENTS AND TRG_BEFORE_INSERT_PICKUP 
--AND TRG_BEFORE_INSERT_TOADDRESS AND BEFORE_INSERT_CATEGORIES AND TGR_BEFORE_INSERT_USERS AND TGR_BEFORE_INSERT_ADDRESS AND TRG_BEFORE_INSERT_PENALTIES
--AND TRG_BEFORE_INSERT_REGISTERED AND TRG_CALCULATE_AUCTION_DURATION AND 
INSERT INTO Addresses (country, city, state)
VALUES ('Canada', 'Ottawa', 'Canada');
INSERT INTO Users (name, mail, address)
VALUES ('Karol', 'karol@mail.com', 1);
INSERT INTO Payments (method)
VALUES ('Tarjeta');
INSERT INTO PickUp(pickupDate)
VALUES (SYSDATE);
INSERT INTO Registered(id,password)
VALUES ((SELECT MAX(id) FROM USERS),'1234')
INSERT INTO ToAddress (shippingCost, deliveryTime, address) 
VALUES (17000, TO_DATE('2023-07-01', 'YYYY-MM-DD'),(SELECT MAX(id) FROM ADDRESSES));
INSERT INTO Categories (name, description) 
VALUES ('TEXTIL', XMLType('<Description>TEXTIL.</Description>'));
INSERT INTO Products (name, condition, url, category) 
VALUES ('Car Tires', 'U', 'https://example.com/tires', (SELECT MAX(id) FROM CATEGORIES));
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES ((SELECT MAX(id) FROM PRODUCTS), (SELECT MAX(id) FROM AUCTIONS));
INSERT INTO Auctions (
  initialPrice, finalPrice, status,
  startTime, endTime, payment,
  organizer, winner, address, idDelivery
)
VALUES (
  100, -- initialPrice
  250, -- finalPrice
  'A', -- status
  TO_TIMESTAMP('2025-05-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  TO_TIMESTAMP('2025-05-19 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  (SELECT MAX(id) FROM Payments),
  (SELECT MAX(id) FROM Users),
  (SELECT MAX(id) FROM Users), 
  (SELECT MAX(id) FROM Addresses),
  (SELECT MAX(id) FROM TypesDelivery) 
);
INSERT INTO Users (name, mail, address)
VALUES ('Juana', 'juana@mail.com',(SELECT MAX(id) FROM Addresses) );

INSERT INTO Bids (idAuction, amount, owner)
VALUES ( (SELECT MAX(id) FROM Auctions), 150, (SELECT MAX(id) FROM Users));

-- Verificar inserción
SELECT * FROM Bids WHERE id = (SELECT MAX(id) FROM Bids);
SELECT * FROM Auctions WHERE id = (SELECT MAX(id) FROM Auctions);
SELECT * FROM Addresses WHERE id = (SELECT MAX(id) FROM Addresses);
SELECT * FROM Users WHERE id = (SELECT MAX(id) FROM Users);
SELECT * FROM Payments WHERE id = (SELECT MAX(id) FROM Payments);
SELECT * FROM PickUp WHERE id = (SELECT MAX(id) FROM PickUp);
SELECT * FROM Registered WHERE id = (SELECT MAX(id) FROM Registered);
SELECT * FROM ToAddress WHERE id = (SELECT MAX(id) FROM ToAddress);
SELECT * FROM Categories WHERE id = (SELECT MAX(id) FROM Categories);
SELECT * FROM Products WHERE id = (SELECT MAX(id) FROM Products);
SELECT * FROM Auctions WHERE id = (SELECT MAX(id) FROM Auctions);
SELECT * FROM Bids WHERE id = (SELECT MAX(id) FROM Bids);
SELECT * FROM AuctionByProduct WHERE idProduct = (SELECT MAX(id) FROM Products);


--TGR_BEFORE_UPDATE_AUCTIONS
UPDATE Auctions
SET InitialPrice = 150
WHERE id = (SELECT MAX(id) FROM AUCTIONS);
SELECT * FROM Auctions WHERE id = (SELECT MAX(id) FROM AUCTIONS);


-- TRIGGER TRG_update_bids

UPDATE bids SET amount = 40000 WHERE id = (SELECT MAX(id) FROM BIDS);

--TRIGER TRG_UPDATE_PAYMENTS
UPDATE PAYMENTS SET METHOD = 'DEBITO' WHERE id = (SELECT MAX(id) FROM PAYMENTS);

