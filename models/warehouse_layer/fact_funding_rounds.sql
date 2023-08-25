select
,id 
,funding_round_id 
,object_id 
,funded_at ,
,funding_round_type 
,funding_round_code 
,raised_amount_usd 
,raised_amount 
,raised_currency_code 
,pre_money_valuation_usd 
,pre_money_valuation    
,pre_money_currency_code 
,post_money_valuation_usd 
,post_money_valuation 
,post_money_currency_code 
,participants,
,is_first_round boolean,
,is_last_round boolean,
,source_url 
,source_description 
,updated_at current_timestamp() as updated_at
from {{ref('stg_funding_rounds')}}