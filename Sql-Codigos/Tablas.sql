CREATE TABLE Penalties (
    id INT NOT NULL,
    amount NUMBER(9) NOT NULL,
    reason VARCHAR2(50) NOT NULL,
    type CHAR(1) NOT NULL,
    status CHAR(1) NOT NULL,
    idBid INT,
    idAuction INT,
    idAuctionBid INT,
    owner INT NOT NULL
);

CREATE TABLE Bids (
    id INT NOT NULL,
    idAuction INT NOT NULL,
    amount NUMBER(9) NOT NULL,
    status CHAR(1) NOT NULL,
    owner INT NOT NULL
);

CREATE TABLE Auctions (
    id INT NOT NULL,
    initialPrice NUMBER(9) NOT NULL,
    finalPrice NUMBER(9) NOT NULL,
    status CHAR(1) NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    Payment INT NOT NULL,
    Organizer INT NOT NULL,
    Winner INT  NOT NULL,
    Address INT,
    idDelivery INT NOT NULL,
    duration INT
);

CREATE TABLE Payments (
    id INT NOT NULL,
    paymentDate DATE NOT NULL,
    method VARCHAR2(8) NOT NULL
);

CREATE TABLE Users (
    id INT NOT NULL,
    name VARCHAR2(50) NOT NULL,
    mail VARCHAR2(50) NOT NULL,
    address INT NOT NULL
);

CREATE TABLE PhoneNumbers (
    idUser INT NOT NULL,
    phoneNumber CHAR(10) NOT NULL
);

CREATE TABLE Registered (
    id INT NOT NULL,
    registeredDate DATE NOT NULL,
    password VARCHAR2(10) NOT NULL
);

CREATE TABLE Addresses (
    id INT NOT NULL,
    country VARCHAR2(10) NOT NULL,
    city VARCHAR2(15) NOT NULL,
    state VARCHAR2(15) NOT NULL
);

CREATE TABLE TypesDelivery (
    id INT NOT NULL,
    method VARCHAR2(9) NOT NULL,
    status CHAR(1) NOT NULL
);

CREATE TABLE ToAddress (
    id INT NOT NULL,
    shippingCost NUMBER(9) NOT NULL,
    deliveryTime DATE NOT NULL,
    address INT NOT NULL
);

CREATE TABLE PickUp (
    id INT NOT NULL,
    pickUpDate DATE NOT NULL
);

CREATE TABLE Products (
    id INT NOT NULL,
    name VARCHAR2(50) NOT NULL,
    condition CHAR(1) NOT NULL,
    url VARCHAR2(100) NOT NULL,
    category INT NOT NULL
);

CREATE TABLE Categories (
    id INT NOT NULL,
    name VARCHAR2(10) NOT NULL,
    description XMLTYPE
);

CREATE TABLE AuctionByProduct (
    idProduct INT NOT NULL,
    idAuction INT NOT NULL
);



