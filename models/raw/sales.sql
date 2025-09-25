{{ config(materialized="incremental", unique_key="integration_id") }}

select * from {{ source("bicc", "sales")}}