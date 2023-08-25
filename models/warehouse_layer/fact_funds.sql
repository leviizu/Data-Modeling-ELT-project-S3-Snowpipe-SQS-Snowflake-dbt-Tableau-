select 
    id 
    ,fund_id 
    ,object_id 
    ,name 
    ,funded_at 
    ,raised_amount 
    ,raised_currency_code 
    ,source_url
    ,source_description
    ,created_at  
,updated_at current_timestamp() as updated_at
from {{ref('stg_funds')}}