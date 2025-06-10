CREATE OR REPLACE TRIGGER TGR_DELETE_AUCTIONS_PENALTIES
BEFORE DELETE ON AUCTIONS
FOR EACH ROW
BEGIN
    DELETE FROM PENALTIES
    WHERE idAuction = :OLD.id;
END TGR_DELETE_AUCTIONS_PENALTIES;
/

CREATE SEQUENCE seq_id_auctions
START WITH 1
NOCYCLE;


CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_AUCTIONS
BEFORE INSERT ON AUCTIONS
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_auctions.NEXTVAL;

    :NEW.status := 'A';
END;
/


CREATE OR REPLACE TRIGGER TGR_BEFORE_UPDATE_AUCTIONS
BEFORE UPDATE ON AUCTIONS
FOR EACH ROW
BEGIN
    -- Validar si se está intentando modificar campos no permitidos
    IF     NVL(:NEW.finalPrice, -1)     != NVL(:OLD.finalPrice, -1)
        OR NVL(:NEW.status, 'X')         != NVL(:OLD.status, 'X')
        OR NVL(:NEW.endTime, TO_DATE('1900-01-01','YYYY-MM-DD')) != NVL(:OLD.endTime, TO_DATE('1900-01-01','YYYY-MM-DD'))
        OR NVL(:NEW.Payment, -1)         != NVL(:OLD.Payment, -1)
        OR NVL(:NEW.Organizer, -1)       != NVL(:OLD.Organizer, -1)
        OR NVL(:NEW.Winner, -1)          != NVL(:OLD.Winner, -1)
        OR NVL(:NEW.Address, -1)         != NVL(:OLD.Address, -1)
        OR NVL(:NEW.idDelivery, -1)      != NVL(:OLD.idDelivery, -1)
        OR NVL(:NEW.duration, -1)        != NVL(:OLD.duration, -1)
    THEN
        RAISE_APPLICATION_ERROR(-20003, 'Solo se pueden modificar initialPrice y startTime.');
    END IF;

    IF :NEW.startTime IS NOT NULL AND :NEW.startTime != :OLD.startTime THEN
        IF :NEW.startTime < :OLD.endTime THEN
            RAISE_APPLICATION_ERROR(-20001, 'startTime solo puede actualizarse a una fecha futura.');
        END IF;
    END IF;

    -- Validar reglas para initialPrice (si se intenta modificar)
    IF :NEW.initialPrice IS NOT NULL AND :NEW.initialPrice != :OLD.initialPrice THEN
        IF :NEW.initialPrice < :OLD.initialPrice THEN
            RAISE_APPLICATION_ERROR(-20002, 'initialPrice solo puede aumentar.');
        END IF;
    END IF;
END;
/



CREATE SEQUENCE seq_id_bid
START WITH 1
NOCYCLE;

CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_BIDS
BEFORE INSERT ON Bids
FOR EACH ROW
DECLARE
    v_organizer_id Auctions.Organizer%TYPE;
BEGIN
    -- Asignar ID si no se proporciona
    IF :NEW.id IS NULL THEN
        :NEW.id := seq_id_bid.NEXTVAL;
    END IF;

    -- Asignar estado por defecto
    IF :NEW.status IS NULL THEN
        :NEW.status := 'E';
    END IF;

    -- Verificar que la subasta existe y obtener organizador
    BEGIN
        SELECT Organizer INTO v_organizer_id
        FROM Auctions
        WHERE id = :NEW.idAuction;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20020, 'La subasta no existe.');
    END;

    -- Verificar que el pujador no sea el organizador
    IF v_organizer_id = :NEW.owner THEN
        RAISE_APPLICATION_ERROR(-20021, 'Un usuario no puede pujar en su propia subasta.');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER trg_update_bid_amount
BEFORE UPDATE ON BIDS
FOR EACH ROW
BEGIN
    -- Verifica que el nuevo amount sea mayor que el viejo
    IF :NEW.amount <= :OLD.amount THEN
        RAISE_APPLICATION_ERROR(-20004, 'El nuevo monto debe ser mayor al anterior.');
    END IF;

    -- Verifica que no se modifiquen otras columnas excepto amount
    IF (:NEW.id != :OLD.id
        OR :NEW.idAuction != :OLD.idAuction
        OR :NEW.status != :OLD.status
        OR :NEW.owner != :OLD.owner) THEN
        RAISE_APPLICATION_ERROR(-20005, 'Solo se puede modificar el monto (amount).');
    END IF;
END;
/



CREATE OR REPLACE TRIGGER TGR_DELETE_BIDS_PENALTIES
BEFORE DELETE ON BIDS
FOR EACH ROW
BEGIN
    DELETE FROM PENALTIES
    WHERE idBid = :OLD.id AND idAuctionBid = :OLD.idAuction;
END;
/

CREATE SEQUENCE seq_id_product
START WITH 1
NOCYCLE;
/


CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_PRODUCTS
BEFORE INSERT ON PRODUCTS
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_product.NEXTVAL;
END;
/


CREATE SEQUENCE seq_id_types_delivery
START WITH 1
NOCYCLE;
/

CREATE OR REPLACE TRIGGER trg_before_insert_toaddress
BEFORE INSERT ON ToAddress
FOR EACH ROW
DECLARE
    new_id NUMBER;
BEGIN
    SELECT seq_id_types_delivery.NEXTVAL INTO new_id FROM dual;

    INSERT INTO TypesDelivery(id, method, status)
    VALUES (new_id, 'TOADDRESS', 'B');

    :NEW.id := new_id;
