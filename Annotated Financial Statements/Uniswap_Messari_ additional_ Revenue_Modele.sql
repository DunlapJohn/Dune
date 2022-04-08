--They are essentially a public good rn, generating no profit 
--turning on the switch to generate revenue is possible via governance proposal
--This querie has been modified to model a 10% fee on the current V2 and v3 fees
--2021 would have seen net revenues of Uniswap exceed $115 Million 
--That equates to a yearly payout of ~.16 cents given per UNI token or ~.8% of UNIs price on march 27th.

WITH trades AS ( --drawing data from the aggergate dex table, speoificly requesting cols from uni V2 and V3
    SELECT
        DATE_TRUNC('{{3 - Time Granularity}}', block_time) AS time,
        version,
        usd_amount,
        "exchange_contract_address",
        tx_from
    FROM dex."trades" d
    WHERE project = 'Uniswap' AND version IN ('2', '3')
    AND block_time BETWEEN '{{1 - Start Date Time}}' AND LEAST ('{{2 - Finish Date Time}}', NOW())
),

volume AS (   --calulating volume from the meterics referenced above
    SELECT
        time,
        COUNT(*) FILTER (WHERE version = '2') AS v2_tx,
        COUNT(*) FILTER (WHERE version = '3') AS v3_tx,
        SUM(usd_amount) FILTER (WHERE version = '2') AS v2_vol,
        0.003*SUM(usd_amount) FILTER (WHERE version = '2') AS v2_fee, --manual input of fee? isnt there on-chain data that could be used?
        SUM(usd_amount) FILTER (WHERE version = '3') AS v3_vol
    FROM trades t
    GROUP BY 1
    ORDER BY time DESC
),

liq_tx AS ( --speificing the variables used to calulate liquidity 
    SELECT
        DATE_TRUNC('{{3 - Time Granularity}}', day) AS time,
        version,
        token_usd_amount,
        pool_address
    FROM dex."liquidity" d
    WHERE project = 'Uniswap'
    AND token_usd_amount != 0
    AND version IN ('2', '3')
),

liquidity AS ( --summing liquidity 
    SELECT
        time,
        SUM(token_usd_amount) FILTER (WHERE version = '2') AS v2_liq,
        SUM(token_usd_amount) FILTER (WHERE version = '3') AS v3_liq
    FROM liq_tx
    GROUP BY 1
    ORDER BY time DESC
),

v3_fees AS ( --speificing the variables used to calulate v3 fees
    WITH total_fee AS (    
        WITH trades AS (
            SELECT
                time,
                usd_amount,
                fee
            FROM trades d
            LEFT JOIN uniswap_v3."Factory_evt_PoolCreated" p ON d."exchange_contract_address"= p."pool"
            WHERE version = '3'
            AND usd_amount != 0
        )
        
        SELECT -- filtering volume based on fees so that the variable fee can be calculated, again this seems very manual isnt there on-chain data for this?
            time,
            SUM(usd_amount) FILTER (WHERE fee = '100') AS v3_vol_100,
            SUM(usd_amount) FILTER (WHERE fee = '500') AS v3_vol_500,
            SUM(usd_amount) FILTER (WHERE fee = '3000') AS v3_vol_3000,
            SUM(usd_amount) FILTER (WHERE fee = '10000') AS v3_vol_10000,
            0.0001*SUM(usd_amount) FILTER (WHERE fee = '100') AS v3_fee_100,
            0.0005*SUM(usd_amount) FILTER (WHERE fee = '500') AS v3_fee_500,
            0.003*SUM(usd_amount) FILTER (WHERE fee = '3000') AS v3_fee_3000,
            0.01*SUM(usd_amount) FILTER (WHERE fee = '10000') AS v3_fee_10000
        FROM trades t
        GROUP BY 1
    )
    
    SELECT *, 
        COALESCE(v3_fee_100,0)+COALESCE(v3_fee_500,0)+COALESCE(v3_fee_3000,0)+COALESCE(v3_fee_10000,0) AS v3_fee --adding all the fees up to help calculate supply-side revenue.
    FROM total_fee
),
 
v3_liquidity AS (
    WITH add_remove AS (
        SELECT
            time,
            token_usd_amount,
            fee
        FROM liq_tx d
        LEFT JOIN uniswap_v3."Factory_evt_PoolCreated" p ON d.pool_address= p."pool"
        WHERE version = '3'
        AND token_usd_amount != 0
    )
    
    SELECT -- the same logic as the fees but liquidity
        time,
        SUM(token_usd_amount) FILTER (WHERE fee = '100') AS v3_liq_100,
        SUM(token_usd_amount) FILTER (WHERE fee = '500') AS v3_liq_500,
        SUM(token_usd_amount) FILTER (WHERE fee = '3000') AS v3_liq_3000,
        SUM(token_usd_amount) FILTER (WHERE fee = '10000') AS v3_liq_10000
    FROM add_remove
    GROUP BY 1
),

