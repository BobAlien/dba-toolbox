-- vérifier l'ownership des objets dans la base 
select distinct c.relkind, r.rolname, count(*)
from pg_class c 
join pg_roles r 
on c.relowner = r.oid 
group by c.relkind, r.rolname;

-- changement du owner des tables
select 'alter table ' || n.nspname || '.' || c.relname || ' owner to netsoinsdev;'
from pg_class c
join pg_roles r
on c.relowner = r.oid
join pg_namespace n 
on c.relnamespace = n.oid
where c.relkind = 'r' and r.rolname = 'netsoinsrec';

-- changement du owner des tables mères pour des tables TOAST
select 'alter table ' || n.nspname || '.' || c.relname || ' owner to netsoinsdev;'
from pg_class c
join pg_roles r
on c.relowner = r.oid
join pg_namespace n 
on c.relnamespace = n.oid
where reltoastrelid in (select oid from pg_class where relkind = 't' and relowner = (select oid from pg_roles where rolname='netsoinsrec'));

-- changement du owner des séquences
select 'alter sequence ' || n.nspname || '."' || c.relname || '" owner to netsoinsdev;'
from pg_class c
join pg_roles r
on c.relowner = r.oid
join pg_namespace n 
on c.relnamespace = n.oid
where c.relkind = 'S' and r.rolname = 'netsoinsrec';

