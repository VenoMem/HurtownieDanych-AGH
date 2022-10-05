with
general as(
--joining general info
select od.order_id, o.date, p.price
	from cwiczenia_01.dbo.order_details od
	join orders o on o.order_id = od.order_id
	join pizzas p on p.pizza_id = od.pizza_id
),
o_amount as (
-- summing up the orders and adding the month field
select order_id, sum(price) as order_amount, MONTH(date) as m, date
	from general
	group by order_id, date
),
a_amount as (
-- counting the average order per month
select avg(order_amount) as average_month_amount, m
	from o_amount
	group by m
)


select oa.order_id, oa.order_amount,aa.average_month_amount, oa.date
	from o_amount oa
	join a_amount aa on aa.m = oa.m