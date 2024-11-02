with
    int_data as (
        select *
        from {{ ref('int_data') }}
    )

select *
from int_data