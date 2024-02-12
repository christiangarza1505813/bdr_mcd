CREATE database tarea4;
use tarea4;
create table if not exists data_consumer(
	WalletUuid varchar(30) primary key,
	Calc_ParentTransactionUuid VARCHAR(30),
	Amount float(24,2),
	TransactionTypeDsEn VARCHAR(30),
	UpdatedAt datetime,
	Returned int,
	Attribute_1 VARCHAR(30),
	Status VARCHAR(30)
);

create table if not exists IssuedCards(
	WalletUuid varchar(30),
	foreign key (WalletUuid) references data_consumer(WalletUuid),
	CardUuid varchar (30),
	Status varchar (30),
	ProductId int,
	CreatedAt datetime
);

create table if not exists WalletHistory(
	WalletUuid varchar(30),
	foreign key (WalletUuid) references data_consumer(WalletUuid),
	UpdatedAt datetime
);



show tables;
describe data_consumer ;

INSERT INTO data_consumer (WalletUuid, Calc_ParentTransactionUuid, TransactionTypeDsEn, Amount, UpdatedAt, Returned, Attribute_1)
VALUES
('002e779a', '0ae9c488', 'Card Debit Transaction', -35.39, '2023-10-11', 0, NULL),
('03017ac1', '4a91297a', 'Card Debit Transaction', -5.13, '2023-09-30', 0, NULL),
('08bd6080', '1fbe626c', 'Card Debit Transaction', -88.96, '2024-01-30', 0, NULL),
('0bdb1fe8', '16a99adb', 'Card Debit Transaction', -6.23, '2024-01-21', 0, NULL),
('0ee00c74', 'fb598842', 'Load money', 39.97, '2024-01-22', 0, 'CARD'),
('0f4574a7', '17760876', 'Card Debit Transaction', -86.81, '2024-01-29', 0, NULL),
('112a809c', '782a8248', 'Card Credit from VisaReadyLink', 200, '2023-09-16', 0, NULL),
('1266e1d8', 'd1b69b93', 'Load money', 20.5, '2024-01-22', 0, 'CARD'),
('1361d8b5', '60cb9c1d', 'Card Debit Transaction', -8.96, '2023-11-22', 0, NULL),
('198795dd', 'dbb09208', 'International Transfer', -35, '2024-01-02', 0, NULL),
('1ecf9bbd', '683583f6', 'Card Withdrawal from ATM', -403, '2024-01-29', 0, NULL),
('1ee176aa', 'f6f7c501', 'Card Debit Transaction', -8.81, '2023-12-23', 0, NULL),
('1f1f4e15', '87ece85e', 'Card Debit Transaction', -16.04, '2023-12-05', 0, NULL),
('2196f11c', 'c530ec1d', 'International Transfer', -676.84, '2023-11-01', 0, NULL),
('21c3ebcd', '434b0138', 'Card Credit from VisaReadyLink', 60, '2023-12-05', 0, NULL),
('261c27ec', '7a62c547', 'International Transfer', -180, '2024-01-20', 0, 'CARD_PASSTHROUGH - COMPLETED'),
('2658f7c8', '6aa99c95', 'Card Withdrawal from ATM', -12, '2023-12-22', 0, NULL),
('2666a6d2', '9de2dc02', 'International Transfer', -31.35, '2024-01-16', 0, 'CARD_PASSTHROUGH - COMPLETED'),
('27914232', '3c626520', 'International Transfer', -60, '2023-11-30', 0, 'CARD_PASSTHROUGH - COMPLETED'),
('27e46a51', 'bbbee432', 'Card Credit Transaction', 147.38, '2023-12-23', 0, NULL),
('2822789f', 'e21093be', 'Card Debit Transaction', -2.5, '2023-06-28', 0, NULL),
('28b94ad2', '3d92b47d', 'Transfer from External Source', 1340.49, '2023-11-24', 0, NULL),
('2bb4b891', 'd2f1d357', 'Card Debit Transaction', -120, '2023-12-24', 0, NULL),
('3c559334', 'a232e086', 'Card Debit Transaction', -17.77, '2023-09-19', 0, NULL),
('3f238fab', 'd12cff03', 'Load money', 20, '2023-09-13', 0, 'BANK'),
('44fe41da', '4b5e2abc', 'Card Debit Transaction', -17.73, '2023-12-17', 0, NULL),
('463d0695', '66e42a76', 'Card Debit Transaction', -16.98, '2024-01-27', 0, NULL);

