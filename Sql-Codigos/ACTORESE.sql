CREATE OR REPLACE PACKAGE PKG_USER IS
  PROCEDURE addBid(u_amount NUMBER, u_status CHAR, u_owner INT, u_idAuction INT);
  PROCEDURE updateBid(u_id INT, u_amount NUMBER);
  PROCEDURE deleteBid(u_id INT, u_idAuction INT);
  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR);
 
  PROCEDURE addAuction(u_initialPrice NUMBER, u_finalPrice NUMBER, u_status CHAR, u_startTime TIMESTAMP, u_endTime TIMESTAMP, u_duration NUMBER, u_Payment INT, u_Organizer INT, u_Winner INT, u_Address INT, u_idDelivery INT, u_productName VARCHAR2, u_productCondition CHAR, u_url VARCHAR2, u_categoryName VARCHAR2, u_descriptionCategory XMLTYPE);
  PROCEDURE addAuctionByProduct(u_idProduct INT,u_idauction INT);
  PROCEDURE updateAuction(u_id INT, u_initialPrice NUMBER, u_startTime TIMESTAMP);
  PROCEDURE deleteAuction(u_id INT);
  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR);
  PROCEDURE consultDateAuction(C_DATE OUT SYS_REFCURSOR);
  PROCEDURE consultLastAuction(C_LAST OUT SYS_REFCURSOR);
 
  PROCEDURE consultPenalty(C_PENALTY OUT SYS_REFCURSOR);
END PKG_USER;
/

CREATE OR REPLACE PACKAGE PKG_SALESMANAGER IS
  PROCEDURE addPayment(s_paymentDate DATE, s_method VARCHAR2);
  PROCEDURE updatePayment(s_id INT, s_method VARCHAR2);
  PROCEDURE consultPayment(C_PAYMENT OUT SYS_REFCURSOR);

  PROCEDURE addProduct(s_name VARCHAR2, s_condition CHAR, s_url VARCHAR2, s_category INT);
  PROCEDURE updateProduct(s_id INT, s_name VARCHAR2, s_url VARCHAR2);
  PROCEDURE deleteProduct(s_id INT);
  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR);

  PROCEDURE addCategory(s_name VARCHAR2, s_description XMLTYPE);
  PROCEDURE updateCategory(s_id INT, s_name VARCHAR2, s_description XMLTYPE);
  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR);
  PROCEDURE deleteCategory (s_id INT);

  PROCEDURE moreExpensiveProduct(C_EXPENSIVE OUT SYS_REFCURSOR);
  PROCEDURE mostBoughtCategory(C_BOUGHT OUT SYS_REFCURSOR);

  PROCEDURE addUser(s_name VARCHAR2, s_mail VARCHAR2, s_address INT);
  PROCEDURE addRegistered(s_name VARCHAR2, s_mail VARCHAR2, s_address INT, s_password VARCHAR2);
  PROCEDURE addPhoneNumber(s_idUser INT, s_phoneNumber VARCHAR2);
  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR);
  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR);
  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR);

  PROCEDURE consultAverageBid(C_AVERAGE OUT SYS_REFCURSOR);
  PROCEDURE consultPercentageOfGainByProductForOneMonth(C_GAIN_MONTH OUT SYS_REFCURSOR);
  PROCEDURE penaltyEarningsPerMonth(C_EARNINGS_MONTH OUT SYS_REFCURSOR);
  PROCEDURE avarageValueForProductPerMonth(C_PRODUCT_MONTH OUT SYS_REFCURSOR);
END PKG_SALESMANAGER;
/

CREATE OR REPLACE PACKAGE PKG_MANAGER IS
  PROCEDURE addPenalty(m_amount NUMBER, m_reason VARCHAR2, m_type CHAR, m_status CHAR, m_idBid INT, m_idAuction INT, m_idAuctionBid INT, m_owner INT);
  PROCEDURE addAddress(m_country VARCHAR2, m_city VARCHAR2, m_state VARCHAR2);
  PROCEDURE addToAddress(m_id INT, m_shippingCost NUMBER, m_deliveryTime DATE, m_address INT);
  PROCEDURE addPickUp(m_pickUpDate DATE);
    
  PROCEDURE updatePenalty(m_id INT, m_amount NUMBER);
  PROCEDURE consultPenalty(C_PENALTY OUT SYS_REFCURSOR);

  PROCEDURE addProduct(m_name VARCHAR2, m_condition CHAR, m_url VARCHAR2, m_category INT);
  PROCEDURE updateProduct(m_id INT, m_name VARCHAR2, m_url VARCHAR2);
  PROCEDURE deleteProduct(m_id INT);
  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR);
  
  PROCEDURE addCategory(m_name VARCHAR2, m_description XMLTYPE);
  PROCEDURE updateCategory(m_id INT, m_name VARCHAR2, m_description XMLTYPE);
  PROCEDURE consultCategory(C_CATEGORY OUT SYS_REFCURSOR);
  
  PROCEDURE addUser(m_name VARCHAR2, m_mail VARCHAR2, m_address INT);
  PROCEDURE updateUser(m_id INT, m_name VARCHAR2);
  PROCEDURE deleteUser(m_id INT);
  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR);

  PROCEDURE addRegistered(m_name VARCHAR2, m_mail VARCHAR2, m_address INT, m_password VARCHAR2);
  PROCEDURE updateRegistered_0(m_id INT, m_password VARCHAR2);
  PROCEDURE deleteRegistered(m_id INT);
  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR);

  PROCEDURE addPhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2);
  PROCEDURE UpdatePhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2);
  PROCEDURE deletePhoneNumber(m_idUser INT, m_phoneNumber VARCHAR2);
  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR);

  PROCEDURE updateAuction(m_id INT, m_startTime TIMESTAMP);
  PROCEDURE deleteAuction(m_id INT);
  PROCEDURE consultAuction(C_AUCTION OUT SYS_REFCURSOR);

  PROCEDURE deleteBid(m_id INT, m_idAuction INT);
  PROCEDURE consultBid(C_BID OUT SYS_REFCURSOR);
END PKG_MANAGER;
/

CREATE OR REPLACE PACKAGE PKG_LOGISTICSTEAM IS
  PROCEDURE consultLackDelivery(C_LACK_DELIVERY OUT SYS_REFCURSOR);
  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR);
  PROCEDURE availableProduct(C_AVAILABLE_PRODUCT OUT SYS_REFCURSOR);
  PROCEDURE consultLackDeliveryForOneMonth(C_LACK_DELIVERY_MONTH OUT SYS_REFCURSOR);
  PROCEDURE consultRegionsWithTheHighestOrders(C_REGIONS_ORDERS OUT SYS_REFCURSOR);
END PKG_LOGISTICSTEAM;
/

CREATE OR REPLACE PACKAGE PKG_SELLER IS
  PROCEDURE consultUser(C_USER OUT SYS_REFCURSOR);
  PROCEDURE consultRegistered(C_REGISTERED OUT SYS_REFCURSOR);
  PROCEDURE consultPhoneNumber(C_PHONE OUT SYS_REFCURSOR);
  
  PROCEDURE consultProduct(C_PRODUCT OUT SYS_REFCURSOR);
  
  PROCEDURE addPayment(e_paymentDate DATE, e_method VARCHAR2);
END PKG_SELLER;
/