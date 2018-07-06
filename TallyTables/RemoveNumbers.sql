declare @inputstring varchar(8000);

set @inputstring = '1234aBC567defgh890';

WITH Tally (n) AS
(
	--Makes a inline tally table of 8000 entries - same as length of @inputstring

    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM (VALUES(0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) a(n)
    CROSS JOIN (VALUES(0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) b(n)
    CROSS JOIN (VALUES(0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) c(n)
	CROSS JOIN (VALUES(0),(0),(0),(0),(0),(0),(0),(0)) d(n)
)

select resultstring =
(
	select '' + s
	from
	(
		select
			n
			,s
		from
			(
				select
					n
					,case
						when patindex('[a-z]',substring(@inputstring,n,1)) > 0 then substring(@inputstring,n,1)
					end as s
				from Tally
				where n < len(@inputstring)
			) as t
		where s is not null
	) as r
	order by n
	for xml path(''), type
).value('.','varchar(8000)');