

# - Create a physical relational database
SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE IF NOT EXISTS Handmade_Store ;
USE Handmade_Store ;

#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Location
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `location` ;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `location` (
  `Location_id` INT NOT NULL auto_increment,
  `Adress` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`));
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `client` ;
SET FOREIGN_KEY_CHECKS = 1;
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Client 
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
CREATE TABLE IF NOT EXISTS `client` (
  `Client_id` VARCHAR(10) NOT NULL,
  `First_name` VARCHAR(25) NOT NULL,
  `Last_name` VARCHAR(25) NOT NULL,
  `Gender` VARCHAR(10) ,
  `Email` VARCHAR(50),
   `Nationality` VARCHAR(15) NOT NULL,
  `Phone_number` VARCHAR(20) NOT NULL,
  `Birth_date` DATE NULL,
  `Location_id` INT NOT NULL,
  PRIMARY KEY (`client_id`),
	FOREIGN KEY (`location_id`)
	REFERENCES `Handmade_Store`.`LOCATION` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table DESIGNER 
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
SET FOREIGN_KEY_CHECKS = 0;    
DROP TABLE IF EXISTS `Designer` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `Designer` (
  `Designer_id` INT NOT NULL,
  `First_name` VARCHAR(25) NOT NULL,
  `Last_name` VARCHAR(25) NOT NULL,
  `Gender` VARCHAR(10),
  `Nationality` VARCHAR(15) NOT NULL,
  `Phone_number` VARCHAR(20) NULL,
  `Email` VARCHAR(50) NULL,
  `Location_id` INT NOT NULL,
  PRIMARY KEY (`Designer_id`),
    FOREIGN KEY (`location_id`)
    REFERENCES `Handmade_Store`.`LOCATION` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Delivery_Men
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
SET FOREIGN_KEY_CHECKS = 0;    
DROP TABLE IF EXISTS `Delivery_Men` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `Delivery_Men` (
  `Delivery_Men_id` INT NOT NULL,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `nationality` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone_number` VARCHAR(20) NULL,
  `Gender` VARCHAR(10) ,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`Delivery_Men_id`),
    FOREIGN KEY (`location_id`)
    REFERENCES `Handmade_Store`.`LOCATION` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Shipment_Status
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\ 
SET FOREIGN_KEY_CHECKS = 0; 
DROP TABLE IF EXISTS `Shipment_Status` ;
SET FOREIGN_KEY_CHECKS = 1; 
CREATE TABLE IF NOT EXISTS `Shipment_Status` (
  `Shipment_Status_id` INT NOT NULL,
  `Shipment_Status_name` varchar(25) NOT NULL,
  PRIMARY KEY (`Shipment_Status_id`));
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table shipment
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
SET FOREIGN_KEY_CHECKS = 0;    
DROP TABLE IF EXISTS `shipment` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `shipment` (
  `shipment_id` int auto_increment,
  `Delivery_Men_id` int NOT NULL,
  `shipment_date` DATE NOT NULL,
  `Shipment_Status_id` int NOT NULL,
  `shipment_fees` float default 5,
  PRIMARY KEY (`shipment_id`),
    FOREIGN KEY (`Delivery_Men_id`)
    REFERENCES `Handmade_Store`.`Delivery_Men` (`Delivery_Men_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`Shipment_Status_id`)
    REFERENCES `Handmade_Store`.`Shipment_Status` (`Shipment_Status_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Invoice 
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\   
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `invoice` ;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` INT auto_increment,
  `issued_date` DATE NOT NULL,
  `total_value` FLOAT(4) DEFAULT '0',
  `client_id` VARCHAR(10) NOT NULL,
  `Items_bought` int DEFAULT '0',
  `shipment_id` int NOT NULL,
  PRIMARY KEY (`invoice_id`),
    FOREIGN KEY (`client_id`)
    REFERENCES `Handmade_Store`.`CLIENT` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`shipment_id`)
    REFERENCES `Handmade_Store`.`shipment` (`shipment_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Discount 
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `discount` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `discount` (
  `discount_id` INT ,
  `discount_percentage` FLOAT(4) NOT NULL,
   PRIMARY KEY (`discount_id`));
   
 #/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Product_Status
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Product_Status` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `Product_Status` (
  `Product_Status_id` INT ,
  `Quantity` INT NOT NULL,
  `Availability` varchar(30) NOT NULL,
PRIMARY KEY (`Product_Status_id`));
   
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Product
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\ 
SET FOREIGN_KEY_CHECKS = 0;  
DROP TABLE IF EXISTS `Product` ;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `Product` (
  `Product_id` INT NOT NULL,
  `Product_Name` VARCHAR(200) NOT NULL,
  `price` FLOAT NOT NULL,
  `discount_id` INT NOT NULL,
  `Product_Status_id` INT NOT NULL,
  `designer_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
    FOREIGN KEY (`Product_Status_id`)
    REFERENCES `Handmade_Store`.`Product_Status` (`Product_Status_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`discount_id`)
    REFERENCES `Handmade_Store`.`DISCOUNT` (`discount_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`designer_id`)
    REFERENCES `Handmade_Store`.`designer` (`designer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
    
    
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Review
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\  
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int auto_increment,
  `date` DATE NOT NULL,
  `rating` FLOAT(4) NOT NULL,
  `comment` TEXT(200) NULL,
  `client_id` VARCHAR(10) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`review_id`),
    FOREIGN KEY (`client_id`)
    REFERENCES `Handmade_Store`.`CLIENT` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`)
    REFERENCES `Handmade_Store`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Product_order
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\  
SET FOREIGN_KEY_CHECKS = 0;
 DROP TABLE IF EXISTS `Product_order` ;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `Product_order` (
  `product_order_id` int auto_increment  ,
  `invoice_id` INT NOT NULL,
  `Product_id` INT NOT NULL,
  `Quantity` INT NOT NULL,
    PRIMARY KEY (`product_order_id`),
    FOREIGN KEY (`invoice_id`)
    REFERENCES `Handmade_Store`.`INVOICE` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`Product_id`)
    REFERENCES `Handmade_Store`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Category
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\  
SET FOREIGN_KEY_CHECKS = 0;  
DROP TABLE IF EXISTS `category` ;
SET FOREIGN_KEY_CHECKS = 0;  
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`));
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\    
#Table Product_Category
#/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\  
DROP TABLE IF EXISTS `Product_Category` ;

CREATE TABLE IF NOT EXISTS `Product_Category` (
  `Product_id` INT NOT NULL,
  `category_id` INT NOT NULL, 
    FOREIGN KEY (`product_id`)
    REFERENCES `Handmade_Store`.`Product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`category_id`)
    REFERENCES `Handmade_Store`.`CATEGORY` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
    
    
DROP TABLE IF EXISTS `log` ;
CREATE TABLE IF NOT EXISTS `log` (
LOG_ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DT DATETIME NOT NULL,
USR VARCHAR(63),
product_id int ,
old_price float,
new_price float,
old_Discount float,
new_Discount float
);

# Indexes creation 
alter table invoice add index (issued_date desc);
alter table invoice add index (client_id );
alter table invoice add index (total_value desc);

alter table product_order add index (invoice_id);
alter table product_order add index (product_id);

alter table location add index (area);

alter table client add index (location_id);

alter table product add index (designer_id);
alter table product add index (discount_id);

alter table review add index (client_id);
alter table review add index (date);
# Triggers Codes :

 -- *** The delivery_fees trigger  
 #This Trigger works so That deliveries outside of lisbon get automatically a delivery fee of 10 euro
drop trigger if exists Delivery_fees;

delimiter $$
create trigger Delivery_fees
after insert on invoice 
for each row 
begin
   if 
   (select city from invoice i join client c on c.client_id=i.client_id 
					    join location l on l.location_id=c.location_id
                        where invoice_id=new.invoice_id)<>'lisbon' then 
	update shipment
    set shipment.shipment_fees='10' where shipment.shipment_id=new.shipment_id;
						 
   end if ;
end $$
delimiter ;

 -- *** The OUT_OF_STOCK Trigger
 #This Trigger works so That a product that reaches 0 in inventory turns automaticaly to out_of_stock 
 # and if it is restored again it changes again to In Stock
 
drop trigger if exists OUT_OF_STOCK;
delimiter $$
create trigger OUT_OF_STOCK
before update 
on product_status 
for each row 
begin
	if new.quantity=0 then 
        set  new.availability='Out of stock';
    end if ;
    if new.quantity >0 then 
	set  new.availability='In stock';
    end if ;
 end $$
delimiter ; 

-- *** The Updated_Invoice Trigger
 #This Trigger works in a way that The total in the invoice before discount is calculated automaticaly 
 # Also the number of items baught is updated automaticaly when a product is added to certain invoice 

drop trigger if exists Updated_Invoice;
delimiter $$
create trigger Updated_Invoice
after insert on product_order 
for each row 
begin
update invoice set Items_bought = 
( Items_bought + 
(select quantity from product_order where( invoice_id = new.invoice_id and product_id=new.product_id ) ) ) 
where invoice_id = new.invoice_id;

update product_status set quantity = 
( quantity -
(select quantity from product_order where( invoice_id = new.invoice_id and product_id=new.product_id ) ) ) 
where product_status_id = (select product_status_id from product where product_id=new.product_id);


update invoice set total_value = 
( total_value + 
(select quantity from product_order where( invoice_id = new.invoice_id and product_id=new.product_id ) )
*(select product.price from product join product_order on (product.product_ID=product_order.product_ID )where invoice_id = new.invoice_id and product_order.product_id=new.product_id ) ) 
where (invoice_id = new.invoice_id );
end $$
delimiter ;

 -- *** The Free_delivery trigger    
 #This Trigger works in a way that if the total value of invoice is more than 2000 euro it is automaticaly turned to 0
drop trigger if exists Free_delivery;
delimiter $$
create trigger Free_delivery
after update on invoice 
for each row 
begin
   if 
    new.total_value>2000 then 
	update shipment
    set shipment.shipment_fees='0' where shipment.shipment_id=new.shipment_id;
						 
   end if ;
end $$
delimiter ;

 -- *** The Product_Update trigger    
 #This Trigger works in a way it fills a log table everytime a product is updated 
 #The update can be in discount or price 

drop trigger if exists Product_Update;
DELIMITER $$
CREATE TRIGGER Product_Update
AFTER UPDATE
ON product
FOR EACH ROW
BEGIN
INSERT into log (DT,USR,product_id,old_price,new_price,old_Discount,new_Discount) VALUES
(NOW(),USER(),old.product_id,old.price,new.price,(select discount_percentage from discount where discount_id=old.discount_id),(select discount_percentage from discount where discount_id=new.discount_id));
END $$
DELIMITER ;

 -- *** The Product_Update trigger    
#This Trigger works in a way it fills a log table everytime a product is updated 

#The update can be in discount or price 
#We will start inserting values in the data bases 

#let's start by inserting some values in the table location
#We used this web site for the generation of fake adresses 
#We used this web site for the generation of fields https://www.mockaroo.com/
#********************************** Insert locations **************************************************
insert into location ( adress, street,area,city, postal_code) values
 ( '35', '	Av. Jose Regio, loja','Lisbon', 'Lisbon', '2745-807');
 insert into location ( adress, street, area,city, postal_code) values
 ( '17', 'Av. Defensores de Chaves', 'Lisbon','Lisbon', '1000-117');
 insert into location ( adress, street, area,city, postal_code) values
 ( '25', 'Rua Consiglieri Pedroso', 'Sintra', 'Lisbon','2710');
 insert into location ( adress, street, area,city, postal_code) values
 ( '5', 'Rua Henrique Paiva Couceiro', 'Amadora','Lisbon', '2700-453');
 insert into location ( adress, street, area,city, postal_code) values
 ( '49', 'Rua Estr Nacional ', 'Loures','Lisbon', '2670-339');
 insert into location ( adress, street, area,city, postal_code) values
 ( '7', 'Rua Praceta Calouste', 'Torres Vedras','Lisbon', '	2560-291');
  insert into location ( adress, street, area,city, postal_code) values
 ( '12', 'Avenida Pedro Victor', 'Vila Franca de Xira','Lisbon', '2600-221');
  insert into location ( adress, street, area,city, postal_code) values
 ( '30', 'Avenida Heliodoro Salgado', 'Sintra','Lisbon', '2710');
  insert into location ( adress, street, area,city, postal_code) values
 ( '3', 'Avenida Amalia Rodrigues', 'Odivelas','Lisbon', '2675');
  insert into location ( adress, street, area,city, postal_code) values
 ( '32', 'Rua Henrique Paiva Couceiro', 'Amadora','Lisbon', '2700-453');
  insert into location ( adress, street, area,city, postal_code) values
 ( '13', 'Rua Major Caldas Xavier', '	Odivelas','Lisbon', '2675');
  insert into location ( adress, street, area,city, postal_code) values
 ( '3', 'Rua Dona Maria', 'Queluz','Lisbon', '2745');
  insert into location ( adress, street, area,city, postal_code) values
 ( '11', 'Rua Joao Carlos Junior', 'Torres Vedras','Lisbon', '2560');
  insert into location ( adress, street, area,city, postal_code) values
 ( '12', 'Rua Dom Nuno Alvares Pereira', '	Odivelas','Lisbon', '2675');
  insert into location ( adress, street, area,city, postal_code) values
 ( '19', 'Avenida Comandante Paiva Couceiro', 'Queluz','Lisbon', '	2745-190');
  insert into location ( adress, street, area,city, postal_code) values
 ( '10', 'Largo Almirante Candido ', 'Loures','Lisbon', '2670');
  insert into location ( adress, street, area,city, postal_code) values
 ( '18', 'Rua das Padarias ', 'Sintra','Lisbon', '2710-603');
  insert into location ( adress, street, area,city, postal_code) values
 ( '9', 'Largo Dom Dinis', 'Odivelas','Lisbon', '2675');
  insert into location ( adress, street, area,city, postal_code) values
 ( '65', 'Avenida Americo Ferrer Lopes', 'Queluz','Lisbon', '2745-862');
  insert into location ( adress, street, area,city, postal_code) values
 ( '57', 'Praceta Raul Proenca', 'Sintra','Lisbon', '2725');
  insert into location ( adress, street, area,city, postal_code) values
 ( '3', 'Rua Duque de Wellington', 'Torres Vedras','Lisbon', '2710-591');
  insert into location ( adress, street, area,city, postal_code) values
 ( '31', 'Avenida República', 'Lisbon','Lisbon', '1900-134');
  insert into location ( adress, street, area,city, postal_code) values
 ( '32', 'Rua Pulido Valente', 'Odivelas','Lisbon', '2675-671');
  insert into location ( adress, street, area,city, postal_code) values
 ( '31', 'Rua Alto da Cabreira', 'Amadora','Lisbon', '2610-017');
  insert into location ( adress, street, area,city, postal_code) values
 ( '33', 'Rua Luis de Camoes', 'Vila Franca de Xira','Lisbon', '2600');
  insert into location ( adress, street, area,city, postal_code) values
 ( '38', 'Praceta Diogo Gomes', 'Odivelas','Lisbon', '	2675');
   insert into location ( adress, street, area,city, postal_code) values
 ( '30', 'Estrada da Pena', 'Sintra','Lisbon', '2710-609');
  insert into location ( adress, street, area,city, postal_code) values
 ( '20', 'Rua de Sao Juliao,', 'Lisbon','Lisbon', '1100-524');
  insert into location ( adress, street, area,city, postal_code) values
 ( '19', 'Rua Liberdade', 'Odivelas','Lisbon', '1675');
  insert into location ( adress, street, area,city, postal_code) values
 ( '8', 'Rua Luis de Camoes', '	Amadora','Lisbon', '2700-535');
  insert into location ( adress, street, area,city, postal_code) values
 ( '22', 'Avenida 5 de Outubro', 'Lisbon','Lisbon', '1050-054');
  insert into location ( adress, street, area,city, postal_code) values
 ( '1', 'Rua Pulido Valente', 'Odivelas','Lisbon', '2675');
   insert into location ( adress, street, area,city, postal_code) values
 ( '22', '	Rua Dom Antonio Ferreira Gomes', 'Penafiel','Porto', '4560-568');
    insert into location ( adress, street, area,city, postal_code) values
 ( '11', 'Rua Manuel Pinto de Azevedo', 'Porto','Porto', '4100-320');
    insert into location ( adress, street, area,city, postal_code) values
 ( '18', 'Rua Sacadura Cabral', 'Santo Tirso','Porto', '4780-422');
    insert into location ( adress, street, area,city, postal_code) values
 ( '81', 'Estrada da Circunvalacao', 'Porto','Porto', '	4350-115');
    insert into location ( adress, street, area,city, postal_code) values
 ( '23', 'Rua do Bonjardim ', 'Porto','Porto', '4000');
    insert into location ( adress, street, area,city, postal_code) values
 ( '19', 'R. do Convento', 'Santo Tirso','Porto', '4780');
    insert into location ( adress, street, area,city, postal_code) values
 ( '10', 'Rua Roberto Ivens', 'Matosinhos','Porto', '4450');
    insert into location ( adress, street, area,city, postal_code) values
 ( '9', 'Rua do Matinho', 'Matosinhos','Porto', '4450-736');
    insert into location ( adress, street, area,city, postal_code) values
 ( '12', 'Avenida Robert Smith', 'Braga','Braga', '4715-249');
     insert into location ( adress, street, area,city, postal_code) values
 ( '19', 'Rua Dom Paio Mendes', 'Braga','Braga', '4450-736');
     insert into location ( adress, street, area,city, postal_code) values
 ( '23', 'Rua Cidade de Guimaraes', 'Fafe','Braga', '4820');
     insert into location ( adress, street, area,city, postal_code) values
 ( '16', 'Rua Luís António de Oliveira Ramos', 'Vila Verde','Braga', '4730-756');
      insert into location ( adress, street, area,city, postal_code) values
 ( '15', 'Estrada Real', 'Sardão','Águeda', '3750- 725');
      insert into location ( adress, street, area,city, postal_code) values
 ( '344', 'Rua da Poça-Carvalha', 'Vila Verde','Braga', '4705-010');
      insert into location ( adress, street, area,city, postal_code) values
 ( '18', 'Rua do Bonjardim', 'Pombal','Leiria', '2435-689');
      insert into location ( adress, street, area,city, postal_code) values
 ( '39', 'Rua da Costa', 'Pereira','Coimbra', '3140-345');
      insert into location ( adress, street, area,city, postal_code) values
 ( '11', 'Ecovia Internacional do Tâmega e do Corgo', 'Chaves','Vila Real', '5400-764');
      insert into location ( adress, street, area,city, postal_code) values
 ( '15', 'Parque Eólico de Meroicinha', 'Leiria','Leiria', '2495-143');
      insert into location ( adress, street, area,city, postal_code) values
 ( '12', 'Av. de Santo Andre', 'Vila Real','Vila Real', '5000-423');
      insert into location ( adress, street, area,city, postal_code) values
 ( '51', 'Rua Caminho de Fundo', 'Carvalhosa','Porto', '4590-515');
      insert into location ( adress, street, area,city, postal_code) values
 ( '66', 'Estrada da Pocariça', 'Guarda','Guarda', '6300-539');
      insert into location ( adress, street, area,city, postal_code) values
 ( '77', 'Rua Nossa Senhora da Graça','Oliveira do Bairro','Aveiro', '3770-410');
      insert into location ( adress, street, area,city, postal_code) values
 ( '9', 'Rua Engenheiro Guilherme Santos', 'Águeda','Aveiro', '3750-309');
      insert into location ( adress, street, area,city, postal_code) values
 ( '3', 'Rua do Babainho', 'Braga','Braga', '4705-780');
      insert into location ( adress, street, area,city, postal_code) values
 ( '11', 'Rua Manuel de Arriaga', 'Beja','Beja', '7800-631');
 
 #********************************** Insert Delivery men ***********************************************
 insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '842988165','Estevan', 'Dias Barros', 'Portugal','barbosa.mateus@borges.org','+351 259970263','Male','1');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '247642517','Matheus', 'Guerreiro', 'Portugal','carneiro.luciana@hotmail.com','+351 259974567','Male','2');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '568640870','Gil', 'de Henriques', 'Portugal','pinho.anna@hotmail.com','+351 962966332','Male','3');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '161407498','Guilherme', 'Marques Ferreira', 'Portugal','Guilherme@borges.org','+351 220224062','Male','4');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '354308203','Rafael', 'Nuno Monteiro', 'Portugal','cardoso.mara@hotmail.com','+351 259970263','Male','5');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '774857641','Jorge', 'Torres de Miranda', 'Portugal','Jorge.torres@hotmail.com','+351 214567964','Male','6');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '842988145','Virat', 'Bera', 'India','Bera.Bera@vurat.org','+351 256789123','Male','7');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '842988168','Nayan', 'Sethi', 'India','Nayan.sethi@gmail.com','+351 259972645','Male','8');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '482988167','Mohamed', 'Salah', 'Egypt','Mohamed.Salah@gmail.com','+351 245678986','Male','9');
