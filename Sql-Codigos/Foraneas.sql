ALTER TABLE Penalties 
ADD CONSTRAINT fk_penalties_bid FOREIGN KEY (idBid,idAuctionBid) REFERENCES Bids(id,idAuction);

ALTER TABLE Penalties 
ADD CONSTRAINT fk_penalties_auction FOREIGN KEY (idAuction) REFERENCES Auctions(id);

ALTER TABLE Penalties
ADD CONSTRAINT fk_penalties_user FOREIGN KEY (owner) REFERENCES Users(id); 

ALTER TABLE Bids
ADD CONSTRAINT fk_bids_users FOREIGN KEY (owner) REFERENCES Users(id);

ALTER TABLE Bids
ADD CONSTRAINT fk_bids_auctions FOREIGN KEY (idAuction) REFERENCES Auctions(id);

ALTER TABLE AuctionByProduct 
ADD CONSTRAINT fk_auctionbyproduct_product FOREIGN KEY (idProduct) REFERENCES Products(id);
ALTER TABLE AuctionByProduct
ADD CONSTRAINT fk_auctionbyproduct_auction FOREIGN KEY (idAuction) REFERENCES Auctions(id);

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_payment FOREIGN KEY (Payment) REFERENCES Payments(id);

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_organizer FOREIGN KEY (Organizer) REFERENCES Users(id);

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_winner FOREIGN KEY (Winner) REFERENCES Users(id);

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_address FOREIGN KEY (Address) REFERENCES Addresses(id);

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_delivery FOREIGN KEY (idDelivery) REFERENCES TypesDelivery(id);


ALTER TABLE Users 
ADD CONSTRAINT fk_users_address FOREIGN KEY (address) REFERENCES Addresses(id);

ALTER TABLE PhoneNumbers 
ADD CONSTRAINT fk_phonenumbers_user FOREIGN KEY (idUser) REFERENCES Users(id);

ALTER TABLE Registered 
ADD CONSTRAINT fk_registered_user FOREIGN KEY (id) REFERENCES Users(id);

ALTER TABLE ToAddress 
ADD CONSTRAINT fk_toaddress_TypesDelivery FOREIGN KEY (id) REFERENCES TypesDelivery(id);
ALTER TABLE ToAddress
ADD CONSTRAINT fk_toaddress_address FOREIGN KEY (address) REFERENCES Addresses(id);

ALTER TABLE PickUp
ADD CONSTRAINT fk_pickUp_TypesDelivery FOREIGN KEY (id) REFERENCES TypesDelivery(id);

ALTER TABLE Products 
ADD CONSTRAINT fk_products_category FOREIGN KEY (category) REFERENCES Categories(id);


