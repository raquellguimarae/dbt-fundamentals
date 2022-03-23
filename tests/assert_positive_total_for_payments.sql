-- Tipo de teste singular:

-- Os reembolsos têm um valor negativo, portanto, o valor total deve ser sempre >= 0.
-- Portanto, retorne registros onde isso não for verdadeiro para fazer o teste falhar.

select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1
having not(total_amount >= 0)	
