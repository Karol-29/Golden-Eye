CREATE OR REPLACE PACKAGE BODY PKG_USER IS

  PROCEDURE addBid(u_amount NUMBER, u_status CHAR, u_owner INT, u_idAuction INT) IS
    v_current_finalPrice Auctions.finalPrice%TYPE;
  BEGIN
    INSERT INTO Bids(amount, status, owner, idAuction)
    VALUES (u_amount, u_status, u_owner, u_idAuction);
    
    
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addBid;

  PROCEDURE updateBid(u_id INT, u_amount NUMBER) IS
  BEGIN
    UPDATE Bids SET amount = u_amount WHERE id = u_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateBid;

  PROCEDURE deleteBid(u_id INT, u_idAuction INT) IS
  BEGIN
    DELETE FROM Bids WHERE id = u_id AND idAuction = u_idAuction;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteBid;

  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_BID FOR SELECT * FROM Bids;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultBid;

  PROCEDURE addAuction(
    u_initialPrice        NUMBER,
    u_finalPrice          NUMBER,
    u_status              CHAR,
    u_startTime           TIMESTAMP,
    u_endTime             TIMESTAMP,
    u_duration            NUMBER,
    u_Payment             INT,
    u_Organizer           INT,
    u_Winner              INT,
    u_Address             INT,
    u_idDelivery          INT,
    u_productName         VARCHAR2,
    u_productCondition    CHAR,
    u_url                 VARCHAR2,
    u_categoryName        VARCHAR2,
    u_descriptionCategory XMLTYPE
  ) IS
    V_CATEGORYID  INT;
    V_PRODUCTID   INT;
    V_AUCTIONID   INT;
  BEGIN
      -- Intentar obtener IDs existentes
    BEGIN
        SELECT P.ID, C.ID
        INTO V_PRODUCTID, V_CATEGORYID
        FROM PRODUCTS P
        JOIN CATEGORIES C ON P.CATEGORY = C.ID
        WHERE P.NAME = u_productName AND C.NAME = u_categoryName;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Insertar categoría
            INSERT INTO CATEGORIES(name, description)
            VALUES (u_categoryName, u_descriptionCategory);

            SELECT MAX(ID) INTO V_CATEGORYID FROM CATEGORIES;

            -- Insertar producto
            INSERT INTO PRODUCTS(name, condition, url, category)
            VALUES (u_productName, u_productCondition, u_url, V_CATEGORYID);

            SELECT MAX(ID) INTO V_PRODUCTID FROM PRODUCTS;
    END;

    -- Insertar la subasta
    INSERT INTO Auctions(
        initialPrice, finalPrice, status, startTime, endTime, duration,
        payment, organizer, winner, address, idDelivery
    ) VALUES (
        u_initialPrice, u_finalPrice, u_status, u_startTime, u_endTime, u_duration,
        u_Payment, u_Organizer, u_Winner, u_Address, u_idDelivery
    );

    -- Obtener ID de la subasta recién insertada
    SELECT MAX(ID) INTO V_AUCTIONID FROM Auctions;

    -- Insertar relación en AuctionByProduct
    INSERT INTO AuctionByProduct(idProduct, idAuction)
    VALUES (V_PRODUCTID, V_AUCTIONID);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END addAuction;

  PROCEDURE addAuctionByProduct(u_idProduct INT,u_idauction INT) IS
  BEGIN
    INSERT INTO AuctionbyProduct(idProduct,idAuction)
    VALUES (u_idProduct ,u_idauction );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addAuctionByProduct;
  PROCEDURE updateAuction(u_id INT, u_initialPrice NUMBER, u_startTime TIMESTAMP) IS
  BEGIN
    UPDATE Auctions 
    SET initialPrice = u_initialPrice, startTime = u_startTime
    WHERE id = u_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateAuction;

  PROCEDURE deleteAuction(u_id INT) IS
  BEGIN
    DELETE FROM Auctions WHERE id = u_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteAuction;

  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_AUCTION FOR SELECT * FROM Auctions;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultAuction;

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

  PROCEDURE consultPenalty(C_PENALTY OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PENALTY FOR SELECT * FROM Penalties;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultPenalty;

END PKG_USER;
/

CREATE OR REPLACE PACKAGE BODY PKG_SALESMANAGER IS

  PROCEDURE addPayment(s_paymentDate DATE, s_method VARCHAR2) IS
  BEGIN
    INSERT INTO Payments(paymentDate, method)
    VALUES (s_paymentDate, s_method);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END addPayment;

  PROCEDURE updatePayment(s_id INT, s_method VARCHAR2) IS
  BEGIN
    UPDATE Payments
    SET method = s_method
    WHERE id = s_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END updatePayment;

  PROCEDURE consultPayment(C_PAYMENT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PAYMENT FOR SELECT * FROM Payments;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultPayment;

  PROCEDURE addProduct(s_name VARCHAR2, s_condition CHAR, s_url VARCHAR2, s_category INT) IS
  BEGIN
    INSERT INTO Products(name, condition, url, category)
    VALUES (s_name, s_condition, s_url, s_category);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addProduct;

  PROCEDURE updateProduct(s_id INT, s_name VARCHAR2, s_url VARCHAR2) IS
  BEGIN
    UPDATE Products SET name = s_name, url = s_url WHERE id = s_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateProduct;

  PROCEDURE deleteProduct(s_id INT) IS
  BEGIN
    DELETE FROM Products WHERE id = s_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteProduct;

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PRODUCT FOR SELECT * FROM Products;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultProduct;

  PROCEDURE addCategory(s_name VARCHAR2, s_description XMLTYPE) IS
  BEGIN
    INSERT INTO Categories(name, description)
    VALUES (s_name, s_description);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addCategory;

  PROCEDURE updateCategory(s_id INT, s_name VARCHAR2, s_description XMLTYPE) IS
  BEGIN
    UPDATE Categories SET name = s_name, description = s_description WHERE id = s_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateCategory;

  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_CATEGORY FOR SELECT * FROM Categories;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultCategory;

  PROCEDURE deleteCategory(s_id INT) IS
  BEGIN
    DELETE FROM Categories WHERE id = s_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteCategory;

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

  PROCEDURE mostBoughtCategory(C_BOUGHT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_BOUGHT FOR 
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
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END mostBoughtCategory;

  PROCEDURE addUser(s_name VARCHAR2, s_mail VARCHAR2, s_address INT) IS
  BEGIN
    INSERT INTO Users(name, mail, address) VALUES(s_name, s_mail, s_address);
    COMMIT; 
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addUser;

  PROCEDURE addRegistered (
    s_name     IN VARCHAR2,
    s_mail     IN VARCHAR2,
    s_address  IN INT,
    s_password IN VARCHAR2
  ) IS
    v_idUser INT;
  BEGIN
    INSERT INTO Users(name, mail, address)
    VALUES (s_name, s_mail, s_address)
    RETURNING id INTO v_idUser;

    INSERT INTO Registered(id, password)
    VALUES (v_idUser, s_password);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20010, 'Error al registrar usuario: ' || SQLERRM);
  END addRegistered;

  PROCEDURE addPhoneNumber(s_idUser INT, s_phoneNumber VARCHAR2) IS
  BEGIN
    INSERT INTO PhoneNumbers(idUser, phoneNumber) VALUES (s_idUser, s_phoneNumber);
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPhoneNumber;

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

  PROCEDURE consultPercentageOfGainByProductForOneMonth(C_GAIN_MONTH OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_GAIN_MONTH FOR
    SELECT p.id AS product_id, p.name, 
           (SUM(a.finalPrice) - SUM(a.initialPrice)) / NULLIF(SUM(a.initialPrice), 0) * 100 as profit_percentage
    FROM Products p
    JOIN AuctionByProduct ap ON p.id = ap.idProduct
    JOIN Auctions a ON ap.idAuction = a.id
    WHERE a.endTime BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE
    AND a.status = 'A'
    GROUP BY p.id, p.name;
  END consultPercentageOfGainByProductForOneMonth;

  PROCEDURE penaltyEarningsPerMonth(C_EARNINGS_MONTH OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_EARNINGS_MONTH FOR
    SELECT TO_CHAR(p.paymentDate, 'YYYY-MM') as month,
           SUM(pe.amount) as total_penalties
    FROM Penalties pe
    JOIN Payments p ON pe.idBid = p.id -- Assuming penalties are linked to payments via bids
    WHERE pe.status = 'P' -- Assuming 'P' means paid penalties
    GROUP BY TO_CHAR(p.paymentDate, 'YYYY-MM')
    ORDER BY month;
  END penaltyEarningsPerMonth;

  PROCEDURE avarageValueForProductPerMonth(C_PRODUCT_MONTH OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN C_PRODUCT_MONTH FOR
    SELECT p.id AS product_id, p.name, 
           TO_CHAR(a.endTime, 'YYYY-MM') as month,
           AVG(a.finalPrice) as average_price
    FROM Products p
    JOIN AuctionByProduct ap ON p.id = ap.idProduct
    JOIN Auctions a ON ap.idAuction = a.id
    WHERE a.status = 'A'
    GROUP BY p.id, p.name, TO_CHAR(a.endTime, 'YYYY-MM')
    ORDER BY p.id, month;
  END avarageValueForProductPerMonth;
END PKG_SALESMANAGER;
/

CREATE OR REPLACE PACKAGE BODY PKG_MANAGER IS

  PROCEDURE addPenalty(m_amount NUMBER, m_reason VARCHAR2, m_type CHAR, m_status CHAR, m_idBid INT, m_idAuction INT, m_idAuctionBid INT, m_owner INT) IS
  BEGIN
    INSERT INTO Penalties(amount, reason, type, status, idBid, idAuction, idAuctionBid, owner)
    VALUES (m_amount, m_reason, m_type, m_status, m_idBid, m_idAuction, m_idAuctionBid, m_owner);
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPenalty;

  PROCEDURE addAddress(m_country VARCHAR2, m_city VARCHAR2, m_state VARCHAR2) IS
  BEGIN
    INSERT INTO Addresses(id, country, city, state)
    VALUES (null, m_country, m_city, m_state);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addAddress;
  
  PROCEDURE addToAddress(m_id INT, m_shippingCost NUMBER, m_deliveryTime DATE, m_address INT) IS
  BEGIN
    INSERT INTO ToAddress(id, shippingCost, deliveryTime, address)
    VALUES (m_id, m_shippingCost, m_deliveryTime, m_address);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addToAddress;
  
  PROCEDURE addPickUp(m_pickUpDate DATE) IS
  BEGIN
    INSERT INTO PickUp(pickUpDate)
    VALUES (m_pickUpDate);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPickUp;
  
  PROCEDURE updatePenalty(m_id INT, m_amount NUMBER) IS
  BEGIN
    UPDATE Penalties SET amount = m_amount WHERE id = m_id;
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

  PROCEDURE addProduct(m_name VARCHAR2, m_condition CHAR, m_url VARCHAR2, m_category INT) IS
  BEGIN
    INSERT INTO Products(name, condition, url, category)
    VALUES (m_name, m_condition, m_url, m_category);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addProduct;

  PROCEDURE updateProduct(m_id INT, m_name VARCHAR2, m_url VARCHAR2) IS
  BEGIN
    UPDATE Products SET name = m_name, url = m_url WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateProduct;

  PROCEDURE deleteProduct(m_id INT) IS
  BEGIN
    DELETE FROM Products WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteProduct;

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PRODUCT FOR SELECT * FROM Products;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultProduct;

  PROCEDURE addCategory(m_name VARCHAR2, m_description XMLTYPE) IS
  BEGIN
    INSERT INTO Categories(name, description)
    VALUES (m_name, m_description);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addCategory;

  PROCEDURE updateCategory(m_id INT, m_name VARCHAR2, m_description XMLTYPE) IS
  BEGIN
    UPDATE Categories SET name = m_name, description = m_description WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateCategory;

  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_CATEGORY FOR SELECT * FROM Categories;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultCategory;

  PROCEDURE addUser(m_name VARCHAR2, m_mail VARCHAR2, m_address INT) IS
  BEGIN
    INSERT INTO Users(name, mail, address) VALUES(m_name, m_mail, m_address);
    COMMIT; 
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addUser;

  PROCEDURE updateUser(m_id INT, m_name VARCHAR2) IS
  BEGIN
    UPDATE Users SET name = m_name WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateUser;

  PROCEDURE deleteUser(m_id INT) IS
  BEGIN
    DELETE FROM Registered WHERE id = m_id;
    DELETE FROM Users WHERE id = m_id;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteUser;
  
  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN C_USER FOR SELECT * FROM Users;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20084,SQLERRM);    
  END consultUser;

  PROCEDURE addRegistered (
    m_name     IN VARCHAR2,
    m_mail     IN VARCHAR2,
    m_address  IN INT,
    m_password IN VARCHAR2
  ) IS
    v_idUser INT;
  BEGIN
    -- Primero insertamos en Users
    INSERT INTO Users(name, mail, address)
    VALUES (m_name, m_mail, m_address)
    RETURNING id INTO v_idUser;

    -- Luego insertamos en Registered con el mismo ID
    INSERT INTO Registered(id, password)
    VALUES (v_idUser, m_password);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20010, 'Error al registrar usuario: ' || SQLERRM);
  END addRegistered;
  
  PROCEDURE updateRegistered_0(m_id INT, m_password VARCHAR2) IS
  BEGIN
    UPDATE Registered SET password = m_password WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateRegistered_0;

  PROCEDURE deleteRegistered(m_id INT) IS
  BEGIN
    DELETE FROM Registered WHERE id = m_id;
    DELETE FROM Users WHERE id = m_id;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteRegistered;

  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_REGISTERED FOR SELECT * FROM Registered;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultRegistered;

  PROCEDURE addPhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2) IS
  BEGIN
    INSERT INTO PhoneNumbers(idUser, phoneNumber) VALUES (m_idUser, m_phoneNumber);
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END addPhoneNumber;

  PROCEDURE updatePhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2) IS
  BEGIN
    UPDATE PhoneNumbers SET phoneNumber = m_phoneNumber WHERE idUser = m_idUser;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updatePhoneNumber;

  PROCEDURE deletePhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2) IS
  BEGIN
    DELETE FROM PhoneNumbers WHERE idUser = m_idUser AND phoneNumber = m_phoneNumber;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deletePhoneNumber;

  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PHONE FOR SELECT * FROM PhoneNumbers;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultPhoneNumber;

  PROCEDURE updateAuction(m_id INT, m_startTime TIMESTAMP) IS
  BEGIN
    UPDATE Auctions SET startTime = m_startTime WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END updateAuction;

  PROCEDURE deleteAuction(m_id INT) IS
  BEGIN
    DELETE FROM Auctions WHERE id = m_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteAuction;

  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_AUCTION FOR SELECT * FROM Auctions;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultAuction;

  PROCEDURE deleteBid(m_id INT, m_idAuction INT) IS
  BEGIN
    DELETE FROM Bids WHERE id = m_id AND idAuction = m_idAuction;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20050, SQLERRM);
  END deleteBid;

  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_BID FOR SELECT * FROM Bids;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultBid;

