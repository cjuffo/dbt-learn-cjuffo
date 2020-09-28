SELECT
ord.order_id as order_id,
ord.customer_id as customer_id,
ord.order_date as order_date,
SUM(pay.amount) as total_order_amount
FROM {{ref('stg_orders')}} ord
LEFT JOIN {{ref('stg_payments')}} pay USING (order_id)
WHERE pay.status = 'success'
GROUP BY order_id, customer_id, order_date
