# dbdata_mover
Export / Import data from / into mysql instance data

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

## export data

```
sudo bash export_data.sh [ database_names_list_file ] [ database_dumpfiles_location]
```

## create databases

```
sudo bash create_databases.sh [ database_names_list_file ]
```

## import data

```
sudo bash import_data.sh [ database_names_list_file ] [ database_dumpfiles_location]
```