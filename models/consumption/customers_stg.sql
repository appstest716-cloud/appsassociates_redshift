{{ config(materialized='table') }}

select * 
from {{ source('stage','customers_raw') }};
