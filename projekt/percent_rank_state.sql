with cte as (
			select sum(amount) as SummedAmount, state
			from FactSales fs
			inner join DIMCustomers cu on cu.customer_key = fs.customer_key
			group by state
			)

select state, SummedAmount,
PERCENT_RANK() over (order by SummedAmount) as percentile
from cte
order by percentile desc