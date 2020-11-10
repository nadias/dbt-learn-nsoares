{{
  config(
    materialized='view'
  )
}}

with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

payments_orders as (

    select
        order_id,
        sum(amount) as amount
    from payments
    group by 1

),

final as (

    select
        customers.customer_id,
        orders.order_id,
        payments_orders.amount

    from customers
    left join orders using (customer_id)
    left join payments_orders using (order_id)

    -- where orders.status ==

)

select * from final