{{ config(materialized='table') }}

select * 
from {{ ref('customers_stg') }};
