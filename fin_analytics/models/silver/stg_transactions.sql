with raw_data as (
    select * from {{ ref('base_internal_data_raw_transactions') }}
),

traders as (
    select * from {{ ref('base_internal_data_traders') }}
)

select
    t.trade_id,
    tr.trader_name,
    tr.region,
    t.amount_local,
    t.currency_code,
    cast(t.transaction_timestamp as timestamp) as trade_at,
    current_timestamp() as dbt_updated_at
from raw_data t
left join traders tr
    on t.trader_id = tr.trader_id