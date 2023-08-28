-- investor
with
    investor as (
        select inv.investment_id, inv.funding_round_id, st.name as investor
        from {{ ref("dim_startup") }} st
        left join
            {{ ref("bridge_investment") }} inv on inv.investor_object_id = st.object_id
    ),
    -- asset
    asset as (
        select inv.investment_id, inv.funding_round_id, st.name as asset
        from {{ ref("dim_startup") }} st
        left join
            {{ ref("bridge_investment") }} inv on inv.funded_object_id = st.object_id

    ),
    -- funds
    funding as (
        select
            inv.investment_id,
            fr.funding_round_id,
            fr.funded_entity_object_id,
            fr.funded_at,
            fr.funding_round_type,
            fr.funding_round_code,
            fr.raised_amount_usd,
            fr.raised_amount,
            fr.raised_currency_code,
            fr.pre_money_valuation_usd,
            fr.pre_money_valuation,
            fr.pre_money_currency_code,
            fr.post_money_valuation_usd,
            fr.post_money_valuation,
            fr.post_money_currency_code,
            fr.participants,
            fr.is_first_round,
            fr.is_last_round,
            fr.source_url,
            fr.source_description
        from {{ ref("fact_funding_rounds") }} fr
        left join
            {{ ref("bridge_investment") }} inv
            on fr.funding_round_id = inv.funding_round_id

    ),
    investment as (
        select i.investor, a.investment_id, a.funding_round_id, a.asset,
        f.funded_at,
        f.funding_round_type,
        f.funding_round_code,
        f.raised_amount_usd,
        f.raised_amount,
        f.raised_currency_code,
        f.pre_money_valuation_usd,
        f.pre_money_valuation,
        f.pre_money_currency_code,
        f.post_money_valuation_usd,
        f.post_money_valuation,
        f.post_money_currency_code,
        f.participants,
        f.is_first_round,
        f.is_last_round,
        f.source_url,
        f.source_description
        from investor i
        inner join
            asset a
            on i.investment_id = a.investment_id
            and i.funding_round_id = a.funding_round_id
        inner join funding f
            on f.investment_id = a.investment_id
    )
select *
from investment

