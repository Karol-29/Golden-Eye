--PoblarPickup
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-01-12', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-01-19', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-01-26', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-02-02', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-02-09', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-02-16', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-02-23', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-03-08', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-03-22', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-03-29', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-04-05', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-04-12', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-04-19', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-04-26', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-05-03', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-05-17', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-05-24', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-05-31', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-06-07', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-06-14', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-06-21', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-06-28', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-07-05', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-07-12', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-07-19', 'YYYY-MM-DD'));
INSERT INTO PickUp (pickUpDate) VALUES (TO_DATE('2024-07-26', 'YYYY-MM-DD'));

--PoblarToAddress
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Bogotá', 'Cundinamarca');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Medellín', 'Antioquia');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Cali', 'Valle del Cauca');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Barranquilla', 'Atlántico');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Cartagena', 'Bolívar');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Bucaramanga', 'Santander');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Pereira', 'Risaralda');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Manizales', 'Caldas');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Armenia', 'Quindío');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Cúcuta', 'Nt.Santander');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Ibagué', 'Tolima');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Neiva', 'Huila');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Villavicencio', 'Meta');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Santa Marta', 'Magdalena');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Montería', 'Córdoba');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Sincelejo', 'Sucre');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Pasto', 'Nariño');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Popayán', 'Cauca');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Tunja', 'Boyacá');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Florencia', 'Caquetá');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Quibdó', 'Chocó');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Riohacha', 'La Guajira');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Yopal', 'Casanare');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Guaviare', 'Guaviare');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Leticia', 'Amazonas');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Mocoa', 'Putumayo');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Inírida', 'Guainía');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Mitú', 'Vaupés');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Puerto Carreño', 'Vichada');
INSERT INTO Addresses (country, city, state) VALUES ('Colombia', 'Zipaquirá', 'Cundinamarca');


INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (1000, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 1);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (2000, TO_DATE('2023-06-16', 'YYYY-MM-DD'), 2);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (3000, TO_DATE('2023-06-17', 'YYYY-MM-DD'), 3);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (4000, TO_DATE('2023-06-18', 'YYYY-MM-DD'), 4);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (5000, TO_DATE('2023-06-19', 'YYYY-MM-DD'), 5);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (6000, TO_DATE('2023-06-20', 'YYYY-MM-DD'), 6);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (7000, TO_DATE('2023-06-21', 'YYYY-MM-DD'), 7);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (8000, TO_DATE('2023-06-22', 'YYYY-MM-DD'), 8);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (9000, TO_DATE('2023-06-23', 'YYYY-MM-DD'), 9);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (10000, TO_DATE('2023-06-24', 'YYYY-MM-DD'), 10);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (11000, TO_DATE('2023-06-25', 'YYYY-MM-DD'), 11);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (12000, TO_DATE('2023-06-26', 'YYYY-MM-DD'), 12);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (13000, TO_DATE('2023-06-27', 'YYYY-MM-DD'), 13);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (14000, TO_DATE('2023-06-28', 'YYYY-MM-DD'), 14);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (15000, TO_DATE('2023-06-29', 'YYYY-MM-DD'), 15);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (16000, TO_DATE('2023-06-30', 'YYYY-MM-DD'), 16);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (17000, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 17);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (18000, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 18);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (19000, TO_DATE('2023-07-03', 'YYYY-MM-DD'), 19);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (20000, TO_DATE('2023-07-04', 'YYYY-MM-DD'), 20);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (21000, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 21);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (22000, TO_DATE('2023-07-06', 'YYYY-MM-DD'), 22);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (23000, TO_DATE('2023-07-07', 'YYYY-MM-DD'), 23);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (24000, TO_DATE('2023-07-08', 'YYYY-MM-DD'), 24);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (25000, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 25);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (26000, TO_DATE('2023-07-10', 'YYYY-MM-DD'), 26);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (27000, TO_DATE('2023-07-11', 'YYYY-MM-DD'), 27);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (28000, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 28);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (29000, TO_DATE('2023-07-13', 'YYYY-MM-DD'), 29);
INSERT INTO ToAddress (shippingCost, deliveryTime, address) VALUES (30000, TO_DATE('2023-07-14', 'YYYY-MM-DD'), 30);

