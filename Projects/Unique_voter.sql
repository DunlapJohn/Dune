WITH COMP AS (
            select
          "proposalId" as month,
                count(distinct("voter")) AS "COMP Voters"
            FROM compound_v2."GovernorAlpha_evt_VoteCast"
      group by month
            ), 
            AAVE AS (
                      select
                      id as month,
                  count(distinct("voter")) AS "AAVE Voters"
                FROM aave."AaveGovernanceV2_evt_VoteEmitted"
    group by month
        ),
                       DYDX as (
                        select
                            id  AS month,
                            count(distinct("voter"))  AS "DYDX Voters"
                        from dydx_protocol."DydxGovernor_evt_VoteEmitted"
                group by month)



    
        
        Select
            a.month as "Proposal Number",
            "COMP Voters" ,
            "AAVE Voters" ,
            "DYDX Voters"
        from aave a
        left join comp c on a.month = c.month
        left join dydx d on d.month = a.month
