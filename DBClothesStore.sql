drop database if exists DBClothesStore;
create database DBClothesStore;
use DBClothesStore;

CREATE TABLE `TypeUser`
(
    `idTypeUser`       int PRIMARY KEY AUTO_INCREMENT,
    `typeUserName`     varchar(150),
    `createPermission` boolean NOT NULL,
    `deletePermission` boolean NOT NULL,
    `readPermission`   boolean NOT NULL,
    `updatePermission` boolean NOT NULL
);

CREATE TABLE `User`
(
    `idUser`       int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `userName`     varchar(150),
    `userEmail`    varchar(150),
    `userPassword` varchar(100),
    `_idTypeUser`  int             NOT NULL
);

CREATE TABLE `Inventory`
(
    `idInventory`      int PRIMARY KEY AUTO_INCREMENT,
    `nameInventory`    varchar(150),
    `_idEstablishment` int NOT NULL
);

CREATE TABLE `InventoryDetails`
(
    `idInventoryDetails` int PRIMARY KEY AUTO_INCREMENT,
    `_idProduct`         int NOT NULL,
    `_idInventory`       int NOT NULL,
    `stock`              int NOT NULL
);

CREATE TABLE `Products`
(
    `idProducts`         int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `productName`        varchar(100),
    `productDescription` varchar(250),
    `productPrice`       double          NOT NULL,
    `_idProductType`     int             NOT NULL
);

CREATE TABLE `ProductType`
(
    `idProductType`   int PRIMARY KEY AUTO_INCREMENT,
    `productTypeName` varchar(150)
);

CREATE TABLE `OrderRequest`
(
    `idOrderRequest`        int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `orderRequestDate`      time            NOT NULL,
    `_idStatusOrderRequest` int             NOT NULL,
    `_idUser`               int             NOT NULL,
    `_idPaymentType`        int             NOT NULL
);

CREATE TABLE `StatusOrderRequest`
(
    `idStatusOrderRequest`   int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `statusOrderRequestName` varchar(150)
);

CREATE TABLE `OrderRequestDetails`
(
    `idRequestDetails`              int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `orderRequestDetailsQuantity`   int             NOT NULL,
    `orderRequestDetailsTotalPrice` double          NOT NULL,
    `_idProduct`                    int             NOT NULL,
    `_idOrderRequest`               int             NOT NULL
);

CREATE TABLE `Country`
(
    `idCountry`   int PRIMARY KEY AUTO_INCREMENT,
    `countryName` varchar(150)
);

CREATE TABLE `City`
(
    `idCity`          int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `cityName`        varchar(150),
    `cityCoordinateX` decimal,
    `cityCoordinateY` decimal,
    `_idCountry`      int             NOT NULL
);

CREATE TABLE `Establishment`
(
    `idEstablishment`          int PRIMARY KEY AUTO_INCREMENT,
    `establishmentName`        varchar(150),
    `establishmentCoordinateX` decimal,
    `establishmentCoordinateY` decimal,
    `_idCity`                  int NOT NULL
);

CREATE TABLE `UserRegisteredPaymentTypes`
(
    `idUserRegisteredPaymentTypes` int PRIMARY KEY AUTO_INCREMENT,
    `_idUser`                      int NOT NULL,
    `_idPaymentType`               int NOT NULL
);

CREATE TABLE `Card`
(
    `idCard`             int PRIMARY KEY AUTO_INCREMENT,
    `cardExpirationDate` date       NOT NULL,
    `CVC`                varchar(3) NOT NULL,
    `cardOwner`          varchar(30),
    `_idCardType`        int        NOT NULL
);

CREATE TABLE `UserRegisteredCards`
(
    `idUserRegisteredCards` int PRIMARY KEY AUTO_INCREMENT,
    `_idCard`               int NOT NULL,
    `_idUser`               int NOT NULL
);

CREATE TABLE `CardType`
(
    `idCardType`   int PRIMARY KEY AUTO_INCREMENT,
    `cardTypeName` varchar(150)
);

CREATE TABLE `PaymentType`
(
    `idPaymentType`         int PRIMARY KEY AUTO_INCREMENT,
    `paymentTypeNameMethod` varchar(150)
);

CREATE TABLE `StatusTransaction`
(
    `idStatusTransaction`   int PRIMARY KEY AUTO_INCREMENT,
    `statusTransactionName` varchar(100)
);

