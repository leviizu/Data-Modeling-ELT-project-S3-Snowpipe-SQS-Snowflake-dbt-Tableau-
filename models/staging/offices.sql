with source as (
    select * from {{source('startup_source', 'offices')}}
)
select *
from source