with measurements as (

    select * from {{ ref('stg_air_quality') }}

),

locations as (

    select * from {{ ref('dim_locations') }}

),

pollutants as (

    select * from {{ ref('dim_pollutants') }}

)

select
    m.measured_at,
    l.location_id,
    p.pollutant_id,
    m.value,
    m.country,
    m.city,
    m.pollutant
from measurements m
left join locations l
    on m.country = l.country
    and m.city = l.city
left join pollutants p
    on m.pollutant = p.pollutant