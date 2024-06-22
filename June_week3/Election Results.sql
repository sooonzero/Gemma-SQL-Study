select a.candidate
from voting_results a left join (select voter, 1 / count(candidate) vote_score-- voter당 한 투표 값 계산
                        from voting_results
                        group by voter) b
on a. voter = b.voter
group by a.candidate
order by sum(b.vote_score) desc
limit 1