END;
/

CREATE OR REPLACE TRIGGER trg_before_insert_pickup
BEFORE INSERT ON PickUp
FOR EACH ROW
DECLARE
    new_id NUMBER;
BEGIN
    SELECT seq_id_types_delivery.NEXTVAL INTO new_id FROM dual;

    INSERT INTO TypesDelivery(id, method, status)
    VALUES (new_id, 'PICKUP', 'B');

    :NEW.id := new_id;
END;
/



CREATE SEQUENCE seq_id_payment
START WITH 1
NOCYCLE;
/
CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_Payments
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    -- Forzar siempre el id desde la secuencia
    :NEW.id := seq_id_payment.NEXTVAL;

    IF :NEW.paymentDate IS NULL THEN
        :NEW.paymentDate := SYSDATE;
    END IF;
END;
/

 
CREATE SEQUENCE seq_id_users
START WITH 1
NOCYCLE;
/
CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_USERS
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_users.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_REGISTERED
BEFORE INSERT ON Registered
FOR EACH ROW
BEGIN
    :NEW.registeredDate := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER TRG_BEFORE_PAYMENTS_UPDATE
BEFORE UPDATE ON Payments
FOR EACH ROW
BEGIN
    -- No se permite modificar el ID
    IF :NEW.id != :OLD.id THEN
        RAISE_APPLICATION_ERROR(-20005, 'No se permite modificar el ID del pago.');
    END IF;

    -- No se permite modificar la fecha de pago
    IF :NEW.paymentDate != :OLD.paymentDate THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se permite modificar la fecha de pago.');
    END IF;

    -- Solo se permite modificar el método, no otros campos
    IF (:NEW.method IS NULL OR :NEW.method != :OLD.method) THEN
        -- Está permitido modificar 'method', no hacer nada
        NULL;
    ELSE
        -- Si se intentan modificar otros campos, error
        IF (:NEW.id != :OLD.id OR :NEW.paymentDate != :OLD.paymentDate) THEN
            RAISE_APPLICATION_ERROR(-20007, 'Solo se puede modificar el método de pago.');
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TRG_PRODUCTS_UPDATE
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF :NEW.id != :OLD.id THEN
        RAISE_APPLICATION_ERROR(-20007, 'No se permite modificar el ID del producto.');
    END IF;

    IF :NEW.condition != :OLD.condition THEN
        RAISE_APPLICATION_ERROR(-20008, 'No se permite modificar la condición del producto.');
    END IF;

    IF :NEW.category != :OLD.category THEN
        RAISE_APPLICATION_ERROR(-20009, 'No se permite modificar la categoría del producto.');
    END IF;
END;
/



CREATE OR REPLACE TRIGGER TRG_VALIDATE_PENALTIES_TYPE
BEFORE INSERT OR UPDATE ON Penalties
FOR EACH ROW
BEGIN
   
    IF :NEW.type = 'A' THEN
        IF :NEW.idBid IS NOT NULL OR :NEW.idAuctionBid IS NOT NULL THEN
            RAISE_APPLICATION_ERROR(-20010, 'Si la penalización es por subasta (type = ''A''), idBid e idAuctionBid deben ser NULL.');
        END IF;
    END IF;
    IF :NEW.type = 'B' THEN
        IF :NEW.idAuction IS NOT NULL THEN
            RAISE_APPLICATION_ERROR(-20011, 'Si la penalización es por puja (type = ''B''), idAuction debe ser NULL.');
        END IF;
    END IF;
END;
/


CREATE SEQUENCE seq_id_penalties
START WITH 1
NOCYCLE;
/

CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_PENALTIES
BEFORE INSERT ON Penalties
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_penalties.NEXTVAL;
END;
/

CREATE SEQUENCE seq_id_address
START WITH 1
NOCYCLE;
/

CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_ADDRESS
BEFORE INSERT ON Addresses
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_address.NEXTVAL;
    
END;
/
CREATE SEQUENCE seq_id_categories
START WITH 1
NOCYCLE;
/
CREATE OR REPLACE TRIGGER TRG_CALCULATE_AUCTION_DURATION
BEFORE INSERT OR UPDATE ON Auctions
FOR EACH ROW
BEGIN
    IF :NEW.startTime IS NOT NULL AND :NEW.endTime IS NOT NULL THEN
        :NEW.duration := 
            EXTRACT(DAY FROM (:NEW.endTime - :NEW.startTime)) +
            EXTRACT(HOUR FROM (:NEW.endTime - :NEW.startTime)) / 24 +
            EXTRACT(MINUTE FROM (:NEW.endTime - :NEW.startTime)) / 1440 +
            EXTRACT(SECOND FROM (:NEW.endTime - :NEW.startTime)) / 86400;
    ELSE
        :NEW.duration := NULL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT_CATEGORIES
BEFORE INSERT ON Categories
FOR EACH ROW
BEGIN
    :NEW.id := seq_id_categories.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER trg_check_auction_status
BEFORE INSERT OR UPDATE ON Auctions
FOR EACH ROW
BEGIN
  IF :NEW.status = 'A' AND :NEW.endTime <= SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede establecer el estado en ACTIVE si la subasta ya terminó.');
  ELSIF :NEW.status = 'C' AND :NEW.endTime > SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se puede establecer el estado en FINISHED si la subasta aún no ha terminado.');
  END IF;
END;
/
