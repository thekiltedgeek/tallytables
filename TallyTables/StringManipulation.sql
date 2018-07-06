use Scratchpad;
go

declare @parameter varchar(8000);
set @parameter = ',Element01,Element02,Element03,Element04,Element05,';

select
	n
	,substring(@parameter,n,1)
from dbo.Tally
where
	n <= len(@parameter)
	and SUBSTRING(@parameter,n,1) = ','
order by n;