CREATE TABLE `CardTransaction`
(
    `idCardTransaction`     int PRIMARY KEY AUTO_INCREMENT,
    `cardTransactionDate`   date   NOT NULL,
    `cardTransactionTime`   time   NOT NULL,
    `cardTransactionAmount` double NOT NULL,
    `_idOrderRequest`       int    NOT NULL,
    `_idStatusTransaction`  int    NOT NULL,
    `_idCard`               int    NOT NULL
);

CREATE TABLE `MonetaryTransaction`
(
    `idTransaction`             int PRIMARY KEY AUTO_INCREMENT,
    `monetaryTransactionDate`   date   NOT NULL,
    `monetaryTransactionTime`   time   NOT NULL,
    `monetaryTransactionAmount` double NOT NULL,
    `_idOrderRequest`           int    NOT NULL,
    `_idStatusTransaction`      int    NOT NULL
);

ALTER TABLE `OrderRequest`
    ADD FOREIGN KEY (`_idUser`) REFERENCES `User` (`idUser`);

ALTER TABLE `OrderRequest`
    ADD FOREIGN KEY (`_idStatusOrderRequest`) REFERENCES `StatusOrderRequest` (`idStatusOrderRequest`);

ALTER TABLE `Products`
    ADD FOREIGN KEY (`_idProductType`) REFERENCES `ProductType` (`idProductType`);

ALTER TABLE `InventoryDetails`
    ADD FOREIGN KEY (`_idProduct`) REFERENCES `Products` (`idProducts`);

ALTER TABLE `InventoryDetails`
    ADD FOREIGN KEY (`_idInventory`) REFERENCES `Inventory` (`idInventory`);

ALTER TABLE `OrderRequestDetails`
    ADD FOREIGN KEY (`_idProduct`) REFERENCES `Products` (`idProducts`);

ALTER TABLE `OrderRequestDetails`
    ADD FOREIGN KEY (`_idOrderRequest`) REFERENCES `OrderRequest` (`idOrderRequest`);

ALTER TABLE `City`
    ADD FOREIGN KEY (`_idCountry`) REFERENCES `Country` (`idCountry`);

ALTER TABLE `Establishment`
    ADD FOREIGN KEY (`_idCity`) REFERENCES `City` (`idCity`);

ALTER TABLE `UserRegisteredPaymentTypes`
    ADD FOREIGN KEY (`_idPaymentType`) REFERENCES `PaymentType` (`idPaymentType`);

ALTER TABLE `UserRegisteredPaymentTypes`
    ADD FOREIGN KEY (`_idUser`) REFERENCES `User` (`idUser`);

ALTER TABLE `User`
    ADD FOREIGN KEY (`_idTypeUser`) REFERENCES `TypeUser` (`idTypeUser`);

ALTER TABLE `Inventory`
    ADD FOREIGN KEY (`_idEstablishment`) REFERENCES `Establishment` (`idEstablishment`);

ALTER TABLE `UserRegisteredCards`
    ADD FOREIGN KEY (`_idCard`) REFERENCES `Card` (`idCard`);

ALTER TABLE `UserRegisteredCards`
    ADD FOREIGN KEY (`_idUser`) REFERENCES `User` (`idUser`);

ALTER TABLE `Card`
    ADD FOREIGN KEY (`_idCardType`) REFERENCES `CardType` (`idCardType`);

ALTER TABLE `CardTransaction`
    ADD FOREIGN KEY (`_idOrderRequest`) REFERENCES `OrderRequest` (`idOrderRequest`);

ALTER TABLE `CardTransaction`
    ADD FOREIGN KEY (`_idStatusTransaction`) REFERENCES `StatusTransaction` (`idStatusTransaction`);

ALTER TABLE `CardTransaction`
    ADD FOREIGN KEY (`_idCard`) REFERENCES `Card` (`idCard`);

ALTER TABLE `MonetaryTransaction`
    ADD FOREIGN KEY (`_idOrderRequest`) REFERENCES `OrderRequest` (`idOrderRequest`);

ALTER TABLE `MonetaryTransaction`
    ADD FOREIGN KEY (`_idStatusTransaction`) REFERENCES `StatusTransaction` (`idStatusTransaction`);


delimiter $$
create procedure sp_insert_TypeUser(in sp_typeUserName varchar(150)
, in sp_createPermission boolean, in sp_deletePermission boolean, in sp_readPermission boolean
, in sp_updatePermission boolean)
begin
    insert into TypeUser(typeUserName, createPermission, deletePermission, readPermission, updatePermission)
    values (sp_typeUserName, sp_createPermission, sp_deletePermission, sp_readPermission, sp_updatePermission);
