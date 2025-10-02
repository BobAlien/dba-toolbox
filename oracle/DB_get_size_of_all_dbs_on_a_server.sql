for db in $(ps -edaf | grep pmon | awk '{ print $8 }' | sed s/ora_pmon_// | grep -vE 'grep|sed|ASM'); do
  export ORACLE_SID=${db}
  export ORAENV_ASK=NO
  . oraenv -s
  echo "============== ${db} =============="
  sqlplus -S <<EOF
  connect / as sysdba
  select round(sum(bytes/1024/1024/1024)) from dba_data_files;
EOF
done
