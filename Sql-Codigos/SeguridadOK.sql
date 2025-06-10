--PKG_USERS
BEGIN
  PKG_USER.addBid(u_amount => 100, u_status => 'A', u_owner => 2, u_idAuction => 3);
END;
/
BEGIN
  PKG_USER.updateBid(u_id => 1, u_amount => 150);
END;
/
BEGIN
  PKG_USER.deleteBid(u_id => 1, u_idAuction => 1);
END;
/
DECLARE
  C_BID SYS_REFCURSOR;
BEGIN
  PKG_USER.consultBid(C_BID);
END;
/
BEGIN
  PKG_USER.addAuction(
    u_initialPrice => 100,
    u_finalPrice => 1000,
    u_status => 'A',
    u_startTime => TO_TIMESTAMP('2025-05-18 02:18:12', 'YYYY-MM-DD HH24:MI:SS'),
    u_endTime => TO_TIMESTAMP('2025-05-18 02:18:12', 'YYYY-MM-DD HH24:MI:SS'),
    u_duration => 60,
    u_Payment => 1,
    u_Organizer => 2,
    u_Winner => 3,
    u_Address => 1,
    u_idDelivery => 1
  );
END;
/
BEGIN
  PKG_USER.deleteAuction(u_id => 1);
END;
/
DECLARE
  C_AUCTION SYS_REFCURSOR;
BEGIN
  PKG_USER.consultAuction(C_AUCTION);
END;
/
DECLARE
  C_DATE SYS_REFCURSOR;
BEGIN
  PKG_USER.consultDateAuction(C_DATE);
END;
/
DECLARE
  C_LAST SYS_REFCURSOR;
BEGIN
  PKG_USER.consultLastAuction(C_LAST);
END;
/
DECLARE
  C_PENALTY SYS_REFCURSOR;
BEGIN
  PKG_USER.consultPenalty(C_PENALTY);
END;
/
--PKG SALESMANAGER
BEGIN
  PKG_SALESMANAGER.addPayment(SYSDATE, 'Tarjeta');
END;
/

BEGIN
  PKG_SALESMANAGER.updatePayment(s_id => 1, s_method => 'Credito');
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPayment(c);
END;
/
 BEGIN
  PKG_SALESMANAGER.addProduct('Laptop Lenovo', 'N', 'http://ejemplo.com/laptop', 1);
END;
/

BEGIN
  PKG_SALESMANAGER.updateProduct(1, 'Laptop Lenovo Ideapad', 'http://nuevo-url.com/laptop');
END;
/

BEGIN
  PKG_SALESMANAGER.deleteProduct(1);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultProduct(c);
END;
/
BEGIN
  PKG_SALESMANAGER.addCategory('Electro', XMLTYPE('<descripcion>Dispositivos</descripcion>'));
END;
/

BEGIN
  PKG_SALESMANAGER.updateCategory(1, 'Gadgets', XMLTYPE('<descripcion>Gadgets y más</descripcion>'));
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultCategory(c);
END;
/

BEGIN
  PKG_SALESMANAGER.deleteCategory(1);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.moreExpensiveProduct(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.mostBoughtCategory(c);
END;
/

BEGIN
  PKG_SALESMANAGER.addUser('Juan Pérez', 'juan1@example.com', 11);
END;
/

BEGIN
  PKG_SALESMANAGER.addRegistered('Ana Torres', 'anatorees@example.com', 12, 'cosena123');
END;
/

BEGIN
  PKG_SALESMANAGER.addPhoneNumber(1, '3222269828');
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultUser(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultRegistered(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPhoneNumber(c);
END;
/
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultAverageBid(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPercentageOfGainByProductForOneMonth(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.penaltyEarningsPerMonth(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.avarageValueForProductPerMonth(c);
END;
/

--PKG_LOGISTICSTEAM

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_LOGISTICSTEAM.consultLackDelivery(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_LOGISTICSTEAM.consultProduct(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_LOGISTICSTEAM.availableProduct(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_LOGISTICSTEAM.consultLackDeliveryForOneMonth(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_LOGISTICSTEAM.consultRegionsWithTheHighestOrders(c);
END;
/

--PKG_SELLER

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SELLER.consultUser(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SELLER.consultRegistered(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SELLER.consultPhoneNumber(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SELLER.consultProduct(c);
END;
/

BEGIN
  PKG_SELLER.addPayment(SYSDATE, 'Tarjeta');
END;
/

--PKG_MANAGER
BEGIN
  PKG_MANAGER.addAddress(
    m_id => NULL,
    m_country => 'EEUU',
    m_city => 'Nueva York',
    m_state => 'NY'
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addUser(
    m_name => 'Juan Pérez',
    m_mail => 'juan.perez@example.com',
    m_address => 1 -- ID de dirección existente
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addRegistered(
    m_name => 'María Garcia',
    m_mail => 'maria.garcia@example.com',
    m_address => 1, -- ID de dirección existente
    m_password => 'password12'
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addPhoneNumber(
    m_idUser => 1, -- ID de usuario existente
    m_phoneNumber => '3133771652'
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addCategory(
    m_name => 'Elect',
    m_description => XMLTYPE('<description>Productos electrónicos de última generación</description>')
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addProduct(
    m_name => 'Smartphone X',
    m_condition => 'N', -- 'N' para nuevo, 'U' para usado
    m_url => 'http://example.com/smartphone-x',
    m_category => 2 -- ID de categoría existente
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addToAddress(
    m_id => NULL, -- El trigger asignará automáticamente el ID
    m_shippingCost => 1500,
    m_deliveryTime => SYSDATE + 5, -- Fecha de entrega estimada en 5 días
    m_address => 1 -- ID de dirección existente
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.addPenalty(
    m_amount => 50.00,
    m_reason => 'Puja no cumplida',
    m_type => 'B', -- 'A' para subasta, 'B' para puja
    m_status => 'P', -- 'P' para pendiente, 'C' para cobrado
    m_idBid => 3, -- ID de puja existente (si type='B')
    m_idAuction => NULL, -- NULL si type='B'
    m_idAuctionBid => 3, -- ID de subasta de la puja (si type='B')
    m_owner => 1 -- ID del usuario penalizado
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.updateUser(
    m_id => 1, -- ID de usuario existente
    m_name => 'Juan Pérez Actualizado'
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.updateRegistered_0(
    m_id => 1, -- ID de usuario registrado existente
    m_password => 'nuevapassword123'
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.updatePhoneNumber_0(
    m_idUser => 5, -- ID de usuario existente
    m_phoneNumber => '3343333333' -- Nuevo número
  );
  COMMIT;
END;
/

BEGIN
  PKG_MANAGER.deleteUser(
    m_id => 2 -- ID de usuario a eliminar
  );
  COMMIT;
END;
/


