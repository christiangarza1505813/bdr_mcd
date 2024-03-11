CREATE database tarea4;
use tarea4;
create table if not exists data_consumer(
	WalletUuid varchar(40) primary key,
	Calc_ParentTransactionUuid VARCHAR(40),
	Amount float(24,2),
	TransactionTypeDsEn VARCHAR(40),
	UpdatedAt datetime,
	Returned int,
	Attribute_1 VARCHAR(30),
	Status VARCHAR(30)
);

create table if not exists Issued_Cards(
	WalletUuid varchar(40),
	foreign key (WalletUuid) references data_consumer(WalletUuid),
	CardUuid varchar (40),
	Status varchar (40),
	ProductId int,
	CreatedAt datetime
);

create table if not exists Wallet_History(
	WalletUuid varchar(40),
	foreign key (WalletUuid) references data_consumer(WalletUuid),
	UpdatedAt datetime
);

select * from wallet_history ;

CREATE VIEW Remsas_usuarios_Diciembre_2023 as
SELECT wh.WalletUuid, COUNT(dc.TransactionTypeDsEn) AS Num_Remesas
FROM Wallet_History wh
JOIN data_consumer dc ON wh.WalletUuid = dc.WalletUuid
WHERE YEAR(wh.UpdatedAt) = 2023 AND MONTH(wh.UpdatedAt) = 12
AND dc.TransactionTypeDsEn = 'International Transfer'
GROUP BY wh.WalletUuid
order by Num_Remesas desc;
select * from Remsas_usuarios_Diciembre_2023;


CREATE VIEW Tarjetas_usuario AS
SELECT dc.WalletUuid, COUNT(DISTINCT ic.CardUuid) AS Num_Cards
FROM data_consumer dc
left JOIN Issued_Cards ic ON dc.WalletUuid = ic.WalletUuid
GROUP BY dc.WalletUuid
order by Num_Cards DESC;
select * from tarjetas_usuario;
drop view Tarjetas_usuario;


CREATE VIEW Tarjetas_en_uso as
SELECT distinct dc.WalletUuid, ic.CardUuid
FROM data_consumer dc
RIGHT JOIN Issued_Cards ic ON dc.WalletUuid = ic.WalletUuid
where ic.CardUuid is not null
AND dc.TransactionTypeDsEn = 'Card Debit Transaction';
select * from tarjetas_en_uso;

CREATE VIEW Subquery_Remesas as
SELECT WalletUuid, Amount*-1 as Amount2, TransactionTypeDsEn, UpdatedAt 
FROM data_consumer
WHERE Amount*-1 > (SELECT AVG(Amount)*-1  FROM data_consumer WHERE TransactionTypeDsEn = 'International Transfer')
AND TransactionTypeDsEn = 'International Transfer';
select * from subquery_remesas ;

