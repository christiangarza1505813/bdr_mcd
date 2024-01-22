# Tarea 1
## Describir una base de datos y sus relaciones con la que trabajar durante el tetramestre.

### Descripción: 
#### La base de datos que elegí se llama "Data_Consumer" la cual estoy utilizando actualmente en mi trabajo. Para efectos del ejercicio omitiré datos personales. Data_Consumer me da información transaccional de los clientes en un periodo determinado y actualmente la utilizamos para monitorear el comportamiento  de los clientes en base a sus transacciones. 

#### Esta tabla se compone de las siguientes variables: 

##### - WalletUuid: Variable de tipo caracter. Esta variable es el identificador de los clientes. Existe un valor único para cada cliente. 
##### - Calc_ParentTransactionUuid: Variable de tipo caracter. Esta variable es el identificador de cada transacción. Existe un valor único para cada transacción. 
##### - TransactionTypeDsEn: Variable de tipo caracter. Muestra el tipo de transacción realizada. 
##### - Attribute: Variable de tipo caracter. Muestra si la transacción realizada (TransactionTypeDsEn) se realizó con tarjeta o en banco. 
##### - Status: Variable de tipo caracter. Muestra el estatus de la transacción realizada (TransactionTypeDsEn). Ejemplo: nos muestra si la transacción esta completada o rechazada.
##### - Returned: Variable de tipo entero. Muestra un 1 si la variable se retornó o un 0 si no se ha retornado.
##### - UpdatedAt: Variable de tipo fecha. Muestra la fecha y hora en la que se realizó la transacción.
##### - Amount: Variable de tipo flotante. Muestra el monto de la transacción realizada. 


### Relaciones(1): 
#### La base de datos "Data_Consumer" esta relacionada con la base de datos "IssuedCards" **por medio de la variable "WalletUuid".** IssuedCards brinda información de las tarjetas que los clientes han solicitado.

#### Esta tabla se compone de las siguientes variables: 

##### - WalletUuid: Descrita en la sección anterior.
##### - CardUuid: Variabale de tipo caracter. Es el identificador de cada tarjeta. Existe un valor único para cada tarjeta.
##### - ProductId: Variable de tipo entero. Muestra si la tarjeta es fisica (2010) o tarjeta virtual (2009).
##### - Status: Variable de tipo caracter. Muestra el estatus actual de la tarjeta. (Ejemplo: Activa, Enviada, Cancelada, etc.)
##### - CreatedAt: Variable de tipo fecha. Muestra la fecha y hora en la que se registro el ultimo estatus de la tarjeta.

### Relaciones(2):
#### La base de datos "Data_Consumer" esta relacionada con la base de datos "WalletHistory" **por medio de la variable "WalletUuid".** WalletHistory nos dice en que fecha el cliente se registró a la plataforma.

##### - WalletUuid: Descrita en la sección anterior.
##### - Updated At: Variable de tipo fecha. Muestra la fecha y hora en la que el cliente se registró a la plataforma. 

### Adicional: Las relaciones descritas anteriormente se realizan por medio de "power query".


