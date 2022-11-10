with 
tmp as (
select ff.OrganizationKey, do.OrganizationName, sum(ff.Amount) as amount
from dbo.FactFinance ff
inner join dbo.DimOrganization do on ff.OrganizationKey = do.OrganizationKey
where year(ff.Date) = 2012
group by ff.OrganizationKey, do.OrganizationName
),
cte as (
select OrganizationKey, OrganizationName, amount, 
PERCENT_RANK() over (order by amount) as percentile
from tmp
)

select OrganizationKey, OrganizationName, amount, percentile,
STDEV(amount) over (order by OrganizationKey) as std_dev
from cte