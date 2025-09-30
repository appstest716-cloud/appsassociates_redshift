{{ config(materialized='table') }}

select * from {{ source('stage','orders_raw') }};