INSERT INTO IssuedCards (WalletUuid, CardUuid, Status, ProductId, CreatedAt)
VALUES
('002e779a', 'a27671fc', 'SET_TO_EMBOSS', 2010, '2023-09-26 21:16'),
('03017ac1', 'ae8bf378', 'ACTIVE', 2009, '2023-09-28 18:35'),
('03017ac1', 'd63bd909', 'SET_TO_EMBOSS', 2010, '2023-10-20 20:26'),
('08bd6080', '81d7929e', 'ACTIVE', 2009, '2023-10-14 02:34'),
('08bd6080', 'f2ffedd2', 'SET_TO_EMBOSS', 2010, '2023-10-14 02:37'),
('0bdb1fe8', '91c9c212', 'SET_TO_EMBOSS', 2010, '2023-09-24 13:09'),
('0ee00c74', 'aee4d575', 'ACTIVE', 2009, '2024-02-06 21:23'),
('0f4574a7', 'cefa3268', 'SET_TO_EMBOSS', 2010, '2023-08-16 17:33'),
('0f4574a7', 'f8587ef0', 'ACTIVE', 2009, '2023-08-16 14:27'),
('112a809c', '9b1119d9', 'SET_TO_EMBOSS', 2010, '2023-07-30 14:30'),
('1266e1d8', '31d9764e', 'SET_TO_EMBOSS', 2010, '2023-12-02 14:36'),
('1361d8b5', '69da3bab', 'READY_TO_ACTIVATE', 2010, '2023-09-06 07:06'),
('198795dd', '20329b03', 'SET_TO_EMBOSS', 2010, '2023-08-30 20:53'),
('198795dd', 'c047ff1e', 'ACTIVE', 2009, '2023-08-30 20:47'),
('1ecf9bbd', '528d879e', 'SET_TO_EMBOSS', 2010, '2023-11-14 16:29'),
('1ee176aa', '6acb6ee0', 'READY_TO_ACTIVATE', 2010, '2023-12-07 03:25'),
('1ee176aa', 'ead07f8d', 'ACTIVE', 2009, '2023-12-07 03:26'),
('1f1f4e15', '3a11fae6', 'SET_TO_EMBOSS', 2010, '2023-10-10 10:30'),
('2196f11c', 'b90a02ee', 'SET_TO_EMBOSS', 2010, '2023-09-01 11:19'),
('21c3ebcd', 'c009e7d5', 'SET_TO_EMBOSS', 2010, '2023-09-19 23:22'),
('261c27ec', '6cb40159', 'ACTIVE', 2009, '2023-11-22 03:30'),
('261c27ec', 'cd765472', 'SET_TO_EMBOSS', 2010, '2023-11-22 18:53'),
('2658f7c8', '407cb2da', 'SET_TO_EMBOSS', 2010, '2023-12-06 21:48'),
('2666a6d2', 'ae9a8156', 'SET_TO_EMBOSS', 2010, '2023-10-29 00:59'),
('27e46a51', 'c8936236', 'SET_TO_EMBOSS', 2010, '2023-10-16 18:41'),
('2822789f', '2f2f4210', 'READY_TO_ACTIVATE', 2010, '2023-06-19 23:43'),
('2822789f', '3c3af66e', 'ACTIVE', 2009, '2023-05-31 14:31'),
('2822789f', '418bce9e', 'READY_TO_ACTIVATE', 2010, '2023-06-28 13:53'),
('2822789f', 'aad8f013', 'READY_TO_ACTIVATE', 2010, '2023-07-17 01:22'),
('2822789f', 'fb5454ab', 'READY_TO_ACTIVATE', 2010, '2023-05-31 14:34'),
('28b94ad2', 'd215ec1d', 'SET_TO_EMBOSS', 2010, '2023-08-28 21:04'),
('2bb4b891', 'aab5ae6a', 'SET_TO_EMBOSS', 2010, '2023-08-11 17:23'),
('3c559334', '2d94f766', 'READY_TO_ACTIVATE', 2010, '2023-07-26 07:18'),
('3f238fab', '75b0ff39', 'SET_TO_EMBOSS', 2010, '2023-05-29 21:56'),
('44fe41da', '06896a10', 'SET_TO_EMBOSS', 2010, '2023-10-16 18:12'),
('44fe41da', '9066c00a', 'CANCELED', 2010, '2023-10-16 17:57'),
('44fe41da', '957cb2c6', 'CANCELED', 2010, '2023-10-16 17:24'),
('44fe41da', '9c98cdc6', 'SET_TO_EMBOSS', 2010, '2023-10-01 21:54'),
('44fe41da', 'de598374', 'ACTIVE', 2009, '2023-10-01 19:54'),
('463d0695', 'bfe5ccae', 'SET_TO_EMBOSS', 2010, '2023-11-27 17:56')
;

INSERT INTO WalletHistory (WalletUuid, UpdatedAt)
VALUES
('002e779a', '2023-09-22 00:00:00'),
('03017ac1', '2023-09-28 00:00:00'),
('08bd6080', '2023-10-13 00:00:00'),
('0bdb1fe8', '2023-09-24 00:00:00'),
('0ee00c74', '2023-09-22 00:00:00'),
('0f4574a7', '2023-08-10 00:00:00'),
('112a809c', '2023-07-30 00:00:00'),
('1266e1d8', '2023-12-02 00:00:00'),
('1361d8b5', '2023-09-06 00:00:00'),
('198795dd', '2023-08-30 00:00:00'),
('1ecf9bbd', '2023-11-14 00:00:00'),
('1ee176aa', '2023-12-06 00:00:00'),
('1f1f4e15', '2023-10-10 00:00:00'),
('2196f11c', '2023-08-18 00:00:00'),
('21c3ebcd', '2023-09-19 00:00:00'),
('261c27ec', '2023-11-21 00:00:00'),
('2658f7c8', '2023-12-06 00:00:00'),
('2666a6d2', '2023-10-28 00:00:00'),
('27914232', '2023-10-15 00:00:00'),
('27e46a51', '2023-10-16 00:00:00'),
('2822789f', '2023-05-31 00:00:00'),
('28b94ad2', '2023-08-28 00:00:00'),
('2bb4b891', '2023-08-11 00:00:00'),
('3c559334', '2023-07-25 00:00:00'),
('3f238fab', '2023-05-29 00:00:00'),
('44fe41da', '2023-09-30 00:00:00'),
('463d0695', '2023-11-27 00:00:00')
;
	
select * from data_consumer;
select * from issuedcards;
select * from wallethistory;

SELECT *
FROM data_consumer dc
INNER JOIN IssuedCards ic ON dc.WalletUuid = ic.WalletUuid
where ic.Status = "ACTIVE";