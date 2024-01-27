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

### Adicional: 
#### Las relaciones descritas anteriormente se realizan por medio de "power query".


## Sistema gestor de base de datos.

#### De los distintos SGBD que existen (Oracle, MySQL, MongoDB, etc) con el que me encuentro más relacionado es con MySQL. Esto es porque en uno de mis trabajos anteriores tuve que aprender un poco de este gestor para poder realizar algunas consultas en las distintas bases de datos. Algunas consultas consistian en realizar algunos joins, de los cuales el que más utilizaba era "left join" aunque entiendo que existen tambien "inner join", "right join" y "cross join". El objetivo de utilizar estos joins es para combinar distintas bases de datos, esto por medio de un key o una variable unica para cada dato.  

#### La ventaja de utilizar un gestor de base de datos es que se cuenta con metodos de seguridad para proteger los datos ya que en muchos casos, contienen información sensible. Otra ventaja es que varios usuarios pueden acceder a la misma información de manera simultanea. Contar un SGBD nos garantiza que exista consistencia en los datos y que la información es confiable. 
#### Sin embargo, al utilizar un SGBD es necesario tener una noción de programación para realizar consultas de manera optima. Esta necesidad surge porque, al contar con una gran cantidad de información, si todos los usuarios extraen todos los datos al mismo tiempo, generara retrasos en la consulta y en la mayoria de los casos, no todos los usuarios requieren extraer toda la información para sus propositos. 

#### En mi actual trabajo, el software que utilizo principalmente se llama "Power BI" y lo utilizo para visualización de datos. Con este programa me contecto directamente a las bases de datos en SQL utilizando una consulta muy general (select * from). Sin embargo, creo firmemente que optimizando la consulta disminuire los tiempos de carga al actualizar la visualización de datos. 

### Fuentes:

##### MySQL joins. (s. f.). https://www.w3schools.com/mysql/mysql_join.asp
##### Características de una base de datos - Kodigo. (s. f.). Kodigo. https://kodigo.org/caracteristicas-de-una-base-de-datos/

