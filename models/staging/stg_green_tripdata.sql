with 

source as (

    select * from {{ source('staging', 'green_trip_data')}}
)
,renamed as (

    select 
        {{ dbt_utils.generate_surrogate_key(['vendor_id', 'pickup_datetime']) }} as tripid,
        vendor_id AS vendorid,
        pickup_datetime AS lpep_pickup_datetime,
        dropoff_datetime AS lpep_dropoff_datetime,
        store_and_fwd_flag,
        rate_code AS ratecode_id,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        ehail_fee,
        airport_fee,
        total_amount,
        payment_type,
        {{ get_payment_type_description('payment_type') }} as payment_type_description,
        distance_between_service,
        time_between_service,
        trip_type,
        imp_surcharge,
        pickup_location_id AS pulocationid,
        dropoff_location_id AS dolocationsid,
        data_file_year,
        data_file_month

    from source
)

select * from renamed