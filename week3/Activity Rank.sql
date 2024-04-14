select from_user, count(*) total_emails, ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)
from google_gmail_emails
group by from_user
order by 3 asc;

-- ROW_NUMBER() 하는거 몰랐는데 예상출력 컬럼에 그대로 있어서 사용함
-- ROW_NUMBER()관련해서는 추 후 정리 예정
