-- Insertar dirección
INSERT INTO Addresses (country, city, state)
VALUES ('Colombia', 'Cajica', 'Cundinamarca');

-- Insertar usuario, tomando la dirección recién insertada
INSERT INTO Users (name, mail, address)
VALUES (
  'JuanDavid',
  'JunDavid@gmail.com',
  (SELECT MAX(id) FROM Addresses)
);

-- Insertar método de pago
INSERT INTO Payments(method)
VALUES('EFECTIVO');

-- Insertar punto de recogida
INSERT INTO PickUp (pickUpDate)
VALUES (TO_DATE('2024-01-05', 'YYYY-MM-DD'));

INSERT INTO Auctions (
  id, initialPrice, finalPrice, status,
  startTime, endTime, payment,
  organizer, winner, address, idDelivery
)
VALUES (
  1, -- id único para la subasta
  100, -- initialPrice
  350, -- finalPrice
  'A', -- status
  TO_TIMESTAMP('2025-05-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  TO_TIMESTAMP('2025-05-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  (SELECT MAX(id) FROM Payments),
  (SELECT MAX(id) FROM Users),
  (SELECT MAX(id) FROM Users), -- mismo usuario como ganador por ahora
  (SELECT MAX(id) FROM Addresses),
  (SELECT MAX(id) FROM TypesDelivery) 
);

SELECT *
FROM AUCTIONS 
WHERE ID=(SELECT MAX(id) FROM AUCTIONS);

--ck_initialP_finalp
UPDATE Auctions
SET initialPrice = 600  
WHERE id = (SELECT MAX(id) FROM AUCTIONS);


