with price as (
        select DATE(minute) as "day", AVG(price) as "daily_avg_price"
        from prices.usd where symbol = 'WETH' 
        group by day
        order by day desc     
    )
    
    
select *,
  avg(daily_avg_price) OVER(ORDER BY day ROWS BETWEEN 29 PRECEDING AND CURRENT ROW ) as moving_average 
from price
order by day desc
