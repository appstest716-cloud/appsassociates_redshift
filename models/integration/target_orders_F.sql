{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
  o.order_id,
  o.customer_id,
  o.order_ts,
  o.order_total as amount,  -- or just keep `o.order_total`
  c.first_name,
  c.last_name,
  c.email
from {{ ref('orders_stg') }} o
left join {{ ref('target_customers_D') }} c
  on c.customer_id = o.customer_id
