with
    funding_rounds as (
        select
            id,
            funding_round_id,
            object_id as funded_entity_object_id,
            funded_at,
            funding_round_type,
            funding_round_code,
            raised_amount_usd,
            raised_amount,
            raised_currency_code,
            pre_money_valuation_usd,
            pre_money_valuation,
            pre_money_currency_code,
            post_money_valuation_usd,
            post_money_valuation,
            post_money_currency_code,
            participants,
            is_first_round,
            is_last_round,
            source_url,
            source_description,
            current_timestamp() as updated_at
        from {{ ref("stg_funding_rounds") }}
        group by all
        -- removing duplicates
        having count(*) = 1
    )

select *
from funding_rounds
