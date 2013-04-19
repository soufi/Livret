<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Nouveau module</TITLE>
 </HEAD>

 <BODY>
<p><a href ="index.php">Cliquez ici</a> pour revenir à l'index</p>
  <form method="post" action="ajout_modif_cible.php">
<?

include('connexion.php');

if (isset($_GET['promo'])) {
$get=true;
$query="select _ID_MOD_ from livret_module where _NOM_MOD_ = '".$_GET['promo']."';";
$result=mysql_query($query);
$row=mysql_fetch_row($result);
  $id_module = $row[0];

//Séléction du libellé de l'ue du module à modifier
$query="select _LIBELLE_UE_ from livret_infos_ue natural join livret_module where _ID_MOD_ = ".$id_module;
$result=mysql_query($query);
$row=mysql_fetch_row($result);
$modif_ue=$row[0];

//Séléction du nom de la promo du module
$query="select _NOM_PROMO_ from livret_promotion natural join livret_module where _ID_MOD_ = ".$id_module;
$result=mysql_query($query);
$row=mysql_fetch_row($result);
$modif_promo=$row[0];

//Séléction de l'enseignant associé au module
$query="select _NOM_ENS_ from livret_enseignant natural join livret_responsable_module natural join livret_module where _ID_MOD_ = ".$id_module;
$result=mysql_query($query);
$row=mysql_fetch_row($result);
$modif_ens=$row[0];

//Séléction de la matiere associée au module
$query="select _NOM_MAT_ from livret_matiere natural join livret_module where _ID_MOD_ = ".$id_module;
$result=mysql_query($query);
$row=mysql_fetch_row($result);
$modif_mat=$row[0];

//Séléction des données du module
$query="select * from livret_module where _ID_MOD_ = ".$id_module;
$result=mysql_query($query);
$ligne=mysql_fetch_row($result);

//Séléction du pre-requis du module
$query="select _ID_MOD_PERE_ from livret_pre_requis where _ID_MOD_FILS_ = ".$id_module;
$result=mysql_query($query);
$row=mysql_fetch_row($result);
$modif_pre_requis=$row[0];
  }
?>
<h1>Création d'un nouveau module</h1>
<p>
<h2>UE</h2>
Sélectionner l'UE : 
<select name="ue"">
<?
//Création de la liste des UE
$query = "SELECT _LIBELLE_UE_ FROM livret_infos_ue";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
//Tri par ordre alphabetique
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
//Ajout de l'élément séléctionné automatiquement lorsqu'on modifie un module déjà existant
if($tab[$j]==$modif_ue)
echo "<option value=\"".$tab[$j]."\" selected=\"selected\">".$tab[$j]."</option>";
else
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/>
Ou en créer un nouveau : (laissez ce champ vide si la promotion existe déjà)
<br/><br/>
Libellé du nouvel UE : 
<input type="text" name="nom_ue" value="" /><br/>

<h2>Promotion</h2>
<br/><br/>
Sélectionner la promotion : 
<select name="promo">
<?
//Création de la liste des promotions
$query = "SELECT _NOM_PROMO_ FROM livret_promotion";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
//Tri par ordre alphabetique
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
if($tab[$j]==$modif_promo)
echo "<option value=\"".$tab[$j]."\" selected=\"selected\">".$tab[$j]."</option>";
else
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/>
Ou en créer une nouvelle : (laissez ces champs vide si la promotion existe déjà)
<br/><br/>
Choisir enseignant responsable : 
<select name="promo_ens">
<?
//Création de la liste des enseignants afin de le séléctionner pour l'associer à un module
$query = "SELECT _NOM_ENS_ FROM livret_enseignant";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
//Tri par ordre alphabetique
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/><br/>
Nom de la nouvelle promotion : 
<input type="text" name="nom_promo" value="" /><br/>
Nombre d'élèves de la nouvelle promotion : 
<input type="text" name="nb_eleves_promo" value="" /><br/>
Intitulé de la nouvelle promotion : 
<input type="text" name="intitule_promo" value="" /><br/>


