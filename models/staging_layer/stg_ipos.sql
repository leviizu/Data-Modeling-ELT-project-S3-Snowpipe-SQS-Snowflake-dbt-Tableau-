with source as (
    select * from {{source('startup_source', 'ipos')}}
)
select *
from source