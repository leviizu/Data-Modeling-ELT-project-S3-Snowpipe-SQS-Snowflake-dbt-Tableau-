with source as (
    select * from {{source('startup_source', 'acquisition')}}
)
select *
from source