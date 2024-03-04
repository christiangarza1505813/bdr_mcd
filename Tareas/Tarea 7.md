# Tarea 7

#### Primero veo una descripción de los datos para validar que esten en el formato correcto. 
#### En caso de requerir alguna corrección, hago las modificaciones necesarias. 
###### describe data_consumer ;
###### ALTER TABLE data_consumer
###### MODIFY UpdatedAt DATETIME,
###### MODIFY Returned INT;
###### describe data_consumer ;

#### En el caso de "Attribute_1" lleno los espacios en blanco o nullos con el valor "Wallet"
###### UPDATE data_consumer SET Attribute_1 = COALESCE(Attribute_1, 'Wallet') WHERE Attribute_1 IS NULL OR Attribute_1 = '';
###### select distinct Attribute_1  from data_consumer;

#### Repito los mismos pasos en las otras tablas
###### describe wallet_history ;
###### alter table wallet_history 
###### modify UpdatedAt DATETIME;
###### describe wallet_history ;

###### describe issued_cards ;
###### alter table issued_cards 
###### modify CreatedAt DATETIME;
###### describe issued_cards;

#### Al final de cada tabla vuelvo a utilizar describe para validar que los datos esten en el formato correcto