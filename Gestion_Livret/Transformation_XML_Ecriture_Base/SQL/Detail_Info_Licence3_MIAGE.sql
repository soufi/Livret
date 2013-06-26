SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Info');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence3' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence3', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence3' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'MIAGE');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'MIAGE');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'MIAGE');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Environnement économique de l\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Environnement économique de l\'entreprise', '6', '24', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Le cours vise à donner aux étudiants une information sur les thèmes essentiels de l\'économie contemporaine (chômage, inflation, politiques économiques,...) et à leur permettre d\'appréhender les principaux modes de raisonnement nécessaires à la compréhension de l\'environnement économique. 
 * Pour ce faire, un retour théorique est opéré sur chaque thème, à partir d\'un regard sur l\'actualité conjoncturelle.', 'Les agents économiques et leurs fonctions. Keynes et les classiques : introduction a la macroéconomie. Le modèle is-lm. Emploi et chômage. Inflation et désinflation. État et politique économique.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Environnement économique de l\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Gilles', 'LE FLOHIC', 'Gilles.LE-FLOHIC@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse et conception des SI' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Analyse et conception des SI', '5', '20', '20', '10', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Transformer les besoins et attentes des utilisateurs d\'un système d\'information en spécifications formalisées d\'une future application informatique.', 'Contribution d\'une méthode d\'analyse et de conception, Merise en l\'occurrence, au sein des activités de l\'ingénierie des systèmes d\'information. Les principes généraux de la méthode. Le cycle d\'abstraction : raisonnements de modélisation et formalismes associés. Schémas des flux ; Modèle conceptuel des données (MCD) ; Modèle conceptuel des traitements (MCT) et modèle organisationnel des traitements (MOT). Le cycle de vie : la démarche. Étude préalable : Analyse de l\'existant et Conception du futur système ; Étude détaillée du futur système.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse et conception des SI' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Anglais', '5', '0', '24', '0', '0', '2', '2', 'Français_', 'Unité obligatoire.', '* Comprendre et s\'exprimer dans une langue simple et correcte à l\'oral comme à l\'écrit afin d\'acquérir une autonomie suffisante dans le milieu professionnel
 * Aide à la rédaction de CV et lettres de motivation dans le cadre de la recherche de stage.', '* Restituer, échanger des informations, produire des énoncés corrects à l\'oral comme à l\'écrit.
 * Travail personnel : Exercices d\'application à la fin de chaque unité et remise d\'un devoir au cours du semestre (CV).
 * Travail individuel de remise à niveau en centre ressource multimédia si nécessaire.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi avec succès les enseignements des semestres précédents.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Marie-Françoise', 'TASSARD', 'Marie-Françoise.TASSARD@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mise à niveau Informatique' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Mise à niveau Informatique', '5', '0', '0', '12', '20', '0', '0', 'Français_', 'Unité qui s\'intègre dans le PRL (Plan Réussite en Licence).\\
Obligatoire pour certains étudiants.', '* Remise à niveau essentiellement destinée aux étudiants intégrant la Licence au semestre 5, afin de leur assurer les bases nécessaires pour suivre de manière satisfaisante les enseignements de troisième année.', 'Rappels sur l\'algorithmique et la programmation, les systèmes d\'exploitation, les outils de 
développement.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Niveau bac + 2 en informatique ou équivalent', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mise à niveau Informatique' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNET@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Catherine', 'JULIÉ-BONNET', 'Catherine.JULIE-BONNET@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNET@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet informatique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet informatique', '5', '0', '6', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Au sein d\'un groupe, apprendre à organiser la réalisation complète d\'un projet, depuis l\'analyse jusqu\'aux tests de validation en utilisant des outils collaboratifs. 
 * Percevoir les différentes compétences nécessaires au sein d\'un groupe de travail Se préparer au métier de chef de projet.', 'Projet de fin d\'études, faisant intervenir différentes connaissances et compétences acquises lors de l\'ensemble de la formation en licence.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Niveau de connaissance et de compétence de fin d\'année de licence (L3), en particulier dans les domaines de l\'analyse, de la modélisation et de la programmation.
