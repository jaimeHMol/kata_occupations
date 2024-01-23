-- Executed and checked on Hacker Rank, using MS SQL Server

select doctor, professor, singer, actor from (
select dl.doctor, pl.professor, sl.singer, al.actor, coalesce(dl.num, pl.num, sl.num, al.num) as num
from (
    select name as doctor, row_number() over ( order by name asc) num
    from OCCUPATIONS where occupation = 'Doctor'
) as dl
full join (
    select name as professor, row_number() over ( order by name asc) num
    from OCCUPATIONS where occupation = 'Professor'
) as pl on dl.num = pl.num
full join (
    select name as singer, row_number() over ( order by name asc) num
    from OCCUPATIONS where occupation = 'Singer'
) as sl on pl.num = sl.num 
full join (
    select name as actor, row_number() over ( order by name asc) num
    from OCCUPATIONS where occupation = 'Actor'
) as al on sl.num = al.num
) as final
order by final.num asc;
