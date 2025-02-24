with 

source as {

    select * from {{ source('staging', 'green_trip_data')}}
}

select * from source