{{ config(
    alias='target_customers_d',
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='customer_id',
    on_schema_change='sync_all_columns'
) }}

select
  c.customer_id,
  initcap(c.first_name) as first_name,
  initcap(c.last_name)  as last_name,
  c.email,
  c.signup_ts
from {{ ref('customers_stg') }} c

{% if is_incremental() %}
where c.signup_ts > (
  select coalesce(max(signup_ts), timestamp '1900-01-01')
  from {{ this }}
)
{% endif %}
