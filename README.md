# sqoop-flume

## Ejercicios Sqoop
	MySQL User: root
	MySQL Password: cloudera

### Ejercicio 1 - lista-databases
Mediante Sqoop conectate a la base de datos MySQL local y saca un listado de todas bases de datos que hay. 


### Ejercicio 2 - list-tables
Mediante Sqoop conectate a la base de datos MySQL local y saca un listado las tablas de la base de datos "mysql".


### Ejercicio 3 - import
#### Apartado A
Selecciona una de las tablas que hemos listado en el ejercicio anterior e importala al HDFS con Sqoop.

#### Apartado B
¿En qué carpeta de HDFS hemos importado la tabla?.

#### Apartado C
¿Qué ocurre cuando se vuelve a importar la misma tabla? (Sin cambiar nada).

#### Apartado D
Haz el mismo import incluyendo un directorio de destino.


### Ejercicio 4 - import
Antes de comenzar el Ejercicio 4 entra en la carpeta sqoop que encontrarás en este directorio y ejecuta el siguiente comando:

	mysql -u root -p < sql1.sql

Con ello habremos creado la tabla miTienda.compras que contiene los datos que usaremos para el ejercicio. 

#### Apartado A
Importa la tabla completa en el directorio "miTienda_compras"

#### Apartado B
Importa al HDFS de la tabla compras los registros cuyo id_compra sea mayor que 5. Y guardalo en un directorio llamado "miTienda_compras_id2".

#### Apartado C
Importa al HDFS la tabla compras en formato avro las columnas "desc_producto" y "precio", y cuyo directorio de destino sea "miTienda_compras_avro".

#### Apartado D
Importa al HDFS de la tabla compras los registros cuyo precio sea mayor que 20, que su formato sea parquet y cuyo directorio de destino sea "miTienda_compras_parquet".


### Ejercicio 5 - import --incremental
Antes de comenzar el Ejercicio 5 entra en la carpeta sqoop que encontrarás en este directorio y ejecuta el siguiente comando:

	mysql -u root -p < sql2.sql

Con ello habremos insertado nuevos registros en la tabla que nos ayudaran a trabajar con el import incremental. 

#### Apartado A
Partiendo de la base del Ejercicio 4 Apartado A, haz un import incremental de los registros nuevos con el modo append.

#### Apartado B
Partiendo de la base del Ejercicio 4 Apartado B, haz un import incremental de los registros nuevos con el modo lastmodified.


### Ejercicio 6 - import --hive
Importa la tabla compras a hive.


## Ejercicios Flume
### Ejercicio 1
Crea un agente Flume cuyo source sea telnet, su channel esté en memoria y su sink sea log mostrado en la consola.
Y comprueba que el agente funciona enviando mensajes mediante el comando de consola telnet. 

### Ejercicio 2
Crea un agente Flume cuyo source sea una carpeta a la cual irán llegando ficheros, su channel esté en disco y su sink sea una carpeta en el HDFS.
Y comprueba que el agente funciona revisando el log y la carpeta de HDFS. 