insert into Delivery_Men (Delivery_Men_id,first_name, last_name, nationality,email,phone_number,Gender, location_id) values
 ( '602988185','Jose', 'carlos', 'Angola','Jose@carlos.org','+351 259970244','Male','10');
 #********************************** Insert Designer ***************************************************
 insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '702988174','Mario', 'Fernandes','Male', 'Portugal','+351258870233','Mario@fasion.org','11');
insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '604088174','Maria', 'Gueriro','Female', 'Portugal','+351258870233','Maria.Gueriro@gmail.com','13');
insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '90407744','Sofia', 'Santos','Female', 'Portugal','+351247770222','Sofia.Santos@gmail.com','14');
 insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '704033174','Cristina', 'Jorge de Carvalho','Female', 'Portugal','+351243370211','Cristina.Jorge@gmail.com','15');
 insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '117642516','Cristina', 'Jorge de Carvalho','Female', 'Portugal','+351243370211','Cristina.Jorge@gmail.com','21');
  insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '487642556','ANABELA', 'BALDAQUE','Female', 'Portugal','+351243370346','BALDAQUE.Anabel@hotmail.com','21');
   insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '847652565','ANABELA', 'BALDAQUE','Female', 'Portugal','+351243370346','BALDAQUE.Anabel@hotmail.com','31');
    insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '997652365','Samuel', 'Santos','Male', 'Portugal','+351243370006','Samuel.Santos@hotmail.com','41');
    insert into Designer (Designer_id,first_name, last_name,gender, nationality,phone_number,email, location_id) values
 ( '747651599','Alberto', 'Decaprio','Male', 'Portugal','+351243370222','Decaprio.Alberto@hotmail.com','51');
 
 
