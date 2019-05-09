# sqoop-flume Soluciones

## Ejercicios Sqoop

### Ejercicio 1
sqoop list-databases --connect jdbc:mysql://localhost --username root --password cloudera

### Ejercicio 2
sqoop list-tables --connect jdbc:mysql://localhost/mysql --username root --password cloudera

### Ejercicio 3
#### Apartado A
sqoop import --connect jdbc:mysql://localhost/mysql --username root --password cloudera --table user

#### Apartado B
En nuestra carpeta de usuario debido a que no hemos incluido un directorio de destino

#### Apartado C
Aparece un error debido a que la carpeta ya existe

#### Apartado D
sqoop import --connect jdbc:mysql://localhost/mysql --username root --password cloudera --table user --target-dir user_1


### Ejercicio 4 - import
#### Apartado A
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras

#### Apartado B
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras_id2 where "id_compra > 5"

#### Apartado C
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras_avro --as-avrodatafile --columns desc_producto,precio

#### Apartado D
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras_parquet --where "preco > 20" --as-parquetfile


### Ejercicio 5 - import --incremental
#### Apartado A
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras --incremental append --check-column id_compra --last-value 10

#### Apartado B
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --target-dir miTienda_compras_id2 where "id_compra > 5"  --incremental lastmodified --check-column hora --append

### Ejercicio 6 - import - hive
sqoop import --connect jdbc:mysql://localhost/miTienda --username root --password cloudera --table compras --hive-import --create-hive-table


## Ejercicios Flume
### Ejercicio 1
	# Name the components on this agent
	a1.sources = r1
	a1.sinks = k1
	a1.channels = c1

	# Describe/configure the source
	a1.sources.r1.type = netcat
	a1.sources.r1.bind = localhost
	a1.sources.r1.port = 44444

	# Describe the sink
	a1.sinks.k1.type = logger

	# Use a channel which buffers events in memory
	a1.channels.c1.type = memory
	a1.channels.c1.capacity = 1000
	a1.channels.c1.transactionCapacity = 100

	# Bind the source and sink to the channel
	a1.sources.r1.channels = c1
	a1.sinks.k1.channel = c1

### Ejercicio 2
	# Name the components on this agent
	a1.channels = disk-channel
	a1.sources = logs-source
	a1.sinks = hdfs-sink

	# Describe/configure the source
	a1.sources.logs-source.type = spooldir
	a1.sources.logs-source.spoolDir = /var/log/apache/flumeSpool
	a1.sources.logs-source.fileHeader = true

	# Describe the channel
	a1.channels.disk-channel.type = file
	a1.channels.disk-channel.checkpointDir = /mnt/flume/checkpoint
	a1.channels.disk-channel.dataDirs = /mnt/flume/data

	# Describe the sink
	a1.sinks.hdfs-sink.type = hdfs
	a1.sinks.hdfs-sink.hdfs.path = /flume/events/%Y/%{fileName}
	a1.sinks.hdfs-sink.hdfs.filePrefix = events-
	a1.sinks.hdfs-sink.hdfs.round = true
	a1.sinks.hdfs-sink.hdfs.roundValue = 10
	a1.sinks.hdfs-sink.hdfs.roundUnit = minute

	# Bind the source and sink to the channel
	a1.sinks.hdfs-sink.channel = disk-channel
	a1.sources.logs-source.channels = disk-channel