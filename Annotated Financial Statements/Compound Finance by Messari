WITH tokens AS (
    SELECT
        "cToken" AS contract_address, --identifiying the interest bearing ctokens and naming then both token and ctoken for display purposes. Then there is a decimal conversion to ensure correct price conversions.
        CASE
            WHEN "cToken" = '\xe65cdb6479bac1e22340e4e755fae7e509ecd06c' THEN 'AAVE'
            WHEN "cToken" = '\x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e' THEN 'BAT'
            WHEN "cToken" = '\x70e36f6bf80a52b3b46b3af8e106cc0ed743e8e4' THEN 'COMP'
            WHEN "cToken" = '\x5d3a536e4d6dbd6114cc1ead35777bab948e3643' THEN 'DAI'
            WHEN "cToken" = '\x4ddc2d193948926d02f9b1fe9e1daa0718270ed5' THEN 'WETH'
            WHEN "cToken" = '\xface851a4921ce59e912d19329929ce6da6eb0c7' THEN 'LINK'
            WHEN "cToken" = '\x95b4ef2869ebd94beb4eee400a99824bf5dc325b' THEN 'MKR'
            WHEN "cToken" = '\x158079ee67fce2f58472a96584a73c7ab9ac95c1' THEN 'REP'
            WHEN "cToken" = '\xf5dce57282a584d2746faf1593d3121fcac444dc' THEN 'SAI'
            WHEN "cToken" = '\x4b0181102a0112a2ef11abee5563bb4a3176c9d7' THEN 'SUSHI'
            WHEN "cToken" = '\x12392f67bdf24fae0af363c24ac620a2f67dad86' THEN 'TUSD'
            WHEN "cToken" = '\x35a18000230da775cac24873d00ff85bccded550' THEN 'UNI'
            WHEN "cToken" = '\x39aa39c021dfbae8fac545936693ac917d5e7563' THEN 'USDC'
            WHEN "cToken" = '\x041171993284df560249b57358f931d9eb7b925d' THEN 'USDP'
            WHEN "cToken" = '\xf650c3d88d12db855b8bf7d11be6c55a4e07dcc9' THEN 'USDT'
            WHEN "cToken" = '\xc11b1268c1a384e55c48c2391d8d480264a3a7f4' THEN 'WBTC OLD'
            WHEN "cToken" = '\xccf4429db6322d5c611ee964527d42e5d685dd6a' THEN 'WBTC'
            WHEN "cToken" = '\x80a2ae356fc9ef4305676f7a3e2ed04e12c33946' THEN 'YFI'
            WHEN "cToken" = '\xb3319f5d18bc0d84dd1b4825dcde5d5f7266d407' THEN 'ZRX'
        END AS Token,
        CASE
            WHEN "cToken" = '\xe65cdb6479bac1e22340e4e755fae7e509ecd06c' THEN 'cAAVE'
            WHEN "cToken" = '\x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e' THEN 'cBAT'
            WHEN "cToken" = '\x70e36f6bf80a52b3b46b3af8e106cc0ed743e8e4' THEN 'cCOMP'
            WHEN "cToken" = '\x5d3a536e4d6dbd6114cc1ead35777bab948e3643' THEN 'cDAI'
            WHEN "cToken" = '\x4ddc2d193948926d02f9b1fe9e1daa0718270ed5' THEN 'cETH'
            WHEN "cToken" = '\xface851a4921ce59e912d19329929ce6da6eb0c7' THEN 'cLINK'
            WHEN "cToken" = '\x95b4ef2869ebd94beb4eee400a99824bf5dc325b' THEN 'cMKR'
            WHEN "cToken" = '\x158079ee67fce2f58472a96584a73c7ab9ac95c1' THEN 'cREP'
            WHEN "cToken" = '\xf5dce57282a584d2746faf1593d3121fcac444dc' THEN 'cSAI'
            WHEN "cToken" = '\x4b0181102a0112a2ef11abee5563bb4a3176c9d7' THEN 'cSUSHI'
            WHEN "cToken" = '\x12392f67bdf24fae0af363c24ac620a2f67dad86' THEN 'cTUSD'
            WHEN "cToken" = '\x35a18000230da775cac24873d00ff85bccded550' THEN 'cUNI'
            WHEN "cToken" = '\x39aa39c021dfbae8fac545936693ac917d5e7563' THEN 'cUSDC'
            WHEN "cToken" = '\x041171993284df560249b57358f931d9eb7b925d' THEN 'cUSDP'
            WHEN "cToken" = '\xf650c3d88d12db855b8bf7d11be6c55a4e07dcc9' THEN 'cUSDT'
            WHEN "cToken" = '\xc11b1268c1a384e55c48c2391d8d480264a3a7f4' THEN 'cWBTC OLD'
            WHEN "cToken" = '\xccf4429db6322d5c611ee964527d42e5d685dd6a' THEN 'cWBTC'
            WHEN "cToken" = '\x80a2ae356fc9ef4305676f7a3e2ed04e12c33946' THEN 'cYFI'
            WHEN "cToken" = '\xb3319f5d18bc0d84dd1b4825dcde5d5f7266d407' THEN 'cZRX'
        END AS cToken,
        CASE
            WHEN "cToken" = '\xe65cdb6479bac1e22340e4e755fae7e509ecd06c' THEN 18
            WHEN "cToken" = '\x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e' THEN 18
            WHEN "cToken" = '\x70e36f6bf80a52b3b46b3af8e106cc0ed743e8e4' THEN 18
            WHEN "cToken" = '\x5d3a536e4d6dbd6114cc1ead35777bab948e3643' THEN 18
            WHEN "cToken" = '\x4ddc2d193948926d02f9b1fe9e1daa0718270ed5' THEN 18
            WHEN "cToken" = '\xface851a4921ce59e912d19329929ce6da6eb0c7' THEN 18
            WHEN "cToken" = '\x95b4ef2869ebd94beb4eee400a99824bf5dc325b' THEN 18
            WHEN "cToken" = '\x158079ee67fce2f58472a96584a73c7ab9ac95c1' THEN 18
            WHEN "cToken" = '\xf5dce57282a584d2746faf1593d3121fcac444dc' THEN 18
            WHEN "cToken" = '\x4b0181102a0112a2ef11abee5563bb4a3176c9d7' THEN 18
            WHEN "cToken" = '\x12392f67bdf24fae0af363c24ac620a2f67dad86' THEN 18
            WHEN "cToken" = '\x35a18000230da775cac24873d00ff85bccded550' THEN 18
            WHEN "cToken" = '\x39aa39c021dfbae8fac545936693ac917d5e7563' THEN 6
            WHEN "cToken" = '\xf650c3d88d12db855b8bf7d11be6c55a4e07dcc9' THEN 6
            WHEN "cToken" = '\xc11b1268c1a384e55c48c2391d8d480264a3a7f4' THEN 8
            WHEN "cToken" = '\xccf4429db6322d5c611ee964527d42e5d685dd6a' THEN 8
            WHEN "cToken" = '\x80a2ae356fc9ef4305676f7a3e2ed04e12c33946' THEN 18
            WHEN "cToken" = '\xb3319f5d18bc0d84dd1b4825dcde5d5f7266d407' THEN 18
            WHEN "cToken" = '\x041171993284df560249b57358f931d9eb7b925d' THEN 18
        END AS decimals,
        8 AS cToken_Decimals
    FROM compound_v2."Unitroller_evt_MarketListed" 
),

