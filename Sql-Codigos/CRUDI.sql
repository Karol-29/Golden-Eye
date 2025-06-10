---(PACKAGE BODY)PRODUCTS
CREATE OR REPLACE PACKAGE BODY PKG_PRODUCTS IS

  PROCEDURE addProduct(name VARCHAR2, condition CHAR, url VARCHAR2, category INT) IS
  BEGIN
    INSERT INTO Products(name, condition, url, category)
    VALUES (name, condition, url, category);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addProduct;

  PROCEDURE addCategory(name VARCHAR2, description XMLTYPE) IS
  BEGIN
    INSERT INTO Categories(name, description)
    VALUES (name, description);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addCategory;

  PROCEDURE updateProduct(id INT, name VARCHAR2, url VARCHAR2) IS
  BEGIN
    UPDATE Products SET name = name, url = url WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateProduct;

  PROCEDURE updateCategory(id INT, name VARCHAR2, description XMLTYPE) IS
  BEGIN
    UPDATE Categories SET name = name, description = description WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateCategory;

  PROCEDURE deleteProduct(id INT) IS
  BEGIN
    DELETE FROM Products WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteProduct;

  PROCEDURE deleteCategory(id INT) IS
  BEGIN
    DELETE FROM Categories WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM); 
  END deleteCategory;

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PRODUCT FOR SELECT * FROM Products;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultProduct;

  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_CATEGORY FOR SELECT * FROM Categories;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultCategory;
  
  PROCEDURE mostBoughtCategory(C_BOUGHT OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_BOUGHT FOR SELECT 
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
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END mostBoughtCategory;

  PROCEDURE moreExpensiveProduct(C_EXPENSIVE OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_EXPENSIVE FOR
      SELECT p.name AS producto, 
             a.finalPrice AS precio
      FROM Products p
      JOIN AuctionByProduct ap ON p.id = ap.idProduct
      JOIN Auctions a ON ap.idAuction = a.id
      WHERE a.status = 'A'
        AND a.finalPrice = (
          SELECT MAX(finalPrice)
          FROM Auctions
          WHERE status = 'A'
        )
      ORDER BY a.finalPrice DESC;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END moreExpensiveProduct;

  PROCEDURE availableProduct(C_AVAILABLE OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_AVAILABLE FOR
      SELECT p.id,
             p.name,
             p.condition,
             p.url,
             p.category
        FROM Products p
       WHERE NOT EXISTS (
               SELECT 1
                 FROM AuctionByProduct ap
                WHERE ap.idProduct = p.id
             );
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END availableProduct;
END PKG_PRODUCTS;
/

---(PACKAGE BODY)AUCTIONS
CREATE OR REPLACE PACKAGE BODY PKG_AUCTIONS IS

  PROCEDURE addAuction(initialPrice NUMBER, finalPrice NUMBER, status CHAR, startTime TIMESTAMP, endTime TIMESTAMP, duration NUMBER, payment INT, organizer INT, winner INT, address INT, idDelivery INT) IS
  BEGIN
    INSERT INTO Auctions(initialPrice, finalPrice, status, startTime, endTime, duration, payment, organizer, winner, address, idDelivery)
    VALUES (initialPrice, finalPrice, status, startTime, endTime, duration, payment, organizer, winner, address, idDelivery);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addAuction;

  PROCEDURE addBid(idAuction INT, status CHAR, owner INT, amount NUMBER) IS
  v_current_finalPrice Auctions.finalPrice%TYPE;
  BEGIN
      
      INSERT INTO Bids(idAuction, status, owner, amount)
      VALUES (idAuction, status, owner, amount);
    
      SELECT finalPrice INTO v_current_finalPrice
      FROM Auctions
      WHERE id = idAuction;
    
      IF amount > v_current_finalPrice THEN
        UPDATE Auctions
        SET finalPrice = amount,
            winner = owner
        WHERE id = idAuction;
      END IF;
    
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20050, SQLERRM);
    END addBid;

  PROCEDURE addPenalty(id INT, amount NUMBER, reason VARCHAR2, type CHAR, idBid INT, idAuction INT, owner INT) IS
  BEGIN
    INSERT INTO Penalties(id, amount, reason, type, idBid, idAuction, owner)
    VALUES (id, amount, reason, type, idBid, idAuction, owner);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPenalty;

  PROCEDURE addAddress(id INT, country VARCHAR2, city VARCHAR2, state VARCHAR2) IS
  BEGIN
    INSERT INTO Addresses(id, country, city, state)
    VALUES (id, country, city, state);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addAddress;

  PROCEDURE addPickUp(pickUpDate DATE) IS
  BEGIN
    INSERT INTO PickUp(pickUpDate)
    VALUES (pickUpDate);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPickUp;

  PROCEDURE addToAddress(id INT, shippingCost NUMBER, deliveryTime DATE, address INT) IS
  BEGIN
    INSERT INTO ToAddress(id, shippingCost, deliveryTime, address)
    VALUES (id, shippingCost, deliveryTime, address);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addToAddress;

  PROCEDURE updateAuction(id INT, startTime TIMESTAMP) IS
  BEGIN
    UPDATE Auctions 
    SET startTime = startTime
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateAuction;

  PROCEDURE updateBid(id INT, idAuction INT, amount NUMBER) IS
  BEGIN
    UPDATE Bids 
    SET idAuction = idAuction, amount = amount 
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateBid;

  PROCEDURE updateAddress(id INT, country VARCHAR2, city VARCHAR2, state VARCHAR2) IS
  BEGIN
    UPDATE Addresses 
    SET country = country, city = city, state = state
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateAddress;

  PROCEDURE updateToAddress(id INT, address INT) IS
  BEGIN
    UPDATE ToAddress 
    SET address = address 
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateToAddress;

  PROCEDURE updatePenalty(id INT, amount NUMBER) IS
  BEGIN
    UPDATE Penalties 
    SET amount = amount 
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updatePenalty;

  PROCEDURE updatePickUp(id INT, pickUpDate DATE) IS
  BEGIN
    UPDATE PickUp 
    SET pickUpDate = pickUpDate 
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updatePickUp;

  PROCEDURE deleteAddress(id INT) IS
  BEGIN
    DELETE FROM Addresses WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteAddress;

  PROCEDURE deleteAuction(id INT) IS
  BEGIN
    DELETE FROM Auctions WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteAuction;

  PROCEDURE deleteBid(id INT, idAuction INT) IS
  BEGIN
    DELETE FROM Bids WHERE id = id AND idAuction = idAuction;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteBid;

  PROCEDURE deletePickUp(id INT) IS
  BEGIN
    DELETE FROM PickUp WHERE id = id;
    DELETE FROM TypesDelivery WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deletePickUp;

  PROCEDURE deleteToAddress(id INT) IS
  BEGIN
    DELETE FROM ToAddress WHERE id = id;
    DELETE FROM TypesDelivery WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteToAddress;

  PROCEDURE consultAddress(C_ADDRESS OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_ADDRESS FOR SELECT * FROM Addresses;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultAddress;

  PROCEDURE consultTypeDelivery(C_TYPE OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_TYPE FOR SELECT * FROM TypesDelivery;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultTypeDelivery;

  PROCEDURE consultPickUp(C_PICKUP OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_PICKUP FOR SELECT * FROM PickUp;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultPickUp;

  PROCEDURE consultToAddress(C_ADDRESS OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_ADDRESS FOR SELECT * FROM ToAddress;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultToAddress;
  
  PROCEDURE consultLackDelivery(C_LACK OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_LACK FOR
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
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultLackDelivery;
  
  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_AUCTION FOR SELECT * FROM Auctions;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultAuction;
  
  PROCEDURE consultActiveAuctions(C_ACTIVE OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_ACTIVE FOR
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
          AND b.amount = (
          SELECT MAX(amount) 
          FROM Bids 
          WHERE id = b.id)
      ORDER BY a.endTime ASC;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);  
  END consultActiveAuctions;
  
  PROCEDURE consultLastAuction(C_LAST OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_LAST FOR
      SELECT 
          p.name AS producto, 
          p.condition AS condicion, 
          a.endTime AS fecha_cierre
      FROM Products p
      JOIN AuctionByProduct ap ON p.id = ap.idProduct
      JOIN Auctions a ON ap.idAuction = a.id
      WHERE a.status = 'A'
          AND a.endTime = (
          SELECT MAX(endTime) FROM Auctions WHERE status = 'A')
      ORDER BY a.endTime DESC;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultLastAuction;
  
  PROCEDURE consultDateAuction(C_DATE OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_DATE FOR
      SELECT 
          a.endTime AS fecha_cierre,
          p.name AS nombre_producto,
          p.condition AS condicion
      FROM Auctions a
      JOIN AuctionByProduct ap ON a.id = ap.idAuction
      JOIN Products p ON ap.idProduct = p.id
      ORDER BY a.endTime DESC;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultDateAuction;
  
  PROCEDURE consultAverageBid(C_AVERAGE OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_AVERAGE FOR
      SELECT 
          b.owner AS id_cliente,
          ROUND(AVG(b.amount), 2) AS promedio_pujas
      FROM Bids b
      GROUP BY b.owner
      ORDER BY promedio_pujas DESC;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultAverageBid;
  
  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_BID FOR SELECT * FROM Bids;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultBid;
  
END PKG_AUCTIONS;
/

---(PACKAGE BODY)PAYMENTS
CREATE OR REPLACE PACKAGE BODY PKG_PAYMENTS IS

  -- Solo se requiere el método; paymentDate se asigna automáticamente por trigger
  PROCEDURE addPayment(method VARCHAR2) IS
  BEGIN
    INSERT INTO Payments(method)
    VALUES (method);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END addPayment;

  -- Solo se puede actualizar el método, según lo permite el trigger
  PROCEDURE updatePayment(id INT, method VARCHAR2) IS
  BEGIN
    UPDATE Payments
    SET method = method
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END updatePayment;

  -- Elimina un pago por ID
  PROCEDURE deletePayment(id INT) IS
  BEGIN
    DELETE FROM Payments
    WHERE id = id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END deletePayment;
  
  PROCEDURE consultPayment(C_PAYMENT OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_PAYMENT FOR SELECT * FROM Payments;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);
  END consultPayment;

END PKG_PAYMENTS;
/

---(PACKAGE BODY)USERS
CREATE OR REPLACE PACKAGE BODY PKG_USERS IS

  PROCEDURE addUser(p_name VARCHAR2, p_mail VARCHAR2, p_address INT) IS
  BEGIN
    INSERT INTO Users(name, mail, address) VALUES(p_name, p_mail, p_address);
    COMMIT; 
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addUser;

  PROCEDURE addRegistered (
    p_name     IN VARCHAR2,
    p_mail     IN VARCHAR2,
    p_address  IN INT,
    p_password IN VARCHAR2
  ) IS
    v_idUser INT;
  BEGIN
    SELECT SEQ_ID_USERS.NEXTVAL INTO v_idUser FROM dual;

    INSERT INTO Users(id, name, mail, address)
    VALUES (v_idUser, p_name, p_mail, p_address);

    INSERT INTO Registered(id, password)
    VALUES (v_idUser, p_password);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20010, 'Error al registrar usuario: ' || SQLERRM);
  END addRegistered;

  PROCEDURE addPhoneNumber(p_idUser INT, p_phoneNumber VARCHAR2) IS
  BEGIN
    INSERT INTO PhoneNumbers(idUser, phoneNumber) VALUES (p_idUser, p_phoneNumber);
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPhoneNumber;

  PROCEDURE updateUser(p_id INT, p_name VARCHAR2) IS
  BEGIN
    UPDATE Users SET name = p_name WHERE id = p_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateUser;

  PROCEDURE updateRegistered(p_id INT, p_password VARCHAR2) IS
  BEGIN
    UPDATE Registered SET password = p_password WHERE id = p_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateRegistered;

  PROCEDURE updatePhoneNumber(p_idUser INT, p_phoneNumber VARCHAR2) IS
  BEGIN
    UPDATE PhoneNumbers SET phoneNumber = p_phoneNumber WHERE idUser = p_idUser;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updatePhoneNumber;

  PROCEDURE deleteUser(p_id INT) IS
  BEGIN
    DELETE FROM Registered WHERE id = p_id; -- eliminar si está registrado
    DELETE FROM Users WHERE id = p_id;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteUser;

  PROCEDURE deleteRegistered(p_id INT) IS
  BEGIN
    DELETE FROM Registered WHERE id = p_id;
    DELETE FROM Users WHERE id = p_id; -- eliminar también al usuario base
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteRegistered;

  PROCEDURE deletePhoneNumber(p_idUser INT) IS
  BEGIN
    DELETE FROM PhoneNumbers WHERE idUser = p_idUser;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deletePhoneNumber;

  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_USER FOR SELECT * FROM Users;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);    
  END consultUser;

  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_REGISTERED FOR SELECT * FROM Registered;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);    
  END consultRegistered;

  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_PHONE FOR SELECT * FROM PhoneNumbers;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);    
  END consultPhoneNumber;

END PKG_USERS;
/

CREATE OR REPLACE PACKAGE BODY PKG_PENALTIES IS 
  PROCEDURE addPenalty(p_amount NUMBER, p_reason VARCHAR2, p_type CHAR, p_status CHAR, p_idBid INT, p_idAuction INT, p_idAuctionBid INT, p_owner INT) IS
  BEGIN
    INSERT INTO Penalties(amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (p_amount, p_reason, p_type, p_status, p_idBid, p_idAuction, p_idAuctionBid, p_owner);
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPenalty;
  
  PROCEDURE updatePenalty(p_id INT, p_amount NUMBER) IS
  BEGIN
    UPDATE Penalties SET amount = p_amount WHERE id = p_id;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updatePenalty;
  
  PROCEDURE consultPenalty(C_PENALTY OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PENALTY FOR SELECT * FROM Penalties;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  Raise_application_error(-20084,SQLERRM);    
  END consultPenalty;

END PKG_PENALTIES;
/