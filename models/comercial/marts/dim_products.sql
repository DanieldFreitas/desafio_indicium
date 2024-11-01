with
    int_products as(
        select *
        from {{ ref('int_products_categories') }}
    )

select *
from int_products
