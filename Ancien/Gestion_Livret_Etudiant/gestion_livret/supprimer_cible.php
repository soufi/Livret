<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<?
include('connexion.php');

//On regarde selon le domaine de de la suppression
switch($_POST['form']) {
//Si on souhaite supprimer une promo
case "promo" :
//On met à jour les modules et matieres
$query="update livret_module set _ID_PROMO_ = 0 where _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."');";
mysql_query($query);
$query="update livret_matiere set _ID_PROMO_ = 0 where _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."');";
mysql_query($query);
//Puis on supprime la promotion
$query="delete from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."';";break;

//Dans le cas d'un enseignant
case "enseignant" :
//On sépare la chaine de caractéres nom/prénom
$ens=explode(" ",$_POST['enseignant']);
//On met à jour les promotions et les modules associés à l'enseignant
$query="update livret_promotion set _ID_ENS_ = 0 where _ID_ENS_ = (select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = '".$ens[0]."' and _PRENOM_ENS_ = '".$ens[1]."');";
mysql_query($query);
$query="update livret_responsable_module set _ID_ENS_ = 0 where _ID_ENS_ = (select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = '".$ens[0]."' and _PRENOM_ENS_ = '".$ens[1]."');";
mysql_query($query);
//Puis on supprime l'enseignant
$query="delete from livret_enseignant where _NOM_ENS_ = '".$ens[0]."' and _PRENOM_ENS_ = '".$ens[1]."';";break;

//Dans le cas d'une matiere/module
case "matiere" :
//On supprime l'association avec un enseignant, le pre-requis, le module et la matiere
$query="delete from livret_responsable_module where _ID_MOD_ = (select _ID_MOD_ from livret_module where _ID_MAT_ = (select _ID_MAT_ from livret_matiere where _NOM_MAT_ = '".$_POST['matiere']."'));";
mysql_query($query);
$query="delete from livret_pre_requis where _ID_MOD_FILS_ = (select _ID_MOD_ from livret_module where _ID_MAT_ = (select _ID_MAT_ from livret_matiere where _NOM_MAT_ = '".$_POST['matiere']."'));";
mysql_query($query);
$query="delete from livret_module where _ID_MAT_ = (select _ID_MAT_ from livret_matiere where _NOM_MAT_ = '".$_POST['matiere']."' and _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."'));";
mysql_query($query);
$query="delete from livret_matiere where _NOM_MAT_ = '".$_POST['matiere']."'and _ID_PROMO_ = (select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."');";
}



mysql_query($query);
mysql_close();
?>

<p>Promotion supprimée <a href="supprimer.php">cliquez ici</a> pour revenir à la page supprimer.php.</p>
</BODY>
</HTML>
