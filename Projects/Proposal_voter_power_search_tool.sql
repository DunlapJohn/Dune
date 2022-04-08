With gov as (
SELECT 
    voter,
    "proposalId",
votes / pow(10, 18) as votes
    FROM compound_v2."GovernorAlpha_evt_VoteCast"
  WHERE  "proposalId" = '{{COMP Proposal Id}}'
  ORDER BY
votes DESC
Limit 10
)
select *,
LAST_VALUE(votes)OVER()/FIRST_VALUE(VOTES)OVER() as "rank 10 is X percent of rank 1 voter"
from gov
