select b.date, b.consumption
from (select date, sum(consumption) consumption, rank() over(order by sum(consumption) desc) rk
from (select * from fb_eu_energy union select * from fb_asia_energy union select * from fb_na_energy) a
group by date
) b
where b.rk=1