END PKG_MANAGER;
/

CREATE OR REPLACE PACKAGE BODY PKG_LOGISTICSTEAM IS

  PROCEDURE consultLackDelivery(C_LACK_DELIVERY OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_LACK_DELIVERY FOR
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

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PRODUCT FOR SELECT * FROM Products;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultProduct;

  PROCEDURE availableProduct(C_AVAILABLE_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_AVAILABLE_PRODUCT FOR
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

  PROCEDURE consultLackDeliveryForOneMonth(C_LACK_DELIVERY_MONTH OUT SYS_REFCURSOR) IS
  BEGIN
    /* Consulta no implementada en el CRUDI - Ejemplo de implementación:
    OPEN C_LACK_DELIVERY_MONTH FOR
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
        AND pay.paymentDate BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE
      ORDER BY pay.paymentDate;
    */
    NULL;
  END consultLackDeliveryForOneMonth;

  PROCEDURE consultRegionsWithTheHighestOrders(C_REGIONS_ORDERS OUT SYS_REFCURSOR) IS
  BEGIN
    /* Consulta no implementada en el CRUDI - Ejemplo de implementación:
    OPEN C_REGIONS_ORDERS FOR
      SELECT 
          a.country AS region,
          COUNT(*) AS total_orders
      FROM Addresses a
      JOIN Auctions au ON a.id = au.address
      WHERE au.winner IS NOT NULL
      GROUP BY a.country
      ORDER BY total_orders DESC;
    */
    NULL;
  END consultRegionsWithTheHighestOrders;

END PKG_LOGISTICSTEAM;
/

CREATE OR REPLACE PACKAGE BODY PKG_SELLER IS

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

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN C_PRODUCT FOR SELECT * FROM Products;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      Raise_application_error(-20084,SQLERRM);
  END consultProduct;

  PROCEDURE addPayment(e_paymentDate DATE, e_method VARCHAR2) IS
  BEGIN
    INSERT INTO Payments(paymentDate, method)
    VALUES (e_paymentDate, e_method);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20050, SQLERRM);
  END addPayment;

END PKG_SELLER;
/