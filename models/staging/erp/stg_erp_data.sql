WITH renaming AS (
    SELECT
        cast(DATA_ID as int) as pk_data
        , cast(DATA as date) as data
        , cast(ANO as int) as ano
        , cast(MES as int) as mes
        , cast(DIA as int) as dia
        , cast(DIA_DA_SEMANA as int) as dia_da_semana
        , cast(TRIMESTRE as int) as trimeste 
        , cast(ANO_MES as varchar) as ano_mes
        , cast(ANO_SEMANA as int) as anosemana
    FROM {{ source('erp.northwind', 'data') }}  -- Certifique-se que 'erp' e 'shippers' estão corretos
)

SELECT *
FROM renaming


