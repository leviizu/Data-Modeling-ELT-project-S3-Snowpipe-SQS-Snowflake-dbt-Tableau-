with acqusition as(
select * from {{ref("fact_acquisition")}}
)
select acquisition_id,sum (price_amount) as cost
from acqusition
group by acquisition_id
having cost <0