daily_price AS (. -- pulling prices, /symbols organized by date, for all of the listed tokens on compound, these tokens have different addresses as their corresponding ctokens.
    WITH daily_price_with_gap AS (
        WITH allprices AS (
            SELECT
                date_trunc('day', minute) AS time,
                price,
                symbol
            FROM prices.usd
            WHERE contract_address IN ('\x7fc66500c84a76ad7e9c93437bfc5ac33e2ddae9',  --AAVE
                                        '\x0d8775f648430679a709e98d2b0cb6250d2887ef',  --BAT
                                        '\xc00e94cb662c3520282e6f5717214004a7f26888',  --COMP
                                        '\x6b175474e89094c44da98b954eedeac495271d0f',  --DAI
                                        '\x514910771af9ca656af840dff83e8264ecf986ca',  --LINK
                                        '\x9f8f72aa9304c8b593d555f12ef6589cc3a579a2',  --MKR
                                        '\x1985365e9f78359a9b6ad760e32412f4a445e862',  --REP
                                        '\x89d24a6b4ccb1b6faa2625fe562bdd9a23260359',  --SAI
                                        '\x6b3595068778dd592e39a122f4f5a5cf09c90fe2',  --SUSHI
                                        '\x0000000000085d4780b73119b644ae5ecd22b376',  --TUSD
                                        '\x1f9840a85d5af5bf1d1762f925bdaddc4201f984',  --UNI
                                        '\xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',  --USDC
                                        '\x8e870d67f660d95d5be530380d0ec0bd388289e1',  --USDP
                                        '\xdac17f958d2ee523a2206206994597c13d831ec7',  --USDT
                                        '\x2260fac5e5542a773aa44fbcfedf7c193bc2c599',  --WBTC
                                        '\xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2',  --WETH
                                        '\x0bc529c00c6401aef6d220be8c6ea1667f6ad93e',  --YFI
                                        '\xe41d2489571d322189246dafa5ebde1f4699f498')  --ZRX 
    
            AND minute > '2019-05-07 00:00'
            
            UNION ALL --pulling prices for COMP from aggergated dex prices
            
            SELECT
                date_trunc('day', hour) AS time,
                median_price,
                symbol
            FROM prices."prices_from_dex_data"
            WHERE contract_address = '\xc00e94cb662c3520282e6f5717214004a7f26888'
            AND hour < '2020-07-16 00:00'
           
            UNION ALL --joining the rows above with the price data for WBTC, presumably the reason it stands alone is that is the old WBTC and it is best practice ot seperate non-live token prices.
            
            SELECT
                date_trunc('day', minute) AS time,
                price,
                'WBTC OLD'
            FROM prices.usd
            WHERE contract_address = '\x2260fac5e5542a773aa44fbcfedf7c193bc2c599'  --WBTC
            AND minute > '2019-05-07 00:00'
        )
        
        SELECT --window function: sorting by prices by symbol and then organizing by date
            time,
            symbol,
            lead(time, 1, now()) OVER (PARTITION BY symbol ORDER BY time ASC) AS next_time,
            AVG(price) AS price
        FROM allprices
        GROUP BY 1,2
    ),
    
    gs AS ( --speificying time window 
        SELECT
            generate_series('2019-05-07 00:00', NOW(), '1 day'::interval) AS time
    )
    
    SELECT -- pulling prices for listed markets with the time frame
        gs.time,
        symbol,
        price
    FROM daily_price_with_gap g
    INNER JOIN gs ON g.time <= gs.time AND gs.time < g.next_time --adding time window col 
),