<h2>Enseignant</h2>
Sélectionner enseignant :
<select name="ens">
<?
//Création de la liste des enseignant afin de les séléctionner pour les associer à un module
$query = "SELECT _NOM_ENS_ FROM livret_enseignant";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
if($tab[$j]==$modif_ens)
echo "<option value=\"".$tab[$j]."\" selected=\"selected\">".$tab[$j]."</option>";
else
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/><br/>
Ou en créer un nouveau : (laissez ces champs vide si l'enseignant existe déjà)
<br/><br/>
Nom de l'enseignant responsable du module : 
<input type="text" name="nom_ens"/><br/>
Prénom de l'enseignant responsable du module : 
<input type="text" name="prenom_ens"/><br/>
Adresse mail de l'enseignant responsable du module <br/>(si différente de prénom.nom@etu.univ-orleans.fr): 
<input type="text" name="email_ens"/><br/>


<h2>Matiere</h2>

<!--
Séléctionner la matiere : 

<select name="mat">

<?
//Création de la liste des matieres afin de les séléctionner pour y associer un module
$query = "SELECT _NOM_MAT_ FROM livret_matiere";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
//Tri par ordre alphabetique
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
if($tab[$j]==$modif_mat)
echo "<option value=\"".$tab[$j]."\" selected=\"selected\">".$tab[$j]."</option>";
else
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/><br/>
Ou en créer une nouvelle : (laissez ces champs vide si la matiere existe déjà)
<br/><br/>
-->
Nom de la matiere : 
<input type="text" name="nom_mat" value="" /><br/>
Abbréviation de la matiere : 
<input type="text" name="abbr_mat"/><br/>
Code apogée matiere: 
<input type="text" name="code_apg_mat"/><br/>


<h2>Module</h2>
Nom du module :
<input type="text" name="nom_mod" value="<?echo $ligne[3]?>"/><br/>
Code apogée module: 
<input type="text" name="code_apg_mod" value="<?echo $ligne[4]?>"/><br/>
Nombre d'heures de cours : 
<input type="text" name="nbh_c" value="0" value="<?echo $ligne[5]?>"/><br/>
Nombre d'heures de TD : 
<input type="text" name="nbh_td" value="0" value="<?echo $ligne[6]?>"/><br/>
Nombre d'heures de TP : 
<input type="text" name="nbh_tp" value="0" value="<?echo $ligne[7]?>"/><br/>
Nombre d'heures de cours TD : 
<input type="text" name="nbh_ctd" value="0" value="<?echo $ligne[8]?>"/><br/>
Nombre d'ECTS : 
<input type="text" name="nb_ects" value="0" value="<?echo $ligne[9]?>"/><br/>
Coefficient : 
<input type="text" name="coef" value="<?echo $ligne[10]?>"/><br/>
Langue d'enseignement : 
<input type="text" name="langue" value="Français" value="<?echo $ligne[11]?>"/><br/>
Objectif : <br/>
<textarea name="obj" rows="8" cols="45">
<?echo $ligne[12]?>
</textarea><br/>
Description détaillée : <br/>
<textarea name="desc_det" rows="8" cols="45">
<?echo $ligne[13]?>
</textarea><br/>
Methode d'évaluation : 
<input type="text" name="meth_eval" value="<?echo $ligne[14]?>"/><br/>
Modalité CC session 1 : 
<input type="text" name="mod_cc1" value="<?echo $ligne[15]?>"/><br/>
Modalité CC session 2 : 
<input type="text" name="mod_cc2" value="<?echo $ligne[16]?>"/><br/>
Calcul de la note finale session 1 : 
<input type="text" name="nf1" value="<?echo $ligne[17]?>"/><br/>
Calcul de la note finale session 2 : 
<input type="text" name="nf2" value="<?echo $ligne[18]?>"/><br/>
Pré-requis : <br/>
<textarea name="pre_req" rows="8" cols="45">
<?echo $ligne[19]?>
</textarea><br/>
Choisissez un module pré-requis : 
<select name="pre_req">
<option value="Aucun">&lt;Aucun module pré-requis&gt;</option>
<?
//Création de la liste des modules
$query = "SELECT _NOM_MOD_ FROM livret_module";
$result = mysql_query($query);
$tab=array();
$i=0;
while($row = mysql_fetch_row($result)){
$nom=$row[0];
$tab[$i]=utf8_encode($nom);
$i++;
}
usort($tab, "strcasecmp");
for($j=0;$j<$i;$j++){
if($tab[$j]==$modif_pre_requis)
//Ajout du module pre-requis existant dans le cas de la modification (ne fonctionne pas)
echo "<option value=\"".$tab[$j]."\" selected=\"selected\">".$tab[$j]."</option>";
else
echo "<option value=\"".$tab[$j]."\">".$tab[$j]."</option>";
}
?>
</select><br/>
Ressources (liens) : <br/>
<textarea name="ressources" rows="8" cols="45">
<?echo $ligne[20]?>
</textarea><br/>
Bibliographie : <br/>
<textarea name="biblio" rows="8" cols="45">
<?echo $ligne[21]?>
</textarea><br/>
Note éliminatoire : 
<input type="text" name="note_elim"  value="<?echo $ligne[22]?>"/><br/>
Module obligatoire : 
<?
if($get){
if($ligne[23]==1){
echo "<input type=\"radio\" name=\"oblig\" value=\"oui\" id=\"oui\" checked=\"checked\" /> <label for=\"oui\">Oui</label>";
echo "<input type=\"radio\" name=\"oblig\" value=\"non\" id=\"non\" /> <label for=\"non\">Non</label><br/>";
}
else {
echo "<input type=\"radio\" name=\"oblig\" value=\"oui\" id=\"oui\"/> <label for=\"oui\">Oui</label>";
echo "<input type=\"radio\" name=\"oblig\" value=\"non\" id=\"non\" checked=\"checked\"/> <label for=\"non\">Non</label><br/>";
}
}
else{
echo "<input type=\"radio\" name=\"oblig\" value=\"oui\" id=\"oui\" checked=\"checked\" /> <label for=\"oui\">Oui</label>";
echo "<input type=\"radio\" name=\"oblig\" value=\"non\" id=\"non\" /> <label for=\"non\">Non</label><br/>";
}
?>

<br/>
<input type="submit" value="Valider" />
</p>
<?
mysql_close();
?>

<input type="hidden" name="modific" value="<?if($get)echo'oui';else echo'non';?>"/>
<? if($get) 
echo "<input type=\"hidden\" name=\"id\" value=\"".$id_module."\"/>";
?>
</form>
    </BODY>
</HTML>
