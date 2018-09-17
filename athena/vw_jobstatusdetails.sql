CREATE OR REPLACE VIEW jobstatusdetails AS
SELECT
  "detail"."jobid"
, "time"
, "detail"."status"
, "detail"."jobdefinition"
, "detail"."retrystrategy"."attempts"
, "partition_0" "yyyy"
, "partition_1" "mm"
, "partition_2" "dd"
, "partition_3" "hh"
FROM
  batchstates
ORDER BY 2 ASC