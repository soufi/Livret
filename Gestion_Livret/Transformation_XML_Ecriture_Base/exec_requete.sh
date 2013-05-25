#/bin/sh

rep="$1"
cd $rep

for i in `ls .` 
do 
	echo "Traitement du fichier : $i"
	mysql -h localhost --user=root livret --password=root < $i
done