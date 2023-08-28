with
    startup as (
        select
            id as object_id,
            entity_type,
            entity_id,
            parent_id,
            name,
            normalized_name,
            permalink,
            category_code,
            status,
            founded_at,
            closed_at,
            domain,
            homepage_url,
            twitter_username,
            logo_url,
            logo_width,
            logo_height,
            short_description,
            description,
            overview,
            tag_list,
            country_code,
            state_code,
            city,
            region,
            created_by,
            created_at,
            current_timestamp() as ingestion_date
        from {{ ref("stg_startup") }}
        group by all
        having count(*) = 1
    ),
    unique_startup as (
        select *, row_number() over (partition by object_id order by object_id) as id
        from startup
    )
select
    object_id,
    entity_type,
    entity_id,
    parent_id,
    name,
    normalized_name,
    permalink,
    category_code,
    status,
    founded_at,
    closed_at,
    domain,
    homepage_url,
    twitter_username,
    logo_url,
    logo_width,
    logo_height,
    short_description,
    description,
    overview,
    tag_list,
    country_code,
    state_code,
    city,
    region,
    created_by,
    created_at,
    ingestion_date
from unique_startup
where id = 1
