-- per size desc
select trunc(COMPLETION_TIME,'DD') Day, thread#, 
round(sum(BLOCKS*BLOCK_SIZE)/1024/1024/1024) GB,
count(*) Archives_Generated from v$archived_log 
group by trunc(COMPLETION_TIME,'DD'),thread# order by 4 desc;

-- per date
select trunc(COMPLETION_TIME,'DD') Day, thread#, 
round(sum(BLOCKS*BLOCK_SIZE)/1024/1024/1024) GB,
count(*) Archives_Generated from v$archived_log 
group by trunc(COMPLETION_TIME,'DD'),thread# order by 1;


-- average
with arch_list as (select trunc(COMPLETION_TIME,'DD') Day,
round(sum(BLOCKS*BLOCK_SIZE)/1024/1024/1024) GB
from v$archived_log
where trunc(COMPLETION_TIME,'DD') < trunc(sysdate,'DD')
group by trunc(COMPLETION_TIME,'DD'))
select avg(GB) from arch_list; 