br_tx AS(
    SELECT --calculating borrowed amounts from cerc20 table
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        "borrowAmount" AS borrow,
        0 AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."cErc20_evt_Borrow"
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc') --excluding c'Augur' and cSAI -- older tokens that are historically irrelevent
    UNION ALL 
    SELECT --calculating borrowed amounts from cether_evt table
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        "borrowAmount" AS borrow,
        0 AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."cEther_evt_Borrow" 
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    UNION ALL
    SELECT --calculating borrowed amounts from cerc20 delegator table
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        "borrowAmount" AS borrow,
        0 AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."CErc20Delegator_evt_Borrow"
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    
    UNION ALL
    
    SELECT --repeating the three source structure above to calculating borrowed amount repayed 
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        0 AS borrow,
        -"repayAmount" AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."cErc20_evt_RepayBorrow"
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    UNION ALL
    SELECT 
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        0 AS borrow,
        -"repayAmount" AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."cEther_evt_RepayBorrow"
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    UNION ALL
    SELECT 
        evt_block_time,
        evt_index,
        date_trunc('day', evt_block_time) AS time,
        contract_address,
        0 AS borrow,
        -"repayAmount" AS repay,
        "totalBorrows" AS Total_Borrow
    FROM compound_v2."CErc20Delegator_evt_RepayBorrow"
    WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
),
    
