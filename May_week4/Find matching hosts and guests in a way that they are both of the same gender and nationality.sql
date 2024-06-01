select a.host_id, b.guest_id
from (select distinct(host_id), gender, nationality
from airbnb_hosts ) a join (select distinct(guest_id), gender, nationality
from airbnb_guests ) b
where a.gender = b.gender and a.nationality = b.nationality
