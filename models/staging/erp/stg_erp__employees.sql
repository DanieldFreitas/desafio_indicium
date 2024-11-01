with
    source_employees as (
        select *
        from {{ source('erp.northwind', 'employees') }}
    )

    , renaming as (
        select
        cast(EMPLOYEE_ID as int) as pk_funcionario
        , cast(REPORTS_TO as int) as fk_gerente
        , FIRST_NAME || ' ' || LAST_NAME as nome_funcionario
        , cast(TITLE as varchar) as cargo_funcionario 
        , cast(BIRTH_DATE as date) as dt_nascimento_funcionario
        , cast(HIRE_DATE as date) as dt_contratacao
        , cast(CITY as varchar) as cidade_funcionario
        , cast(REGION as varchar) as regiao_funcionario
        , cast(COUNTRY as varchar) as pais_funcionario
        , cast(NOTES as varchar) as gasto_funcionario
        --, cast(HOME_PHONE as varchar)
        --, cast(EXTENSION as varchar)
        --, cast(PHOTO as varchar)
        --, cast(TITLE_OF_COURTESY as varchar) as 
         --, cast(ADDRESS as varchar)
        --, cast(POSTAL_CODE as varchar)
        --, cast(PHOTO_PATH as varchar) as 
        from source_employees
    )

select *
from renaming
