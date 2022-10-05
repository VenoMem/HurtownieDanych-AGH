with 
temp_table as(
-- joining the general info
select od.order_id, sum(p.price) price_sum, o.date
	from cwiczenia_01.dbo.order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id
	where o.date = '2015-02-18'
	group by od.order_id, o.date
)

select avg(price_sum) avergae_order_amount, date
	from temp_table
	group by date