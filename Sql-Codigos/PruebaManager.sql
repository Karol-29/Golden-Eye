--Llega un nuevo cliente a la plataforma, el cual va quiere ser un Usuario registrado
--con la siguiente iInformacion
--Nomber: Johan, correo: johane@@@utlokk.com, password:Pi31415.*, el cual vive en Country:Colombia, City:Supata, state:Cundinamarca
--Primero agrega la direccion

DECLARE
BEGIN
    -- Agregar la dirección 
    PKG_manager.addAddress(
        m_country => 'Colombia',
        m_city    => 'Supata',
        m_state   => 'Cundinamarca'
    );

END;
/
--intenta agregar el cliente con correo mal

DECLARE
    v_address_id INT;
BEGIN
    SELECT MAX(id) INTO v_address_id FROM addresses;

    PKG_manager.addRegistered(
        m_name     => 'Johan',
        m_mail     => 'johane@@@utlokk.com',
        m_address  => v_address_id,
        m_password => 'Pi31415.*'
    );

END;
/
--corrije correo
DECLARE
    v_address_id INT;
BEGIN
    SELECT MAX(id) INTO v_address_id FROM addresses;
    
    PKG_manager.addRegistered(
        m_name     => 'Johan',
        m_mail     => 'johane@utlokk.com',
        m_address  => v_address_id,
        m_password => 'Pi31415.*'
    );
END;
/
--Ahora Johan desea agregar su numero de telefeno y le pide ayuda al manager para agregar esta informacion
DECLARE
     v_user_id INT;
BEGIN
    SELECT MAX(id) INTO v_user_id FROM Users;
    PKG_MANAGER.addPhoneNumber(
    m_idUser     => v_user_id,
    m_phoneNumber     =>'3133732667'
    );
END;
/

--El manager desea ver la informacion de johan asi que usamos la vista de usuarios registrados y buscamos la informacion de johan
SELECT * FROM vw_RegisteredUserDetails WHERE NOMBRE = 'Johan';

--Johan desea Cambiar su numero de telefono por 2222222222, sin embargo nuestro manager le informa que esto no es posible 
--ya que los numeros deben inciar en 10 y tener una longitud de 10, sin embargo lo intenta para verificarlo
DECLARE
     v_user_id INT;
BEGIN
    SELECT MAX(id) INTO v_user_id FROM Users;
    PKG_MANAGER.updatePhoneNumber(
    m_idUser     => v_user_id,
    m_phoneNumber     =>'22222222'
    );
END;
/

--Johan decide ya no cambia de numero y el gerente vuelve a verificar que el numero este intacto
SELECT * FROM vw_RegisteredUserDetails WHERE NOMBRE = 'Johan';

--Johan quiere ahora agrwgar su apellido y que ahora su nombre sea johan estrada
DECLARE
     v_user_id INT;
BEGIN
    SELECT MAX(id) INTO v_user_id FROM Users;
    PKG_MANAGER.updateUser(
    m_id     => v_user_id,
    m_name   =>'Johan Estrada'
    );
END;
/

--Por ultimo verifican por ultima vez la informacion de johan
--primero que johan ya no aparezcan
SELECT * FROM vw_RegisteredUserDetails WHERE NOMBRE = 'Johan';
--ahora que este Johan Estrada
SELECT * FROM vw_RegisteredUserDetails WHERE NOMBRE = 'Johan Estrada';


--Johan decide retirarse de la plataforma asi que nuestro manager tiene que eliminarlo de la base de datos
DECLARE
     v_user_id INT;
BEGIN
    SELECT MAX(id) INTO v_user_id FROM Users;
    PKG_MANAGER.deleteRegistered(
    m_id     => v_user_id
    );
END;
/

--Verificamos que el usuarioregistrado no este
SELECT * FROM vw_RegisteredUserDetails WHERE NOMBRE = 'Johan Estrada';
--Verificamos que el numero de telefono tampoco este ya que si el usuario no existe sus numeros de telefonos asociados tampoco
SELECT * FROM PHONENUMBERS WHERE PHONENUMBER='3133732667';

