select a.employee_title, a.sex, sum(a.salary+b.bonus) / count(b.worker_ref_id) avg_compensation
from sf_employee a left join (select worker_ref_id, sum(bonus) bonus
                            from sf_bonus
                            group by worker_ref_id) b
on a.id = b.worker_ref_id
where b.bonus is not null
group by employee_title
