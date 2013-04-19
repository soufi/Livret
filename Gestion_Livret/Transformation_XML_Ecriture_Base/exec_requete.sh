#/bin/sh

for i in $@ 
do 
	mysql -h localhost -u root livret < $i
done