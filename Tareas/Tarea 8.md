# Tarea 8

## Join
### Esta vista me permite visualizar los la cantidad de remesas (data_consumer) que los 
### usuarios que se registraron en diciembre 2023 (wallet history) han realizado.
### El Join se hace por medio de la variable "WalletUuid"

###### CREATE VIEW Remsas_usuarios_Diciembre_2023 as
###### SELECT wh.WalletUuid, COUNT(dc.TransactionTypeDsEn) AS Num_Remesas
###### FROM Wallet_History wh
###### JOIN data_consumer dc ON wh.WalletUuid = dc.WalletUuid
###### WHERE YEAR(wh.UpdatedAt) = 2023 AND MONTH(wh.UpdatedAt) = 12
###### AND dc.TransactionTypeDsEn = 'International Transfer'
###### GROUP BY wh.WalletUuid
###### order by Num_Remesas desc;


## Left Join
### En esta vista se visualizan la cantidad de tarjetas (Issued_cards) que
### tiene cada usuario que transacciona (Data_consumer)
### El Left Join se hace por medio de la variable "WalletUuid"
###### CREATE VIEW Tarjetas_usuario AS
###### SELECT dc.WalletUuid, COUNT(DISTINCT ic.CardUuid) AS Num_Cards
###### FROM data_consumer dc
###### left JOIN Issued_Cards ic ON dc.WalletUuid = ic.WalletUuid
###### GROUP BY dc.WalletUuid
###### order by Num_Cards DESC;

## Right Join
### Esta vista me permita visualizar las tarjetas que si se estan utilizando.
### Para esto necesito unirle a esa tabla los walletUuids con tipo de transaccion igual a
### Card Debit.

###### CREATE VIEW Tarjetas_en_uso as
###### SELECT distinct dc.WalletUuid, ic.CardUuid
###### FROM data_consumer dc
###### RIGHT JOIN Issued_Cards ic ON dc.WalletUuid = ic.WalletUuid
###### where ic.CardUuid is not null
###### AND dc.TransactionTypeDsEn = 'Card Debit Transaction';
###### select * from tarjetas_en_uso;

## Subconsulta
### La primera consulta que hago es para saber el monto promedio de remesas enviadas por usuario. 
### Multiplico por -1 para obtener el numero en positivo. Despues, este numero lo utilizo para validar
### la siguiente consulta y filtrar por usuarios, monto, transaccion y fecha cuyo monto sea mayor al promedio.
### Esta subconsulta responde a la pregunta: Quienes y cuando han realizado remesas por encima del promedio?
###### CREATE VIEW Subquery_Remesas as
###### SELECT WalletUuid, Amount*-1 as Amount2, TransactionTypeDsEn, UpdatedAt 
###### FROM data_consumer
###### WHERE Amount*-1 > (SELECT AVG(Amount)*-1  FROM data_consumer WHERE TransactionTypeDsEn = 'International Transfer')
###### AND TransactionTypeDsEn = 'International Transfer';
###### select * from subquery_remesas ;
