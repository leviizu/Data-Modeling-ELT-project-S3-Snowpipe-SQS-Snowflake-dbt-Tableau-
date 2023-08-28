with
    ipos as (
        select
            st.name,
            ip.ipo_id,
            ip.startup_object_id,
            ip.valuation_amount,
            ip.valuation_currency_code,
            ip.raised_amount,
            ip.raised_currency_code,
            ip.public_at,
            ip.stock_symbol,
            ip.source_url,
            ip.source_description,
            ip.created_at,
            current_timestamp() as ingestion_date
        
        from {{ ref("dim_startup") }} st
        inner join {{ ref("fact_ipos") }} ip on st.object_id = ip.startup_object_id
    )

select *
from ipos
