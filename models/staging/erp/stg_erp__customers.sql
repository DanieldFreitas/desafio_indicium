with
    renaming as (
        select
            cast(CUSTOMER_ID as string) as pk_clientes
            , cast(COMPANY_NAME as varchar) as nome_cliente
            , cast(ADDRESS as varchar) as endereco_cliente
            , cast(CITY as varchar) as cidade_cliente
            , cast(COUNTRY as varchar) as pais_cliente
        from {{ source('erp.northwind', 'customers') }}
    )

select *
from renaming

