with
    investment as (
        select
            id as investment_id,
            funding_round_id,
            funded_object_id,
            investor_object_id,
            created_at,
            current_timestamp() as updated_at
        from {{ ref("stg_investment") }}
        group by all
    )
,
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
    )

select 
i.investment_id,
i.investor_object_id,
i.created_at,
i.updated_at
f.*
from investment i
join funding_rounds f on i.funding_round_id = f.funding_round_id
and i.funded_object_id = f.funded_entity_object_id
