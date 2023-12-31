with
    ipos as (
        select
            id,
            ipo_id,
            object_id as startup_object_id,
            valuation_amount,
            valuation_currency_code,
            raised_amount,
            raised_currency_code,
            public_at,
            stock_symbol,
            source_url,
            source_description,
            created_at,
            current_timestamp() as updated_at
        from {{ ref("stg_ipos") }}
        group by all
        -- removing duplicates
        having count(*) = 1
    )
select *
from ipos
