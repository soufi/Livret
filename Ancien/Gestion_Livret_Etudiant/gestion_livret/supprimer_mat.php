<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

?>
<h2>Supprimer matiere</h2>
<form method="post" action="supprimer_cible.php">
Sélectionner la matiere : 

<select name="matiere">
<?
//Liste des matieres
$query = "SELECT _NOM_MAT_ FROM livret_matiere where _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."');";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
//echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
$i++;
}
usort($tab, "strcasecmp");//Tri par ordre alphabetique
for($j=0;$j<$i;$j++){
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/><br/>

<input type="hidden" name="form" value="matiere" />
<!-- On transmet la promo de la matiere/module avec ce champ caché -->
<input type="hidden" name="promo" value="<?echo $_POST['promo']?>" />
<input type="submit" value="Valider suppression matiere" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>

