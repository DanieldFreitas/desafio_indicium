with
    renaming as (
        select
           ORDER_ID::string || '-' || PRODUCT_ID::string as pk_pedido_item
            , cast(ORDER_ID as int) as fk_pedido
            , cast(PRODUCT_ID as int) as fk_produto
            , cast(UNIT_PRICE as numeric(18,2)) as preco_da_unidade
            , cast(QUANTITY as int) as quantidade
            , cast(DISCOUNT as numeric(18,2)) as desconto_perc
        from {{ source('erp.northwind', 'ORDER_DETAILS') }}
    )

select *
from renaming
