ALTER TABLE Auctions ADD CONSTRAINT ck_initialP_finalP CHECK(initialPrice <= finalPrice);

ALTER TABLE Auctions ADD CONSTRAINT ck_startT_endT CHECK(startTime <= endTime);

