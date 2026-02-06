with source as (
        select * from {{ source('marketplace_data', 'FX_RATES_TIMESERIES') }}
  ),
  renamed as (
      select
          {{ adapter.quote("VARIABLE") }},
        {{ adapter.quote("VARIABLE_NAME") }},
        {{ adapter.quote("BASE_CURRENCY_ID") }},
        {{ adapter.quote("QUOTE_CURRENCY_ID") }},
        {{ adapter.quote("BASE_CURRENCY_NAME") }},
        {{ adapter.quote("QUOTE_CURRENCY_NAME") }},
        {{ adapter.quote("DATE") }},
        {{ adapter.quote("VALUE") }}

      from source
  )
  select * from renamed
    