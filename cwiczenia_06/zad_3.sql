select OrganizationKey, DepartmentGroupKey, sum(Amount) as amount 
from dbo.FactFinance
group by rollup (OrganizationKey, DepartmentGroupKey)
order by OrganizationKey