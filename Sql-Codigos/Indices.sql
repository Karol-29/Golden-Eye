CREATE INDEX idx_payment_date
ON Payments(paymentDate);

CREATE INDEX idx_auctions_status
ON Auctions(status);

CREATE INDEX idx_auctions_organizer
ON Auctions(organizer);
