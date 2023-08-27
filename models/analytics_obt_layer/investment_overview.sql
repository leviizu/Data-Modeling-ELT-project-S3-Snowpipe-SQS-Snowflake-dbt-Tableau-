-- investor
with
    investor as (
        select inv.investment_id, inv.funding_round_id, st.name as investor
        from {{ ref("bridge_investment") }} inv
        inner join {{ ref("dim_startup") }} st on inv.investor_object_id = st.object_id
    ),
    -- asset and funds
    asset as (
        select
            inv.investment_id,
            inv.funding_round_id,
            st.name as asset,
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
        from {{ ref("bridge_investment") }} inv
        inner join {{ ref("dim_startup") }} st on inv.funded_object_id = st.object_id
        inner join
            {{ ref("fact_funding_rounds") }} fr
            on fr.funding_round_id = inv.funding_round_id
            and fr.funded_entity_object_id = inv.funded_object_id
    ),
    -- investment
    investment as (
        select 
        i.investor,
         a.investment_id,
            a.funding_round_id,
            a.asset,
            a.funded_entity_object_id,
            a.funded_at,
            a.funding_round_type,
            a.funding_round_code,
            a.raised_amount_usd,
            a.raised_amount,
            a.raised_currency_code,
            a.pre_money_valuation_usd,
            a.pre_money_valuation,
            a.pre_money_currency_code,
            a.post_money_valuation_usd,
            a.post_money_valuation,
            a.post_money_currency_code,
            a.participants,
            a.is_first_round,
            a.is_last_round,
            a.source_url,
            a.source_description
        from investor i
        inner join
            asset a
            on i.investment_id = a.investment_id
            and i.funding_round_id = a.funding_round_id
    )
select *
from investment
