# tcp-ds-osx-patch
TCP DS v2.10.1rc3 patch for OSX 
This patch adds OSX support. Currently tested only on OSX Mojave 10.14.3.

To use get the [latest TCP-DS source](http://www.tpc.org/tpc_documents_current_versions/download_programs/tools-download-request.asp?bm_type=TPC-DS&bm_vers=2.10.1&mode=CURRENT-ONLY)and apply the patch:
```
$ cd v2.10.1rc3
$ patch -p1 < ../tcp-ds-2.0.osx.patch

```

To build then run:
```
cd tools
make -f Makefile.spec
```

To generate some data:
```
./dsdgen -scale 1 -dir /tmp/testdata
```

To load data into mysql (modify your loaddata script and mysql user to match your situation):

```
#create the database
mysql -u root -e "create database tpcds"
#load the schema first
mysql -u root -Dtpcds < tpcds.sql
sh loaddata-mysql.sh
```

To load data into postgresql
```
createdb tpcds
psql tpcds -f tpcds.sql
sh loaddata-psql.sh
```