#********************************** Insert Clients ******************************************************
insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '100651500','Mohamed Ettaher', 'Ben Slama','Male','b.slama.med.taher@gmail.com', 'Tunisia','+351243372061','1999-11-22','16');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '103651510','Skander', 'Chaabini','Male','SkanderChaabini@gmail.com', 'Tunisia','+3512433744','1997-12-13','17');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '100651520','ALex', 'Santander','Male','Alexsantander@gmail.com', 'Chili','+351243375000','1985-12-29','18');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '107633530','Jose', 'Pedri','Male','Josepedri1@gmail.com', 'Angola','+351243374000','1985-10-19','19');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651577','Samuel', 'Ronaldo','Male','Samu.ronaldo@gmail.com', 'Portugal','+351243373000','1980-1-11','20');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651118','Leo', 'Santos','Male','Leosantos@gmail.com', 'Portugal','+35124337243','1990-03-22','22');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651128','João', 'Santos','Male','João.Santos@gmail.com', 'Brazil','+35124337219','2000-07-11','23');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117654458','Johannes', 'Dlamini','Male','Johannes.Dlamini@gmail.com', 'South Africa','+351243376000','1975-09-22','24');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651500','Pierre', 'Dubois','Male','Pierre.Dubois@gmail.com', 'France','+351243374003','1980-09-22','25');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '227651588','João', 'Guerriro','Male','João.Guerriro@gmail.com', 'Portugal','+35124337700','1999-08-12','26');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '109651588','Diego', 'Guerriro','Male','Diego.Guerriro@gmail.com', 'Brazil','+351243374356','1992-11-09','27');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117001588','Luis', 'Silva','Male','Luis.Silva@gmail.com', 'Brazil','+351243374567','1993-11-20','28');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117561588','Diogo', 'Matos','Male','Diogo.Matos@gmail.com', 'Portugal','+351243370932','1994-10-29','29');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '113351588','Juan', 'Matos','Male','Juan.Matos@gmail.com', 'Argentina','+351243370983','1999-10-28','30');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117653981','Franchesco', 'Matos','Male','Franchesco.Matos@gmail.com', 'Italy','+351243375648','1991-05-27','32');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651599','Carla', 'Kross','Female','Carla.Kross@gmail.com', 'Germany','+351243371111','2001-04-26','33');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117644588','Sarra', 'Dubois','Female','Sarra.Dubois@gmail.com', 'France','+351243371345','1970-07-21','34');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651544','Ines', 'Ferreira','Female','Ines.Ferreira@gmail.com', 'Portugal','+351243372345','1988-06-13','35');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651338','Isabelle', 'Ferreira','Female','Isabelle.Ferreira@gmail.com', 'Portugal','+351243374356','1965-01-10','36');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '999651908','Celine', 'Ferreira','Female','Celine.Ferreira@gmail.com', 'Portugal','+351243379876','1986-11-19','37');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '888651000','Beatriz', 'Ferreira','Female','Beatriz.Ferreira@gmail.com', 'Portugal','+351243370987','1987-10-31','38');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '777651588','Beatriz', 'Motta','Female','Beatriz.Motta@gmail.com', 'Portugal','+351243371234','1987-11-30','39');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '666651588','Marina', 'Motta','Female','Marina.Motta@gmail.com', 'Portugal','+351243371987','1978-05-01','40');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '555651588','Matilde', 'Motta','Female','Matilde.Motta@gmail.com', 'Portugal','+351243371356','1988-09-09','42');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '444651588','Leonor', 'Motta','Female','Leonor.Motta@gmail.com', 'Portugal','+351243371093','1994-07-08','43');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '333651588','Maria', 'Santos','Female','Maria.Santos@gmail.com', 'Portugal','+351243371635','1987-06-09','44');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '222651588','Marina', 'Santos','Female','Marina.Santos@gmail.com', 'Portugal','+351243371938','1987-02-05','45');
  insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '903651588','Sarra', 'Santos','Female','Sarra.Santos@gmail.com', 'Portugal','+351243371345','1977-11-10','46');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '897651588','Carolina', 'Santos','Female','Carolina.Santos@gmail.com', 'Portugal','+351243379817','1985-03-12','47');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '107651588','Ana', 'Santos','Female','Ana.Santos@gmail.com', 'Portugal','+351243379372','1999-01-14','48');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '157851588','Maria', 'Oliveira','Female','Maria.Oliveira@gmail.com', 'Brazil','+351243371983','1993-01-16','49');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '147651512','Maria', 'Silva','Female','Maria.Silva@gmail.com', 'Brazil','+351243372934','2000-10-16','50');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '764538364','Marina', 'Ferreira','Female','Marina.Ferreira@gmail.com', 'Brazil','+351243318474','1992-11-17','52');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117650943','Celine', 'Borba','Female','Celine.Borba@gmail.com', 'Portugal','+351243314532','1987-09-18','53');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117666666','Lenor', 'Machado','Female','Lenor.Machado@gmail.com', 'Portugal','+351243372032','1988-05-19','54');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651111','Carlota', 'bounouchi','Female','Carlota.bounouchi@gmail.com', 'Italy','+351243372044','1989-04-20','55');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117650000','Maria', 'Oliveira','Female','b.slama.med.taher@gmail.com', 'Portugal','+351243372055','1990-02-21','56');
 insert into Client (client_id,first_name, last_name,gender,email,nationality,phone_number,birth_date, location_id) values
 ( '117651412','Ines', 'Fernandes','Female','Ines.fernandes@gmail.com', 'Portugal','+351243372054','1970-11-22','57');
 
 
 #********************************** Insert Shipment_Status ******************************************************
