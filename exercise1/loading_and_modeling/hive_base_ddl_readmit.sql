DROP TABLE readmit_table;

CREATE EXTERNAL TABLE readmit_table
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  measure_name string,
  measure_id string,
  compare_natl string,
  denominator string,
  score string,
  lower_est string,
  higher_est string,
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
LOCATION '/user/w205/hospital_compare/readmit'
;

