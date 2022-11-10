select OrganizationKey, DepartmentGroupKey, sum(Amount) as amount 
from dbo.FactFinance
group by cube (OrganizationKey, DepartmentGroupKey)
order by OrganizationKey