with locations as (

    select
        country,
        city,
        avg(latitude) as latitude,
        avg(longitude) as longitude
    from {{ ref('stg_air_quality') }}
    where city is not null
    group by country, city

)

select
    {{ dbt_utils.generate_surrogate_key(['country', 'city']) }} as location_id,
    country,
    city,
    latitude,
    longitude
from locations