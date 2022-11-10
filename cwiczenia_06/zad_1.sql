with tmp as (select sum(SalesAmount) as sum_sales_amount, OrderDate 
			 from dbo.FactInternetSales group by OrderDate)

select sum_sales_amount,
	   avg(sum_sales_amount) over (order by OrderDate rows 3 preceding) as moving_avg,
	   OrderDate
from tmp
order by OrderDate