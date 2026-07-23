with source as (

    select *
    from `portfolio-de-2026.air_quality_raw.raw_air_quality`

),

cleaned as (

    select
        country,
        city,
        pollutant,
        value,
        unit,
        timestamp as measured_at,
        latitude,
        longitude
    from source
    where value >= 0  -- scarta misurazioni negative, non valide

)

select * from cleaned