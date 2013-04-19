<HTML>
 <HEAD>
<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
  <TITLE>Test</TITLE>
 </HEAD>

 <BODY>

<?
include('connexion.php');


//On vérifie la valeur d'obligatoire
//Si on est à oui sur le bouton radio
if($_POST['oblig']=='oui')
//Alors obligatoire vaut 1 pour la base
$obliga=1;
else
//Sinon obligatoire vaut 0 pour la base
$obliga=0;

//Si on est dans une modification
if($_POST['modific']=='oui'){

//On récupére le n° d'_ID_MAT_
$mat="(select _ID_MAT_ from livret_matiere where _NOM_MAT_ = '".$_POST['mat']."')";

//Et on fait la requete de mise à jour du module
$query="update livret_module set _NOM_MOD_ = '".$_POST['nom_mod']."',_CODE_APOG_MOD_ = '".$_POST['code_apg_mod']."',_NBH_C_ = '".$_POST['nbh_c']."',_NBH_TD_ = '".$_POST['nbh_td']."',_NBH_TP_ = '".$_POST['nbh_tp']."',_NBH_CTD_ = '".$_POST['nbh_ctd']."',_NB_ECTS_ = '".$_POST['nb_ects']."',_COEF_ = '".$_POST['coef']."',_LANGUE_ = '".$_POST['langue']."',_OBJECTIF_ = '".$_POST['obj']."',_DESCRIPTION_ = '".$_POST['desc_det']."',_METHODE_EVAL_ = '".$_POST['meth_eval']."',_MOD_CC_1_ = '".$_POST['mod_cc1']."',_MOD_CC_2_ = '".$_POST['mod_cc2']."',_CALCUL_NF_1_ = '".$_POST['nf1']."',_CALCUL_NF_2_ = '".$_POST['nf2']."',_LIEN_RESSOURCE_ = '".$_POST['ressources']."',_BIBLIOGRAPHIE_ = '".$_POST['biblio']."',_NOTE_ELIM_ = '".$_POST['note_elim']."',_OBLIGATOIRE_ = '".$obliga."',_PREREQUIS_ = '".$_POST['pre_req']."' where _ID_MOD_ = ".$_POST['id'].";";
mysql_query($query);

}

