with
    funds as (
        select
            fund_id,
            object_id as funding_entity_object_id,
            name,
            funded_at,
            raised_amount,
            raised_currency_code,
            source_url,
            source_description,
            created_at,
            current_timestamp() as updated_at
        from {{ ref("stg_funds") }}
        group by all
        -- removing duplicates
        having count(*) = 1
    )
select *
from funds
