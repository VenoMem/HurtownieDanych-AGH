with cte as (
			select sum(amount) as SummedAmount, TheMonth
			from FactSales fs
			inner join DIMDate dd on dd.date_id = fs.date_id
			where TheYear = '2007'
			group by TheMonth
)

select TheMonth, SummedAmount,
STDEV(SummedAmount) over (order by TheMonth) as std_dev
from cte