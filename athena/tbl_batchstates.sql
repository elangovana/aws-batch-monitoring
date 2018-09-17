CREATE EXTERNAL TABLE `batchstatesbatchstates`(
  `version` string COMMENT 'from deserializer',
  `id` string COMMENT 'from deserializer',
  `detail-type` string COMMENT 'from deserializer',
  `source` string COMMENT 'from deserializer',
  `account` string COMMENT 'from deserializer',
  `time` string COMMENT 'from deserializer',
  `region` string COMMENT 'from deserializer',
  `resources` array<string> COMMENT 'from deserializer',
  `detail` struct<jobname:string,jobid:string,jobqueue:string,status:string,attempts:array<struct<container:struct<containerinstancearn:string,taskarn:string,exitcode:int,logstreamname:string>,startedat:bigint,stoppedat:bigint,statusreason:string>>,createdat:bigint,retrystrategy:struct<attempts:int>,dependson:array<string>,jobdefinition:string,parameters:struct<mode:string,text:string,s3_destination:string,file_pattern:string,data_dir:string>,container:struct<image:string,vcpus:int,memory:int,command:array<string>,jobrolearn:string,volumes:array<struct<host:struct<sourcepath:string>,name:string>>,environment:array<struct<name:string,value:string>>,mountpoints:array<struct<containerpath:string,readonly:boolean,sourcevolume:string>>,readonlyrootfilesystem:boolean,ulimits:array<string>,privileged:boolean,containerinstancearn:string,taskarn:string,logstreamname:string,exitcode:int>,startedat:bigint,statusreason:string,stoppedat:bigint> COMMENT 'from deserializer')
PARTITIONED BY (
  `partition_0` string,
  `partition_1` string,
  `partition_2` string,
  `partition_3` string)
ROW FORMAT SERDE
  'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'paths'='account,detail,detail-type,id,region,resources,source,time,version')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://<bucket>/<prefix>/'
TBLPROPERTIES (
  'CrawlerSchemaDeserializerVersion'='1.0',
  'CrawlerSchemaSerializerVersion'='1.0',
  'UPDATED_BY_CRAWLER'='awsbatchstatescrawler',
  'averageRecordSize'='1526',
  'classification'='json',
  'compressionType'='gzip',
  'objectCount'='1',
  'recordCount'='1',
  'sizeKey'='1456',
  'typeOfData'='file')