end$$
delimiter ;


delimiter $$
create procedure sp_update_TypeUser(in sp_idTypeUser int, in sp_typeUserName varchar(150)
, in sp_createPermission boolean, in sp_deletePermission boolean, in sp_readPermission boolean
, in sp_updatePermission boolean)
begin
    update TypeUser
    set idTypeUser       = sp_idTypeUser,
        typeUserName     = sp_typeUserName,
        createPermission = sp_createPermission,
        deletePermission = sp_deletePermission,
        readPermission   = sp_readPermission,
        updatePermission = sp_updatePermission
    where idTypeUser = sp_idTypeUser;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_TypeUser(in sp_idTypeUser int)
begin
    delete
    from TypeUser
    where idTypeUser = sp_idTypeUser;
end$$
delimiter ;


delimiter $$
create procedure sp_select_TypeUser(in sp_idTypeUser int)
begin
    select T.idTypeUser, T.typeUserName, T.createPermission, T.deletePermission, T.readPermission, T.updatePermission
    from TypeUser T
    where idTypeUser = sp_idTypeUser;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_TypeUser()
begin
    select T.idTypeUser, T.typeUserName, T.createPermission, T.deletePermission, T.readPermission, T.updatePermission
    from TypeUser T;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_User(in sp_userName varchar(150)
, in sp_userEmail varchar(150)
, in sp_userPassword varchar(100)
, in sp__idTypeUser int)
begin
    insert into User(userName, userEmail, userPassword, _idTypeUser)
    values (sp_userName, sp_userEmail, sp_userPassword, sp__idTypeUser);
end$$
delimiter ;


delimiter $$
create procedure sp_update_User(in sp_idUser int, in sp_userName varchar(150)
, in sp_userEmail varchar(150)
, in sp_userPassword varchar(100)
, in sp__idTypeUser int)
begin
    update User
    set idUser       = sp_idUser,
        userName     = sp_userName,
        userEmail    = sp_userEmail,
        userPassword = sp_userPassword,
        _idTypeUser  = sp__idTypeUser
    where idUser = sp_idUser;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_User(in sp_idUser int)
begin
    delete
    from User
    where idUser = sp_idUser;
end$$
delimiter ;


delimiter $$
create procedure sp_select_User(in sp_idUser int)
begin
    select U.idUser, U.userName, U.userEmail, U.userPassword, U._idTypeUser
    from User U
    where idUser = sp_idUser;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_User()
begin
    select U.idUser, U.userName, U.userEmail, U.userPassword, U._idTypeUser from User U;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_Inventory(in sp_nameInventory varchar(150)
, in sp__idEstablishment int)
begin
    insert into Inventory(nameInventory, _idEstablishment)
    values (sp_nameInventory, sp__idEstablishment);
end$$
delimiter ;


delimiter $$
create procedure sp_update_Inventory(in sp_idInventory int, in sp_nameInventory varchar(150)
, in sp__idEstablishment int)
begin
    update Inventory
    set idInventory      = sp_idInventory,
        nameInventory    = sp_nameInventory,
        _idEstablishment = sp__idEstablishment
    where idInventory = sp_idInventory;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_Inventory(in sp_idInventory int)
begin
    delete
    from Inventory
    where idInventory = sp_idInventory;
end$$
delimiter ;


delimiter $$
create procedure sp_select_Inventory(in sp_idInventory int)
begin
    select I.idInventory, I.nameInventory, I._idEstablishment
    from Inventory I
    where idInventory = sp_idInventory;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_Inventory()
begin
    select I.idInventory, I.nameInventory, I._idEstablishment from Inventory I;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_InventoryDetails(in sp__idProduct int, in sp__idInventory int, in sp_stock int)
begin
    insert into InventoryDetails(_idProduct, _idInventory, stock)
    values (sp__idProduct, sp__idInventory, sp_stock);
end$$
delimiter ;


delimiter $$
create procedure sp_update_InventoryDetails(in sp_idInventoryDetails int, in sp__idProduct int, in sp__idInventory int,
                                            in sp_stock int)
begin
    update InventoryDetails
    set idInventoryDetails = sp_idInventoryDetails,
        _idProduct         = sp__idProduct,
        _idInventory       = sp__idInventory,
        stock              = sp_stock
    where idInventoryDetails = sp_idInventoryDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_InventoryDetails(in sp_idInventoryDetails int)
begin
    delete
    from InventoryDetails
    where idInventoryDetails = sp_idInventoryDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_select_InventoryDetails(in sp_idInventoryDetails int)
