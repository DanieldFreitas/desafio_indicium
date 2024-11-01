with
    products as (
        select *
        from {{ ref('stg_erp_products') }}
    )

    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )

    , joined as (
        select
            products.PK_PRODUTO
            , products.NOME_PRODUTO
            , products.QUANTIDADE_POR_UNIDADE
            , products.PRECO_POR_UNIDADE
            , products.UNIDADE_ESTOQUE
            , products.UNIDADE_POR_PEDIDO
            , products.NIVEL_PEDIDO
            , products.IS_DISCONTINUADO
            , suppliers.NOME_FORNECEDOR
            , suppliers.CIDADE_FORNECEDOR
            , suppliers.PAIS_FORNECEDOR
        from products
        left join suppliers 
            on suppliers.pk_fornecedor = products.fk_fornecedor
    )

select *
from joined
