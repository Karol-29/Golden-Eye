ALTER TABLE Penalties 
ADD CONSTRAINT chk_status_Penalty 
CHECK (status IN ('P','A'));

ALTER TABLE Penalties 
ADD CONSTRAINT chk_type_Penalty 
CHECK (type IN ('B','A'));

ALTER TABLE Users 
ADD CONSTRAINT chk_users_type_mail 
CHECK (REGEXP_LIKE(mail, '^[^@]+@[^@]+\.com$'));

ALTER TABLE PhoneNumbers
ADD CONSTRAINT chk_phone_starts_with_3
CHECK (REGEXP_LIKE(phoneNumber, '^3[0-9]{9}$'));

ALTER TABLE Bids 
ADD CONSTRAINT chk_bids_status 
CHECK (status IN ('A','E','D'));

ALTER TABLE Auctions 
ADD CONSTRAINT chk_auctions_status 
CHECK (status IN ('A','D', 'C'));

ALTER TABLE TypesDelivery
ADD CONSTRAINT chk_status_typeDelivery
CHECK (status IN ('B','E','C'));

ALTER TABLE TypesDelivery
ADD CONSTRAINT chk_method_typeDelivery
CHECK (method IN ('TOADDRESS','PICKUP'));

ALTER TABLE Bids
ADD CONSTRAINT chk_bids_amount 
CHECK (MOD(amount,50)=0);

ALTER TABLE Penalties
ADD CONSTRAINT chk_penalty_amount
CHECK (MOD(amount,50)=0);

ALTER TABLE Auctions
ADD CONSTRAINT chk_autions_initialPrice 
CHECK (MOD(initialPrice,50)=0);

ALTER TABLE Auctions
ADD CONSTRAINT chk_autions_finalPrice 
CHECK (MOD(finalPrice,50)=0);

ALTER TABLE ToAddress
ADD CONSTRAINT chk_ToAddress_shippingCost
CHECK (MOD(shippingCost,50)=0);







