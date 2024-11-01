with
    renaming as (
        select
            cast(CATEGORY_ID as int) as pk_categoria
            , cast(CATEGORY_NAME as varchar) as nome_categoria 
            , cast(DESCRIPTION as varchar) as descricao_categoria
        from {{ source('erp.northwind', 'categories') }}
    )

select *
from renaming
