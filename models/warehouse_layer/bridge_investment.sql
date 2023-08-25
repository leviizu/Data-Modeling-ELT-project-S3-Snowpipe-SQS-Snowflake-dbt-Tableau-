select
    investment_id,
    funding_round_id,
    funded_object_id,
    investor_object_id,
    created_at,
    current_timestamp() as updated_at
from {{ ref("stg_investment") }}
