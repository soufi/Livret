<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Modification</TITLE>
 </HEAD>

 <BODY>
<p><a href ="index.php">Cliquez ici</a> pour revenir à l'index</p>
<?
include('connexion.php');

?>
<h1>Modification</h1>
  <form method="get" action="ajout_modif.php">
Sélectionner le module : 
<select name="promo">
<?
$query = "SELECT _NOM_MOD_ FROM livret_module";
$result = mysql_query($query);
while($row = mysql_fetch_row($result)){
$nom=$row[0];
echo"<option value=\"".utf8_encode($nom)."\">".utf8_encode($nom)."</option>";
}
?>
</select><br/>
<br/>
<input type="submit" value="Valider module" />
</form>
<?
mysql_close();
?>
    </BODY>
</HTML>
