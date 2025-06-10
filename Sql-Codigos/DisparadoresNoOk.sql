
--TGR_BEFORE_UPDATE_AUCTIONS
INSERT INTO Auctions (
    initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery, duration
) VALUES (
    100, 200, 'A', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 1, 1, 1, 1, 1, 10
);
-- Intento actualizar el finalPrice (no permitido)
UPDATE Auctions
SET finalPrice = 250
WHERE id = 1;

--TRG_BEFORE_INSERT_BIDS
--mismo user que hizo subasta anterior
INSERT INTO Bids (id, amount, status, owner) VALUES ((SELECT MAX(ID) FROM AUCTIONS), 150, 'A', 1);

--TRG_UPDATE_BID_AMOUNT
UPDATE BIDS
SET AMOUNT=50
WHERE id=(SELECT MAX(ID) FROM BIDS);

--TRG_BEFORE_PAYMENTS_UPDATE
UPDATE PAYMENTS
SET ID=50
WHERE id=(SELECT MAX(ID) FROM PAYMENTS);

--TTRG_PRODUCTS_UPDATE
UPDATE PRODUCTS
SET condition='N'
WHERE id=(SELECT MAX(ID) FROM Products);

--TRG_VALIDATE_PENALTIES_TYPE
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) 
VALUES (850, 'Oferta inválida', 'B', 'A', 12, 8, 12, 27);



