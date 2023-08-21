with source as (
    select * from {{source('startup_source', 'summary')}}
)
select *
from source