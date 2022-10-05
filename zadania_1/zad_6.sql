with
general as (
-- joining the general info
select od.order_id, p.pizza_id, p.pizza_type_id, pt.name, pt.category
	from cwiczenia_01.dbo.order_details od
	join dbo.orders o on o.order_id = od.order_id
	join dbo.pizzas p on p.pizza_id = od.pizza_id
	join dbo.pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	where o.date like '2015-01%'
)

select count(pizza_type_id) as sold_pizza_type, name, category
	from general
	group by pizza_type_id, name, category