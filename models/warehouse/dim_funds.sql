with
    funds as (
        select
            fund_id,
            object_id as funding_entity_object_id,
            name,
            raised_amount,
            raised_currency_code,
            source_url,
            source_description
        from {{ ref("stg_funds") }}
        group by all
    )
select *
from funds


