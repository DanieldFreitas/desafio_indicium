with
    ORDERS as (
        select *
        from {{ ref('sgt_erp_orders') }}
    )

    , ORDER_DETAILS as (
        select *
        from {{ ref('sgt_erp_order_details') }}
    )

    , joined as (
        select
        ORDER_DETAILS.PK_PEDIDO_ITEM

        , ORDER_DETAILS.FK_PRODUTO
        , ORDERS.FK_CLIENTE
        , ORDERS.FK_FUNCIONARIOS
        , ORDERS.FK_TRANSPORTADORA
        , ORDERS.DATA_DO_PEDIDO
        , ORDERS.DATA_REQUERIDA_ENTREGA
        , ORDERS.DATA_DO_ENVIO
        , ORDER_DETAILS.PRECO_DA_UNIDADE
        , ORDER_DETAILS.QUANTIDADE
        , ORDER_DETAILS.desconto_perc
        , ORDERS.FRETE
        , ORDERS.numero_pedido
        , ORDERS.NOME_DESTINATARIO
        , ORDERS.CIDADE_DESTINATARIO
        , ORDERS.REGIAO_DESTINATARIO
        , ORDERS.PAIS_DESTINATARIO
        from ORDER_DETAILS 
        inner join ORDERS on ORDERS.pk_pedidos = ORDER_DETAILS.fk_pedido
    )

    , metrica as (
        select *
            , quantidade * preco_da_unidade as valor_bruto 
            , quantidade * preco_da_unidade * (1-desconto_perc) as valor_liquido
            , frete / (count(*) over(partition by numero_pedido)) as frete_rateado
            , case 
                when desconto_perc > 0 then true
                else false
            end as teve_desconto
            , (valor_bruto - desconto_perc) / numero_pedido
        from joined
    )

    , final_select as (
        select 
            PK_PEDIDO_ITEM
            , FK_PRODUTO
            , FK_CLIENTE
            , FK_FUNCIONARIOS
            , FK_TRANSPORTADORA
            , DATA_DO_PEDIDO
            , DATA_REQUERIDA_ENTREGA
            , DATA_DO_ENVIO
            , PRECO_DA_UNIDADE
            , QUANTIDADE     
            , DESCONTO_PERC
            , VALOR_BRUTO
            , VALOR_LIQUIDO
            , cast(FRETE_RATEADO as numeric(18,2)) as frete_rateado
            , TEVE_DESCONTO
            , NUMERO_PEDIDO
            , NOME_DESTINATARIO
            , CIDADE_DESTINATARIO
            , REGIAO_DESTINATARIO
            , PAIS_DESTINATARIO
        from metrica
    )

select *
from final_select