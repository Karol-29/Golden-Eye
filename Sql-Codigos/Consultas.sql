--Consultar producto más caro
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


--Consultar ultima subabsta
SELECT p.name AS producto, p.condition AS condicion, a.endTime AS fecha_cierre
FROM Products p
JOIN AuctionByProduct ap ON p.id = ap.idProduct
JOIN Auctions a ON ap.idAuction = a.id
WHERE a.status IN ('A')
AND a.endTime = (SELECT MAX(endTime) FROM Auctions WHERE status IN ('A'))
ORDER BY a.endTime DESC;

--Consultar Subastas activas 
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

--consultar fecha de subasta
SELECT 
    a.endTime AS fecha_cierre,
    p.name AS nombre_producto,
    p.condition AS condicion
FROM Auctions a
JOIN AuctionByProduct ap ON a.id = ap.idAuction
JOIN Products p ON ap.idProduct = p.id
ORDER BY a.endTime DESC;

--Consultar Productos disponibles 
SELECT p.id, p.name, p.condition, p.url, p.category
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM AuctionByProduct ap
    WHERE ap.idProduct = p.id
);


--Consultar envios faltantes

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

--Valor Puja promedio 
SELECT 
    b.owner AS id_cliente,
    ROUND(AVG(b.amount), 2) AS promedio_pujas
FROM Bids b
GROUP BY b.owner
ORDER BY promedio_pujas DESC;

--Categoria mas comprada
SELECT 
    c.name AS categoria,
    COUNT(*) AS veces_comprada
FROM Auctions a
JOIN AuctionByProduct abp ON a.id = abp.idAuction
JOIN Products p ON abp.idProduct = p.id
JOIN Categories c ON p.category = c.id
WHERE a.winner IS NOT NULL
GROUP BY c.name
ORDER BY veces_comprada DESC
FETCH FIRST 1 ROWS ONLY;



