with
    renaming as (
        select
            cast(SUPPLIER_ID as int) as pk_fornecedor
            , cast(COMPANY_NAME as varchar) as nome_fornecedor
            , cast(CITY as varchar) as cidade_fornecedor
            , cast(COUNTRY as varchar) as pais_fornecedor
        from {{ source('erp.northwind', 'SUPPLIERS') }}
    )

select *
from renaming
