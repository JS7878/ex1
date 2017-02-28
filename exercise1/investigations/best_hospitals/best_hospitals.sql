
drop table my_timely;

create table my_timely as
select
  hospital_name,
  state,
  measure_name,
  measure_id,
  cast(score as decimal(3,0)) score,
  measure_st,
  measure_end
from timely_table
where score not like 'N%'
;

select measure_id, measure_name, count(measure_name) from my_timely group by measure_id, measure_name;

drop table low_timely;

create table low_timely as
select
  hospital_name,
  state,
  measure_name,
  measure_id,
  cast(score as decimal(3,0)) score,
  measure_st,
  measure_end
from my_timely
where measure_id like 'ED%'
or measure_id like 'OP_3b'
or measure_id like 'OP_5'
or measure_id like 'OP_18b'
or measure_id like 'OP_20'
or measure_id like 'OP_21'
or measure_id like 'OP_22'
or measure_id like 'PC_01'
or measure_id like 'VTE_6'
or score not like 'NULL'
;

select avg(score), hospital_name from low_timely group by hospital_name order by avg(score) asc limit 10;

drop table high_timely;

create table high_timely as
select
  hospital_name,
  state,
  measure_name,
  measure_id,
  cast(score as decimal(3,0)) score,
  measure_st,
  measure_end
from my_timely
where measure_id like 'OP_4'
or measure_id like 'OP_29'
or measure_id like 'OP_30'
or measure_id like 'IMM%'
or measure_id like 'STK%'
or measure_id like 'VTE%'
or score not like 'NULL'
;

select avg(score), hospital_name from high_timely group by hospital_name order by avg(score) desc limit 10;

drop table my_readmit;

create table my_readmit as
select
provider_id,
hospital_name,
state,
measure_name,
measure_id,
compare_natl,
denominator,
score,
lower_est,
higher_est,
measure_st,
measure_end
from readmit_table
where score not like 'N%'
;

select avg(score), hospital_name from my_readmit group by hospital_name order by avg(score) asc limit 10;
