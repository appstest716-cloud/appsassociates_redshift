{{ config(materialized='table') }}
select o.*, c.customer_id
from {{ ref('orders_stg') }} o
left join {{ ref('target_customers_D') }} c using (customer_id);
