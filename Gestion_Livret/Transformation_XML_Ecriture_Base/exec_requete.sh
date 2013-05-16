#/bin/sh

for i in $@ 
do 
	echo "Traitement du fichier : ".$i;
	mysql -h localhost --user=root livret --password=root < $i
done