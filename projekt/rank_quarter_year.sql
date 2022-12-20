with 
cte as (
		select sum(amount) as Amount, TheQuarter, TheYear
		from FactSales fs
		inner join DIMDate dd on dd.date_id = fs.date_id
		group by TheQuarter, TheYear
)

select rank () over (order by Amount desc) as Ranking, Amount, TheQuarter, TheYear
from cte