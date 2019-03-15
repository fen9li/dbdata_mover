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
* edit potatos.credential to define database hosts, database username and database password

```
 ~]$ cd dbdata_mover/
 dbdata_mover]$ cp potatos.template potatos.credential
 dbdata_mover]$ vim potatos.credential
 ...
 dbdata_mover]$ 
```

* edit / double check databases.conf
This is the database list you want to export data from source DB instance and create databases / import data in target DB instance.

## export data

```
sudo bash export_data.sh [ /path/to/databases.conf ] [ /path/to/database_dump_location]
```

## create databases before you can import data

```
sudo bash create_databases.sh [ /path/to/databases.conf ] 
```

## import data

```
sudo bash import_data.sh [ /path/to/databases.conf ] [ /path/to/database_dump_location]
```