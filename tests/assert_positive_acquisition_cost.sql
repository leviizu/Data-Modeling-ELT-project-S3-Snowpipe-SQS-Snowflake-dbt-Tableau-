with acqusition as(
select * from {{ref("fact_acquisition")}}
)
select * 
from acqusition
where price_amount < 0

