with
    data_int as (
        select *
        from {{ ref('stg_erp_data') }}
    )

select * 
from data_int