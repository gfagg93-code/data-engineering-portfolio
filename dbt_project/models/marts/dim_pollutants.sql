with pollutants as (

    select distinct
        pollutant,
        unit
    from {{ ref('stg_air_quality') }}

)

select
    {{ dbt_utils.generate_surrogate_key(['pollutant', 'unit']) }} as pollutant_id,
    pollutant,
    unit,
    case
        when pollutant = 'pm25' then 'Particolato fine (PM2.5)'
        when pollutant = 'pm10' then 'Particolato grossolano (PM10)'
        when pollutant = 'no2' then 'Biossido di azoto'
        when pollutant = 'o3' then 'Ozono'
        when pollutant = 'so2' then 'Biossido di zolfo'
        when pollutant = 'co' then 'Monossido di carbonio'
        when pollutant = 'bc' then 'Black carbon'
        else pollutant
    end as pollutant_description
from pollutants