insert into Shipment_Status (Shipment_Status_id,Shipment_Status_name) values
 ( '1','Pending');
 insert into Shipment_Status (Shipment_Status_id,Shipment_Status_name) values
 ( '2','Prepared');
  insert into Shipment_Status (Shipment_Status_id,Shipment_Status_name) values
 ( '3','Shiped');
   insert into Shipment_Status(Shipment_Status_id,Shipment_Status_name) values
 ( '4','recieved');
   insert into Shipment_Status (Shipment_Status_id,Shipment_Status_name) values
 ( '5','failed');
 
 
 #********************************** Insert Discount ******************************************************
insert into discount(discount_id,discount_percentage) values
 ( '1','0');
 insert into discount(discount_id,discount_percentage) values
 ( '2','5');
 insert into discount(discount_id,discount_percentage) values
 ( '3','10');
 insert into discount(discount_id,discount_percentage) values
 ( '4','20');
 insert into discount(discount_id,discount_percentage) values
 ( '5','25');
 insert into discount(discount_id,discount_percentage) values
 ( '6','40');
 insert into discount(discount_id,discount_percentage) values
 ( '7','50');
 insert into discount(discount_id,discount_percentage) values
 ( '8','60');
 insert into discount(discount_id,discount_percentage) values
 ( '9','70');
 insert into discount(discount_id,discount_percentage) values
 ( '10','80');
 
 
  #********************************** Insert Category ******************************************************
 
 
 insert into category(category_id,category_name) values
 ( '1','Jewelry & Accessories');
  insert into category(category_id,category_name) values
 ( '2','Clothing & Shoes');
  insert into category(category_id,category_name) values
 ( '3','Home & Living');
  insert into category(category_id,category_name) values
 ( '4','Wedding & Party');
  insert into category(category_id,category_name) values
 ( '5','Toys & Entertainment');
  insert into category(category_id,category_name) values
 ( '6','Art & Collectibles');
  insert into category(category_id,category_name) values
 ( '7','Vintage');
  insert into category(category_id,category_name) values
 ( '8','Top_Sellers');
  insert into category(category_id,category_name) values
 ( '9','Best_Rated'); 
 insert into category(category_id,category_name) values
 ( '10','Major_Discount');


  #********************************** Insert Product_Status ******************************************************
 insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '1','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '2','10','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '3','300','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '4','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '5','500','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '6','300','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '7','111','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '8','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '9','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '10','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '11','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '12','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '13','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '14','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '15','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '16','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '17','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '18','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '19','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '20','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '21','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '22','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '23','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '24','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '25','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '26','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '27','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '28','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '29','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '30','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '31','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '32','100','In Stock');
  insert into Product_Status(Product_Status_id,Quantity,Availability) values
 ( '33','100','In Stock');

   #********************************** Insert IN PRODUCT  ******************************************************
   #We will insert some rows in several categories 
   #we will choose the bar code as the ID because each product will have a unique bar code 
   
   
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560134000','Dried Flower Handmade Earrings','12.5',2,1,90407744);
   insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560987001','three circle silver earrings, circle earrings, silver earrings','27',3,2,90407744);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560561002','Custom Jordan Mid Smoke Grey','162.21',1,3,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560351098','Leather Crossbody bag','93',1,4,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131076','leather strappy sandals','37.5',1,5,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131042','Multicolored shoes Oxford shoes','125',1,6,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131065','Custom quote wooden box, Memory box','45.99',1,7,487642556);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131123','Wooden bottle opener, personalized wall bottle opener','29',1,8,487642556);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131234','Black and Gold Wedding Invites, Winter Wedding Invitations','3.2',2,9,604088174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131345','Gold Cake topper for Wedding, Personalized cake topper','17',3,10,702988174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131567','Minimal Planner Dashboard Transparent','7',1,11,702988174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131678','Stack the Cats! Cat lover gift','28',9,12,702988174);
     insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131789','Personalised toy car storage garage track ramp waldorf play house ','127',8,13,702988174);
   insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131091','Wood Veneer Retro Desk, Veneered Plywood Mid Century Desk','540',7,14,704033174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560456038','Wood Shelf - Essential Oil Shelf - Handmade Shelfs','28',6,15,747651599);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560671001','120mm AB-Color Hanging Crystals Prism Suncatcher for Windows Decoration','26',5,16,747651599);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560091111','Custom Dog Sculpture, Clay Dog Sculpture, Replica of your Pet','107',4,17,847652565);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131222','Kintsugi - Empty Blue','211',3,18,997652365);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131333','Acorn Vase','32',2,19,997652365);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131444','10x13.5 ft / Navy Oushak Rug','1487',1,20,997652365);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131555','Set of 12 Mismatched Tea Cups and Saucers','178.5',10,21,997652365);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131666','Ammonite Fossil Half 100% Genuine Specimen Madagascar Cretaceous','12.5',4,22,90407744);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131777','Vintage Edison Bulb','10',5,23,90407744);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131888','Mandala Jedi FLEECE LINED','79',5,24,90407744);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131999','Turkish Bathrobe, Turkish Cotton robe','34',6,25,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560112091','Open Back Dress, Midi Dress Manhattan One Shoulder','97',1,26,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131198','Anime Sweatshirt, Gifts For Anime','34',1,27,117642516);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560131276','Handmade eco friendly felted slippers from natural wool','48.6',1,28,702988174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560132344','Horloge murale rouge style vintage','60',7,29,702988174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560135983','Mohair Socks made without any Elastic','22',8,30,704033174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560112345','Father Son Matching shirts, Father and baby shirts','16',9,31,704033174);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560138899','Custom Wooden Handmade Music Box','51',10,32,847652565);
    insert into Product(Product_id,Product_Name,price,discount_id,Product_Status_id,designer_id) values
 ( '560137722','Date Night Ideas Generator Card Game for Couples','30.4',10,32,847652565);


