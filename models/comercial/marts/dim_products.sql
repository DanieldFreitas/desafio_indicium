with
    int_employess as(
        select *
        from {{ ref('int_products_categories') }}
    )

select *
from int_employess
