with
tmp as (
-- joining the general info
select o.order_id, orders.date, string_agg(pt.ingredients,',') as all_ingredients
	from cwiczenia_01.dbo.order_details o
	join pizzas p on p.pizza_id = o.pizza_id
	join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
	join orders on orders.order_id = o.order_id
	group by o.order_id, orders.date
)

select order_id
	from tmp
	where tmp.order_id not in (select order_id
									from tmp
									where (date like '2015-03%' and all_ingredients like '%Pineapple%'))