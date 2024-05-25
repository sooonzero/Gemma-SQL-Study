select type, sum(processed) / count(complaint_id)
from facebook_complaints
group by type;
