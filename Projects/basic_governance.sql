SELECT p.*,
    to_char(p."Affirmative Votes"/ p."Total Votes"* 100,'999D%') as "Affirmative Percentage"
FROM (
    SELECT 
        "proposalId" as "Proposal Number",
                TRUNC(sum(votes) / 10^18) as "Total Votes",
                TRUNC(SUM(CASE WHEN support = true 
                THEN votes ELSE 0 END) / 10^18) as "Affirmative Votes",
                TRUNC(SUM(CASE WHEN support = false 
                THEN votes ELSE 0 END) / 10^18) as "Critical Votes"
    FROM compound_v2."GovernorAlpha_evt_VoteCast" p
    group by "Proposal Number"
)  as p
order by "Proposal Number" desc
