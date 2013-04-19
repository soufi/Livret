<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

?>

<form method="post" action="supprimer_mod.php">

Sélectionner la promotion : 
<select name="promo">
<?
$query = "SELECT _NOM_PROMO_ FROM livret_promotion";
$result = mysql_query($query);
while($row = mysql_fetch_row($result)){
$nom=$row[0];
echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
}
?>
<input type="submit" value="Valider promotion" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>
