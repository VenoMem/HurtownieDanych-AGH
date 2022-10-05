with
tmp as (
-- joining the general info
select od.order_id, sum(p.price) as sum_order 
	from cwiczenia_01.dbo.order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
	join orders o on o.order_id = od.order_id
	where o.date like '%-02-%'
	group by od.order_id
),
tmp2 as (
-- adding the rank
select order_id, sum_order, RANK () over (order by sum_order desc) as position
	from tmp
)

select * 
	from tmp2
	where position <= 10