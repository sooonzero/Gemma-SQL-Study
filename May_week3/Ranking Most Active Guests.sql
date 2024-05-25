select id_guest, sum(n_messages) messages, dense_rank() over(order by sum(n_messages) desc) ranks
from airbnb_contacts
group by id_guest;
