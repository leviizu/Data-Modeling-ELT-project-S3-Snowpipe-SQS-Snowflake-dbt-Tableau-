-- buyer
with
    acquisition_buyer as (
        select aq.acquisition_id, aq.acquiring_object_id as buyer_id, st.name as buyer
        from  {{ ref("dim_startup") }} st 
        left join  {{ ref("fact_acquisition") }} aq on aq.acquiring_object_id = st.object_id
    ),
    -- asset
    acquisition_asset as (
        select aq.acquisition_id, aq.acquired_object_id as asset_id, st.name as asset
        from {{ ref("dim_startup") }} st 
        left join  {{ ref("fact_acquisition") }} aq on aq.acquired_object_id = st.object_id
    ),
    -- aquisition
    acquisition as (
        select
            aq.acquisition_id,
            ab.buyer,
            aa.asset,
            aq.term_code,
            aq.price_amount,
            aq.price_currency_code,
            aq.acquired_at,
            aq.source_url,
            aq.source_description,
            current_timestamp() as updated_at
        from {{ ref("fact_acquisition") }} aq
        inner join
            acquisition_buyer ab
            on ab.buyer_id = aq.acquiring_object_id
            --and aq.acquisition_id = ab.acquisition_id
        inner join
            acquisition_asset aa
            on aa.asset_id = aq.acquired_object_id
            --and aq.acquisition_id = aa.acquisition_id
    )

select *
from acquisition
