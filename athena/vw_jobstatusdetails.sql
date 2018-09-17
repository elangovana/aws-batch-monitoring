CREATE OR REPLACE VIEW jobstatusdetails AS
SELECT
  "detail"."jobid"
, "time"
, "detail"."status"
, "detail"."jobdefinition"
, cardinality("detail"."attempts") attempts
, detail.container.logStreamName logStreamName
, "partition_0" "yyyy"
, "partition_1" "mm"
, "partition_2" "dd"
, "partition_3" "hh"
FROM
  batchstates
ORDER BY 2 ASC