begin
    select I.idInventoryDetails, I._idProduct, I._idInventory, I.stock
    from InventoryDetails I
    where idInventoryDetails = sp_idInventoryDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_InventoryDetails()
begin
    select I.idInventoryDetails, I._idProduct, I._idInventory, I.stock from InventoryDetails I;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_Products(in sp_productName varchar(100)
, in sp_productDescription varchar(250)
, in sp_productPrice double, in sp__idProductType int)
begin
    insert into Products(productName, productDescription, productPrice, _idProductType)
    values (sp_productName, sp_productDescription, sp_productPrice, sp__idProductType);
end$$
delimiter ;


delimiter $$
create procedure sp_update_Products(in sp_idProducts int, in sp_productName varchar(100)
, in sp_productDescription varchar(250)
, in sp_productPrice double, in sp__idProductType int)
begin
    update Products
    set idProducts         = sp_idProducts,
        productName        = sp_productName,
        productDescription = sp_productDescription,
        productPrice       = sp_productPrice,
        _idProductType     = sp__idProductType
    where idProducts = sp_idProducts;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_Products(in sp_idProducts int)
begin
    delete
    from Products
    where idProducts = sp_idProducts;
end$$
delimiter ;


delimiter $$
create procedure sp_select_Products(in sp_idProducts int)
begin
    select P.idProducts, P.productName, P.productDescription, P.productPrice, P._idProductType
    from Products P
    where idProducts = sp_idProducts;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_Products()
begin
    select P.idProducts, P.productName, P.productDescription, P.productPrice, P._idProductType from Products P;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_ProductType(in sp_productTypeName varchar(150)
)
begin
    insert into ProductType(productTypeName)
    values (sp_productTypeName);
end$$
delimiter ;


delimiter $$
create procedure sp_update_ProductType(in sp_idProductType int, in sp_productTypeName varchar(150)
)
begin
    update ProductType
    set idProductType   = sp_idProductType,
        productTypeName = sp_productTypeName
    where idProductType = sp_idProductType;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_ProductType(in sp_idProductType int)
begin
    delete
    from ProductType
    where idProductType = sp_idProductType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_ProductType(in sp_idProductType int)
begin
    select P.idProductType, P.productTypeName
    from ProductType P
    where idProductType = sp_idProductType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_ProductType()
begin
    select P.idProductType, P.productTypeName from ProductType P;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_OrderRequest(in sp_orderRequestDate time, in sp__idStatusOrderRequest int,
                                        in sp__idUser int,
                                        in sp__idPaymentType int)
begin
    insert into OrderRequest(orderRequestDate, _idStatusOrderRequest, _idUser, _idPaymentType)
    values (sp_orderRequestDate, sp__idStatusOrderRequest, sp__idUser, sp__idPaymentType);
end$$
delimiter ;


delimiter $$
create procedure sp_update_OrderRequest(in sp_idOrderRequest int, in sp_orderRequestDate time,
                                        in sp__idStatusOrderRequest int,
                                        in sp__idUser int, in sp__idPaymentType int)
begin
    update OrderRequest
    set idOrderRequest        = sp_idOrderRequest,
        orderRequestDate      = sp_orderRequestDate,
        _idStatusOrderRequest = sp__idStatusOrderRequest,
        _idUser               = sp__idUser,
        _idPaymentType        = sp__idPaymentType
    where idOrderRequest = sp_idOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_OrderRequest(in sp_idOrderRequest int)
begin
    delete
    from OrderRequest
    where idOrderRequest = sp_idOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_select_OrderRequest(in sp_idOrderRequest int)
begin
    select O.idOrderRequest, O.orderRequestDate, O._idStatusOrderRequest, O._idUser, O._idPaymentType
    from OrderRequest O
    where idOrderRequest = sp_idOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_OrderRequest()
begin
    select O.idOrderRequest, O.orderRequestDate, O._idStatusOrderRequest, O._idUser, O._idPaymentType
    from OrderRequest O;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_StatusOrderRequest(in sp_statusOrderRequestName varchar(150)
)
begin
    insert into StatusOrderRequest(statusOrderRequestName)
    values (sp_statusOrderRequestName);
end$$
delimiter ;


delimiter $$
create procedure sp_update_StatusOrderRequest(in sp_idStatusOrderRequest int, in sp_statusOrderRequestName varchar(150)
)
begin
    update StatusOrderRequest
    set idStatusOrderRequest   = sp_idStatusOrderRequest,
        statusOrderRequestName = sp_statusOrderRequestName
    where idStatusOrderRequest = sp_idStatusOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_StatusOrderRequest(in sp_idStatusOrderRequest int)
