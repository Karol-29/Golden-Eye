CREATE ROLE MANAGER;
CREATE ROLE LOGISTICSTEAM;
CREATE ROLE SALESMANAGER;
CREATE ROLE SELLER;
CREATE ROLE USER_ROLE;


GRANT EXECUTE ON PKG_MANAGER TO MANAGER;
GRANT EXECUTE ON PKG_LOGISTICSTEAM TO LOGISTICSTEAM;
GRANT EXECUTE ON PKG_SALESMANAGER TO SALESMANAGER;
GRANT EXECUTE ON PKG_SELLER TO SELLER;
GRANT EXECUTE ON PKG_USER TO USER_ROLE;
