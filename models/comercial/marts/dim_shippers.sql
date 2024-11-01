with
    int_shippers as(
        select *
        from {{ ref('int_shippers') }}
    )

select *
from int_shippers