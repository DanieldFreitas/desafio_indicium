with
    int_suppliers as(
        select *
        from {{ ref('int_products_suppliers') }}
    )

select *
from int_suppliers