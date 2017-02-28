drop table my_hvbp;

create table my_hvbp as
select
provider_id,
hospital_name,
state,
overall_floor,
overall_achieve_thresh,
overall_benchmark,
overall_baseline,
overall_perf,
overall_achieve_pts,
overall_improve,
overall_dimension,
hcahps_base,
hcahps_consistency
from hvbp_table
where overall_perf not like 'N%'
;

select overall_perf, overall_improve, hospital_name from my_hvbp order by overall_perf desc limit 10;

SELECT (Avg(s.overall_rate * h.overall_perf) - Avg(s.overall_rate) * Avg(h.overall_perf)) / (stddev_pop(s.overall_rate) * stddev_pop(h.overall_perf)) AS Correlation
from my_hvbp h join my_states s
on h.hospital_name = s.hospital_name
where s.overall_rate not like 'N%'
or h.overall_perf not like 'N%'
;
