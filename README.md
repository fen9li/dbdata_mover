# dbdata_mover
Export / Import database data from / into mysql instance

## clone this repo
```
 ~]$ git clone https://github.com/fen9li/dbdata_mover.git
Cloning into 'dbdata_mover'...
remote: Enumerating objects: 42, done.
remote: Counting objects: 100% (42/42), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 42 (delta 17), reused 28 (delta 9), pack-reused 0
Unpacking objects: 100% (42/42), done.
 ~]$ 
```

## prepare environment

* copy potatos.template to potatos.credential
* edit potatos.credential to define mysql instance name(host), username and password for source and/or target mysql instance

```
 ~]$ cd dbdata_mover/
 dbdata_mover]$ cp potatos.template potatos.credential
 dbdata_mover]$ vim potatos.credential
 ...
 dbdata_mover]$ 
```

* run get_database_list.sh against the source mysql instance to get the database list

```
 ~]$ cd dbdata_mover/
 dbdata_mover]$ sudo bash get_database_list.sh databases.conf
 ...
 dbdata_mover]$ 
```

* edit / update / double check databases.conf
This file has the database list you want to export data from source DB instance and delete / create databases / import data in target DB instance.

## export data

```
sudo bash export_data.sh [ /path/to/databases.conf ] [ /path/to/database_dump_location]
```

## wash dumped databases files

> As dumped database files use 'root' as its username, and AWS RDS mysql instance is using 'c1admin' as its username,
> you must run this script to wash all the dumped database file to replace any 'root' user with 'c1admin'.

```
 ~]$ cd dbdata_mover/
 dbdata_mover]$ sudo bash wash_dumped_database_files.sh [ /path/to/databases.conf ] [ /path/to/database_dump_location]
 ...
 dbdata_mover]$ 
```

## create databases before you can import data

```
sudo bash create_databases.sh [ /path/to/databases.conf ] 
```

## import data

```
sudo bash import_data.sh [ /path/to/databases.conf ] [ /path/to/database_dump_location]
```