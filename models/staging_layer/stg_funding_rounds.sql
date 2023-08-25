with source as (
    select * from {{source('startup_source', 'funding_rounds')}}
)
select *
from source