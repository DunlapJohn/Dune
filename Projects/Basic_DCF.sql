WITH

Inputs as (
select    
    '{{6 - Discount Rate %}}'::numeric/ 100 as discount_rate, 
    '{{1 - Current Supply}}'::numeric as supply, -- Current circlulating supply 'today
    '{{5 - Revenue Growth Rate %}}'::numeric / 100 as growth_rate, --what was last years revenue growth rate x/12
    20::numeric as projection_years, --choose your time horizion
    '{{7 - Assumed P/E Ratio}}'::numeric as assumed_pe, --from your revenue caluclations base your price/earnings assumption
    12 * '{{4 - Monthly Revenue USD}}'::numeric as annual_revenue, 
    case
        when '{{3 - Inflation / Deflation}}' = 'Inflation' then ('{{2 - Supply Change %}}'::numeric / 100) --is the currency inflationary or deflationary?
        else ('{{2 - Supply Change %}}'::numeric / -100)
    end as inflation_rate
),

years as (select generate_series (1,20,1) as year), --your projected time horizion

math as (
select
    year,
    case
        when year = 1 then date_trunc('year', current_date)
        else date_trunc('year', current_date) + (year - 1) * interval '1 year'
    end as year_date, --formatting the series
    (d.annual_revenue) * (1 + d.growth_rate)^(y.year - 1) as revenue, 
    d.growth_rate,
    (1 - d.discount_rate)^(y.year) as discount_rate,
    ((1 - d.discount_rate)^(y.year)) * (d.annual_revenue) * (1 + d.growth_rate)^(y.year - 1) as present_value, --revenue discounted
    d.assumed_pe,
    d.supply * (1 + d.inflation_rate)^(y.year - 1) as supply
from        (select generate_series (1,20,1) as year) y
cross join  inputs d
),

summary as (
select
    year,
    year_date,
    revenue,
    growth_rate,
    discount_rate,
    present_value,
    sum(present_value) over (order by year asc) as cumulative_present_value,
    assumed_pe,
    supply
from math
)

select
    year_date as "Year",
    revenue as "Revenue",
    present_value as "Present Value",
    cumulative_present_value,
    assumed_pe * revenue as "Implied Valuation",
    (assumed_pe * revenue) / supply as fair_value_price,
    supply
from summary

-- This would have been impossible without the skills and precendent query of @anthonybowman -this guy is a wizard
