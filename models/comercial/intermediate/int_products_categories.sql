with
    products as (
        select *
        from {{ ref('stg_erp_products') }}
    )

    ,categories as (
        select *
        from {{ ref('stg_erp__categories') }}
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
            , categories.NOME_CATEGORIA
            , categories.DESCRICAO_CATEGORIA
        from products
        left join categories 
            on categories.pk_categoria = products.fk_categoria
    )

select *
from joined