v2_markets AS ( --the creation of new markets on the protocol
    WITH create_tx AS (
        SELECT 
            DATE_TRUNC ('day', evt_block_time) AS time,
            pair
        FROM uniswap_v2."Factory_evt_PairCreated"
    ),
    
    daily_new_markets AS (
        SELECT
            time,
            COUNT (pair) AS v2_new_markets
        FROM create_tx
        GROUP BY 1
    )
    
    SELECT *,
        SUM(v2_new_markets) OVER (ORDER BY time) AS v2_agg_markets
    FROM daily_new_markets
),

v3_markets AS (
    WITH create_tx AS (
        SELECT 
            DATE_TRUNC ('day', evt_block_time) AS time,
            pool,
            fee
        FROM uniswap_v3."Factory_evt_PoolCreated"
    ),
    
    daily_new_markets AS (
        SELECT
            time,
            COUNT(*) AS v3_new_markets,
            COUNT(pool) FILTER (WHERE fee=100) AS v3_markets_100,
            COUNT(pool) FILTER (WHERE fee=500) AS v3_markets_500,
            COUNT(pool) FILTER (WHERE fee=3000) AS v3_markets_3000,
            COUNT(pool) FILTER (WHERE fee=10000) AS v3_markets_10000
        FROM create_tx
        GROUP BY 1
    )
    
    SELECT *,
        SUM(v3_new_markets) OVER (ORDER BY time) AS v3_agg_markets
    FROM daily_new_markets
)

SELECT 
    v.time AS "Time",
    v2_tx AS "V2 # Swaps",
    v2_vol AS "V2 Volume",
    SUM(v2_vol) OVER (ORDER BY v.time) AS "V2 Agg Volume",
    v2_fee AS "V2 Fees",
    SUM(v2_fee) OVER (ORDER BY v.time) AS "V2 Agg Fees",
    v2_liq AS "V2 Liquidity",
    v2_new_markets AS "V2 New Markets",
    v2_agg_markets AS "V2 Agg Markets",
    0 AS "V2 Protocol Revenue",
    v2_fee AS "V2 Supply-Side Revenue",
    '|' AS ".",
    v3_tx AS "V3 # Swaps",
    v3_vol AS "V3 Volume",
    SUM(v3_vol) OVER (ORDER BY v.time) AS "V3 Agg Volume",
    v3_fee AS "V3 Fees",
    SUM(v3_fee) OVER (ORDER BY v.time) AS "V3 Agg Fees",
    v3_liq AS "V3 Liquidity",
    v3_new_markets AS "V3 New Markets",
    v3_agg_markets AS "V3 Agg Markets",
    0 AS "V3 Protocol Revenue",
    (v3_fee*(1-.1)) AS "V3 Supply-Side Revenue",
    '|' AS "..",
    SUM((v3_fee * .1)+(v2_fee * .1)) OVER (ORDER BY v.time) AS "Uniswap Protocol Revenue Agg",
    COALESCE(v2_fee,0)+COALESCE(v3_fee,0) AS "Uniswap Supply-Side Revenue",
    '|' AS ",",
     v3_vol_100 AS "V3 0.01% Vol",
     v3_vol_500 AS "V3 0.05% Vol",
     v3_vol_3000 AS "V3 0.30% Vol",
     v3_vol_10000 AS "V3 1.00% Vol",
     v3_fee_100 AS "V3 0.01% Fee",
     v3_fee_500 AS "V3 0.05% Fee",
     v3_fee_3000 AS "V3 0.30% Fee",
     v3_fee_10000 AS "V3 1.00% Fee",
     v3_Liq_100 AS "V3 0.01% Liq",
     v3_Liq_500 AS "V3 0.05% Liq",
     v3_Liq_3000 AS "V3 0.30% Liq",
     v3_Liq_10000 AS "V3 1.00% Liq",
     v3_markets_100 AS "V3 0.01% New Markets",
     v3_markets_500 AS "V3 0.05% New Markets",
     v3_markets_3000 AS "V3 0.30% New Markets",
     v3_markets_10000 AS "V3 1.00% New Markets"
FROM volume v
LEFT JOIN liquidity l ON v.time = l.time
LEFT JOIN v3_fees f ON v.time = f.time
LEFT JOIN v3_liquidity li ON v.time = li.time
LEFT JOIN v2_markets m2 ON v.time = m2.time
LEFT JOIN v3_markets m3 ON v.time = m3.time
WHERE v.time BETWEEN '{{1 - Start Date Time}}' AND LEAST ('{{2 - Finish Date Time}}', NOW())
ORDER BY v.time DESC
