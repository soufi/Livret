DECLARE @id_compo int;DECLARE @id_filiere int;DECLARE @id_promo int;DECLARE @id_matiere int;DECLARE @id_ens1 int;DECLARE @id_ens2 int;DECLARE @id_compo int; INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES ( (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info'),Info);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_, _LIBELLE_FILIERE_,_ID_COMPO) VALUES ( (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence3' AND _ID_COMPO_= (SELECT _ID_COMPOInfo'),Licence3,Info);
SET @id_compo = (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info');
SET @id_filiere = (SELECT _ID_COMPO_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ' Licence3');
SET @id_promo = (SELECT _ID_COMPO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = ' MIAGE.tex');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Mise à niveau Informatique'),@id_promo,'Mise à niveau Informatique','UE 51','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Mise à niveau Informatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '12', '20', '0', '0', 'Français_', '
	- Remise à niveau essentiellement destinée aux étudiants intégrant la Licence au semestre 5, afin de leur assurer les bases nécessaires pour suivre de manière satisfaisante les enseignements de troisième année.
', '
Rappels sur l\'algorithmique et la programmation, les systèmes d\'exploitation, les outils de 
développement. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité qui s\'intègre dans le PRL (Plan Réussite en Licence).\\Obligatoire pour certains étudiants.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNET@univ-orleans.fr'),'Catherine', 'JULIÉ-BONNET', 'Catherine.JULIE-BONNET@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Programmation avancée et structures dynamiques'),@id_promo,'Programmation avancée et structures dynamiques','UE 52','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Programmation avancée et structures dynamiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '30', '0', '0', '4', '4', 'Français_', '
	- Acquérir et combiner plusieurs méthodes de programmation au sein d\'un même langage. Intégrer la notion d\'abstraction des données et des traitements. 
	- Comprendre l\'intérêt du typage fort et de l\'induction de types. Arbitrer entre des solutions statiques et dynamiques. 
', '
Introduction au langage ADA. Types non contraints et pointeurs.
Unités de compilation, modularité, généricité.
Tâches, rendez-vous, type protégés, répartition.
Types étiquetés, programmation orientée objet, programmation par classe, héritage, héritage multiple. Interfaçage : autres langages, interface graphique, serveur web,... 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='Jean-Jacques.LACRAMPE@univ-orleans.fr'),'Jean-Jacques', 'LACRAMPE', 'Jean-Jacques.LACRAMPE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Réseaux'),@id_promo,'Réseaux','UE 53','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Réseaux');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '12', '12', '0', '4', '4', 'Français_', '
	- Principes et pratique des réseaux locaux informatiques.
', '
Architecture des réseaux\,: structure en couches, protocoles, services. Réseaux locaux sous UDP-TCP/IP, Ethernet. Protocoles de routage\,: RIP, OSPF, BGP. Principaux protocoles Internet\,: DNS (annuaire de noms de domaines). SMTP (mail), FTP (transfert de fichiers), HTTP (web),... 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Abdelali' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='Abdelali.ED-DBALI@univ-orleans.fr'),'Abdelali', 'ED-DBALI', 'Abdelali.ED-DBALI@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Abdelali' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Analyse et conception des SI'),@id_promo,'Analyse et conception des SI','UE 54','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Analyse et conception des SI');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '20', '10', '0', '4', '4', 'Français_', '
	- Transformer les besoins et attentes des utilisateurs d\'un système d\'information en spécifications formalisées d\'une future application informatique.
', '
Contribution d\'une méthode d\'analyse et de conception, Merise en l\'occurrence, au sein des activités de l\'ingénierie des systèmes d\'information. Les principes généraux de la méthode. Le cycle d\'abstraction : raisonnements de modélisation et formalismes associés. Schémas des flux ; Modèle conceptuel des données (MCD) ; Modèle conceptuel des traitements (MCT) et modèle organisationnel des traitements (MOT). Le cycle de vie : la démarche. Étude préalable : Analyse de l\'existant et Conception du futur système ; Étude détaillée du futur système. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr'),'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Statistiques'),@id_promo,'Statistiques','UE 55','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Statistiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '30', '0', '3', '3', 'Français_', '
	- Le but du cours est de savoir mener une étude statistique sur des données avec un objectif précis. 
	- Présentation synthétique des données, puis énoncé d\'hypothèses probabilistes et enfin validation de ces hypothèses, et enfin exploitation des résultats. 
