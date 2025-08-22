-- one disk 
ALTER DISKGROUP DATA ADD DISK '/dev/oracleasm/disks/DATA2' NAME DATA2;

-- several disks 
ALTER DISKGROUP DATA ADD DISK 
'/dev/oracleasm/disks/DATA6' NAME DATA6,
'/dev/oracleasm/disks/DATA7' NAME DATA7,
'/dev/oracleasm/disks/DATA8' NAME DATA8,
'/dev/oracleasm/disks/DATA9' NAME DATA9;