--Poblar users 
INSERT INTO Users (name, mail, address) VALUES ('Juan Perez', 'juanperez@gmail.com', 1);
INSERT INTO Users (name, mail, address) VALUES ('Maria Garcia', 'mariagarcia@gmail.com', 2);
INSERT INTO Users (name, mail, address) VALUES ('Carlos Lopez', 'carloslopez@gmail.com', 3);
INSERT INTO Users (name, mail, address) VALUES ('Ana Martinez', 'anamartinez@gmail.com', 4);
INSERT INTO Users (name, mail, address) VALUES ('Luis Rodriguez', 'luisrodriguez@gmail.com', 5);
INSERT INTO Users (name, mail, address) VALUES ('Sofia Hernandez', 'sofiahernandez@gmail.com', 6);
INSERT INTO Users (name, mail, address) VALUES ('Jorge Gonzalez', 'jorgegonzalez@gmail.com', 7);
INSERT INTO Users (name, mail, address) VALUES ('Laura Diaz', 'lauradiaz@gmail.com', 8);
INSERT INTO Users (name, mail, address) VALUES ('Pedro Sanchez', 'pedrosanchez@gmail.com', 9);
INSERT INTO Users (name, mail, address) VALUES ('Elena Ramirez', 'elenaramirez@gmail.com', 10);
INSERT INTO Users (name, mail, address) VALUES ('Miguel Torres', 'migueltorres@gmail.com', 11);
INSERT INTO Users (name, mail, address) VALUES ('Isabel Flores', 'isabelflores@gmail.com', 12);
INSERT INTO Users (name, mail, address) VALUES ('Fernando Vargas', 'fernandovargas@gmail.com', 13);
INSERT INTO Users (name, mail, address) VALUES ('Adriana Castro', 'adrianacastro@gmail.com', 14);
INSERT INTO Users (name, mail, address) VALUES ('Ricardo Ortega', 'ricardoortega@gmail.com', 15);
INSERT INTO Users (name, mail, address) VALUES ('Patricia Medina', 'patriciamedina@gmail.com', 16);
INSERT INTO Users (name, mail, address) VALUES ('Oscar Guzman', 'oscarguzman@gmail.com', 17);
INSERT INTO Users (name, mail, address) VALUES ('Claudia Rios', 'claudiarios@gmail.com', 18);
INSERT INTO Users (name, mail, address) VALUES ('Francisco Mora', 'franciscomora@gmail.com', 19);
INSERT INTO Users (name, mail, address) VALUES ('Gabriela Paredes', 'gabrielaparedes@gmail.com', 20);
INSERT INTO Users (name, mail, address) VALUES ('Daniel Jimenez', 'danieljimenez@gmail.com', 21);
INSERT INTO Users (name, mail, address) VALUES ('Veronica Silva', 'veronicasilva@gmail.com', 22);
INSERT INTO Users (name, mail, address) VALUES ('Raul Mendoza', 'raulmendoza@gmail.com', 23);
INSERT INTO Users (name, mail, address) VALUES ('Teresa Cordero', 'teresacordero@gmail.com', 24);
INSERT INTO Users (name, mail, address) VALUES ('Arturo Leon', 'arturoleon@gmail.com', 25);
INSERT INTO Users (name, mail, address) VALUES ('Lucia Herrera', 'luciaherrera@gmail.com', 26);
INSERT INTO Users (name, mail, address) VALUES ('Manuel Campos', 'manuelcampos@gmail.com', 27);
INSERT INTO Users (name, mail, address) VALUES ('Beatriz Vega', 'beatrizvega@gmail.com', 28);
INSERT INTO Users (name, mail, address) VALUES ('Roberto Navarro', 'robertonavarro@gmail.com', 29);
INSERT INTO Users (name, mail, address) VALUES ('Silvia Cortes', 'silviacortes@gmail.com', 30);
INSERT INTO Users (name, mail, address) VALUES ('Andrea Fuentes', 'andreafuentes@gmail.com', 1);
INSERT INTO Users (name, mail, address) VALUES ('Diego Cabrera', 'diegocabrera@gmail.com', 2);
INSERT INTO Users (name, mail, address) VALUES ('Monica Reyes', 'monicareyes@gmail.com', 3);
INSERT INTO Users (name, mail, address) VALUES ('Hector Salazar', 'hectorsalazar@gmail.com', 4);
INSERT INTO Users (name, mail, address) VALUES ('Carmen Peña', 'carmenpena@gmail.com', 5);
INSERT INTO Users (name, mail, address) VALUES ('Julio Marquez', 'juliomarquez@gmail.com', 6);
INSERT INTO Users (name, mail, address) VALUES ('Paola Lozano', 'paolalozano@gmail.com', 7);
INSERT INTO Users (name, mail, address) VALUES ('Ernesto Duarte', 'ernestoduarte@gmail.com', 8);
INSERT INTO Users (name, mail, address) VALUES ('Sandra Molina', 'sandramolina@gmail.com', 9);
INSERT INTO Users (name, mail, address) VALUES ('Alfredo Cruz', 'alfredocruz@gmail.com', 10);
INSERT INTO Users (name, mail, address) VALUES ('Rosa Aguilar', 'rosaaguilar@gmail.com', 11);
INSERT INTO Users (name, mail, address) VALUES ('Victor Nunez', 'victornunez@gmail.com', 12);
INSERT INTO Users (name, mail, address) VALUES ('Natalia Campos', 'nataliacampos@gmail.com', 13);
INSERT INTO Users (name, mail, address) VALUES ('Gustavo Ponce', 'gustavoponce@gmail.com', 14);
INSERT INTO Users (name, mail, address) VALUES ('Liliana Serrano', 'lilianaserrano@gmail.com', 15);
INSERT INTO Users (name, mail, address) VALUES ('Mauricio Bravo', 'mauriciobravo@gmail.com', 16);
INSERT INTO Users (name, mail, address) VALUES ('Karina Duarte', 'karinaduarte@gmail.com', 17);
INSERT INTO Users (name, mail, address) VALUES ('Eduardo Rojas', 'eduardorojas@gmail.com', 18);
INSERT INTO Users (name, mail, address) VALUES ('Nancy Barrera', 'nancybarrera@gmail.com', 19);
INSERT INTO Users (name, mail, address) VALUES ('Pablo Castañeda', 'pablocastaneda@gmail.com', 20);
INSERT INTO Users (name, mail, address) VALUES ('Rocio Medina', 'rociomedina@gmail.com', 21);
INSERT INTO Users (name, mail, address) VALUES ('Esteban Romero', 'estebanromero@gmail.com', 22);
INSERT INTO Users (name, mail, address) VALUES ('Angela Mejia', 'angelamejia@gmail.com', 23);
INSERT INTO Users (name, mail, address) VALUES ('Tomas Figueroa', 'tomasfigueroa@gmail.com', 24);
INSERT INTO Users (name, mail, address) VALUES ('Julia Carrillo', 'juliacarrillo@gmail.com', 25);
INSERT INTO Users (name, mail, address) VALUES ('Marcos Peña', 'marcospena@gmail.com', 26);
INSERT INTO Users (name, mail, address) VALUES ('Lorena Zamora', 'lorenazamora@gmail.com', 27);
INSERT INTO Users (name, mail, address) VALUES ('Alonso Varela', 'alonsovarela@gmail.com', 28);
INSERT INTO Users (name, mail, address) VALUES ('Melisa Rivera', 'melisarivera@gmail.com', 29);
INSERT INTO Users (name, mail, address) VALUES ('Sebastian Castro', 'sebastiancastro@gmail.com', 30);