#********************************** Insert IN Review  ******************************************************
  
  
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the shoes ,They are very original','107651588','560561002');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the shoes ,They are very original','100651500','560091111');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','2','A very bad product','107633530','560112091');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the product ','107651588','560112345');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','4','So good,still can be a bit more soft','109651588','560112345');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','woow ','117650000','560112345');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','3','My co-worker Knute has one of these. He says it looks smoky.','117651111','560131042');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','4','My neighbor Zoa has one of these. She works as a scribe and she says it looks wide.','117651118','560561002');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','2','Terrible experience','117651128','560131065');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','1','I Will never buy from this shop again','117651500','560131091');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','The Best thing I bought in my life','117651544','560131076');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','Just awsome','117651599','560131198');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','very beautiful','147651512','560131198');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I am in love with the colors','333651588','560561002');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','Best outfit ever','107651588','560131222');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','2','Dispointed very different than the pictures','107651588','560131234');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the shoes ,They are very original','555651588','560131444');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','1','I want my money back','444651588','560131555');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the shoes ,They are very original','764538364','560131567');
   
  Insert into review(date,rating,comment,client_id,product_id) values
 ( '2022-12-14','5','I really liked the shoes ,They are very original','777651588','560131666');

 
#********************************** Insert IN Shipment  ******************************************************
 
 
 insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '161407498','2020-10-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '247642517','2020-10-21',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '354308203','2020-10-22',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '482988167','2020-10-23',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '568640870','2020-10-24',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '602988185','2020-10-25',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '774857641','2020-10-26',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988145','2020-10-27',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988165','2020-10-28',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988168','2020-10-29',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '161407498','2020-10-30',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '247642517','2020-11-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '354308203','2020-12-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '482988167','2021-1-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '568640870','2021-2-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '602988185','2021-3-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '774857641','2021-4-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988145','2021-5-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988165','2021-6-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988168','2021-7-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '161407498','2021-8-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '247642517','2021-9-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '354308203','2021-10-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '482988167','2021-11-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '568640870','2021-12-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '602988185','2022-1-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '774857641','2022-2-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988145','2022-3-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988165','2022-4-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988168','2022-5-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '161407498','2022-6-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '247642517','2022-7-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '354308203','2022-8-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '482988167','2022-9-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '568640870','2022-10-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '602988185','2022-11-20',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '774857641','2022-12-01',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988145','2022-12-02',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988165','2022-12-02',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '842988168','2022-12-03',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '161407498','2022-12-04',4);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '247642517','2020-12-05',3);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '354308203','2020-12-06',2);
   insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
 ( '568640870','2020-12-07',1);