begin
    delete
    from StatusOrderRequest
    where idStatusOrderRequest = sp_idStatusOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_select_StatusOrderRequest(in sp_idStatusOrderRequest int)
begin
    select S.idStatusOrderRequest, S.statusOrderRequestName
    from StatusOrderRequest S
    where idStatusOrderRequest = sp_idStatusOrderRequest;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_StatusOrderRequest()
begin
    select S.idStatusOrderRequest, S.statusOrderRequestName from StatusOrderRequest S;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_OrderRequestDetails(in sp_orderRequestDetailsQuantity int,
                                               in sp_orderRequestDetailsTotalPrice double,
                                               in sp__idProduct int, in sp__idOrderRequest int)
begin
    insert into OrderRequestDetails(orderRequestDetailsQuantity, orderRequestDetailsTotalPrice, _idProduct,
                                    _idOrderRequest)
    values (sp_orderRequestDetailsQuantity, sp_orderRequestDetailsTotalPrice, sp__idProduct, sp__idOrderRequest);
end$$
delimiter ;


delimiter $$
create procedure sp_update_OrderRequestDetails(in sp_idRequestDetails int, in sp_orderRequestDetailsQuantity int,
                                               in sp_orderRequestDetailsTotalPrice double, in sp__idProduct int,
                                               in sp__idOrderRequest int)
begin
    update OrderRequestDetails
    set idRequestDetails              = sp_idRequestDetails,
        orderRequestDetailsQuantity   = sp_orderRequestDetailsQuantity,
        orderRequestDetailsTotalPrice = sp_orderRequestDetailsTotalPrice,
        _idProduct                    = sp__idProduct,
        _idOrderRequest               = sp__idOrderRequest
    where idRequestDetails = sp_idRequestDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_OrderRequestDetails(in sp_idRequestDetails int)
begin
    delete
    from OrderRequestDetails
    where idRequestDetails = sp_idRequestDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_select_OrderRequestDetails(in sp_idRequestDetails int)
begin
    select O.idRequestDetails,
           O.orderRequestDetailsQuantity,
           O.orderRequestDetailsTotalPrice,
           O._idProduct,
           O._idOrderRequest
    from OrderRequestDetails O
    where idRequestDetails = sp_idRequestDetails;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_OrderRequestDetails()
begin
    select O.idRequestDetails,
           O.orderRequestDetailsQuantity,
           O.orderRequestDetailsTotalPrice,
           O._idProduct,
           O._idOrderRequest
    from OrderRequestDetails O;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_Country(in sp_countryName varchar(150)
)
begin
    insert into Country(countryName)
    values (sp_countryName);
end$$
delimiter ;


delimiter $$
create procedure sp_update_Country(in sp_idCountry int, in sp_countryName varchar(150)
)
begin
    update Country
    set idCountry   = sp_idCountry,
        countryName = sp_countryName
    where idCountry = sp_idCountry;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_Country(in sp_idCountry int)
begin
    delete
    from Country
    where idCountry = sp_idCountry;
end$$
delimiter ;


delimiter $$
create procedure sp_select_Country(in sp_idCountry int)
begin
    select C.idCountry, C.countryName
    from Country C
    where idCountry = sp_idCountry;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_Country()
begin
    select C.idCountry, C.countryName from Country C;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_City(in sp_cityName varchar(150)
, in sp_cityCoordinateX decimal
, in sp_cityCoordinateY decimal
, in sp__idCountry int)
begin
    insert into City(cityName, cityCoordinateX, cityCoordinateY, _idCountry)
    values (sp_cityName, sp_cityCoordinateX, sp_cityCoordinateY, sp__idCountry);
end$$
delimiter ;


delimiter $$
create procedure sp_update_City(in sp_idCity int, in sp_cityName varchar(150)
, in sp_cityCoordinateX decimal
, in sp_cityCoordinateY decimal
, in sp__idCountry int)
begin
    update City
    set idCity          = sp_idCity,
        cityName        = sp_cityName,
        cityCoordinateX = sp_cityCoordinateX,
        cityCoordinateY = sp_cityCoordinateY,
        _idCountry      = sp__idCountry
    where idCity = sp_idCity;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_City(in sp_idCity int)
begin
    delete
    from City
    where idCity = sp_idCity;
end$$
delimiter ;


