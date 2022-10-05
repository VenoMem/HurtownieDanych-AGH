select p.size, count(p.size) as count
	from cwiczenia_01.dbo.order_details od
	join dbo.orders o on o.order_id = od.order_id
	join dbo.pizzas p on p.pizza_id = od.pizza_id
	join dbo.pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	where (o.date like '2015-02%' or o.date like '2015-03%')
	group by size