#********************************** Insert IN Invoice  ******************************************************

insert into invoice(issued_date,client_id,shipment_id) values
( '2020-10-18','100651500',1);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-19','100651500',2);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-20','100651500',3);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-21','100651520',4);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-22','100651520',5);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-23',103651510,6);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-24','107633530',7);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-25','107651588',8);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2020-10-26','109651588',9);
   insert into invoice(issued_date,client_id,shipment_id) values
 ('2020-10-27','113351588',10);
  insert into invoice(issued_date,client_id,shipment_id) values
 ('2020-10-28','117001588',11);
 insert into invoice(issued_date,client_id,shipment_id) values
 ('2020-11-18','117561588',12);
   insert into invoice(issued_date,client_id,shipment_id) values
 ('2020-12-18',117644588,13);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2021-1-18','117650000',14);
   insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-2-18','117650943',15);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-3-18','117651111',16);
  insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-4-18',117651118,17);
  insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-5-18','117651128',18);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-6-18','117651338',19);
 insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-7-18','117651338',20);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-8-18','117651412',21);
 insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-9-18','117651500',22);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-10-18','117651544',23);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-11-18',117651577,24);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2021-12-18',117651599,25);
insert into invoice(issued_date,client_id,shipment_id) values
 ('2022-1-18','117653981',26);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-2-18','117654458',27);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-3-18','117666666',28);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-4-18','999651908',29);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-5-18','897651588',30);
 insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-6-18','888651000',31);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-7-18','777651588',32);
 insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-8-18','444651588',33);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-9-18','117654458',34);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-10-18','117651577',35);
   insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-11-18','117651544',36);
 insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-11-30','117651412',37);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-11-30','100651500',38);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-01','103651510',39);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-02','107633530',40);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-02','100651500',41);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-03','100651520',42);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-04','103651510',43);
