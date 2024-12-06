with orders as (
select * from {{ ref('stg_jaffle_shop__orders') }}
)


,customers as (
    select * from {{ ref('stf_jaffle_shop_customers') }}
)

select
    first_name
    , last_name
    , count(distinct order_id) as total_orders
    from
    customers
    join orders on orders.customer_id = customers.customer_id
    where orders.status = 'completed'
    group by first_name, last_name