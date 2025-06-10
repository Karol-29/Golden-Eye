
-- ======================================
-- HISTORIA 1: Usuario Registrado 
-- ======================================

-- Prueba de consulta de subastas
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultAuction(c);
END;
/

-- Prueba de consulta de la última subasta
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultLastAuction(c);
END;
/

-- Prueba de consulta de fechas de subasta
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultDateAuction(c);
END;
/

-- Prueba de agregar una puja
BEGIN
  PKG_USER.addBid(
    u_amount     => 250,
    u_status     => 'A',
    u_owner      => 1,
    u_idAuction  => 15
  );
END;
/
--Consultar pujas mirar la 37
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultBid(c);
END;
/

-- Prueba de actualización de una puja
BEGIN
  PKG_USER.updateBid(
    u_id     => 37,
    u_amount => 300000
  );
END;
/
--volver a mirar la 37
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultBid(c);
END;
/
-- Prueba de eliminación de una puja
BEGIN
  PKG_USER.deleteBid(
    u_id        => 37,
    u_idAuction => 16
  );
END;
/

-- Prueba de consulta de pujas
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultBid(c);
END;
/

-- Prueba de agregar una nueva subasta
BEGIN
  PKG_USER.addAuction(
    u_initialPrice => 100,
    u_finalPrice   => 5000,
    u_status       => 'A',
    u_startTime    => SYSTIMESTAMP,
    u_endTime      => SYSTIMESTAMP + INTERVAL '3' DAY,
    u_duration     => 3,
    u_Payment      => 5,
    u_Organizer    => 11,
    u_Winner       => 11,
    u_Address      => 22,
    u_idDelivery   => 2
  );
END;
/
--mirar la 27
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultAuction(c);
END;
/
BEGIN
  PKG_USER.deleteAuction(
    u_id => 23
  );
END;
/

--mrar la 23
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultAuction(c);
END;
/

DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_USER.consultPenalty(c);
END;
/


-- ======================================
-- HISTORIA 2: Gerente de ventares - Mariana
-- ======================================


-- Prueba: Agregar un nuevo pago
BEGIN
  PKG_SALESMANAGER.addPayment(SYSDATE, 'Tarjeta');
END;
/

-- Prueba: Actualizar método de pago
BEGIN
  PKG_SALESMANAGER.updatePayment(1, 'Credito');
END;
/

-- Prueba: Consultar pagos
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPayment(c);
END;
/

-- Prueba: Agregar producto
BEGIN
  PKG_SALESMANAGER.addProduct('Bicicleta', 'N', 'http://imagen.bike', 2);
END;
/

-- Prueba: Actualizar producto
BEGIN
  PKG_SALESMANAGER.updateProduct(1, 'Bicicleta Montaña', 'http://imagen.bike/montana');
END;
/

-- Prueba: Eliminar producto
BEGIN
  PKG_SALESMANAGER.deleteProduct(1);
END;
/

-- Prueba: Consultar productos
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultProduct(c);
END;
/

-- Prueba: Agregar categoría
BEGIN
  PKG_SALESMANAGER.addCategory('Deportes', XMLTYPE('<desc>Artículos deportivos</desc>'));
END;
/

-- Prueba: Actualizar categoría
BEGIN
  PKG_SALESMANAGER.updateCategory(1, 'Outdoor', XMLTYPE('<desc>Artículos al aire libre</desc>'));
END;
/

-- Prueba: Consultar categorías
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultCategory(c);
END;
/

-- Prueba: Eliminar categoría
BEGIN
  PKG_SALESMANAGER.deleteCategory(1);
END;
/

-- Prueba: Producto más caro
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.moreExpensiveProduct(c);
END;
/

-- Prueba: Categoría más comprada
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.mostBoughtCategory(c);
END;
/

-- Prueba: Agregar usuario
BEGIN
  PKG_SALESMANAGER.addUser('Carlos Ruiz', 'cruiz@correo.com', 10);
END;
/

-- Prueba: Agregar registrado
BEGIN
  PKG_SALESMANAGER.addRegistered('Ana Gómez', 'ana@correo.com', 12, 'segura123');
END;
/

-- Prueba: Agregar número telefónico
BEGIN
  PKG_SALESMANAGER.addPhoneNumber(5, '555-1234');
END;
/

-- Prueba: Consultar usuarios
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultUser(c);
END;
/

-- Prueba: Consultar registrados
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultRegistered(c);
END;
/

-- Prueba: Consultar teléfonos
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPhoneNumber(c);
END;
/

-- Prueba: Promedio de pujas
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultAverageBid(c);
END;
/

-- Prueba: Porcentaje de ganancia por producto mensual
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.consultPercentageOfGainByProductForOneMonth(c);
END;
/

-- Prueba: Ganancias por penalización mensual
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.penaltyEarningsPerMonth(c);
END;
/

-- Prueba: Valor promedio de productos por mes
DECLARE
  c SYS_REFCURSOR;
BEGIN
  PKG_SALESMANAGER.avarageValueForProductPerMonth(c);
END;
/
