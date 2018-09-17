CREATE OR REPLACE VIEW jobexecutiontimes AS
SELECT
  "s"."jobid"
, "s"."attempts"
, "s"."jobdefinition"
, "s"."time" "starttime"
, "f"."time" "finishtime"
, "date_diff"('second', "from_iso8601_timestamp"("s"."time"), "from_iso8601_timestamp"("f"."time")) "total_in_seconds"
, "f"."status" "completionstatus"
, "s"."yyyy"
, "s"."dd"
, "s"."mm"
, "s"."hh"
FROM
  (jobstatusdetails s
INNER JOIN jobstatusdetails f ON (("s"."jobid" = "f"."jobid") AND ("s"."attempts" = "f"."attempts")))
WHERE (("s"."status" = 'STARTING') AND ("f"."status" IN ('FAILED', 'SUCCEEDED')))