delimiter $$
create procedure sp_select_City(in sp_idCity int)
begin
    select C.idCity, C.cityName, C.cityCoordinateX, C.cityCoordinateY, C._idCountry
    from City C
    where idCity = sp_idCity;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_City()
begin
    select C.idCity, C.cityName, C.cityCoordinateX, C.cityCoordinateY, C._idCountry from City C;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_Establishment(in sp_establishmentName varchar(150)
, in sp_establishmentCoordinateX decimal
, in sp_establishmentCoordinateY decimal
, in sp__idCity int)
begin
    insert into Establishment(establishmentName, establishmentCoordinateX, establishmentCoordinateY, _idCity)
    values (sp_establishmentName, sp_establishmentCoordinateX, sp_establishmentCoordinateY, sp__idCity);
end$$
delimiter ;


delimiter $$
create procedure sp_update_Establishment(in sp_idEstablishment int, in sp_establishmentName varchar(150)
, in sp_establishmentCoordinateX decimal
, in sp_establishmentCoordinateY decimal
, in sp__idCity int)
begin
    update Establishment
    set idEstablishment          = sp_idEstablishment,
        establishmentName        = sp_establishmentName,
        establishmentCoordinateX = sp_establishmentCoordinateX,
        establishmentCoordinateY = sp_establishmentCoordinateY,
        _idCity                  = sp__idCity
    where idEstablishment = sp_idEstablishment;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_Establishment(in sp_idEstablishment int)
begin
    delete
    from Establishment
    where idEstablishment = sp_idEstablishment;
end$$
delimiter ;


delimiter $$
create procedure sp_select_Establishment(in sp_idEstablishment int)
begin
    select E.idEstablishment, E.establishmentName, E.establishmentCoordinateX, E.establishmentCoordinateY, E._idCity
    from Establishment E
    where idEstablishment = sp_idEstablishment;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_Establishment()
begin
    select E.idEstablishment, E.establishmentName, E.establishmentCoordinateX, E.establishmentCoordinateY, E._idCity
    from Establishment E;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_UserRegisteredPaymentTypes(in sp__idUser int, in sp__idPaymentType int)
begin
    insert into UserRegisteredPaymentTypes(_idUser, _idPaymentType)
    values (sp__idUser, sp__idPaymentType);
end$$
delimiter ;


delimiter $$
create procedure sp_update_UserRegisteredPaymentTypes(in sp_idUserRegisteredPaymentTypes int, in sp__idUser int,
                                                      in sp__idPaymentType int)
begin
    update UserRegisteredPaymentTypes
    set idUserRegisteredPaymentTypes = sp_idUserRegisteredPaymentTypes,
        _idUser                      = sp__idUser,
        _idPaymentType               = sp__idPaymentType
    where idUserRegisteredPaymentTypes = sp_idUserRegisteredPaymentTypes;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_UserRegisteredPaymentTypes(in sp_idUserRegisteredPaymentTypes int)
begin
    delete
    from UserRegisteredPaymentTypes
    where idUserRegisteredPaymentTypes = sp_idUserRegisteredPaymentTypes;
end$$
delimiter ;


delimiter $$
create procedure sp_select_UserRegisteredPaymentTypes(in sp_idUserRegisteredPaymentTypes int)
begin
    select U.idUserRegisteredPaymentTypes, U._idUser, U._idPaymentType
    from UserRegisteredPaymentTypes U
    where idUserRegisteredPaymentTypes = sp_idUserRegisteredPaymentTypes;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_UserRegisteredPaymentTypes()
begin
    select U.idUserRegisteredPaymentTypes, U._idUser, U._idPaymentType from UserRegisteredPaymentTypes U;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_Card(in sp_cardExpirationDate date, in sp_CVC varchar(3), in sp_cardOwner varchar(30)
, in sp__idCardType int)
begin
    insert into Card(cardExpirationDate, CVC, cardOwner, _idCardType)
    values (sp_cardExpirationDate, sp_CVC, sp_cardOwner, sp__idCardType);
end$$
delimiter ;


delimiter $$
create procedure sp_update_Card(in sp_idCard int, in sp_cardExpirationDate date, in sp_CVC varchar(3)
, in sp_cardOwner varchar(30)
, in sp__idCardType int)
begin
    update Card
    set idCard             = sp_idCard,
        cardExpirationDate = sp_cardExpirationDate,
        CVC                = sp_CVC,
        cardOwner          = sp_cardOwner,
        _idCardType        = sp__idCardType
    where idCard = sp_idCard;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_Card(in sp_idCard int)
begin
    delete
    from Card
    where idCard = sp_idCard;
