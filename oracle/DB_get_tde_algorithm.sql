select t.name as "TABLESPACE_NAME", nvl(et.encryptionalg, 'NULL') as "ENCRYPTION_ALGO_OR_NULL"
from v$tablespace t
left join v$encrypted_tablespaces et
on t.ts# = et.ts#;