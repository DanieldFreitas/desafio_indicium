with
    renaming as (
        select
            cast(PRODUCT_ID as int) as pk_produto
            , cast(SUPPLIER_ID as int) as fk_fornecedor
            , cast(CATEGORY_ID as int) as fk_categoria
            , cast(PRODUCT_NAME as varchar) as nome_produto
            , cast(QUANTITY_PER_UNIT as varchar) as quantidade_por_unidade
            , cast(UNIT_PRICE as numeric(18,2)) as preco_por_unidade
            , cast(UNITS_IN_STOCK as int) unidade_estoque
            , cast(UNITS_ON_ORDER as int) unidade_por_pedido
            , cast(REORDER_LEVEL as int) nivel_pedido
            , case 
                when DISCONTINUED = '1' then true
                when DISCONTINUED = '0' then false
            end as is_discontinuado
        from {{ source('erp.northwind', 'products') }}
    )

select *
from renaming