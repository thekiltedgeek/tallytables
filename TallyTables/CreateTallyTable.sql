use Scratchpad;
go

drop table if exists dbp.Tally;

select top (11000)
	identity(int,1,1) as N
into dbo.Tally
from master.dbo.syscolumns as sc1, master.dbo.syscolumns as sc2;

alter table dbo.Tally
	add constraint pk_tally_n primary key clustered (N) with fillfactor = 100;