select  
    id as order_id
    , user_id as customer_id
    , status
from {{source("jaffle_shop", 'orders')}}