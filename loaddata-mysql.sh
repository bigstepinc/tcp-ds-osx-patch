DIR=/tmp/testdata
MYSQL_PARAMS="-u root -Dtpcds  --local-infile" 
mysql $MYSQL_PARAMS -e "SET GLOBAL local_infile = true;"
ls $DIR/*.dat | while read file; do
    pipe=$file.pipe
    mkfifo $pipe
    table=`basename $file .dat | sed -e 's/_[0-9]_[0-9]//'`
    echo $file $table
    LANG=C && sed -e 's_^|_\\N|_g' -e 's_||_|\\N|_g' -e 's_||_|\\N|_g' $file > $pipe & \
    mysql $MYSQL_PARAMS -e \
          "load data local infile '$pipe' replace into table $table character set latin1 fields terminated by '|'"
    rm -f $pipe
done
