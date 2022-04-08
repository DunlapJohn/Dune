WITH price AS (
   Select 
     date_trunc('day',minute) AS day,
     price ,
     symbol
FROM prices."usd" 
WHERE symbol IN ('MKR', 'AAVE', 'COMP', 'WETH')
and minute BETWEEN '2021-11-10' AND '2022-03-28'
GROUP BY day, price,  symbol
 ),
 
 avg_price as (
 Select 
    day,
     symbol,
      Price
from price
group by day, symbol, price
 )
 Select
     day,
     symbol,
      Price,
    (price/  FIRST_VALUE(price) OVER (PARTITION BY symbol ORDER BY day ASC))-1 AS Performance
    From avg_price
WHERE day BETWEEN '2021-11-10' AND '2022-03-28'


