select from_user, count(*) total_emails, ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)
from google_gmail_emails
group by from_user
order by 3 asc;
