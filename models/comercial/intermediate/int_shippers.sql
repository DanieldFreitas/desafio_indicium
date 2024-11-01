with
    shippers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )

select *
from shippers