//Sinon (on est dans un cas d'ajout)
else {
//On va vérifier la création d'un UE
//Si on a rempli le champ nom_ue alors on considére que l'utilisateur demande la création d'un nouvel UE
if($_POST['nom_ue']!=''){
//On fait donc la requete d'insertion
$query="insert into livret_infos_ue (_LIBELLE_UE_) values('".$_POST['nom_ue']."');";
mysql_query($query);
//Et on enregistre ici la valeur qui sera utilisée pour la création de module
$ue="(select MAX(_ID_UE_) from livret_infos_ue)";
}
//Sinon (on ne créé pas de nouvel UE)
else
//On enregistre la valeur qui sera utilisée pour la création de module
$ue="(select _ID_UE_ from livret_infos_ue where _LIBELLE_UE_ = '".$_POST['ue']."')";

//On utilise le même système pour la promotion
if($_POST['nom_promo']!=''){
$query="insert into livret_promotion (_ID_ENS_,_NOM_PROMO_,_NB_ELEVES_PROMO_,_INTITULE_PROMO_) values((select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = '".$_POST['promo_ens']."'),'".$_POST['nom_promo']."','".$_POST['nb_eleves_promo']."','".$_POST['intitule_promo']."');";
mysql_query($query);
$promo="(select MAX(_ID_PROMO_) from livret_promotion)";
}
else
$promo="(select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '".$_POST['promo']."')";

//Et à nouveau le même fonctionnement pour la matiere et en plus on ne peut pas créer une matiere sans module associé
if($_POST['nom_mat']!='' && $_POST['nom_mod']!=''){
$query="insert into livret_matiere (_ID_PROMO_,_NOM_MAT_,_ABBR_MAT_,_CODE_APOG_MAT_) values(".$promo.",'".$_POST['nom_mat']."','".$_POST['abbr_mat']."','".$_POST['code_apg_mat']."');";
$mat="(select _ID_MAT_ from livret_matiere where _NOM_MAT_ = '".$_POST['nom_mat']."')";
mysql_query($query);
}

//Enfin on créé le nouveau module si le champ nom_module est rempli (ce qui permet de créer des promos/UE sans
//créer de module si on le souhaite)
//De plus la matiere et le module sont liés : pas de module sans matiere
if($_POST['nom_mod']!='' && $_POST['nom_mat']!=''){
$query="insert into livret_module (_ID_MAT_ ,_ID_PROMO_,_NOM_MOD_ , _CODE_APOG_MOD_,_NBH_C_,_NBH_TD_,_NBH_TP_,_NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_,_METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_, _CALCUL_NF_1_,_CALCUL_NF_2_,_LIEN_RESSOURCE_,_BIBLIOGRAPHIE_,_NOTE_ELIM_,_OBLIGATOIRE_,_PREREQUIS_,_ID_UE_) values(".$mat.",".$promo.",'".$_POST['nom_mod']."','".$_POST['code_apg_mod']."','".$_POST['nbh_c']."','".$_POST['nbh_td']."','".$_POST['nbh_tp']."','".$_POST['nbh_ctd']."','".$_POST['nb_ects']."','".$_POST['coef']."','".$_POST['langue']."','".$_POST['obj']."','".$_POST['desc_det']."','".$_POST['meth_eval']."','".$_POST['mod_cc1']."','".$_POST['mod_cc2']."','".$_POST['nf1']."','".$_POST['nf2']."','".$_POST['ressources']."','".$_POST['biblio']."','".$_POST['note_elim']."',".$obliga.",'".$_POST['pre_req']."',".$ue.");";
mysql_query($query);
}

//On reprend le même système pour les enseignants que pour les UE/promotions/matieres
if($_POST['nom_ens']!=''){
//On fait en plus en sorte de générer automatiquement l'adresse mail si il est de la forme prenom.nom@univ-orleans.fr
if($_POST['email_ens']==="")
$email=$_POST['prenom_ens'].".".$_POST['nom_ens']."@univ-orleans.fr";
else
$email=$_POST['email_ens'];

$query="insert into livret_enseignant(_NOM_ENS_,_PRENOM_ENS_,_EMAIL_ENS_) values('".$_POST['nom_ens']."','".$_POST['prenom_ens']."','".$email."');";
mysql_query($query);

$ens="(select MAX(_ID_ENS_) from livret_enseignant)";
}
else
$ens="(select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = '".$_POST['ens']."')";

//On va ici faire la requete permettant d'associer un enseignant à un module
$query="insert into livret_responsable_module (_ID_MOD_,_ID_ENS_) values ((select MAX(_ID_MOD_) from livret_module),".$ens.");";
mysql_query($query);

//Et enfin on s'occupe des pré-requis si celui-ci a une valeur (il n'est pour l'instant possible que d'associer un 
//seul pré-requis à un module)
if($_POST['pre_req']!="Aucun")
$query="insert into livret_pre_requis (_ID_MOD_FILS_,_ID_MOD_PERE_) values((select MAX( _ID_MOD_) from livret_module),(select _ID_MOD_ from livret_module where _NOM_MOD_ = '".$_POST['pre_req']."'));";
mysql_query($query);
mysql_close();

}
if($_POST['modific']=='oui')
echo "<p>Modification enregistrée. <a href=\"ajout_modif.php\">Cliquez ici</a> pour revenir au formulaire.</p>";
else
echo "<p>Ajout enregistré. <a href=\"ajout_modif.php\">Cliquez ici</a> pour revenir au formulaire.</p>";
?>
</BODY>
</HTML>