end$$
delimiter ;


delimiter $$
create procedure sp_select_Card(in sp_idCard int)
begin
    select C.idCard, C.cardExpirationDate, C.CVC, C.cardOwner, C._idCardType
    from Card C
    where idCard = sp_idCard;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_Card()
begin
    select C.idCard, C.cardExpirationDate, C.CVC, C.cardOwner, C._idCardType from Card C;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_UserRegisteredCards(in sp__idCard int, in sp__idUser int)
begin
    insert into UserRegisteredCards(_idCard, _idUser)
    values (sp__idCard, sp__idUser);
end$$
delimiter ;


delimiter $$
create procedure sp_update_UserRegisteredCards(in sp_idUserRegisteredCards int, in sp__idCard int, in sp__idUser int)
begin
    update UserRegisteredCards
    set idUserRegisteredCards = sp_idUserRegisteredCards,
        _idCard               = sp__idCard,
        _idUser               = sp__idUser
    where idUserRegisteredCards = sp_idUserRegisteredCards;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_UserRegisteredCards(in sp_idUserRegisteredCards int)
begin
    delete
    from UserRegisteredCards
    where idUserRegisteredCards = sp_idUserRegisteredCards;
end$$
delimiter ;


delimiter $$
create procedure sp_select_UserRegisteredCards(in sp_idUserRegisteredCards int)
begin
    select U.idUserRegisteredCards, U._idCard, U._idUser
    from UserRegisteredCards U
    where idUserRegisteredCards = sp_idUserRegisteredCards;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_UserRegisteredCards()
begin
    select U.idUserRegisteredCards, U._idCard, U._idUser from UserRegisteredCards U;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_CardType(in sp_cardTypeName varchar(150)
)
begin
    insert into CardType(cardTypeName)
    values (sp_cardTypeName);
end$$
delimiter ;


delimiter $$
create procedure sp_update_CardType(in sp_idCardType int, in sp_cardTypeName varchar(150)
)
begin
    update CardType
    set idCardType   = sp_idCardType,
        cardTypeName = sp_cardTypeName
    where idCardType = sp_idCardType;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_CardType(in sp_idCardType int)
begin
    delete
    from CardType
    where idCardType = sp_idCardType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_CardType(in sp_idCardType int)
begin
    select C.idCardType, C.cardTypeName
    from CardType C
    where idCardType = sp_idCardType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_CardType()
begin
    select C.idCardType, C.cardTypeName from CardType C;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_PaymentType(in sp_paymentTypeNameMethod varchar(150)
)
begin
    insert into PaymentType(paymentTypeNameMethod)
    values (sp_paymentTypeNameMethod);
end$$
delimiter ;


delimiter $$
create procedure sp_update_PaymentType(in sp_idPaymentType int, in sp_paymentTypeNameMethod varchar(150)
)
begin
    update PaymentType
    set idPaymentType         = sp_idPaymentType,
        paymentTypeNameMethod = sp_paymentTypeNameMethod
    where idPaymentType = sp_idPaymentType;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_PaymentType(in sp_idPaymentType int)
begin
    delete
    from PaymentType
    where idPaymentType = sp_idPaymentType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_PaymentType(in sp_idPaymentType int)
begin
    select P.idPaymentType, P.paymentTypeNameMethod
    from PaymentType P
    where idPaymentType = sp_idPaymentType;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_PaymentType()
begin
    select P.idPaymentType, P.paymentTypeNameMethod from PaymentType P;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_StatusTransaction(in sp_statusTransactionName varchar(100)
)
begin
    insert into StatusTransaction(statusTransactionName)
    values (sp_statusTransactionName);
end$$
delimiter ;


delimiter $$
create procedure sp_update_StatusTransaction(in sp_idStatusTransaction int, in sp_statusTransactionName varchar(100)
)
begin
    update StatusTransaction
    set idStatusTransaction   = sp_idStatusTransaction,
        statusTransactionName = sp_statusTransactionName
    where idStatusTransaction = sp_idStatusTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_StatusTransaction(in sp_idStatusTransaction int)
begin
    delete
    from StatusTransaction
    where idStatusTransaction = sp_idStatusTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_StatusTransaction(in sp_idStatusTransaction int)
begin
    select S.idStatusTransaction, S.statusTransactionName
    from StatusTransaction S
    where idStatusTransaction = sp_idStatusTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_StatusTransaction()
