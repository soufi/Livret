<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<!--
Utilisé afin de séléctionner la promotion qui correspond à la matiere qu'on souhaite supprimer
-->
<?
include('connexion.php');

?>
<h2>Supprimer matiere</h2>
<form method="post" action="supprimer_mat.php">
Sélectionner la promotion : 
<select name="promo">
<?
//Liste des promotions
$query = "SELECT _NOM_PROMO_ FROM livret_promotion";
$result = mysql_query($query);
while($row = mysql_fetch_row($result)){
$nom=$row[0];
echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
}
?>
</select><br/>

<input type="submit" value="Valider promotion" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>
