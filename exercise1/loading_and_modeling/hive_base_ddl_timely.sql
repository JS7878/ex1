DROP TABLE timely_table;

CREATE EXTERNAL TABLE timely_table
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  condition string,
  measure_id string,
  measure_name string,
  score string,
  sample string,
  foot string,
  measure_st string,
  measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/timely'
;