insert into invoice(issued_date,client_id,shipment_id) values
 ( '2022-12-05','100651500',44);

#******************************** Insert IN Product_Order  ******************************************************
insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '1','560091111',12);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '1','560112091',10);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '1','560112345',7);
insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '2','560091111',3);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '2','560112091',4);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '2','560131042',1);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '3','560131065',5);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '3','560131076',6);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '3','560131091',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '4','560131123',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '5','560131222',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '5','560131234',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '5','560131276',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '6','560131345',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '7','560131444',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '8','560131555',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '9','560131567',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '10','560131666',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '11','560131678',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '12','560131777',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '13','560131789',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '14','560131888',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '15','560131999',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '16','560132344',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '17','560134000',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '18','560135983',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '19','560137722',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '19','560138899',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '18','560351098',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '20','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '21','560456038',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '22','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '23','560561002',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '24','560671001',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '25','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '26','560671001',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '26','560561002',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '27','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '28','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '29','560456038',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '30','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '31','560138899',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '32','560091111',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '33','560134000',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '34','560131678',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '35','560131444',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '36','560091111',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '37','560112091',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '38','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '39','560131042',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '40','560131065',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560131076',1);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '42','560131091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '43','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '44','560131222',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '16','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '15','560131276',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '14','560091111',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '14','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560131333',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560131444',5);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '43','560131555',7);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '42','560131666',6);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560091111',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '44','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560131777',7);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '11','560131789',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '17','560112091',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '11','560131999',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '11','560134000',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '41','560561002',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '5','560671001',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '39','560987001',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '33','560131234',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '40','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '15','560131333',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '14','560112345',1);
  insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '32','560112345',2);
 insert into Product_Order(invoice_id,Product_id,Quantity) values
 ( '32','560131444',2);

#********************************** Insert IN Product_Order  ******************************************************
 
  
  insert into Product_category(Product_id,category_id) values
 ( '560091111','2');
   insert into Product_category(Product_id,category_id) values
 ( '560091111','10');
    insert into Product_category(Product_id,category_id) values
 ( '560091111','8');
     insert into Product_category(Product_id,category_id) values
 ( '560112091','2');
      insert into Product_category(Product_id,category_id) values
 ( '560112345','3');
      insert into Product_category(Product_id,category_id) values
 ( '560131042','2');
       insert into Product_category(Product_id,category_id) values
 ( '560131065','6');
insert into Product_category(Product_id,category_id) values
( '560131076','2');
insert into Product_category(Product_id,category_id) values
( '560131091','10');
insert into Product_category(Product_id,category_id) values
( '560131091','3');
 insert into Product_category(Product_id,category_id) values
( '560131123','3');
 insert into Product_category(Product_id,category_id) values
( '560131198','2');
 insert into Product_category(Product_id,category_id) values
( '560131222','7');
 insert into Product_category(Product_id,category_id) values
( '560131222','9');
 insert into Product_category(Product_id,category_id) values
( '560131234','4');
 insert into Product_category(Product_id,category_id) values
( '560131276','7');
 insert into Product_category(Product_id,category_id) values
( '560131333','3');
 insert into Product_category(Product_id,category_id) values
( '560131345','4');
 insert into Product_category(Product_id,category_id) values
( '560131444','7');
 insert into Product_category(Product_id,category_id) values
( '560131555','10');
 insert into Product_category(Product_id,category_id) values
( '560131555','7');
 insert into Product_category(Product_id,category_id) values
( '560131567','4');
 insert into Product_category(Product_id,category_id) values
( '560131567','10');
 insert into Product_category(Product_id,category_id) values
( '560131666','3');
 insert into Product_category(Product_id,category_id) values
( '560131666','10');
 insert into Product_category(Product_id,category_id) values
( '560131678','10');
 insert into Product_category(Product_id,category_id) values