daily_BorrowRepay AS (
    SELECT --summing equity and debt
        time,
        contract_address,
        SUM(borrow) AS borrow,
        SUM(repay) AS repay
    FROM br_tx
    GROUP BY 1, 2
),

loans AS (    
    WITH maxTBorrow1 AS (
        SELECT 
            contract_address,
            time,
            MAX(evt_block_time) AS _maxtime --organizing time col
        FROM br_tx
        GROUP BY 1,2
    ),
    
    daily_TBorrow1 AS ( --duplicate transaction with same time but different index evt 
        SELECT 
            a.time,
            a.evt_index,
            a.contract_address,
            a.Total_Borrow
        FROM br_tx a
        INNER JOIN maxTBorrow1 m ON a.contract_address=m.contract_address AND a.evt_block_time=m._maxtime
    ),
    
    maxTBorrow2 AS (
        SELECT 
            contract_address,
            time,
            MAX(evt_index) AS _maxindex
        FROM daily_TBorrow1
        GROUP BY 1,2
    ),
    
    daily_TBorrow2 AS ( -- excluding loest evt_index
        SELECT 
            a.time,
            lead(a.time, 1, now()) OVER (PARTITION BY a.contract_address ORDER BY a.time ASC) AS next_time,
            a.contract_address,
            a.Total_Borrow
        FROM daily_TBorrow1 a
        INNER JOIN maxTBorrow2 m ON a.contract_address=m.contract_address AND a.time=m.time AND a.evt_index=m._maxindex
    ),
    
    gs AS (
        SELECT
            generate_series('2019-05-07 00:00', NOW(), '1 day'::interval) AS time
    )
    
    SELECT
        gs.time,
        contract_address,
        Total_Borrow
    FROM daily_TBorrow2 b
    INNER JOIN gs ON b.time <= gs.time AND gs.time < b.next_time --syncing it all up

),

dailyMintRedeem AS ( -- deposits from the three table sources and then sorting data by listed market
    WITH mr_tx AS (    
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "mintAmount" AS deposit,
            0 AS redeem,
            "mintAmount" AS amount,
            "mintTokens" AS ctoken
        FROM compound_v2."cErc20_evt_Mint"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "mintAmount" AS deposit,
            0 AS redeem,
            "mintAmount" AS amount,
            "mintTokens" AS ctoken
        FROM compound_v2."cEther_evt_Mint" 
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "mintAmount" AS deposit,
            0 AS redeem,
            "mintAmount" AS amount,
            "mintTokens" AS ctoken
        FROM compound_v2."CErc20Delegator_evt_Mint"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
 
        UNION ALL
        
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            0 AS deposit,
            -"redeemAmount" AS redeem,
            "redeemAmount" AS amount,
            "redeemTokens" AS ctoken
        FROM compound_v2."cErc20_evt_Redeem"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            0 AS deposit,
            -"redeemAmount" AS redeem,
            "redeemAmount" AS amount,
            "redeemTokens" AS ctoken
        FROM compound_v2."cEther_evt_Redeem"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            0 AS deposit,
            -"redeemAmount" AS redeem,
            "redeemAmount" AS amount,
            "redeemTokens" AS ctoken
        FROM compound_v2."CErc20Delegator_evt_Redeem"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    )

    SELECT --daily sums for interest, depositing capital, widthdrawing capital, and total
        time,
        contract_address,
        SUM(deposit) AS dailyDeposit,
        SUM(redeem) AS dailyRedeem,
        SUM(amount) AS dailyAmount,
        SUM(ctoken) AS dailyCtoken
    FROM mr_tx
    GROUP BY 1,2
),

