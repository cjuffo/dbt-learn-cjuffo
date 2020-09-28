select
id as payment_id,
orderid as order_id,
paymentmethod as payment_method,
status as status,
amount/100 as amount, --change to dollars
created as created_date
from {{sources('stripe', 'payment')}}