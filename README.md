核心架构
1.业务数据:用户和系统网站进行交互所产生的数据，如下单交付数据，存在mysql中。
1. datax:全量表的采集。
2.maxwel:增量表的实时监控。
2.用户行为日志:点击网站所进行的一系列动作。
1.flume:采集数据。
2.hdfs:文件存储系统存放数据。
3.kafka:为实时数仓搭建作准备，flink从kafka中读取数据。3.hive+hdfs，hive套在hdfs上，分层计算形成数仓
1.hdfs:只支持新增及追加写数据，不支持实时修改与删除,
2.hive:可以用update命令修改数据，整个文件读取出来修改后覆盖写回去，效率较低，因此将计算结果保存在新表中。
数仓分层
1.ods:operation data store，原始数据层。
2.dwd: data warehouse detail，明细数据层.
3. dws: data warehouse summary，汇总数据层。
4.dim:dimension，公共维度层
5.ads:application data service，数据应用层,