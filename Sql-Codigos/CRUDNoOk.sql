-- 1. Contraseña demasiado larga (supera VARCHAR2(10))
BEGIN
  PKG_USERS.addRegistered('thisislongpass'); -- 14 caracteres
END;
/
-- 2. Valor NULL en campo obligatorio
BEGIN
  PKG_USERS.addRegistered(NULL);
END;
/
-- 3. Duplicación de usuario (asumiendo que hay UNIQUE constraint)
BEGIN
  PKG_USERS.addRegistered('pass123'); -- Ya fue insertado en pruebas OK
END;
/

-- 1. Precio negativo (asumiendo constraint CHECK price > 0)
BEGIN
  PKG_PRODUCTS.addProduct('Guitarra', -500, 'Instrumento musical');
END;
/
-- 2. Nombre de producto NULL (asumiendo que es obligatorio)
BEGIN
  PKG_PRODUCTS.addProduct(NULL, 300, 'Sin nombre');
END;
/
-- 3. Descripción demasiado larga (asumiendo VARCHAR2(30))
BEGIN
  PKG_PRODUCTS.addProduct('Micrófono', 120, 'Descripción muy larga que supera el límite permitido');
END;
/

-- 1. Monto de pago negativo
BEGIN
  PKG_PAYMENTS.addPayment(101, -250, 'EFECTIVO');
END;
/
-- 2. Tipo de pago inválido (asumiendo solo 'EFECTIVO' o 'TARJETA' permitidos por trigger)
BEGIN
  PKG_PAYMENTS.addPayment(102, 300, 'CHEQUE');
END;
/
-- 3. Usuario inexistente
BEGIN
  PKG_PAYMENTS.addPayment(9999, 300, 'TARJETA'); -- usuario 9999 no existe
END;
/

-- 1. Fecha de cierre anterior a la de inicio
BEGIN
  PKG_AUCTIONS.addAuction(201, TO_DATE('2025-05-10','YYYY-MM-DD'), TO_DATE('2025-05-01','YYYY-MM-DD'));
END;
/
-- 2. Usuario nulo
BEGIN
  PKG_AUCTIONS.addAuction(NULL, TO_DATE('2025-05-10','YYYY-MM-DD'), TO_DATE('2025-05-20','YYYY-MM-DD'));
END;
/
-- 3. Producto ya asignado a otra subasta (violación de integridad por trigger XOR)
BEGIN
  PKG_AUCTIONS.addAuction(101, TO_DATE('2025-06-01','YYYY-MM-DD'), TO_DATE('2025-06-15','YYYY-MM-DD'));
END;
/

-- 1. Oferta menor a la actual (asumiendo validación por trigger)
BEGIN
  PKG_BIDS.addBid(301, 50); -- valor inferior al actual
END;
/
-- 2. Oferta sin subasta válida
BEGIN
  PKG_BIDS.addBid(9999, 500); -- subasta no existente
END;
/
-- 3. Usuario no registrado en el sistema
BEGIN
  PKG_BIDS.addBid(301, 1000, 8888); -- usuario 8888 no existe
END;
/

-- 1. Penalidad sin motivo (descripción nula)
BEGIN
  PKG_PENALTIES.addPenalty(101, NULL);
END;
/
-- 2. Penalidad duplicada para mismo usuario y subasta
BEGIN
  PKG_PENALTIES.addPenalty(101, 'Reincidencia'); -- ya se le impuso en prueba OK
END;
/
-- 3. Usuario inexistente
BEGIN
  PKG_PENALTIES.addPenalty(9999, 'Falsa oferta');
END;
/
