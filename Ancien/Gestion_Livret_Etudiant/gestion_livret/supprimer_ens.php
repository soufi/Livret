<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

?>
<h2>Supprimer enseignant</h2>
Sélectionner l'enseignant : 
<form method="post" action="supprimer_cible.php">
<select name="enseignant">
<?
//On fait la liste des enseignants
$query = "SELECT _NOM_ENS_ , _PRENOM_ENS_ FROM livret_enseignant";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$prenom=$row[1];
$tab[$i]=utf8_encode($nom)." ".utf8_encode($prenom);
$i++;
}
usort($tab, "strcasecmp");//On les tris par ordre alphabetique
for($j=0;$j<$i;$j++){
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/><br/>

<!--On met le champ form à la valeur enseignant afin de savoir dans la cible qu'on va supprimer un enseignant-->
<input type="hidden" name="form" value="enseignant" />
<input type="submit" value="Valider suppression enseignant" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>
