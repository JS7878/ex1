drop table my_states;

create table my_states as
select
  hospital_name,
  state,
  overall_rate,
  mortality_natl,
  safety_natl,
  readmit_natl,
  experience_natl,
  effectiveness_natl,
  timely_natl,
  imaging_natl
from hosp_table
where overall_rate not like 'N%'
;

select avg(overall_rate), state from my_states group by state order by avg(overall_rate) desc limit 10;
