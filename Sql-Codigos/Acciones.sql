ALTER TABLE Bids DROP CONSTRAINT fk_bids_auctions;
ALTER TABLE AuctionByProduct DROP CONSTRAINT fk_auctionbyproduct_auction;
ALTER TABLE AuctionByProduct DROP CONSTRAINT fk_auctionbyproduct_product;
ALTER TABLE Products DROP CONSTRAINT fk_products_category;
ALTER TABLE Penalties DROP CONSTRAINT fk_penalties_user ;
ALTER TABLE PhoneNumbers DROP CONSTRAINT fk_phonenumbers_user;
ALTER TABLE Auctions DROP CONSTRAINT fk_auctions_organizer;
ALTER TABLE Auctions DROP CONSTRAINT fk_auctions_winner;
ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_organizer FOREIGN KEY (Organizer) REFERENCES Users(id)
ON DELETE CASCADE;

ALTER TABLE Auctions 
ADD CONSTRAINT fk_auctions_winner FOREIGN KEY (Winner) REFERENCES Users(id)
ON DELETE CASCADE;

ALTER TABLE PhoneNumbers 
ADD CONSTRAINT fk_phonenumbers_user FOREIGN KEY (idUser) REFERENCES Users(id)
ON DELETE CASCADE;

ALTER TABLE Penalties
ADD CONSTRAINT fk_penalties_user FOREIGN KEY (owner) REFERENCES Users(id)
ON DELETE CASCADE;
ALTER TABLE Products 
ADD CONSTRAINT fk_products_category FOREIGN KEY (category) REFERENCES Categories(id)
ON DELETE CASCADE;

ALTER TABLE Bids
ADD CONSTRAINT fk_bids_auctions FOREIGN KEY (idAuction) REFERENCES Auctions(id)
ON DELETE CASCADE;

ALTER TABLE AuctionByProduct
ADD CONSTRAINT fk_auctionbyproduct_auction FOREIGN KEY (idAuction) REFERENCES Auctions(id)
ON DELETE CASCADE;

ALTER TABLE AuctionByProduct 
ADD CONSTRAINT fk_auctionbyproduct_product FOREIGN KEY (idProduct) REFERENCES Products(id)
ON DELETE CASCADE;