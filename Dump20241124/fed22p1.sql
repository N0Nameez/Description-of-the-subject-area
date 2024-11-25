use outlet;

CREATE TABLE IF NOT EXISTS `client` (
  `IdClient` INT NOT NULL AUTO_INCREMENT,
  `Details` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` CHAR(11) NULL DEFAULT NULL,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `ContactPerson` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`IdClient`));

CREATE TABLE IF NOT EXISTS `outlet` (
  `IdOutlet` INT NOT NULL AUTO_INCREMENT,
  `Floor` INT NULL DEFAULT NULL,
  `Conditioner` TINYINT NULL DEFAULT NULL,
  `Cost` INT NULL DEFAULT NULL,
  `Square` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdOutlet`));

CREATE TABLE IF NOT EXISTS `contractdetails` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `IdContract` INT NULL,
  `DateStartArend` DATE NULL DEFAULT NULL,
  `DateEndArend` DATE NULL DEFAULT NULL,
  `IdOutlet` INT NULL,
  INDEX `fkIdOutlet_idx` (`IdOutlet` ASC) VISIBLE,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fkContractDetailsOutlet`
    FOREIGN KEY (`IdOutlet`)
    REFERENCES `bd`.`outlet` (`IdOutlet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `contract` (
  `IdContract` INT NOT NULL,
  `IdClient` INT NOT NULL,
  PRIMARY KEY (`IdContract`, `IdClient`),
  INDEX `fkContractClient_idx` (`IdClient` ASC) VISIBLE,
  CONSTRAINT `fkContractClient`
    FOREIGN KEY (`IdClient`)
    REFERENCES `bd`.`client` (`IdClient`),
  CONSTRAINT `fkContractContractDetails`
    FOREIGN KEY (`IdContract`)
    REFERENCES `bd`.`contractdetails` (`IdContract`));

select * FROM client;

SELECT CompanyName, ContactPerson FROM client;

SELECT distinct Details FROM client;

SELECT CompanyName, ContactPerson FROM client LIMIT 2;

SELECT CompanyName, ContactPerson FROM client LIMIT 2,3;

SELECT CompanyName as 'Название компании', ContactPerson as 'Контактное лицо' FROM client;

SELECT * FROM client 
where Details='Сбербанк';

SELECT * FROM client 
where IdClient between 7 and 8;

SELECT * FROM client 
where CompanyName between 'A' and 'S';

SELECT * FROM client 
where Details not in ('Сбербанк');

SELECT * FROM client 
where CompanyName not like 'S%';

SELECT * FROM client 
where CompanyName like '_k%';

SELECT * FROM client 
where CompanyName is NOT NULL;

SELECT * FROM client 
order by CompanyName DESC, Phone DESC;

SELECT * FROM client
where Details not in ('Сбербанк')
order by PubYear DESC, Rating DESC;

SELECT count(Details) FROM client;

SELECT MAX(Phone), MIN(Phone) FROM client;

SELECT Details, CompanyName, count(*) FROM client
where Details not in ('Сбербанк')
group by Details, CompanyName;

SELECT Details, CompanyName, count(*) FROM client
where Details not in ('Сбербанк')
group by Details, CompanyName
having avg(phone)>7;

SELECT Details, CompanyName, count(*) FROM client
where Details not in ('Сбербанк')
group by Details, CompanyName
having avg(phone)>7
order by avg(Phone);
