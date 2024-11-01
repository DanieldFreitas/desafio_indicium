WITH renaming AS (
    SELECT
        CAST(SHIPPER_ID AS INT) AS pk_transportadora,
        CAST(COMPANY_NAME AS VARCHAR) AS nome_transportadora
    FROM {{ source('erp.northwind', 'shippers') }}  -- Certifique-se que 'erp' e 'shippers' estão corretos
)

SELECT *
FROM renaming
