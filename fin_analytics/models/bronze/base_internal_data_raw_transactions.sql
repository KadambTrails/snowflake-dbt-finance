with source as (
        select * from {{ source('internal_data', 'raw_transactions') }}
  ),
  renamed as (
      select
          {{ adapter.quote("TRADE_ID") }},
        {{ adapter.quote("TRADER_ID") }},
        {{ adapter.quote("AMOUNT_LOCAL") }},
        {{ adapter.quote("CURRENCY_CODE") }},
        {{ adapter.quote("TRANSACTION_TIMESTAMP") }}

      from source
  )
  select * from renamed
    