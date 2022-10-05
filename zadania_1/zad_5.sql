with
general as (
-- joining general info
select distinct od.order_id, o.date, o.time
	from cwiczenia_01.dbo.order_details od
	join dbo.orders o on o.order_id = od.order_id
	where o.date = '2015-01-01'
	group by od.order_id, o.date, o.time
)

select count(order_id) as order_count, date, DATEPART(hh, time) as hour
	from general
	group by date, DATEPART(hh, time)
	order by hour