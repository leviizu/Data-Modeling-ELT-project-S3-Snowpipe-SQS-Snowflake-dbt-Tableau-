with source as (
    select * from {{source('startup_source', 'investments')}}
)
select *
from source