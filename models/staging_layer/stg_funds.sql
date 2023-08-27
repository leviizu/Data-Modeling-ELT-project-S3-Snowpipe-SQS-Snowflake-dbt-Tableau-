with source as (select * from {{ source("startup_source", "funds") }})
select *
from source