Le langage de programmation souhaité pour le projet devra être connu ou maîtrisé dans un délai très court.
De plus il est obligatoire de s\'impliquer dans un groupe de travail et de posséder un minimum de qualités dans la communication.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet informatique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation avancée et structures dynamiques' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation avancée et structures dynamiques', '5', '20', '30', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Acquérir et combiner plusieurs méthodes de programmation au sein d\'un même langage. Intégrer la notion d\'abstraction des données et des traitements. 
 * Comprendre l\'intérêt du typage fort et de l\'induction de types. Arbitrer entre des solutions statiques et dynamiques.', 'Introduction au langage ADA. Types non contraints et pointeurs.
Unités de compilation, modularité, généricité.
Tâches, rendez-vous, type protégés, répartition.
Types étiquetés, programmation orientée objet, programmation par classe, héritage, héritage multiple. Interfaçage : autres langages, interface graphique, serveur web,...', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Maîtrise de l\'algorithmique de base (y compris les techniques d\'assertion et d\'invariant) et des structures statiques. Connaissance des principes de gestion mémoire, de la notion d\'état, de l\'affectation. Expérience des entrées sorties (non-)bufferisées.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation avancée et structures dynamiques' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='Jean-Jacques.LACRAMPE@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean-Jacques', 'LACRAMPE', 'Jean-Jacques.LACRAMPE@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='Jean-Jacques.LACRAMPE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Droit' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Droit', '6', '24', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Connaissance des droits et obligations de l\'utilisateur de produits informatiques, de l\'utilisateur d\'Internet et des mécanismes des contrats.', 'Régime de protection juridique des logiciels et des produits informatiques. Droits de l\'auteur et de l\'utilisateur du logiciel. Fraude informatique. Loi informatique et Libertés. Contrats.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Droit' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Philippe' AND _PRENOM_ENS_='CHALLINE' AND _EMAIL_ENS_='Jean-Philippe.CHALLINE@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean-Philippe', 'CHALLINE', 'Jean-Philippe.CHALLINE@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean-Philippe' AND _PRENOM_ENS_='CHALLINE' AND _EMAIL_ENS_='Jean-Philippe.CHALLINE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Techniques de communication' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Techniques de communication', '5', '0', '24', '0', '0', '2', '2', 'Français_', 'Unité obligatoire.', '* Savoir animer une réunion, connaître la communication orale professionnelle et rédiger des écrits professionnels en entreprise.', '* Prise de parole devant un groupe : constituer et présenter un dossier avec documents.
 * Travail de groupe et créativité : s\'initier aux méthodes de l\'invention pour innover dans un travail de groupe.
 * Communication et programmation neurolinguistique (PLN) : se connaître, connaître autrui pour mieux communiquer.
 * La recherche d\'emploi : le C.V., la lettre de motivation.
 * Les écrits professionnels :
   
    \item La lettre : lisibilité et créativité. La note de service : concision et précision.
    \item Le journal d\'entreprise : accroche et information.
    \item Le compte-rendu : recherche de l\'objectivité.
    \item Le rapport : aide à la prise de décision.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Savoir adapter un langage aux situations professionnelles.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Techniques de communication' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='Alfred.HITCHCOCK@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Alfred', 'HITCHCOCK', 'Alfred.HITCHCOCK@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='Alfred.HITCHCOCK@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet informatique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet informatique', '6', '0', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Transformer des spécifications formalisées en une application informatique. 
 * Rédiger des dossiers techniques : Dossier des Spécifications techniques, Dossier de programmation, Manuel Utilisateur.', 'Réalisation d\'une application mettant en \oe uvre l\'analyse réalisée lors du projet de conception des SI.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Unité "Programmation des systèmes d\'information".', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet informatique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation des SI' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation des SI', '6', '20', '0', '20', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* notion de modélisation, bases de données (niveau L2/L3) 
 * Transformer des spécifications formalisées en une application informatique.', 'Contribution d\'une méthode de conception, Merise en l\'occurrence, au sein des activités de développement des systèmes d\'information. Architectures logicielles. Le cycle de vie, la démarche \,: Étude technique du futur système ; Production du logiciel et Déploiement. Le cycle d\'abstraction, raisonnements de modélisation et formalismes associés \,: Modèle logique des données (MLD)\,; Modèle physique des données (MPD) et modèle physique des traitements (MPT). Mise en \oe uvre d\'architecture logicielle en Développement Web. Mise en \oe uvre d\'activités de développement avec Oracle.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation des SI' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Génie Logiciel' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Génie Logiciel', '6', '12', '20', '8', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Acquérir une connaissance des outils et des techniques de spécification tels que les réseaux de Petri. 
 * Maîtriser un langage dédié au génie logiciel, UML.', 'Généralités, cycle de vie d\'un logiciel, méthodes d\'analyse et de conception, méthodes objet, langage UML, méthodes de tests.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'notions de modélisation et de système d\'information', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Génie Logiciel' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'KAHLEM', 'Laure.KAHLEM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Gestion comptable' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Gestion comptable', '5', '30', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* être capable de déterminer un coût. Réfléchir à la notion de prix, aux outils d\'aide à la décision.', 'Introduction\,: De la comptabilité générale à la comptabilité analytique. La détermination des coûts :