--Poblar registrados
INSERT INTO Registered (id, password) VALUES (31, 'pass31');
INSERT INTO Registered (id, password) VALUES (32, 'pass32');
INSERT INTO Registered (id, password) VALUES (33, 'pass33');
INSERT INTO Registered (id, password) VALUES (34, 'pass34');
INSERT INTO Registered (id, password) VALUES (35, 'pass35');
INSERT INTO Registered (id, password) VALUES (36, 'pass36');
INSERT INTO Registered (id, password) VALUES (37, 'pass37');
INSERT INTO Registered (id, password) VALUES (38, 'pass38');
INSERT INTO Registered (id, password) VALUES (39, 'pass39');
INSERT INTO Registered (id, password) VALUES (40, 'pass40');
INSERT INTO Registered (id, password) VALUES (41, 'pass41');
INSERT INTO Registered (id, password) VALUES (42, 'pass42');
INSERT INTO Registered (id, password) VALUES (43, 'pass43');
INSERT INTO Registered (id, password) VALUES (44, 'pass44');
INSERT INTO Registered (id, password) VALUES (45, 'pass45');
INSERT INTO Registered (id, password) VALUES (46, 'pass46');
INSERT INTO Registered (id, password) VALUES (47, 'pass47');
INSERT INTO Registered (id, password) VALUES (48, 'pass48');
INSERT INTO Registered (id, password) VALUES (49, 'pass49');
INSERT INTO Registered (id, password) VALUES (50, 'pass50');
INSERT INTO Registered (id, password) VALUES (51, 'pass51');
INSERT INTO Registered (id, password) VALUES (52, 'pass52');
INSERT INTO Registered (id, password) VALUES (53, 'pass53');
INSERT INTO Registered (id, password) VALUES (54, 'pass54');
INSERT INTO Registered (id, password) VALUES (55, 'pass55');
INSERT INTO Registered (id, password) VALUES (56, 'pass56');
INSERT INTO Registered (id, password) VALUES (57, 'pass57');
INSERT INTO Registered (id, password) VALUES (58, 'pass58');
INSERT INTO Registered (id, password) VALUES (59, 'pass59');
INSERT INTO Registered (id, password) VALUES (60, 'pass60');