reserves AS (
    WITH reserves_with_gap AS (
        SELECT 
            time,
            contract_address,
            lead(time, 1, now()) OVER (PARTITION BY contract_address ORDER BY time ASC) AS next_time,
            SUM(dailyDeposit+dailyRedeem) OVER (PARTITION BY contract_address ORDER BY time) AS total_reserve -- calculating total deposits by factoring in widthdraws
        FROM dailyMintRedeem
    ),
    
    gs AS (
        SELECT
            generate_series('2019-05-07 00:00', NOW(), '1 day'::interval) AS time --is the redundent?
    )
    
    SELECT
        gs.time,
        contract_address,
        total_reserve
    FROM reserves_with_gap b
    INNER JOIN gs ON b.time <= gs.time AND gs.time < b.next_time
),

interests AS ( --interest for each listed market from the three sources...over time
    WITH ai_tx AS (
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "interestAccumulated" AS interest
        FROM compound_v2."CErc20Delegator_evt_AccrueInterest"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "interestAccumulated" AS interest
        FROM compound_v2."cErc20_evt_AccrueInterest"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            contract_address,
            "interestAccumulated" AS interest
        FROM compound_v2."cEther_evt_AccrueInterest"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    )

    SELECT
        time,
        contract_address,
        SUM(interest) AS dailyInterest
    FROM ai_tx
    GROUP BY 1,2
),

liquidations AS ( --debt defaults data with be multiplied with ctoken conversions later
    WITH liq_tx AS (
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            "cTokenCollateral" AS contract_address,
            "seizeTokens" AS liquidated
        FROM compound_v2."CErc20Delegator_evt_LiquidateBorrow"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            "cTokenCollateral" AS contract_address,
            "seizeTokens" AS liquidated
        FROM compound_v2."cErc20_evt_LiquidateBorrow"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
        UNION ALL
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            "cTokenCollateral" AS contract_address,
            "seizeTokens" AS liquidated
        FROM compound_v2."cEther_evt_LiquidateBorrow"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    )
    
    SELECT
        time,
        contract_address,
        SUM(liquidated) AS daily_liq
    FROM liq_tx
    GROUP BY 1,2
),

