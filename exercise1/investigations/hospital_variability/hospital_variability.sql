
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

select avg(score), hospital_name from my_readmit group by hospital_name order by avg(score) desc limit 10;

select variance(score), hospital_name from my_readmit group by hospital_name order by variance(score) desc limit 10;
