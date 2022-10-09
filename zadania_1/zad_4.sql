with
general as(
--joining general info
select od.order_id, o.date, p.price, od.quantity
	from cwiczenia_01.dbo.order_details od
	join orders o on o.order_id = od.order_id
	join pizzas p on p.pizza_id = od.pizza_id
),
tmp as (
-- multiplying pizza by quantity for cases
-- in which order consisted more than one pizza
-- of the same type
select order_id, date, price*quantity as pizza_summed 
	from general
),
o_amount as (
-- summing up the orders and adding the month field
select order_id, sum(pizza_summed) as order_amount, MONTH(date) as m, date
	from tmp
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

