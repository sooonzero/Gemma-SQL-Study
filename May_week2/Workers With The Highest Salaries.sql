select b.worker_title
from (select worker_id, salary, rank() over(order by salary desc) rk
    from worker
)a join title b 
on a.worker_id = b.worker_ref_id
where a.rk=1;