begin
    select S.idStatusTransaction, S.statusTransactionName from StatusTransaction S;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_CardTransaction(in sp_cardTransactionDate date, in sp_cardTransactionTime time,
                                           in sp_cardTransactionAmount double, in sp__idOrderRequest int,
                                           in sp__idStatusTransaction int, in sp__idCard int)
begin
    insert into CardTransaction(cardTransactionDate, cardTransactionTime, cardTransactionAmount, _idOrderRequest,
                                _idStatusTransaction, _idCard)
    values (sp_cardTransactionDate, sp_cardTransactionTime, sp_cardTransactionAmount, sp__idOrderRequest,
            sp__idStatusTransaction, sp__idCard);
end$$
delimiter ;


delimiter $$
create procedure sp_update_CardTransaction(in sp_idCardTransaction int, in sp_cardTransactionDate date,
                                           in sp_cardTransactionTime time, in sp_cardTransactionAmount double,
                                           in sp__idOrderRequest int, in sp__idStatusTransaction int, in sp__idCard int)
begin
    update CardTransaction
    set idCardTransaction     = sp_idCardTransaction,
        cardTransactionDate   = sp_cardTransactionDate,
        cardTransactionTime   = sp_cardTransactionTime,
        cardTransactionAmount = sp_cardTransactionAmount,
        _idOrderRequest       = sp__idOrderRequest,
        _idStatusTransaction  = sp__idStatusTransaction,
        _idCard               = sp__idCard
    where idCardTransaction = sp_idCardTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_CardTransaction(in sp_idCardTransaction int)
begin
    delete
    from CardTransaction
    where idCardTransaction = sp_idCardTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_CardTransaction(in sp_idCardTransaction int)
begin
    select C.idCardTransaction,
           C.cardTransactionDate,
           C.cardTransactionTime,
           C.cardTransactionAmount,
           C._idOrderRequest,
           C._idStatusTransaction,
           C._idCard
    from CardTransaction C
    where idCardTransaction = sp_idCardTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_CardTransaction()
begin
    select C.idCardTransaction,
           C.cardTransactionDate,
           C.cardTransactionTime,
           C.cardTransactionAmount,
           C._idOrderRequest,
           C._idStatusTransaction,
           C._idCard
    from CardTransaction C;
end$$
delimiter ;

######################################################################################################################

delimiter $$
create procedure sp_insert_MonetaryTransaction(in sp_monetaryTransactionDate date, in sp_monetaryTransactionTime time,
                                               in sp_monetaryTransactionAmount double, in sp__idOrderRequest int,
                                               in sp__idStatusTransaction int)
begin
    insert into MonetaryTransaction(monetaryTransactionDate, monetaryTransactionTime, monetaryTransactionAmount,
                                    _idOrderRequest, _idStatusTransaction)
    values (sp_monetaryTransactionDate, sp_monetaryTransactionTime, sp_monetaryTransactionAmount, sp__idOrderRequest,
            sp__idStatusTransaction);
end$$
delimiter ;


delimiter $$
create procedure sp_update_MonetaryTransaction(in sp_idTransaction int, in sp_monetaryTransactionDate date,
                                               in sp_monetaryTransactionTime time,
                                               in sp_monetaryTransactionAmount double, in sp__idOrderRequest int,
                                               in sp__idStatusTransaction int)
begin
    update MonetaryTransaction
    set idTransaction             = sp_idTransaction,
        monetaryTransactionDate   = sp_monetaryTransactionDate,
        monetaryTransactionTime   = sp_monetaryTransactionTime,
        monetaryTransactionAmount = sp_monetaryTransactionAmount,
        _idOrderRequest           = sp__idOrderRequest,
        _idStatusTransaction      = sp__idStatusTransaction
    where idTransaction = sp_idTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_delete_MonetaryTransaction(in sp_idTransaction int)
begin
    delete
    from MonetaryTransaction
    where idTransaction = sp_idTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_MonetaryTransaction(in sp_idTransaction int)
begin
    select M.idTransaction,
           M.monetaryTransactionDate,
           M.monetaryTransactionTime,
           M.monetaryTransactionAmount,
           M._idOrderRequest,
           M._idStatusTransaction
    from MonetaryTransaction M
    where idTransaction = sp_idTransaction;
end$$
delimiter ;


delimiter $$
create procedure sp_select_all_MonetaryTransaction()
begin
    select M.idTransaction,
           M.monetaryTransactionDate,
           M.monetaryTransactionTime,
           M.monetaryTransactionAmount,
           M._idOrderRequest,
           M._idStatusTransaction
    from MonetaryTransaction M;
end$$
delimiter ;
    