', '
Statistique descriptive: cas uni et bidimensionnel. Statistique inférentielle\,: Démarche d\'échantillonnage: distribution d\'échantillonnage de la moyenne et de la variance dans le cas du tirage aléatoire.\,; Estimation paramètrique: qualités d\'une estimateur ponctuel, estimateur du maximum de vraisemblance, intervalle de confiance. Test: principes généraux des tests statistiques, tests de conformité, test d\'homogénéité, tests d\'ajustement, tests d\'indépendance. Étude des séries chronologiques: méthodes de filtrages (moyenne mobile, lissage exponentiel). Toutes les notions vues en cours sont illustrées en TP avec les logiciels R et XLSTAT. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sophie' AND _PRENOM_ENS_='JACQUOT' AND _EMAIL_ENS_='Sophie.JACQUOT@univ-orleans.fr'),'Sophie', 'JACQUOT', 'Sophie.JACQUOT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sophie' AND _PRENOM_ENS_='JACQUOT' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Recherche Opérationnelle'),@id_promo,'Recherche Opérationnelle','UE 56','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Recherche Opérationnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '24', '0', '0', '3', '3', 'Français_', '
	- Introduction à la recherche opérationnelle (modélisation et résolution).
', '
Recherche opérationnelle sur les graphes : ordonnancement, flots. Programmation linéaire : méthode du simplex, dualité. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Gestion comptable'),@id_promo,'Gestion comptable','UE 57','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Gestion comptable');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '0', '0', '0', '3', '3', 'Français_', '
	- être capable de déterminer un coût. Réfléchir à la notion de prix, aux outils d\'aide à la décision.
', '
Introduction\,: De la comptabilité générale à la comptabilité analytique. La détermination des coûts :
la méthode des coûts complets (Analyse des charges. Répartition des charges indirectes, enchaînements des calculs. Le coût de production.
Le coût de revient. La notion de résultat analytique d\'exploitation. Rapprochement avec la comptabilité générale. Critiques.)
Les méthodes des coûts partiels (Le coût variable ; le seuil de rentabilité. La méthode du coût indirect.
La méthode de l\'imputation rationnelle des charges fixes. Le coût marginal. ) Remise en cause des modèles traditionnels (La méthode ABC.).
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr'),'Gilles', 'LE FLOHIC', 'Gilles.LE-FLOHIC@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 58','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	- Comprendre et s\'exprimer dans une langue simple et correcte à l\'oral comme à l\'écrit afin d\'acquérir une autonomie suffisante dans le milieu professionnel
	- Aide à la rédaction de CV et lettres de motivation dans le cadre de la recherche de stage.
', '
	 - Restituer, échanger des informations, produire des énoncés corrects à l\'oral comme à l\'écrit.
	 - Travail personnel : Exercices d\'application à la fin de chaque unité et remise d\'un devoir au cours du semestre (CV).
	 - Travail individuel de remise à niveau en centre ressource multimédia si nécessaire.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr'),'Marie-Françoise', 'TASSARD', 'Marie-Françoise.TASSARD@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Techniques de communication'),@id_promo,'Techniques de communication','UE 59','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Techniques de communication');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	- Savoir animer une réunion, connaître la communication orale professionnelle et rédiger des écrits professionnels en entreprise. 
', '
	 - Prise de parole devant un groupe : constituer et présenter un dossier avec documents.
	 - Travail de groupe et créativité : s\'initier aux méthodes de l\'invention pour innover dans un travail de groupe.
	 - Communication et programmation neurolinguistique (PLN) : se connaître, connaître autrui pour mieux communiquer.
	 - La recherche d\'emploi : le C.V., la lettre de motivation.
	 - Les écrits professionnels :
		    - La lettre : lisibilité et créativité. La note de service : concision et précision.
		    - Le journal d\'entreprise : accroche et information.
		    - Le compte-rendu : recherche de l\'objectivité.
		    - Le rapport : aide à la prise de décision. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='Alfred.HITCHCOCK@univ-orleans.fr'),'Alfred', 'HITCHCOCK', 'Alfred.HITCHCOCK@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet informatique'),@id_promo,'Projet informatique','UE 60','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet informatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '6', '0', '0', '3', '3', 'Français_', '
	- Au sein d\'un groupe, apprendre à organiser la réalisation complète d\'un projet, depuis l\'analyse jusqu\'aux tests de validation en utilisant des outils collaboratifs. 
	- Percevoir les différentes compétences nécessaires au sein d\'un groupe de travail Se préparer au métier de chef de projet. 