incentives AS ( --incentives paid to users, !important for protocol strat! ... Anchor 
    WITH inc_tx AS (
        SELECT 
            date_trunc('day', evt_block_time) AS time,
            "cToken" AS contract_address,
            0 AS SupplyIncentive,
            "compDelta"/1e18 AS BorrowincentIve
            -- 0 AS compSupplyIndex,
            -- "compBorrowIndex"/1e18 AS compBorrowIndex,
            -- evt_tx_hash
        FROM compound_v2."Unitroller_evt_DistributedBorrowerComp"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc') 
        -- Removing Hack incentives so they don't mess with graphs
        AND NOT (
            evt_block_time BETWEEN '2021-09-29 00:00' AND  '2021-10-08 23:15'
            AND "cToken" IN ('\xe65cdb6479bac1e22340e4e755fae7e509ecd06c', '\x95b4ef2869ebd94beb4eee400a99824bf5dc325b', '\xf5dce57282a584d2746faf1593d3121fcac444dc', '\x4b0181102a0112a2ef11abee5563bb4a3176c9d7', '\x12392f67bdf24fae0af363c24ac620a2f67dad86', '\x80a2ae356fc9ef4305676f7a3e2ed04e12c33946')
        )
        UNION ALL
        SELECT
            date_trunc('day', evt_block_time) AS time,
            "cToken" AS contract_address,
            "compDelta"/1e18 AS SupplyIncentive,
            0 AS SupplyIncentive
            -- "compSupplyIndex"/1e18 AS compSupplyIndex,
            -- 0 AS compBorrowIndex,
            -- evt_tx_hash
        FROM compound_v2."Unitroller_evt_DistributedSupplierComp"
        WHERE contract_address NOT IN ('\x158079ee67fce2f58472a96584a73c7ab9ac95c1', '\xf5dce57282a584d2746faf1593d3121fcac444dc')
    ),
    
    dailyIncentives AS (
        SELECT
            time,
            contract_address,
            SUM(SupplyIncentive) AS DailySupplyIncentive,
            SUM(BorrowincentIve) AS DailyBorrowIncentive
        FROM inc_tx
        GROUP BY 1,2
    ),
    
   compIncentives AS (
        SELECT *,
            SUM(DailySupplyIncentive) OVER (PARTITION BY contract_address ORDER BY time) AS TotalSupplyIncentive,
            SUM(DailyBorrowincentIve) OVER (PARTITION BY contract_address ORDER BY time) AS TotalBorrowincentIve
        FROM dailyIncentives
    )
    
    SELECT 
        i.*,
        price AS compPrice,
        DailySupplyIncentive*price AS DailySupplyIncentiveUSD,
        DailyBorrowIncentive*price AS DailyBorrowIncentiveUSD,
        TotalSupplyIncentive*price AS TotalSupplyIncentiveUSD,
        TotalBorrowincentIve*price AS TotalBorrowincentIveUSD
    FROM compIncentives i
    LEFT JOIN daily_price p ON i.time = p.time AND p.symbol = 'COMP'
),

resFactor AS ( --COMPs cut of interest overtime
   WITH gap_ResFactor_tx AS (
        WITH ResFactor_tx AS (
            SELECT 
                evt_block_time AS time,
                contract_address,
                "newReserveFactorMantissa"/1e18 AS ReserveFac
            FROM compound_v2."cErc20_evt_NewReserveFactor"
            UNION ALL
            SELECT 
                evt_block_time AS time,
                contract_address,
                "newReserveFactorMantissa"/1e18 AS ReserveFac
            FROM compound_v2."cEther_evt_NewReserveFactor"
            UNION ALL
            SELECT 
                evt_block_time AS time,
                contract_address,
                "newReserveFactorMantissa"/1e18 AS ReserveFac
            FROM compound_v2."CErc20Delegator_evt_NewReserveFactor"
        )
    
         SELECT
            time,
            lead(time, 1, now()) OVER (PARTITION BY contract_address ORDER BY time ASC) AS next_day,
            contract_address,
            ReserveFac
        FROM ResFactor_tx
        ORDER BY contract_address, time DESC
    ),
            
    days AS (
        SELECT DISTINCT
            generate_series('2019-05-07'::TIMESTAMP, date_trunc('day', NOW()), '1 day') AS day,
            contract_address
        FROM gap_ResFactor_tx
    )
    
    SELECT 
        d.day AS time,
        g.contract_address,
        ReserveFac
    FROM gap_ResFactor_tx g
    INNER JOIN days d ON g.time <= d.day AND d.day < g.next_day AND g.contract_address = d.contract_address
),


