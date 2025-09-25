{{
    config(
        materialized="table",
        full_refresh=True,
    )
}}

select *
from {{ source('bicc','sales') }}
