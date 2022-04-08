WITH price as ( 
select 
    date_trunc('day',block_time) as day,
    token_a_symbol as dpi,
    token_a_amount as value_out
from dex."trades"
where token_a_symbol = 'UNI'
and block_time > '2022-01-01'
),


uni as (
select
    price as uni_price,
    symbol,
    date_trunc('day', minute) as day
from prices."usd"
where symbol = 'UNI'
and minute > '2022-01-01'
),


prices as (
select
    day,
    value_out,
    AVG(value_out) as avg_amount_out
from price
Where day > '2022-01-01'
group by day, value_out
    )
   
    
select
        value_out,
        value_out/'{{UNI Supply}}' as velocity,
        avg(avg_amount_out) OVER(ORDER BY p.day ROWS BETWEEN 29 PRECEDING AND CURRENT ROW ) as MA,
        p.day,
        uni_price
from prices p
left join uni u on u.day = p.day
Where p.day > '2022-01-01'
order by day desc