--poblar phoneNumber
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (2,3222269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (3,3225269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (8,3504141406);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (9,3122269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (10,3282226982);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (11,3209803142);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (1,3144369871);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (4,3922269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (5,3222269876);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (6,3222219826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (12,3702269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (13,3102269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (14,3702679826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (21,3222269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (31,3225269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (18,3504141406);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (19,3122269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (16,3282226982);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (18,3209803142);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (12,3144369871);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (40,3922269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (51,3222269876);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (60,3222219826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (2,3702269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (3,3102269826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (4,3702679826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (3,3104069826);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (4,3702679850);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (60,3702679850);
INSERT INTO PhoneNumbers (idUser, phoneNumber) VALUES (40,3702679850);
--poblar payment
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('EFECTIVO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('CREDITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');
INSERT INTO Payments(method) VALUES('DEBITO');

--poblar auctions

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (100, 500, TO_TIMESTAMP('2023-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 2, 1, 1);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (200, 800, TO_TIMESTAMP('2023-01-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2, 3, 2, 2);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (150, 600, TO_TIMESTAMP('2023-01-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-07 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 4, 3, 3);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (300, 1200, TO_TIMESTAMP('2023-01-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-08 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 4, 5, 4, 4);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (250, 1000, TO_TIMESTAMP('2023-01-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-09 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5, 6, 5, 5);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (400, 1500, TO_TIMESTAMP('2023-01-06 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-10 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6, 7, 6, 6);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (350, 1300, TO_TIMESTAMP('2023-01-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 7, 8, 7, 7);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (500, 2000, TO_TIMESTAMP('2023-01-08 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-12 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 8, 9, 8, 8);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (450, 1800, TO_TIMESTAMP('2023-01-09 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-13 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 9, 10, 9, 9);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (600, 2500, TO_TIMESTAMP('2023-01-10 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-14 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 10, 11, 10, 10);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (550, 2200, TO_TIMESTAMP('2023-01-11 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-15 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 11, 12, 11, 11);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (700, 3000, TO_TIMESTAMP('2023-01-12 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-16 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 12, 13, 12, 12);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (650, 2800, TO_TIMESTAMP('2023-01-13 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-17 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 13, 13, 14, 13, 13);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (800, 3500, TO_TIMESTAMP('2023-01-14 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-18 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 14, 14, 15, 14, 14);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (750, 3200, TO_TIMESTAMP('2023-01-15 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-19 20:15:00', 'YYYY-MM-DD HH24:MI:SS'), 15, 15, 16, 15, 15);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (900, 4000, TO_TIMESTAMP('2023-01-16 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-20 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 16, 16, 17, 16, 16);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (850, 3800, TO_TIMESTAMP('2023-01-17 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-21 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17, 17, 18, 17, 17);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1000, 4500, TO_TIMESTAMP('2023-01-18 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-22 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 18, 18, 19, 18, 18);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (950, 4200, TO_TIMESTAMP('2023-01-19 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-23 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 19, 19, 20, 19, 19);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1100, 5000, TO_TIMESTAMP('2023-01-20 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-24 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 20, 20, 21, 20, 20);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1050, 4800, TO_TIMESTAMP('2023-01-21 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-25 19:45:00', 'YYYY-MM-DD HH24:MI:SS'), 21, 21, 22, 21, 21);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1200, 5500, TO_TIMESTAMP('2023-01-22 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-26 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 22, 22, 23, 22, 22);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1150, 5200, TO_TIMESTAMP('2023-01-23 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-27 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23, 23, 24, 23, 23);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1300, 6000, TO_TIMESTAMP('2023-01-24 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-28 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 24, 24, 25, 24, 24);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1250, 5800, TO_TIMESTAMP('2023-01-25 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-29 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25, 25, 26, 25, 25);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1400, 6500, TO_TIMESTAMP('2023-01-26 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-30 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26, 26, 27, 26, 26);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1350, 6200, TO_TIMESTAMP('2023-01-27 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-31 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 27, 27, 28, 27, 27);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1500, 7000, TO_TIMESTAMP('2023-01-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 28, 28, 29, 28, 28);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1450, 6800, TO_TIMESTAMP('2023-01-29 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29, 29, 30, 29, 29);

INSERT INTO Auctions (initialPrice, finalPrice, startTime, endTime, Payment, Organizer, Winner, Address, idDelivery)
VALUES (1600, 7500, TO_TIMESTAMP('2023-01-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-03 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30, 30, 1, 30, 30);


--poblar categories 
INSERT INTO Categories (name, description) VALUES ('Books', XMLType('<Description>Various genres of books including fiction, non-fiction, and academic.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Movies', XMLType('<Description>DVDs, Blu-rays, and digital movies.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Toys', XMLType('<Description>Toys for children of all ages.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Games', XMLType('<Description>Board games, card games, and puzzles.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Music', XMLType('<Description>CDs, vinyl records, and music downloads.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Sports', XMLType('<Description>Sporting goods and fitness equipment.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Electroni', XMLType('<Description>Gadgets, devices, and accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Clothes', XMLType('<Description>Men’s, women’s, and children’s clothing.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Shoes', XMLType('<Description>Footwear for all ages.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Watches', XMLType('<Description>Luxury and casual watches.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Health', XMLType('<Description>Health and wellness products.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Beauty', XMLType('<Description>Cosmetics and skincare.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Garden', XMLType('<Description>Tools, plants, and outdoor items.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Office', XMLType('<Description>Office supplies and furniture.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Pets', XMLType('<Description>Pet food and accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Grocery', XMLType('<Description>Food and beverage items.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Jewelry', XMLType('<Description>Necklaces, rings, and other accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Kitchen', XMLType('<Description>Cookware and kitchen gadgets.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Tools', XMLType('<Description>Hand tools and power tools.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Travel', XMLType('<Description>Luggage and travel accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Baby', XMLType('<Description>Products for babies and toddlers.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Crafts', XMLType('<Description>DIY supplies and handmade goods.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Art', XMLType('<Description>Art supplies and decor.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Phones', XMLType('<Description>Mobile phones and accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Tablets', XMLType('<Description>Tablets and e-readers.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Cameras', XMLType('<Description>Photography and video equipment.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Furniture', XMLType('<Description>Home and office furniture.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Gaming', XMLType('<Description>Consoles and gaming accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Bikes', XMLType('<Description>Bicycles and cycling accessories.</Description>'));
INSERT INTO Categories (name, description) VALUES ('Auto', XMLType('<Description>Car accessories and parts.</Description>'));


--poblar products 
INSERT INTO Products (name, condition, url, category) VALUES ('iPhone 14', 'N', 'https://example.com/iphone14', 1);
INSERT INTO Products (name, condition, url, category) VALUES ('Samsung TV', 'U', 'https://example.com/samsungtv', 2);
INSERT INTO Products (name, condition, url, category) VALUES ('LEGO Set', 'N', 'https://example.com/legoset', 3);
INSERT INTO Products (name, condition, url, category) VALUES ('Chess Board', 'N', 'https://example.com/chess', 4);
INSERT INTO Products (name, condition, url, category) VALUES ('Vinyl Album', 'U', 'https://example.com/vinyl', 5);
INSERT INTO Products (name, condition, url, category) VALUES ('Football', 'N', 'https://example.com/football', 6);
INSERT INTO Products (name, condition, url, category) VALUES ('Smartwatch', 'N', 'https://example.com/smartwatch', 7);
INSERT INTO Products (name, condition, url, category) VALUES ('Winter Jacket', 'U', 'https://example.com/jacket', 8);
INSERT INTO Products (name, condition, url, category) VALUES ('Running Shoes', 'N', 'https://example.com/shoes', 9);
INSERT INTO Products (name, condition, url, category) VALUES ('Rolex Watch', 'U', 'https://example.com/rolex', 10);
INSERT INTO Products (name, condition, url, category) VALUES ('Vitamins Pack', 'N', 'https://example.com/vitamins', 11);
INSERT INTO Products (name, condition, url, category) VALUES ('Skincare Set', 'N', 'https://example.com/skincare', 12);
INSERT INTO Products (name, condition, url, category) VALUES ('Shovel', 'U', 'https://example.com/shovel', 13);
INSERT INTO Products (name, condition, url, category) VALUES ('Office Chair', 'N', 'https://example.com/chair', 14);
INSERT INTO Products (name, condition, url, category) VALUES ('Dog Leash', 'N', 'https://example.com/leash', 15);
INSERT INTO Products (name, condition, url, category) VALUES ('Organic Milk', 'N', 'https://example.com/milk', 16);
INSERT INTO Products (name, condition, url, category) VALUES ('Diamond Ring', 'U', 'https://example.com/ring', 17);
INSERT INTO Products (name, condition, url, category) VALUES ('Blender', 'N', 'https://example.com/blender', 18);
INSERT INTO Products (name, condition, url, category) VALUES ('Hammer', 'U', 'https://example.com/hammer', 19);
INSERT INTO Products (name, condition, url, category) VALUES ('Suitcase', 'N', 'https://example.com/suitcase', 20);
INSERT INTO Products (name, condition, url, category) VALUES ('Stroller', 'N', 'https://example.com/stroller', 21);
INSERT INTO Products (name, condition, url, category) VALUES ('Paint Set', 'N', 'https://example.com/paintset', 22);
INSERT INTO Products (name, condition, url, category) VALUES ('Art Poster', 'U', 'https://example.com/poster', 23);
INSERT INTO Products (name, condition, url, category) VALUES ('iPhone Case', 'N', 'https://example.com/case', 24);
INSERT INTO Products (name, condition, url, category) VALUES ('Kindle', 'U', 'https://example.com/kindle', 25);
INSERT INTO Products (name, condition, url, category) VALUES ('DSLR Camera', 'N', 'https://example.com/camera', 26);
INSERT INTO Products (name, condition, url, category) VALUES ('Sofa', 'U', 'https://example.com/sofa', 27);
INSERT INTO Products (name, condition, url, category) VALUES ('PS5 Console', 'N', 'https://example.com/ps5', 28);
INSERT INTO Products (name, condition, url, category) VALUES ('Mountain Bike', 'N', 'https://example.com/bike', 29);
INSERT INTO Products (name, condition, url, category) VALUES ('Car Tires', 'U', 'https://example.com/tires', 30);

--poblar auctionbyproduct
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (1, 1);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (2, 2);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (3, 3);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (4, 4);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (5, 5);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (6, 6);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (7, 7);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (8, 8);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (9, 9);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (10, 10);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (11, 11);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (12, 12);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (13, 13);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (14, 14);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (15, 15);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (16, 16);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (17, 17);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (18, 18);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (19, 19);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (20, 20);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (21, 21);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (22, 22);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (23, 23);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (24, 24);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (25, 25);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (26, 26);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (27, 27);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (28, 28);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (29, 29);
INSERT INTO AuctionByProduct (idProduct, idAuction) VALUES (30, 30);

--Poblar bids
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (1, 100, 'A', 31);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (2, 100, 'A', 32);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (3, 150, 'A', 33);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (4, 1000, 'A', 34);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (5, 1050, 'A', 35);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (6, 50, 'A', 36);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (7, 50, 'A', 37);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (8, 100, 'A', 38);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (9, 150, 'A', 39);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (10, 400, 'A', 40);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (11, 500, 'A', 41);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (12, 50, 'A', 42);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (13, 700, 'A', 43);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (14, 150, 'A', 44);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (15, 1700, 'A', 45);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (16, 1750, 'A', 46);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (17, 1800, 'A', 47);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (18, 1850, 'A', 48);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (19, 1900, 'A', 49);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (20, 1950, 'A', 50);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (21, 2000, 'A', 51);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (22, 2050, 'A', 52);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (23, 2100, 'A', 53);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (24, 2150, 'A', 54);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (25, 2200, 'A', 55);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (26, 2250, 'A', 56);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (27, 2300, 'A', 57);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (28, 2350, 'A', 58);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (29, 2400, 'A', 59);
INSERT INTO Bids (idAuction, amount, status, owner) VALUES (30, 2450, 'A', 60);

--Poblar penalties
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (50, 'Retraso en pago', 'A', 'A', NULL, 1, NULL, 5);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (600, 'Incumplimiento de reglas', 'B', 'A', 2, NULL, 2, 12);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (450, 'Retraso en envío', 'A', 'A', NULL, 3, NULL, 8);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (800, 'Conducta inapropiada', 'B', 'A', 4, NULL, 4, 25);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (550, 'Rechazo injustificado', 'A', 'A', NULL, 5, NULL, 41);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (700, 'Oferta fraudulenta', 'B', 'A', 6, NULL, 6, 3);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5200, 'No asistencia', 'A', 'A', NULL, 7, NULL, 14);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (900, 'Falsificación', 'B', 'A', 8, NULL, 8, 38);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (650, 'Retraso en pago', 'A', 'A', NULL, 9, NULL, 2);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (750, 'Incumplimiento', 'B', 'A', 10, NULL, 10, 33);

INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5800, 'Retraso leve', 'A', 'A', NULL, 11, NULL, 46);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (850, 'Oferta inválida', 'B', 'A', 12, NULL, 12, 27);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5300, 'Inasistencia', 'A', 'A', NULL, 13, NULL, 60);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (8800, 'Conducta agresiva', 'B', 'A', 14, NULL, 14, 16);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (4700, 'Demora excesiva', 'A', 'A', NULL, 15, NULL, 19);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (7700, 'Engaño', 'B', 'A', 16, NULL, 16, 4);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (6100, 'Retraso leve', 'A', 'A', NULL, 17, NULL, 29);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (9200, 'Falsificación', 'B', 'A', 18, NULL, 18, 51);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (4900, 'Inasistencia', 'A', 'A', NULL, 19, NULL, 11);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (6600, 'Mal uso', 'B', 'A', 20, NULL, 20, 30);

INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5400, 'No respuesta', 'A', 'A', NULL, 21, NULL, 36);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (7900, 'Incumplimiento', 'B', 'A', 22, NULL, 22, 6);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (600, 'No asistencia', 'A', 'A', NULL, 23, NULL, 58);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (8400, 'Violación de reglas', 'B', 'A', 24, NULL, 24, 10);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5600, 'Tardanza', 'A', 'A', NULL, 25, NULL, 22);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (7300, 'Irregularidad', 'B', 'A', 26, NULL, 26, 44);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (5900, 'Demora', 'A', 'A', NULL, 27, NULL, 17);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (8900, 'Falsificación', 'B', 'A', 28, NULL, 28, 9);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (6400, 'Error de procedimiento', 'A', 'A', NULL, 29, NULL, 31);
INSERT INTO Penalties (amount, reason, type, status, idBid, idAuction, idAuctionBid, owner) VALUES (9300, 'Negligencia', 'B', 'A', 30, NULL, 30, 55);

COMMIT;
--codigo para ver la cantidad de registros 
SET SERVEROUTPUT ON;
DECLARE
    v_count NUMBER;
BEGIN
    FOR t IN (
        SELECT table_name FROM (
            SELECT 'PENALTIES' AS table_name FROM DUAL UNION ALL
            SELECT 'BIDS' FROM DUAL UNION ALL
            SELECT 'AUCTIONS' FROM DUAL UNION ALL
            SELECT 'PAYMENTS' FROM DUAL UNION ALL
            SELECT 'USERS' FROM DUAL UNION ALL
            SELECT 'PHONENUMBERS' FROM DUAL UNION ALL
            SELECT 'REGISTERED' FROM DUAL UNION ALL
            SELECT 'ADDRESSES' FROM DUAL UNION ALL
            SELECT 'TYPESDELIVERY' FROM DUAL UNION ALL
            SELECT 'TOADDRESS' FROM DUAL UNION ALL
            SELECT 'PICKUP' FROM DUAL UNION ALL
            SELECT 'PRODUCTS' FROM DUAL UNION ALL
            SELECT 'CATEGORIES' FROM DUAL UNION ALL
            SELECT 'AUCTIONBYPRODUCT' FROM DUAL
        )
    ) LOOP
        BEGIN
            EXECUTE IMMEDIATE 
                'SELECT COUNT(*) FROM ' || t.table_name 
                INTO v_count;
            DBMS_OUTPUT.PUT_LINE(t.table_name || ': ' || v_count);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error con tabla: ' || t.table_name || ' - ' || SQLERRM);
        END;
    END LOOP;
END;
/


