with
    int_employess as(
        select *
        from {{ ref('int_products_suppliers') }}
    )

select *
from int_employess