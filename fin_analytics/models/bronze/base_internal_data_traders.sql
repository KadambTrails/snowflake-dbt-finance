with source as (
        select * from {{ source('internal_data', 'traders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("TRADER_ID") }},
        {{ adapter.quote("TRADER_NAME") }},
        {{ adapter.quote("REGION") }},
        {{ adapter.quote("IS_ACTIVE") }}

      from source
  )
  select * from renamed
    