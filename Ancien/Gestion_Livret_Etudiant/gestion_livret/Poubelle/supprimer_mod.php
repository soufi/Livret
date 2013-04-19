<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

?>
<!--
<h2>Supprimer module</h2>

<form method="post" action="supprimer_cible.php">

Sélectionner la promotion : 
<select name="promo_mod">
<?
$query = "SELECT _NOM_PROMO_ FROM livret_promotion";
$result = mysql_query($query);
while($row = mysql_fetch_row($result)){
$nom=$row[0];
echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
}
?>
</select><br/>
-->
<form method="post" action="supprimer_cible.php">
Sélectionner le module : 

<select name="module">

<?
$query = "SELECT _NOM_MOD_ FROM livret_module where _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."');";

$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
//echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
$i++;
}

usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
echo $query;
?>
</select><br/><br/>

<input type="hidden" name="promo" value="<?echo$_POST['promo']?>" />
<input type="hidden" name="form" value="module" />
<input type="submit" value="Valider suppression module" />
</form>
<?
mysql_close();
?>

    </BODY>
</HTML>
