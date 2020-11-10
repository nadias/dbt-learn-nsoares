select
    id as payment_id,
    orderid as order_id,
    status,
    coalesce(amount/100, 0) as amount

from raw.stripe.payment

where status = 'success' -- estas coisas nao deviam ser aqui. Aqui deve ser o mais proximo possivel da source.