tokenskpi AS ( --putting it all together!!! Cleaning up labels for graphs with "_" and from drawing all the subqueries 
    SELECT  
        b.time AS "Day",
        token AS "Token",
        price AS "Day Price",
        COALESCE(dailyDeposit/10^t.decimals, 0) AS "Deposit (Native)", --using coalesce to handle any null values and multiplying the decimals referencing in the begining to accurately display deposits amounts in the naitive token
        COALESCE((dailyDeposit/10^t.decimals)*price, 0) AS "Deposit (USD)", --multipling deposits by relevent price of the particular token
        COALESCE(dailyRedeem/10^t.decimals, 0) AS "Redeem (Native)", --""
        COALESCE((dailyRedeem/10^t.decimals)*price, 0) AS "Redeem (USD)", --""
        COALESCE(borrow/10^t.decimals, 0) AS "Borrow (Native)", --""
        COALESCE((borrow/10^t.decimals)*price, 0) AS "Borrow (USD)", --""
        COALESCE(repay/10^t.decimals, 0) AS "Repay (Native)", --""
        COALESCE((repay/10^t.decimals)*price, 0) AS "Repay (USD)", --""
        COALESCE(daily_liq/10^ctoken_decimals, 0) AS daily_liq_ctoken,
        total_reserve/10^t.decimals AS "Outstanding Deposits (Native)", --""
        (total_reserve/10^t.decimals)*price AS "Outstanding Deposits (USD)", --""
        COALESCE(Total_Borrow/10^t.decimals, 0) AS "Outstanding Loans (Native)", --""
        COALESCE((Total_Borrow/10^t.decimals)*price, 0) AS "Outstanding Loans (USD)",--""
        dailyInterest/10^t.decimals AS "Interest (Native)", --""
        (dailyInterest/10^t.decimals)*price AS "Interest (USD)", --""
        COALESCE((dailyAmount/10^t.decimals)/NULLIF((dailyCtoken/10^t.cToken_Decimals),0),0) AS "cToken Convertion", --finding the ctoken ratio with division
        COALESCE((Total_Borrow/10^t.decimals)/NULLIF((total_reserve/10^t.decimals),0),0) AS "Utilization", --finding the debt utilization of assets total borrowed/total deposited
        compPrice AS "COMP Price",  
        COALESCE(DailySupplyIncentive, 0) AS "Deposit Incentive (COMP)", --""
        COALESCE(DailySupplyIncentiveUSD, 0) AS "Deposit Incentive (USD)",--""
        COALESCE(DailyBorrowIncentive, 0) AS "Borrow Incentive (COMP)",--""
        COALESCE(DailyBorrowIncentiveUSD, 0) AS "Borrow Incentive (USD)",--""
        COALESCE(TotalSupplyIncentive, 0) AS "Aggregate Deposit Incentive (COMP)",--""
        COALESCE(TotalSupplyIncentiveUSD, 0) AS "Aggregate Deposit Incentive (USD)",--""
        COALESCE(TotalBorrowIncentive, 0) AS "Aggregate Borrow Incentive (COMP)",--""
        COALESCE(TotalBorrowIncentiveUSD, 0) AS "Aggregate Borrow Incentive (USD)",--""
        ReserveFac AS "Reserve Factor",
        (dailyInterest/10^t.decimals)*ReserveFac AS "Protocol Revenue (Native)",-- interest * the reserve factor (which is the % of interest comp takes)
        (dailyInterest/10^t.decimals)*price*ReserveFac AS "Protocol Revenue (USD)", --above but with usd prices
        (dailyInterest/10^t.decimals)*(1-ReserveFac) AS "Supply-Side Revenue (Native)", --the revenue for individuals
        (dailyInterest/10^t.decimals)*price*(1-ReserveFac) AS "Supply-Side Revenue (USD)" --above but with USD prices
    FROM interests b
    LEFT JOIN loans a ON a.time = b.time AND a.contract_address = b.contract_address
    LEFT JOIN daily_BorrowRepay br ON br.time = b.time AND br.contract_address = b.contract_address
    LEFT JOIN dailyMintRedeem m ON m.time = b.time AND m.contract_address = b.contract_address
    LEFT JOIN reserves c ON c.time = b.time AND c.contract_address = b.contract_address
    LEFT JOIN liquidations l ON l.time = b.time AND l.contract_address = b.contract_address
    LEFT JOIN incentives i ON i.time = b.time AND i.contract_address = b.contract_address
    LEFT JOIN tokens t ON b.contract_address = t.contract_address
    LEFT JOIN daily_price p ON t.token = p.symbol AND b.time = p.time
    LEFT JOIN resFactor r ON b.contract_address = r.contract_address AND b.time = r.time
    WHERE b.time BETWEEN '{{1 - Start Date Time}}' AND LEAST ('{{2 - Finish Date Time}}', NOW())
    AND compPrice IS NOT NULL
), -- all of the left joins are adding the subqueries created above on a speific col, all protocol data is joined at the contract addressses of listed markets, and prices are joined on date  

