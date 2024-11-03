with
    renaming as (
        select
         cast(ORDER_ID as int) as pk_pedidos
        ,  cast(CUSTOMER_ID as string) as fk_cliente
        ,  cast(EMPLOYEE_ID as int) as fk_funcionarios
        ,  cast(SHIP_VIA as int) as fk_transportadora
        ,  cast(ORDER_ID as int) as numero_pedido
        ,  cast(ORDER_DATE as date) as data_do_pedido
        ,  cast(REQUIRED_DATE as date) as data_requerida_entrega
        ,  cast(SHIPPED_DATE as date) as data_do_envio
        ,  cast(FREIGHT as numeric) as frete
        ,  cast(SHIP_NAME as varchar) as nome_destinatario
        ,  cast(SHIP_CITY as varchar) as cidade_destinatario
        ,  cast(SHIP_REGION as varchar) as regiao_destinatario
        ,  cast(SHIP_COUNTRY as varchar) as pais_destinatario
        ,  cast(DATA_ID as int) as fk_data       
        from {{ source('erp.northwind', 'ORDERS') }}
    )

select *
from renaming
