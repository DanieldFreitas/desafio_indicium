with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , joined as (
        select
            employees.PK_FUNCIONARIO
            , employees.NOME_FUNCIONARIO
            , gerente.nome_funcionario as nome_gerente
            , employees.CARGO_FUNCIONARIO
            , employees.DT_NASCIMENTO_FUNCIONARIO
            , employees.DT_CONTRATACAO
            , employees.CIDADE_FUNCIONARIO
            , employees.REGIAO_FUNCIONARIO
            , employees.PAIS_FUNCIONARIO
            , employees.GASTO_FUNCIONARIO
        from employees
        left join employees as gerente
            on employees.fk_gerente = gerente.pk_funcionario
    )

    select *
    from joined
    