tokenskpi2 AS (
    SELECT *,
        COALESCE(daily_liq_ctoken*"cToken Convertion", 0) AS "Liquidation (Native)", 
        COALESCE(daily_liq_ctoken*"cToken Convertion"*"Day Price", 0) AS "Liquidation (USD)"
    FROM tokenskpi
),

tokenskpi3 AS ( --everything summed up and final names for graph.
    SELECT 
        "Day",
        SUM("Deposit (USD)") AS "Deposits (USD)",
        SUM("Redeem (USD)") AS "Redeems (USD)",
        SUM("Borrow (USD)") AS "Borrows (USD)",
        SUM("Repay (USD)") AS "Repays (USD)",
        SUM("Liquidation (USD)") AS "Liquidations (USD)",
        SUM("Outstanding Deposits (USD)") AS "Outstanding Deposits (USD)",
        SUM("Outstanding Loans (USD)") AS "Outstanding Loans (USD)",
        SUM("Interest (USD)") AS "Interests (USD)",
        "COMP Price",
        SUM("Deposit Incentive (COMP)") AS "Deposit Incentive (COMP)",
        SUM("Deposit Incentive (USD)") AS "Deposit Incentive (USD)",
        SUM("Borrow Incentive (COMP)") AS "Borrow Incentive (COMP)",
        SUM("Borrow Incentive (USD)") AS "Borrow Incentive (USD)",
        SUM("Aggregate Deposit Incentive (COMP)") AS "Aggregate Deposit Incentive (COMP)",
        SUM("Aggregate Deposit Incentive (USD)") AS "Aggregate Deposit Incentive (USD)",
        SUM("Aggregate Borrow Incentive (COMP)") AS "Aggregate Borrow Incentive (COMP)",
        SUM("Aggregate Borrow Incentive (USD)") AS "Aggregate Borrow Incentive (USD)",
        SUM("Protocol Revenue (USD)") AS "Protocol Revenue (USD)",
        SUM("Supply-Side Revenue (USD)") AS "Supply-Side Revenue (USD)"
    FROM tokenskpi2
    GROUP BY "Day","COMP Price"
)

SELECT
    "Day",
    '|' AS ".",
    "Deposits (USD)",
    "Redeems (USD)",
    "Borrows (USD)",
    "Repays (USD)",
    "Liquidations (USD)",
    '|' AS "..",
    "Outstanding Deposits (USD)",
    "Outstanding Loans (USD)",
    "Interests (USD)",
    "Outstanding Loans (USD)"/NULLIF("Outstanding Deposits (USD)", 0) AS "Total Utilization",
    '|' AS ",",
    "Protocol Revenue (USD)",
    "Supply-Side Revenue (USD)",
    '|' AS ",,",
    "COMP Price",
    "Deposit Incentive (COMP)",
    "Deposit Incentive (USD)",
    "Borrow Incentive (COMP)",
    "Borrow Incentive (USD)",
    "Aggregate Deposit Incentive (COMP)",
    "Aggregate Deposit Incentive (USD)",
    "Aggregate Borrow Incentive (COMP)",
    "Aggregate Borrow Incentive (USD)"
FROM tokenskpi3
ORDER BY "Day" DESC
