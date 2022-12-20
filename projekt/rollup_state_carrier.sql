select count(transactionID) as Shipments, state, carrier_name 
from FactSales fs
inner join DIMCarriers dc on fs.carrier_key = dc.carrier_key
inner join DIMCustomers dcu on dcu.customer_key = fs.customer_key
group by rollup (state, carrier_name) -- creates small summings based on state
--group by rollup (carrier_name, state) -- creates small summings based on carriers