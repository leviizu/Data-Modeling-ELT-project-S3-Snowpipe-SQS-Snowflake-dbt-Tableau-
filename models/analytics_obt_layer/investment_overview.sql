--startup
select
    st.object_id,
    st.entity_type,
    st.entity_id ,
    st.parent_id ,
    st.name,
    st.normalized_name ,
    st.permalink ,
    st.category_code ,
    st.status ,
    st.founded_at,
    st.closed_at,
    st.domain ,
    st.homepage_url ,
    st.twitter_username ,
    st.logo_url ,
    st.logo_width ,
    st.logo_height ,
    st.short_description ,
    st.description ,
    st.overview ,
    st.tag_list ,
    st.country_code ,
    st.state_code ,
    st.city ,
    st.region ,
    st.created_by ,
    st.created_at,
--aquisition
     aq.acquisition_id
    ,aq.acquiring_object_id as buyer
    ,aq.acquired_object_id as asset
    ,aq.term_code 
    ,aq.price_amount
    ,aq.price_currency_code
    ,aq.acquired_at
    ,aq.source_url 
    ,aq.source_description 
    ,aq.created_at
--funding_rounds
    ,fr.id 
    ,fr.funding_round_id 
    ,fr.object_id 
    ,fr.funded_at ,
    ,fr.funding_round_type 
    ,fr.funding_round_code 
    ,fr.raised_amount_usd 
    ,fr.raised_amount 
    ,fr.raised_currency_code 
    ,fr.pre_money_valuation_usd 
    ,fr.pre_money_valuation    
    ,fr.pre_money_currency_code 
    ,fr.post_money_valuation_usd 
    ,fr.post_money_valuation 
    ,fr.post_money_currency_code 
    ,fr.participants,
    ,fr.is_first_round boolean,
    ,fr.is_last_round boolean,
    ,fr.source_url 
    ,fr.source_description
--funds
    fd.id 
    ,fd.fund_id 
    ,fd.object_id 
    ,fd.name 
    ,fd.funded_at 
    ,fd.raised_amount 
    ,fd.raised_currency_code 
    ,fd.source_url
    ,fd.source_description
    ,fd.created_at 
--investment
    inv.investment_id
    inv.funding_round_id 
    inv.funded_object_id 
    inv.investor_object_id 
    inv.created_at 
--ipos
    ip.id 
    ip.ipo_id 
    ip.object_id 
    ip.valuation_amount
    ip.valuation_currency_code 
    ip.raised_amount
    ip.raised_currency_code 
    ip.public_at
    ip.stock_symbol
    ip.source_url 
    ip.source_description
    ip.created_at
    current_timestamp() as ingestion_date
from {{ref('dim_startup')}} st
left join {{ref('fact_acquisition')}} aq on st.object_id = acquiring_object_id 
left join {{ref('fact_funding_rounds')}} fr
left join {{ref('fact_funds')}} fd
left join {{ref('bridge_investment')}} inv
left join {{ref('fact_ipos')}} ip