( '560131678','5');
 insert into Product_category(Product_id,category_id) values
( '560131777','10');
 insert into Product_category(Product_id,category_id) values
( '560131777','7');
 insert into Product_category(Product_id,category_id) values
( '560131789','5');
 insert into Product_category(Product_id,category_id) values
( '560131888','10');
 insert into Product_category(Product_id,category_id) values
( '560131888','1');
 insert into Product_category(Product_id,category_id) values
( '560131999','10');
 insert into Product_category(Product_id,category_id) values
( '560131999','1');
 insert into Product_category(Product_id,category_id) values
( '560132344','10');
 insert into Product_category(Product_id,category_id) values
( '560132344','3');
 insert into Product_category(Product_id,category_id) values
( '560134000','1');
 insert into Product_category(Product_id,category_id) values
( '560135983','2');
 insert into Product_category(Product_id,category_id) values
( '560137722','10');
 insert into Product_category(Product_id,category_id) values
( '560137722','4');
 insert into Product_category(Product_id,category_id) values
( '560138899','6');
 insert into Product_category(Product_id,category_id) values
( '560138899','10');
 insert into Product_category(Product_id,category_id) values
( '560351098','6');
 insert into Product_category(Product_id,category_id) values
( '560456038','3');
insert into Product_category(Product_id,category_id) values
( '560456038','10');
insert into Product_category(Product_id,category_id) values
( '560561002','1');
insert into Product_category(Product_id,category_id) values
( '560671001','10');
insert into Product_category(Product_id,category_id) values
( '560987001','1');





# *** Testting the "Out of stock " Trigger ***
-- UPDATE Product_Status
-- SET quantity =450
-- WHERE product_status_id=5;
-- SELECT * FROM product_status ;
 

-- *** Testing the Updated_Invoice Trigger
-- select * from invoice where invoice_id = 4 or invoice_id=3;
-- insert into product_order (invoice_id, Product_id, Quantity) values ('4', '560091111','20');
 -- insert into product_order (invoice_id, Product_id, Quantity) values ('4', '560132344','20');
 -- insert into product_order (invoice_id, Product_id, Quantity) values ('3', '560132344','10');
 -- select * from invoice where invoice_id = 4 or invoice_id=3;



# *** Testing the Delivery fees Trigger ****

-- select * from client where client_id='117650943';
-- select *from location where location_id = 53 ;
-- ||A client outside lisbon ||
 -- select * from client where client_id='100651500';
 -- select *from location where location_id = 16 ;
-- ||A client inside lisbon||

-- insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
-- ( '568640870','2022-12-20',1);
-- select * from shipment ;
-- insert into invoice(issued_date,client_id,shipment_id) values
-- ('2021-2-19','117650943',45);
-- select * from shipment where shipment_id=45;

-- insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
-- ( '568640870','2022-12-21',1);
-- insert into invoice(issued_date,client_id,shipment_id) values
-- ('2021-2-19','100651500',46);
-- select * from shipment where shipment_id=46;


#**** Testing the free delivery Trigger ****
-- select * from shipment ;
-- Let's test on shipment id=47
-- We already know that client_id 117650943 is from outside lisbon 

-- insert into shipment(Delivery_Men_id,shipment_date,Shipment_Status_id) values
-- ( '568640870','2023-01-01',1);
-- select * from shipment ;
-- insert into invoice(issued_date,client_id,shipment_id) values
-- ('2021-2-19','117650943',47);
-- select * from invoice;
-- insert into Product_Order(invoice_id,Product_id,Quantity) values
-- ( '45','560131091',20);
-- select * from invoice where shipment_id=47;
-- select * from shipment where shipment_id=47;


# *** Testting the "Product_update " Trigger ***
-- UPDATE Product
-- SET price =100
-- WHERE product_id=560112091;
-- UPDATE Product
-- SET discount_id=3
-- WHERE product_id=560112091;
-- SELECT * FROM log ;

-- invoice date / invoice id 
-- client name adress city zip
-- company name -company email -adress
-- SUbTotal-Discount-Dileveryfees-Total
drop view if exists Head_and_total;
create view Head_and_total as 
select   i.issued_date AS 'DATE OF ISSUE',
		 i.invoice_id AS 'INVOICE NUMBER',
         concat(c.first_name,' ',c.last_name) AS 'CLIENT NAME' ,
         concat(l.adress,' ',l.street) AS 'STREET ADRESS',
         concat(l.city,' ',l.postal_code) AS 'CITY,ZIP CODE',
         'HANDMADE CRAFT SHOP' AS 'STORE NAME',
         '35 RUA ACTOR TABORDA' AS 'WAREHOUSE ADRESS',
         'HANDMADE@GROUPE17.TN' AS 'EMAIL',
         i.total_value AS 'SUB TOTAL',
		 (select sum((d.discount_percentage*price)/100*quantity)) As 'TOTAL DISCOUNT',
         sh.shipment_fees As 'SHIPMENT FEES',
         total_value-(select sum((d.discount_percentage*price)/100*quantity)) +shipment_fees As TOTAL
         from product_order po
         join invoice i on po.invoice_id=i.invoice_id
	     join product p on p.product_id=po.product_id
         join discount d on d.discount_id=p.discount_id
         join client c on c.client_id=i.client_id
         join location l on c.location_id=l.location_id
         join shipment sh on sh.shipment_id=i.shipment_id
         Where i.invoice_id=2;
-- Testing Head_and_total View
-- select * from Head_and_total;

         
       
# Details view for a spesefic invoice
drop view if exists Details;
create view Details as 
select   p.product_name AS 'PRODUCT DESCRIPTION',
         concat(p.price,"€") AS 'UNIT PRICE',
         concat(d.discount_percentage," %")As 'ITEM DISCOUNT',
         po.quantity AS 'QUANTITY ORDERED' ,
         concat(((100-d.discount_percentage)*po.quantity*p.price)/100 ,'€') as "PRICE AFTER DISCOUNT" 
         from product_order po
	     join product p on p.product_id=po.product_id
         join discount d on d.discount_id=p.discount_id
          Where po.invoice_id=1 ;
        
                                      
-- Test Details view
-- select * from Details


