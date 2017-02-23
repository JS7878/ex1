DROP TABLE measure_table;

CREATE EXTERNAL TABLE measure_table
(
  measure_name string,
  measure_id string,
  measure_st_qtr string,
  measure_st string,
  measure_end_qtr string,
  measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measuredates'
;