--Nuestro managr desea agregar un producto por peticicion de nuestra usuaria Mariana
--Es un Televisor Nuevo en la categoria de Televisores, nuestro manager sabe que esta categoria no existe asi que decide crearla
BEGIN
    PKG_MANAGER.addCategory(
        m_name       => 'Televisor',
        m_description => XMLTYPE('<Description>Categoria de Televisores.</Description>')
    );
END;
/

DECLARE
     v_category_id INT;
BEGIN
    SELECT MAX(id) INTO v_category_id FROM Categories;
    PKG_MANAGER.addproduct(
    m_name  =>'LG 14''',
    m_condition => 'U',
    m_url  => 'https://www.samsung.com/co/lifestyle-tvs/the-frame/ls03fw-75-inch-black-qn75ls03fwkxzl/',
    m_category => v_category_id );
END;
/

--Usamos la vista de productos para verificar la creacion
SELECT *
FROM vw_ProductDetails
WHERE PRODUCTO='LG 14''';
--mariana desea cambiar el nombre y la url porque se equivoco
DECLARE
    V_IDP INT;
BEGIN
     SELECT MAX(id) INTO V_IDP FROM PRODUCTS;
    PKG_MANAGER.updateProduct(
    m_id=>V_IDP, 
    m_name =>'Samsung 15''', m_url=>'https://www.samsung.com/co/lifestyle-tvs/the-frame/ls03fw-75-inch-black-qn75ls03fwkxzl/');
END;
/

--Verificamos los cambios
SELECT *
FROM vw_ProductDetails
WHERE PRODUCTO='Samsung 15''';
--que el anterior no exista
SELECT *
FROM vw_ProductDetails
WHERE PRODUCTO='LG 14''';

--Mariana quiere que el nombre de la categoria ahora sea Electro
DECLARE
    V_IDP INT;
BEGIN
    SELECT MAX(id) INTO V_IDP FROM CATEGORIES;
    PKG_MANAGER.updateCategory(
    m_id=>V_IDP, 
    m_name =>'Electro',
    m_description => XMLTYPE('<Description>Categoria de electrodomesticos.</Description>' ));
END;
/
--Verificamos
SELECT *
FROM vw_ProductDetails
WHERE PRODUCTO='Samsung 15''';

--Se decide borrar el producto
DECLARE
    V_IDP INT;
BEGIN
    SELECT MAX(id) INTO V_IDP FROM PRODUCTS;

    PKG_MANAGER.deleteProduct(m_id => V_IDP);
END;
/
--Buscamos para verificar
SELECT *
FROM vw_ProductDetails
WHERE PRODUCTO='Samsung 15''';


--Nuestro manager ha detectado que Laura la usuaria creada anteriormente, cometio una infraccion en su subasta
--Asi que se le coloca una penalzacion
DECLARE
     v_user_id INT;
     v_auction_id INT;
BEGIN
    SELECT MAX(id) INTO v_user_id FROM Users;
    SELECT MAX(id) INTO v_auction_id FROM Auctions;
    PKG_MANAGER.addPenalty(5000,'Incumplimiento','A','A',null,v_auction_id,null,v_user_id);
END;
/

--Verificamos la penalizacion
SELECT *
FROM USERS
JOIN PENALTIES ON USERS.ID=PENALTIES.OWNER
WHERE USERS.NAME='Laura';

--Laura siguio con su incumplimiento por lo que su penalizacion aumento
DECLARE
     v_penalty_id INT;
BEGIN
    SELECT MAX(id) INTO v_penalty_id FROM Penalties;
    PKG_MANAGER.updatePenalty(v_penalty_id,300000);
END;
/

--Verificamos la penalizacion
SELECT *
FROM USERS
JOIN PENALTIES ON USERS.ID=PENALTIES.OWNER
WHERE USERS.NAME='Laura'

