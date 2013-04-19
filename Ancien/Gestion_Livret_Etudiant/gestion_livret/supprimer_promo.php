<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

?>
  <form method="post" action="supprimer_cible.php">
<h2>Supprimer promotion</h2>
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
</select><br/>
<br/>
<input type="hidden" name="form" value="promo" />
<input type="submit" value="Valider suppression promotion" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>