la méthode des coûts complets (Analyse des charges. Répartition des charges indirectes, enchaînements des calculs. Le coût de production.
Le coût de revient. La notion de résultat analytique d\'exploitation. Rapprochement avec la comptabilité générale. Critiques.)
Les méthodes des coûts partiels (Le coût variable ; le seuil de rentabilité. La méthode du coût indirect.
La méthode de l\'imputation rationnelle des charges fixes. Le coût marginal. ) Remise en cause des modèles traditionnels (La méthode ABC.).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Les notions de base en comptabilité financière, charges, bilan et compte de résultat.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Gestion comptable' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Gilles', 'LE FLOHIC', 'Gilles.LE-FLOHIC@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Gilles' AND _PRENOM_ENS_='LE FLOHIC' AND _EMAIL_ENS_='Gilles.LE-FLOHIC@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet personnel et professionnel', '5', '12', '12', '0', '0', '2', '2', 'Français_', 'Unité obligatoire.', '* Se préparer au stage en entreprise, sur les plans législatif, comportemental et en terme de techniques de communication professionnelle. 
* Connaître les différents types d\'emplois accessibles aux diplômés, les parcours de formation possibles, et commencer à cibler son propre projet professionnel et personnel.', 'Préparation à la recherche de stage en entreprise. Techniques de communication dans le cadre professionnel, comportement et respect des règles de l\'entreprise et de la convention de stage.
Rédaction du rapport de stage et préparation d\'un exposé oral.
Présentation des différents types d\'emplois / métiers accessibles à l\'issue de la formation et des parcours de formation adéquats.
Étude d\'un projet professionnel personnel.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNE@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Catherine', 'JULIÉ-BONNET', 'Catherine.JULIE-BONNE@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Renforcement POO Java' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Renforcement POO Java', '6', '0', '0', '12', '0', '0', '0', 'Français_', 'Unité qui s\'intègre dans le PRL (Plan Réussite en Licence).\\
Obligatoire pour certains étudiants.', '* Assainir les lacunes encore présentes en programmation.', 'Programmation orientée objet. Gestion de la mémoire.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Renforcement POO Java' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage ou projet fin d\'études' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Stage ou projet fin d\'études', '6', '0', '0', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', '* Capacité à participer et mener à bien un projet au sein d\'une entreprise. 
 * Connaissance 
du monde professionnel.', 'Stage d\'au moins trois mois consécutifs dans une entreprise ou projet de fin d\'étude, suivi par un enseignant et donnant lieu à la rédaction d\'un mémoire puis d\'une soutenance de stage en présence d\'un jury mixte d\'enseignants et de responsables de l\'entreprise.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Compétences acquises au cours de la licence.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage ou projet fin d\'études' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Réseaux', '5', '18', '12', '12', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Principes et pratique des réseaux locaux informatiques.', 'Architecture des réseaux\,: structure en couches, protocoles, services. Réseaux locaux sous UDP-TCP/IP, Ethernet. Protocoles de routage\,: RIP, OSPF, BGP. Principaux protocoles Internet\,: DNS (annuaire de noms de domaines). SMTP (mail), FTP (transfert de fichiers), HTTP (web),...', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Algorithmique (modules de L1 et L2).', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Abdelali' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='Abdelali.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Abdelali', 'ED-DBALI', 'Abdelali.ED-DBALI@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Abdelali' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='Abdelali.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Recherche Opérationnelle' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Recherche Opérationnelle', '5', '16', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Introduction à la recherche opérationnelle (modélisation et résolution).', 'Recherche opérationnelle sur les graphes : ordonnancement, flots. Programmation linéaire : méthode du simplex, dualité.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'algorithmique élémentaire sur les graphes', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Recherche Opérationnelle' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Bases de données', '6', '12', '20', '8', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Créer des bases de données relationnelles d\'une bonne forme normale. 
 * Mettre en \oe uvre des contraintes d\'intégrité au sein de bases de données relationnelles. 
 * Interroger des bases de données relationnelles.', 'Algèbre relationnelle. SQL : Langage d\'Interrogation des Données. Dépendances fonctionnelles et Formes normales. SQL : Langage de Définition des Données. Mise en \oe uvre des contraintes d\'intégrité avec Oracle', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'UE : Bases des données (L2).', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raymond', 'RAKOTOZAFY', 'Raymond.RAKOTOZAFY@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raymond' AND _PRENOM_ENS_='RAKOTOZAFY' AND _EMAIL_ENS_='Raymond.RAKOTOZAFY@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Anglais', '6', '0', '25', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Comprendre l’information exprimée dans des messages complexes sur le domaine des Sciences et Technologies et s’exprimer sur ce même domaine à l’oral avec un degré suffisant de spontanéité et de fluidité (niveau européen\,: B2).', 'Travail de compréhension et d’expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi l\'unité "Anglais 5" ou un volume d\'heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Marie-Françoise', 'TASSARD', 'Marie-Françoise.TASSARD@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Françoise.TASSARD@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Statistiques', '5', '0', '0', '30', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Le but du cours est de savoir mener une étude statistique sur des données avec un objectif précis. 
 * Présentation synthétique des données, puis énoncé d\'hypothèses probabilistes et enfin validation de ces hypothèses, et enfin exploitation des résultats.', 'Statistique descriptive: cas uni et bidimensionnel. Statistique inférentielle\,: Démarche d\'échantillonnage: distribution d\'échantillonnage de la moyenne et de la variance dans le cas du tirage aléatoire.\,; Estimation paramètrique: qualités d\'une estimateur ponctuel, estimateur du maximum de vraisemblance, intervalle de confiance. Test: principes généraux des tests statistiques, tests de conformité, test d\'homogénéité, tests d\'ajustement, tests d\'indépendance. Étude des séries chronologiques: méthodes de filtrages (moyenne mobile, lissage exponentiel). Toutes les notions vues en cours sont illustrées en TP avec les logiciels R et XLSTAT.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Notions de probabilités.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sophie' AND _PRENOM_ENS_='JACQUOT' AND _EMAIL_ENS_='Sophie.JACQUOT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sophie', 'JACQUOT', 'Sophie.JACQUOT@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sophie' AND _PRENOM_ENS_='JACQUOT' AND _EMAIL_ENS_='Sophie.JACQUOT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
