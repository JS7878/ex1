DROP TABLE hosp_table;

CREATE EXTERNAL TABLE hosp_table
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  hosp_type string,
  hosp_own string,
  emerg_services string,
  criteria_ehr string,
  overall_rate string,
  overall_foot string,
  mortality_natl string,
  mortality_foot string,
  safety_natl string,
  safety_foot string,
  readmit_natl string,
  readmit_foot string,
  experience_natl string,
  experience_foot string,
  effectiveness_natl string,
  effectiveness_foot string,
  timely_natl string,
  timely_foot string,
  imaging_natl string,
  imaging_foot string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'
;

