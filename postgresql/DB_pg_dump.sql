 nohup pg_dump -j 8 -d pgs_nso_prd -Fd -f /mnt/nfs0dtbpgs000/DUMP/pgs_nso_prd -v > pg_dump.log 2>&1 &

-j 8 => parallel with 8 threads
-d => name of the database
-Fd => format directory 
-f => path of the directory 
-v => verbose