', '
Projet de fin d\'études, faisant intervenir différentes connaissances et compétences acquises lors de l\'ensemble de la formation en licence.
', '', 'Rapport et soutenance de projet', 'Pas de 2nde session', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr'),'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet personnel et professionnel'),@id_promo,'Projet personnel et professionnel','UE 60.1','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet personnel et professionnel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '12', '0', '0', '2', '2', 'Français_', '
	- Se préparer au stage en entreprise, sur les plans législatif, comportemental et en terme de techniques de communication professionnelle. 
	- Connaître les différents types d\'emplois accessibles aux diplômés, les parcours de formation possibles, et commencer à cibler son propre projet professionnel et personnel.
', '
Préparation à la recherche de stage en entreprise. Techniques de communication dans le cadre professionnel, comportement et respect des règles de l\'entreprise et de la convention de stage.
Rédaction du rapport de stage et préparation d\'un exposé oral.
Présentation des différents types d\'emplois / métiers accessibles à l\'issue de la formation et des parcours de formation adéquats.
Étude d\'un projet professionnel personnel. 
', 'Contrôle continue et terminal', 'Production d\'un rapport', 'Production d\'un rapport', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNE@univ-orleans.fr'),'Catherine', 'JULIÉ-BONNET', 'Catherine.JULIE-BONNE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Renforcement POO Java'),@id_promo,'Renforcement POO Java','UE 61','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Renforcement POO Java');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '12', '0', '0', '0', 'Français_', '
	  - Assainir les lacunes encore présentes en programmation.
', '
Programmation orientée objet. Gestion de la mémoire. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité qui s\'intègre dans le PRL (Plan Réussite en Licence).\\Obligatoire pour certains étudiants.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Génie Logiciel'),@id_promo,'Génie Logiciel','UE 62','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Génie Logiciel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '20', '8', '0', '4', '4', 'Français_', '
	- Acquérir une connaissance des outils et des techniques de spécification tels que les réseaux de Petri. 
	- Maîtriser un langage dédié au génie logiciel, UML. 
', '
Généralités, cycle de vie d\'un logiciel, méthodes d\'analyse et de conception, méthodes objet, langage UML, méthodes de tests. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr'),'Laure', 'KAHLEM', 'Laure.KAHLEM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Bases de données'),@id_promo,'Bases de données','UE 63','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Bases de données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '20', '8', '0', '4', '4', 'Français_', '
	- Créer des bases de données relationnelles d\'une bonne forme normale. 
	- Mettre en \oe uvre des contraintes d\'intégrité au sein de bases de données relationnelles. 
	- Interroger des bases de données relationnelles. 
', '
Algèbre relationnelle. SQL : Langage d\'Interrogation des Données. Dépendances fonctionnelles et Formes normales. SQL : Langage de Définition des Données. Mise en \oe uvre des contraintes d\'intégrité avec Oracle 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr'),'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Programmation des SI'),@id_promo,'Programmation des SI','UE 64','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Programmation des SI');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '20', '0', '4', '4', 'Français_', '
	- notion de modélisation, bases de données (niveau L2/L3) 
	- Transformer des spécifications formalisées en une application informatique. 
