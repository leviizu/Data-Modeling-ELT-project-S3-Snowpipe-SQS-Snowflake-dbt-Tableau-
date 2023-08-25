with source as 
(select 
 acquisition_id
,acquiring_object_id as buyer
,acquired_object_id as asset
,term_code 
,price_amount
,price_currency_code
,acquired_at
,source_url 
,source_description 
,created_at
,updated_at current_timestamp() as updated_at
from {{ref('stg_acquisition')}}),

--removing duplicates
with unique_source as(
  select *, row_number() over(partition by acquisition_id) as id
from source)

select * except(id)
from unique_source
where id = 1
