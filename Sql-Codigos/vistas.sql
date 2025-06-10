CREATE OR REPLACE VIEW vw_ProductDetails AS
SELECT 
    P.ID, 
    P.NAME AS PRODUCTO, 
    P.CONDITION AS CONDICION, 
    C.NAME AS CATEGORIA
FROM PRODUCTS P
JOIN CATEGORIES C ON P.CATEGORY = C.ID;


CREATE OR REPLACE VIEW vw_RegisteredUserDetails AS
SELECT 
    U.id AS ID,
    U.name AS NOMBRE,
    U.mail AS CORREO,
    P.phonenumber AS NUMERO,
    A.country AS PAIS,
    A.state AS DEPARTAMENTO,
    A.city AS CIUDAD
FROM USERS U
INNER JOIN REGISTERED R ON U.id = R.id
INNER JOIN PHONENUMBERS P ON U.id = P.idUser
INNER JOIN ADDRESSES A ON A.id = U.address;


CREATE OR REPLACE VIEW vw_MoreExpesiveProduct AS
SELECT p.name AS producto, 
       a.finalPrice AS precio
FROM Products p
JOIN AuctionByProduct ap ON p.id = ap.idProduct
JOIN Auctions a ON ap.idAuction = a.id
WHERE a.status IN ('A')
AND a.finalPrice = (SELECT MAX(finalPrice) 
                    FROM Auctions 
                    WHERE status IN ('A'))
ORDER BY a.finalPrice DESC;

CREATE OR REPLACE VIEW vw_LastAuction AS
SELECT p.name AS producto,a.endTime AS fecha_cierre,a.finalPrice AS precio
FROM Products p
JOIN AuctionByProduct ap ON p.id = ap.idProduct
JOIN Auctions a ON ap.idAuction = a.id
WHERE a.status IN ('A')
AND a.endTime = (SELECT MAX(endTime) FROM Auctions WHERE status IN ('A'))
ORDER BY a.endTime DESC;


CREATE OR REPLACE VIEW vw_ActiveAuctions AS
SELECT 
    p.name AS producto, 
    a.finalPrice AS precio_actual, 
    a.endTime AS fecha_cierre, 
    u.name AS mejor_postor
FROM Auctions a
JOIN AuctionByProduct ap ON a.id = ap.idAuction
JOIN Products p ON ap.idProduct = p.id
LEFT JOIN Bids b ON a.id = b.id 
LEFT JOIN Users u ON b.owner = u.id
WHERE a.status = 'A' 
AND b.amount = (SELECT MAX(amount) FROM Bids WHERE id = b.id) 
ORDER BY a.endTime ASC;

CREATE OR REPLACE VIEW vw_DateAuction AS
SELECT 
    a.endTime AS fecha_cierre,
    p.name AS nombre_producto,
    a.finalPrice
FROM Auctions a
JOIN AuctionByProduct ap ON a.id = ap.idAuction
JOIN Products p ON ap.idProduct = p.id
ORDER BY a.endTime DESC;

CREATE OR REPLACE VIEW vw_AvaliableProduct AS
SELECT 
    p.id,
    p.name AS product_name,
    c.name AS category_name
FROM 
    Products p
JOIN 
    Categories c ON p.category = c.id
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM AuctionByProduct ap
        WHERE ap.idProduct = p.id
    );


CREATE OR REPLACE VIEW vw_lackDelivery AS
SELECT 
    p.name AS producto,
    u.name AS comprador,
    pay.paymentDate AS fecha_compra,
    td.status AS estado_envio
FROM Auctions a
JOIN AuctionByProduct ap ON a.id = ap.idAuction
JOIN Products p ON ap.idProduct = p.id
JOIN Users u ON a.Winner = u.id
JOIN Payments pay ON a.Payment = pay.id
JOIN TypesDelivery td ON a.idDelivery = td.id
WHERE td.status = 'B' 
ORDER BY pay.paymentDate;