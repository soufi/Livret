#/bin/sh

for i in $@ 
do 
	echo $i;
	mysql -h localhost --user=root livret --password=root < $i
done