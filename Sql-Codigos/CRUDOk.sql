BEGIN
  PKG_PRODUCTS.addCategory('Tecnologí', 'Productos electrónicos y digitales');
  PKG_PRODUCTS.addCategory('Hogar', 'Productos para el hogar');
  
  PKG_PRODUCTS.addProduct('Laptop Lenovo', 'N', 'http://imagen-laptop.com', 1);
  PKG_PRODUCTS.addProduct('Cafetera Oster', 'U', 'http://imagen-cafetera.com', 2);
END;
/

BEGIN
  -- Direcciones
  PKG_AUCTIONS.addAddress(1, 'Colombia', 'Bogotá', 'Cundinamarca');
  PKG_AUCTIONS.addAddress(2, 'Colombia', 'Medellín', 'Antioquia');

  -- Penalties
  PKG_AUCTIONS.addPenalty(1, 10000, 'Incumplimiento', 'A', NULL, NULL, 1);

  -- Subastas
  PKG_AUCTIONS.addAuction(50000, 75000, 'A', SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '5' DAY, 5, 1, 1, NULL, 1, 1);
  
  -- Ofertas
  PKG_AUCTIONS.addBid(1, 'A', 1, 76000);

  -- PickUp y ToAddress
  PKG_AUCTIONS.addPickUp(SYSDATE + 7);
  PKG_AUCTIONS.addToAddress(1, 15000, SYSDATE + 3, 1);
END;
/
