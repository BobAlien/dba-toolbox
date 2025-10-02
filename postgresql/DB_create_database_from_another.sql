CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;


In case of error like : 
ERROR:  source database "originaldb" is being accessed by other users

To disconnect all other users from the database :
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity 
WHERE pg_stat_activity.datname = 'originaldb' AND pid <> pg_backend_pid();