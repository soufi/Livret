<?
$user='root';
$passwd='mysqlroot!';
$host='localhost';
$bdd='livret';
mysql_connect($host, $user,$passwd) or die("erreur de connexion au serveur");
mysql_select_db($bdd) or die("erreur de connexion a la base de donnees");
?>