', '
Contribution d\'une méthode de conception, Merise en l\'occurrence, au sein des activités de développement des systèmes d\'information. Architectures logicielles. Le cycle de vie, la démarche \,: Étude technique du futur système ; Production du logiciel et Déploiement. Le cycle d\'abstraction, raisonnements de modélisation et formalismes associés \,: Modèle logique des données (MLD)\,; Modèle physique des données (MPD) et modèle physique des traitements (MPT). Mise en \oe uvre d\'architecture logicielle en Développement Web. Mise en \oe uvre d\'activités de développement avec Oracle. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr'),'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Environnement économique de l\'entreprise'),@id_promo,'Environnement économique de l\'entreprise','UE 65','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Environnement économique de l\'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', '
	- Le cours vise à donner aux étudiants une information sur les thèmes essentiels de l\'économie contemporaine (chômage, inflation, politiques économiques,...) et à leur permettre d\'appréhender les principaux modes de raisonnement nécessaires à la compréhension de l\'environnement économique. 
	- Pour ce faire, un retour théorique est opéré sur chaque thème, à partir d\'un regard sur l\'actualité conjoncturelle. 
', '
Les agents économiques et leurs fonctions. Keynes et les classiques : introduction a la macroéconomie. Le modèle is-lm. Emploi et chômage. Inflation et désinflation. État et politique économique. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr'),'Gilles', 'LE FLOHIC', 'Gilles.LE-FLOHIC@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Droit'),@id_promo,'Droit','UE 66','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Droit');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', '
	  - Connaissance des droits et obligations de l\'utilisateur de produits informatiques, de l\'utilisateur d\'Internet et des mécanismes des contrats.
', '
Régime de protection juridique des logiciels et des produits informatiques. Droits de l\'auteur et de l\'utilisateur du logiciel. Fraude informatique. Loi informatique et Libertés. Contrats. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jean-Philippe' AND _PRENOM_ENS_='CHALLINE' AND _EMAIL_ENS_='Jean-Philippe.CHALLINE@univ-orleans.fr'),'Jean-Philippe', 'CHALLINE', 'Jean-Philippe.CHALLINE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jean-Philippe' AND _PRENOM_ENS_='CHALLINE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 67','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '25', '0', '0', '3', '3', 'Français_', '
	- Comprendre l’information exprimée dans des messages complexes sur le domaine des Sciences et Technologies et s’exprimer sur ce même domaine à l’oral avec un degré suffisant de spontanéité et de fluidité (niveau européen\,: B2). 
', '
Travail de compréhension et d’expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr'),'Marie-Françoise', 'TASSARD', 'Marie-Françoise.TASSARD@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet informatique'),@id_promo,'Projet informatique','UE 68','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet informatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	- Transformer des spécifications formalisées en une application informatique. 
	- Rédiger des dossiers techniques : Dossier des Spécifications techniques, Dossier de programmation, Manuel Utilisateur.
', '
Réalisation d\'une application mettant en \oe uvre l\'analyse réalisée lors du projet de conception des SI. 
', '', 'Rapport et soutenance de projet', 'Pas de 2nde session', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr'),'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Stage ou projet fin d\'études'),@id_promo,'Stage ou projet fin d\'études','UE 69','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Stage ou projet fin d\'études');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '6', '6', 'Français_', '
	- Capacité à participer et mener à bien un projet au sein d\'une entreprise. 
	- Connaissance 
	du monde professionnel.  
', '
Stage d\'au moins trois mois consécutifs dans une entreprise ou projet de fin d\'étude, suivi par un enseignant et donnant lieu à la rédaction d\'un mémoire puis d\'une soutenance de stage en présence d\'un jury mixte d\'enseignants et de responsables de l\'entreprise. 
', '', 'Rapport et soutenance de stage ou de projet', 'Pas de 2nde session', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '0', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
