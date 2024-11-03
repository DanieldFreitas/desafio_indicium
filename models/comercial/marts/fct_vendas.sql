with
    int_vendas as(
        select *
        from {{ ref('int_vendas_metricas') }}
    )

    ,  dim_products as(
        select *
        from {{ ref('dim_products') }}
    )
    , dim_customers as(
        select *
        from {{ ref('dim_customers') }}
    )
    , dim_employees as(
        select *
        from {{ ref('dim_employees') }}
    )
    , dim_shippers as(
        select *
        from {{ ref('dim_shippers') }}
    )
    , dim_suppliers as(
        select *
        from {{ ref('dim_suppliers') }}
    )
    , dim_data as(
        select *
        from {{ ref('dim_data') }}
    )


select *
from int_vendas