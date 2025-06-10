--Package Products
CREATE OR REPLACE PACKAGE PKG_PRODUCTS IS
  PROCEDURE addProduct(name VARCHAR2, condition CHAR, url VARCHAR2, category INT);
  PROCEDURE addCategory(name VARCHAR2, description XMLTYPE);

  PROCEDURE updateProduct(id INT, name VARCHAR2, url VARCHAR2);
  PROCEDURE updateCategory(id INT, name VARCHAR2, description XMLTYPE); -- ← corregida

  PROCEDURE deleteProduct(id INT);
  PROCEDURE deleteCategory(id INT);

  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR);
  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR);
  PROCEDURE mostBoughtCategory(C_BOUGHT OUT SYS_REFCURSOR);
  PROCEDURE moreExpensiveProduct(C_EXPENSIVE OUT SYS_REFCURSOR);
  PROCEDURE availableProduct(C_AVAILABLE OUT SYS_REFCURSOR);
END;
/

--Package auctions
CREATE OR REPLACE PACKAGE PKG_AUCTIONS IS
  PROCEDURE addAuction(initialPrice NUMBER, finalPrice NUMBER, status CHAR, startTime TIMESTAMP, endTime TIMESTAMP, duration NUMBER, payment INT, organizer INT, winner INT, address INT, idDelivery INT);
  PROCEDURE addBid(idAuction INT, status CHAR, owner INT, amount NUMBER);
  PROCEDURE addAddress(id INT, country VARCHAR2, city VARCHAR2, state VARCHAR2);
  PROCEDURE addToAddress(id INT, shippingCost NUMBER, deliveryTime DATE, address INT);
  PROCEDURE addPickUp(pickUpDate DATE);

  PROCEDURE updateAuction(id INT, startTime TIMESTAMP);
  PROCEDURE updateBid(id INT, idAuction INT, amount NUMBER);
  PROCEDURE updateAddress(id INT, country VARCHAR2, city VARCHAR2, state VARCHAR2);
  PROCEDURE updateToAddress(id INT, address INT);
  PROCEDURE updatePickUp(id INT, pickUpDate DATE);

  PROCEDURE deleteAddress(id INT);
  PROCEDURE deleteAuction(id INT);
  PROCEDURE deleteBid(id INT, idAuction INT);
  PROCEDURE deletePickUp(id INT);
  PROCEDURE deleteToAddress(id INT);

  PROCEDURE consultAddress(C_ADDRESS OUT SYS_REFCURSOR);
  PROCEDURE consultTypeDelivery(C_TYPE OUT SYS_REFCURSOR);
  PROCEDURE consultPickUp(C_PICKUP OUT SYS_REFCURSOR);
  PROCEDURE consultToAddress(C_ADDRESS OUT SYS_REFCURSOR);
  PROCEDURE consultLackDelivery(C_LACK OUT SYS_REFCURSOR);
  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR);
  PROCEDURE consultActiveAuctions(C_ACTIVE OUT SYS_REFCURSOR);
  PROCEDURE consultLastAuction(C_LAST OUT SYS_REFCURSOR);
  PROCEDURE consultDateAuction(C_DATE OUT SYS_REFCURSOR);
  PROCEDURE consultAverageBid(C_AVERAGE OUT SYS_REFCURSOR);
  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR);
END PKG_AUCTIONS;
/

CREATE OR REPLACE PACKAGE PKG_PAYMENTS IS
  PROCEDURE addPayment(method VARCHAR2);
  PROCEDURE updatePayment(id INT, method VARCHAR2);
  PROCEDURE deletePayment(id INT);
  PROCEDURE consultPayment(C_PAYMENT OUT SYS_REFCURSOR);
END;
/

CREATE OR REPLACE PACKAGE PKG_USERS IS
  PROCEDURE addUser(p_name VARCHAR2, p_mail VARCHAR2, p_address INT);
  PROCEDURE addRegistered(p_name VARCHAR2, p_mail VARCHAR2, p_address INT, p_password VARCHAR2);
  PROCEDURE addPhoneNumber(p_idUser INT, p_phoneNumber VARCHAR2);
  
  PROCEDURE updateUser(p_id INT, p_name VARCHAR2);
  PROCEDURE updateRegistered(p_id INT, p_password VARCHAR2);
  PROCEDURE updatePhoneNumber(p_idUser INT, p_phoneNumber VARCHAR2);

  PROCEDURE deleteUser(p_id INT);
  PROCEDURE deleteRegistered(p_id INT);
  PROCEDURE deletePhoneNumber(p_idUser INT);
  
  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR);
  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR);
  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR);
END PKG_USERS;
/

CREATE OR REPLACE PACKAGE PKG_PENALTIES IS
  PROCEDURE addPenalty(p_amount NUMBER, p_reason VARCHAR2, p_type CHAR, p_status CHAR, p_idBid INT, p_idAuction INT, p_idAuctionBid INT, p_owner INT);
  
  PROCEDURE updatePenalty(p_id INT, p_amount NUMBER);
  
  PROCEDURE consultPenalty(C_PENALTY OUT SYS_REFCURSOR);
END PKG_PENALTIES;
/
  




