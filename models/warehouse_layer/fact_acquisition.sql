with
    acquisition as (
        select
            acquisition_id,
            acquiring_object_id,
            acquired_object_id,
            term_code,
            price_amount,
            price_currency_code,
            acquired_at,
            source_url,
            source_description,
            created_at,
            current_timestamp() as updated_at
        from {{ ref("stg_acquisition") }}
        group by all
        -- removing duplicates
        having count(*) = 1
    )

select *
from acquisition
