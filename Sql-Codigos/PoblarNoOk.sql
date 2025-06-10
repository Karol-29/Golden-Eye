--Fallo de foranea por addres no creada
INSERT INTO Users (id, name, mail, address) 
VALUES (NULL, 'Juan Perez', 'juanperez@example.com', 155);
--Tamaño de atributo muy grande
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, idDelivery) 
VALUES (20, NULL, 500, 'Active', '2024-03-20 10:00:00', '2024-03-25 10:00:00', 1, 1, 2, 3);

--CHK_STATUS_PENALTY
INSERT INTO PENALTIES(id,amount,reason,type,status,idBid,idAuction,idAuctionBid,owner)
VALUES(1,1000,'INCUMPLIMIENTO','B','G',1,1,1,1);

--CHK_TYPE_PENALTY
INSERT INTO PENALTIES(id,amount,reason,type,status,idBid,idAuction,idAuctionBid,owner)
VALUES(1,1000,'INCUMPLIMIENTO','G','P',1,1,1,1);

--CHK_USERS_TYPE_MAIL 
INSERT INTO Users (id, name, mail, address) 
VALUES (3, 'Carlos Gomez', 'carlosgomez', 789);

--CHK_PHONE_STARTS_WITH_3
INSERT INTO PHONENUMBERS(idUser,phoneNumber)
VALUES(1,'9090909090');

--CHK_BIDS_STATUS
INSERT INTO Bids (id,idAuction, amount, status, owner) 
VALUES (1,1, 15000, 'F', 3);

--CHK_PENALTY_AMOUNT
INSERT INTO PENALTIES(id,amount,reason,type,status,idBid,idAuction,idAuctionBid,owner)
VALUES(1,25,'INCUMPLIMIENTO','B','9',1,1,1,1);

--CHK_AUCTIONS_STATUS
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1, 10000, 15000, 'H', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 1, 1, 2, 1, 1);

--CHK_STATUS_TYPEDELIVERY
INSERT INTO TypesDelivery (id,method,status) 
VALUES(1,'TOADDRESS','G');

--CHK_METHOD_TYPEDELIVERY
INSERT INTO TypesDelivery (id,method,status) 
VALUES(1,'G','B');

--CHK_CONDITION_PRODUCT
INSERT INTO Products (id,name,condition,url,category)
VALUES(1,'BLUSA','V','AAAA','1');

--CHK_BIDS_AMOUNT
INSERT INTO Bids (id,idAuction, amount, status, owner) 
VALUES (1,1, 15003, 'A', 3);

--CHK_AUTIONS_INITIALPRICE
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, idDelivery) 
VALUES (20,501,500,'A',TO_TIMESTAMP('2024-03-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2024-03-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,1,2,3);

--CHK_AUTIONS_FINALPRICE
INSERT INTO Auctions (id, initialPrice, finalPrice, status, startTime, endTime, Payment, Organizer, Winner, idDelivery) 
VALUES (20,500,505,'A',TO_TIMESTAMP('2024-03-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2024-03-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,1,2,3);

--CHK_TOADDRESS_SHIPPINGCOST
INSERT INTO ToAddress(id,shippingCost,deliveryTime,address)
VALUES (1,101,TO_DATE('2024-03-20' , 'YYYY-MM-DD'),1);