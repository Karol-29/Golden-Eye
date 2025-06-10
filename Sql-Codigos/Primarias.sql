
ALTER TABLE Penalties 
ADD CONSTRAINT pk_penalties PRIMARY KEY (id);

ALTER TABLE Bids 
ADD CONSTRAINT pk_bids PRIMARY KEY (id,idAuction);

ALTER TABLE Auctions 
ADD CONSTRAINT pk_auctions PRIMARY KEY (id);

ALTER TABLE Payments 
ADD CONSTRAINT pk_payments PRIMARY KEY (id);

ALTER TABLE Users 
ADD CONSTRAINT pk_users PRIMARY KEY (id);

ALTER TABLE PhoneNumbers 
ADD CONSTRAINT pk_phonenumbers PRIMARY KEY (idUser, phoneNumber);

ALTER TABLE Registered 
ADD CONSTRAINT pk_registered PRIMARY KEY (id);

ALTER TABLE Addresses 
ADD CONSTRAINT pk_addresses PRIMARY KEY (id);

ALTER TABLE TypesDelivery 
ADD CONSTRAINT pk_typesdelivery PRIMARY KEY (id);

ALTER TABLE ToAddress 
ADD CONSTRAINT pk_toaddress PRIMARY KEY (id);

ALTER TABLE PickUp 
ADD CONSTRAINT pk_pickup PRIMARY KEY (id);

ALTER TABLE Products 
ADD CONSTRAINT pk_products PRIMARY KEY (id);

ALTER TABLE Categories 
ADD CONSTRAINT pk_categories PRIMARY KEY (id);

ALTER TABLE AuctionByProduct 
ADD CONSTRAINT pk_auctionbyproduct PRIMARY KEY (idProduct, idAuction);
