SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Info');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'm2', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'INIS');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'INIS');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'INIS');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Pratique des contraintes' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Pratique des contraintes', '3', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.', '* Modélisation et résolution de problèmes par approche déclarative.', 'Ce module s\'inscrit dans une démarche déclarative et descriptive pour modéliser et résoudre des problèmes combinatoires complexes et professionellement pertinents.
On y montre l\'application des contraintes dans un éventail de problèmes réels, en mettant l\'accent sur la pratique de la modélisation et l\'utilisation des outils.
Il s\'inscrit dans la continuité du module PLC de M1 qui présente le paradigme de la programmation logique et offre une introduction aux contraintes.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Programmation en logique et par contraintes (vu en M1).', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Pratique des contraintes' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Bich' AND _PRENOM_ENS_='DAO' AND _EMAIL_ENS_='Bich.DAO@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Bich', 'DAO', 'Bich.DAO@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Bich' AND _PRENOM_ENS_='DAO' AND _EMAIL_ENS_='Bich.DAO@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des applications nomades' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Sécurité des applications nomades', '3', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Capacité à configurer correctement une machine virtuelle Java en fonction d\'une politique de sécurité donnée.
* Maîtrise des subtilités du langage Java ayant un impact sur la sécurité des applications.
* Connaissance des propriétés de sureté du code assurées par les machines virtuelle Java et des techniques d\'analyse sous-jacentes.
* Application de ces techniques à des propriétés de sécurité spécifiques.', 'Ce cours porte sur la sécurité des applications J2ME (Java 2 Mobile Edition) et se décompose en deux parties.
La première partie traite des problèmes liés à la configuration de la politique de sécurité de la machine virtuelle
(security manager, chargeur de classe, contrôle  d\'accès, signature de classes, ...) et des bonnes pratiques de programmation.
Plusieurs aspects du langage Java (héritage, modificateurs,   sérialisation, JNI...) pouvant avoir un impact sur la sécurité des  applications seront étudiés.
En particulier, l\'accent sera mis, au travers d\'une étude de la spécification du langage, sur les pratiques de développement Java conduisant à la production d\'un code robuste.
La seconde partie du cours portera sur le code exécuté par la machine virtuelle et la spécification de cette dernière.
En particulier, les mécanismes de vérification de bytecode mis en oeuvre par la machine virtuelle (principalement basés sur la sureté du typage)
et les techniques d\'analyse sous-jacentes seront étudiés. Finalement, ces techniques d\'analyse seront généralisées afin de permettre
leur application à des propriétés de sécurité plus précises.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Développement d\'application nomades.
Programmation Java.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des applications nomades' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='12' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Stage', '', '0', '0', '0', '0', '12', '12', 'Français_', 'Unité obligatoire.', '* Appliquer tous les concepts vu durant le master.', '* Un stage en entreprise à temps complet de 4 à 6 mois ou
* Un stage de recherche  à  temps complet de 4 à 6 mois dans un laboratoire au sein d\'une équipe de
recherche confronte l\'étudiant au monde de la recherche et lui permet à  la fois d\'approfondir et d\'individualiser
la formation de base. Bien qu\'il soit conseillé de faire le stage en laboratoire de recherche, le stage peut se dérouler
dans un service de recherche et développement d\'une entreprise.

La recherche du stage est à l\'initiative de l\'étudiant.
Cependant, le sujet doit être validé par les responsables de la formation. Le stage fait l\'objet d\'une convention
engageant l\'entreprise ou le laboratoire, l\'université et l\'étudiant.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='12' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='alfred.hitchcock@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alfred', 'HITCHCOCK', 'alfred.hitchcock@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='alfred.hitchcock@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fouille de données et de textes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Fouille de données et de textes', '4', '15', '15', '10', '0', '3', '3', 'Français_', 'Unité obligatoire. Commune avec le master MIAGE. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.', '* Compléter les connaissances acquises en fouille de données et acquérir de nouvelles compétences sur la fouile de données textuelles. 
* Les données textes ont pris une importance croissante avec le développement d\'Internet qui permet de récupérer rapidement des masses de documents.
* Il est important d\'avoir des outils permettant de traiter les documents, que ce soit pour la classification,
la recherche d\'informations, la structuration de connaissances sur un domaine, le web sémantique, ...', 'Cet enseignement permet d\'une part, d\'introduire des techniques importantes, principalement statistiques et bayésiennes,
non présentées dans le module Extraction de Connaissances dans les BD, d\'autre part, d\'élargir la problématique à des
types de données complexes comme les données textuelles.
1-  Algorithme de fouille de données (approfondissement)
  \begin{itemize}
  1-  apprentissage statistique (réseaux de neurones, machines à vecteur support, ...)
  1-  apprentissage bayésien
  \end{itemize}
1-  Extraction de Connaissances à partir de textes 
  \begin{itemize}
  1-  Préparation des données
  1-  Documents structurés (XML, ...)
  1-  Classification de documents 
  \end{itemize}', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Outils pour l\'exploration de données, Extraction de Connaissances dans les Données.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fouille de données et de textes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Web services et interopérabilité' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Web services et interopérabilité', '4', '15', '15', '10', '0', '3', '3', 'Français_', 'Unité obligatoire. Commune avec le master MIAGE.', '* Comprendre l\'architecture et les technologies sous-jacentes des Services Web, pour permettre l\'interopérabilité entre des systèmes d\'information hétérogènes.', 'Ce module permet de comprendre l\'intérêt et les technologies sous-jacentes mises en \oe uvre dans les architectures de type
Services Web (SOAP, WSDL, HTTP, XML...). Le cours magistral présente les technologies et les outils (libres et commerciaux)
et les séances de travaux dirigés sur machines permettent de mettre en pratique les notions présentées en développant deux
SI sous java J2EE et Microsoft .NET qui interopèrent à l\'aide d\'une architecture orientée service.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Web services et interopérabilité' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Développement avancé d\'applications nomades' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Développement avancé d\'applications nomades', '4', '20', '15', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Fournir à l\'étudiant les connaissances matérielles embarquées dans les téléphones "nouvelle génération".
* Familiariser l\'étudiant à la programmation d\'application de réalité augmentée. Avoir connaissance du cadre légal régissant ce type d\'applications.', 'Ce module présente les nouvelles ressources embarquées dans les téléphones "nouvelle génération" menant à de nouveaux types d\'applications
communément appelées "applications de réalité augmentée". Le spectre d\'applications imaginables est alors conséquents,
cependant elles doivent respecter un cadre légal. Ainsi, ce cours rappelle également la législation régissant ce type d\'applications.
1-  Présentation des ressources matérielles : Wifi, Bluetooth, capteurs, accéléromètres
1-  Description des différentes API selon le support
1-  Interactions avec des services WEB
1-  Cas d\'étude : un exemple de développement d\'une application "réalité augmentée"
1-  Publication des applications', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Développement d\'applications nomades (S2), Sécurité des applications nomades (S3), SIG nomade (S3).', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Développement avancé d\'applications nomades' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Extraction de connaissances dans les BD' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Extraction de connaissances dans les BD', '3', '20', '20', '10', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme. Unité commune avec le master MIAGE.', '* Utilisation d\'outils : Weka, RapidMiner.
* Définir le problème d\'apprentissage : modèle à acquérir, données nécessaires, techniques applicables.
* Appliquer des techniques d\'apprentissage.', '* Les différents types d\'apprentissage et les différentes tâches 
* Classification supervisée : arbre de décision, modèles probabilistes, machines à vecteur support, noyaux
* Evaluation des modèles
* Classification non supervisée : par partitionnement, hiérarchique, conceptuelle
* Recherche de règles d\'association', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Outils d\'exploration de données, Intelligence Artificielle', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Extraction de connaissances dans les BD' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au stage recherche' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Préparation au stage recherche', '4', '0', '0', '0', '0', '6', '6', 'Français_', 'Unité conseillée pour ceux qui se destinent à la recherche.', '* Savoir réaliser un état de l\'art dans un domaine spécialisé de la recherche en informatique et être à même d\'amorcer une démarche scientifique.', '* Réalisation d\'un état de l\'art ou/et d\'une expérimentation dans un domaine précis de l\'informatique.
* Initiation à la recherche.
 
Les étudiants assistent à 4h de cours pour avoir les prérequis pour ce module.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au stage recherche' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Anglais', '4', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Savoir négocier des contrats.', 'Étude des technique de présentation orale : amélioration de la prononciation, organisation du discours, guidage de l\'auditoire, élaboration d\'aides visuelles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Anglais non professionnel', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Cédric' AND _PRENOM_ENS_='SARRE' AND _EMAIL_ENS_='Cedric.SARRE@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Cédric', 'SARRE', 'Cedric.SARRE@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Cédric' AND _PRENOM_ENS_='SARRE' AND _EMAIL_ENS_='Cedric.SARRE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 1', '3', '0', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Mise en pratique des principes et techniques étudiés dans les unités d\'enseignement.', 'Réalisation d\'une application en rapport avec les UE du semestre.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Maîtrise des techniques de développement de logiciels.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Frédéric', 'DABROWSKI', 'Frederic.DABROWSKI@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Qualité et certification' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Qualité et certification', '3', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.', '* Connaître les différents référentiels qualité.
* Connaître les différentes techniques d\'audit.
* Savoir mettre en oeuvre une méthode de certification.', '1-  Qualité logiciel :
  \begin{itemize}
  1-  Présentation de la Qualité, historique, bases de la démarche, définitions, coûts, gains, processus
  1-  Présentation des normes et référentiels Qualité (ISO 9001, CMM, ISO SPICE), assurance qualité logiciel
  1-  Plan d\'assurance de la qualité logicielle
  1-  Qualité produit, ISO 9126, métrologie (qualimétrie logicielle), gestion de configuration, gestion des changements
  1-  Qualité dans la relation client/fournisseur, MOA/MOE, sous-traitants, tableaux de bord
  \end{itemize} 
1-  Certification :
  \begin{itemize}
  1-  Systèmes de management du Sysème d\'information
  1-  ISO 27000, 2700x et méthode d\'audit (EBIOS, MEHARI, OCTAVE, ITIL, COBIT)
  1-  Certifications (audit et organismes)
  \end{itemize}', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '- Architecture des systèmes d\'information 
- Programmation orientée objet', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Qualité et certification' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Visualisation avancée de données' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Visualisation avancée de données', '4', '20', '15', '0', '0', '3', '3', 'Français_', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.', '* Comprendre différentes techniques de visualisation d\'information scientifique.
* Comprendre le fonctionnement d\'une application graphique nomade.
* Aborder sur des exemples les principes des applications  de visualisation scientifique portants sur des données massives de type geo-scientifique ou biologie moléculaire.', 'La complexité sémantique et la massivité des données issues de mesures scientifiques, de simulations numériques ou
d\'immenses bases de données disponibles sur le réseau, rendent indispensable le recours à la médiation visuelle pour
en permettre une appréhension la plus riche possible.  La mise en oeuvre de  techniques de visualisation élaborées
conduit à utiliser des architectures parallèles et distribués pour faire face à la complexité des traitements numériques
en amont ou propre au rendu visuel. Cette puissance de traitement peut être mise en oeuvre pour simplifier le rendu
afin de l\'adapter à un rendu nomade, mais elle  peut aussi adapter les données en post-traitement pour que celles-ci
soient analysées via un vaste environnement de Réalité Virtuelle multi-écrans plus ou moins distant sur le réseau.
Nous présentons dans ce cours  les fondements du pipeline graphique parallèle, les différentes techniques de rendu
scientifique, les moyens d\'adapter le rendu nomade aux gros volumes de données complexes et enfin nous abordons
la visualisation scientifique utilisant les techniques avancées de Réalité Virtuelle au service de la performance.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Calcul intensif. Module programmation graphique. Notions en Réseaux. Architecture des systèmes.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Visualisation avancée de données' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='Sebastien.LIMET@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sébastien', 'LIMET', 'Sebastien.LIMET@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='Sebastien.LIMET@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation à la recherche' AND _ECTS_='7' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Initiation à la recherche', '3', '57', '0', '0', '0', '7', '7', 'Français_', 'Unité conseillée pour ceux qui se destinent à la recherche.', '* L\'objectif est d\'initier l\'étudiant à une démarche scientifique et de le familiariser à un travail de recherche bibliographique. 
* Les tutoriaux ont pour objectif d\'appréhender quelques thématiques de recherche et d\'introduire des techniques récentes ou fondamentales.', 'Initiation au stage recherche :

* introduction d\'outils pour aborder un stage de recherche en laboratoire
* présentation du cycle de tutoriaux, des thématiques, des possibilités de poursuites en thèse et plus largement du milieu de la recherche académique ou industrielle
* présentation des projets académiques proposés au semestre 4
 
Cycle de tutoriaux :

* 2 tutoriaux longs (d\'une durée totale de 9h; soit 2 fois 3 séances de 1h30) seront axés sur une thématique préalablement
choisie et pour laquelle un renforcement est sollicité par le laboratoire.
* 20 tutoriaux courts (de 1h30 chacun) articulés autour de thématiques telles que la résolution par contraintes,
l\'apprentissage, extraction de connaissances, le parallélisme, la réalité virtuelle, la sécurité et sûreté des logiciels,
les modèles de calculs, l\'algorithmique et la théorie des graphes, ...
 
Ces tutoriaux se voudront à la fois introductifs et concrets, mais ils apporteront également des connaissances pointues sur des domaines maîtrisés par les intervenants.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir une connaissance générale de l\'informatique.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation à la recherche' AND _ECTS_='7' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Frédéric', 'DABROWSKI', 'Frederic.DABROWSKI@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Système d\'informations géographiques nomades' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Système d\'informations géographiques nomades', '3', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', '* Développer des applications nomades basées sur la géo-localisation et utilisant des SIG.', '* Apprentissage des principaux systèmes de géo-localisation utilisés dans l\'informatique nomade. Etude des principes et des outils des systèmes d\'informations géographiques (SIG).
* Analyse des architectures matérielles  et logicielles des SIG nomades.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Modules de M1 : Système d\'exploitation embarqué, développement d\'applications nomades, réseaux : protocoles et mobilité.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Système d\'informations géographiques nomades' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Un' AND _PRENOM_ENS_='professionnel du BRGM' AND _EMAIL_ENS_='Bureau de Recherches Géologiques et Minières');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Un', 'professionnel du BRGM', 'Bureau de Recherches Géologiques et Minières');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Un' AND _PRENOM_ENS_='professionnel du BRGM' AND _EMAIL_ENS_='Bureau de Recherches Géologiques et Minières');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse statique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Analyse statique', '', '20', '15', '0', '0', '3', '3', 'Français_', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.', '* Connaissances des fondements de l\'analyse statique de programmes.
* Capacité à utiliser ces connaissances pour le développement d\'outils de sûreté et de sécurité.', 'La vérification de propriétés dynamiques des programmes, comme par exemple l\'absence d\'accès à des pointeurs nuls, est un problème généralement indécidable.
L\'interprétation abstraite dont traite ce cours fournit un cadre formel et des outils permettant de déterminer des approximations décidables
de ces propriétés pour lesquelles il est possible de dériver des systèmes de type, de vérification et d\'analyse statique.
Ce cours introduit les connaissances nécessaires à la mise oeuvre des techniques d\'interprétation abstraite (théorie des ordres,
théorie des points fixes, connexions de Galois,...). Des exemples concrets d\'utilisation de ces techniques seront étudiés et des outils
d\'analyse statique existants (Frama-C, Astree) seront présentés.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Sécurité des Applications Nomades', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse statique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 2', '4', '0', '0', '0', '0', '3', '3', 'Français_', '', '* Mise en pratique de principes et de techniques étudiés dans les unités d\'enseignement.', 'Réalisation d\'une application en rapport avec les UE du semestre.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Maîtrise des techniques de développement de logiciels', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux, sécurité et nomadisme' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Réseaux, sécurité et nomadisme', '4', '20', '15', '0', '0', '3', '3', 'Français_', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.', '* Découvrir les différents types de réseaux sans fils (IP, GSM, ...).
* Connaître les spécificités des réseaux IP sans fils.
* Connaître les protocoles de sécurité classiques.
* Être capable de sécuriser une architecture réseau pour des applications nomades.', 'Protocoles et sécurité:\\
Les attaques réseau. Les méthodes de protection (inetd, tcpwrappers, arp).
Protection des accès distants (PKI, SSO). Switch. VLAN. Routeurs.
Pare-feux, pare-feux applicatifs, proxy.
IPSec, VPN.
SSL, TLS, SSH.
NIDS.
Mobilité dans les réseaux sans fil de type 802.xx:\\
Réseaux mobiles et protocoles IP (IPV6, HMIP, LERS, SIP).
Réseaux mobiles adhoc (par exemple MANET).
Réseaux mobiles de type NEMO (Network Mobility).
Mobilité dans les réseaux téléphoniques:\\
Générations de mobiles (GSM, GPRS, 3G, 3G+, UMTS).
Sécurité des réseaux sans fils:\\
Sécurité des réseaux GSM (authentification et chiffrement, sécurité des cartes SIM, interception d\'appel, sécurité des services de DATA (SMS, MMS)).
Intégrité, confidentialité et disponibilité des données sur les réseaux sans fil (filtrage des adresses MAC, WEP/WPA/WPA2, AAA : Radius, Portail Captif, VPN).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Réseau (modèle OSI, programmation). Notions de cryptographie.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux, sécurité et nomadisme' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des systèmes d\'exploitation' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Sécurité des systèmes d\'exploitation', '', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.', '* Connaître les grands principes de fonctionnement d\'un système d\'exploitation.
* Connaître les différents mécanismes permettant de sécuriser un système d\'exploitation.
* Acquérir la capacité à administrer un système type UNIX/Windows.
* Acquérir la capacité à sécuriser et maintenir la sécurité d\'un système d\'exploitation.
* Acquérir la capacité à analyser et rétablir un système compromis.', '1-  1) Concepts de base sur l\'administration Unix / Windows
  \begin{itemize}
  1-  Boot loader et procédure de boot matériel
  1-  Les démons et le lancement de services
  1-  Les comptes utilisateurs
  1-  Le noyau : fonctionnement, modules, configuration et compilation
  1-  Les différents types de fichiers
  \end{itemize} 
1-  Modèles de sécurité
  \begin{itemize}
  1-  Contrôle d\'accès MAC, RBAC, MLS, BLP
  1-  Propriétés de sécurité
  1-  Séparation de privilèges
  \end{itemize} 
1-  Sécurité d\'un système Linux
  \begin{itemize}
  1-  Sécurité système : authentification, autorisation, single sign on (LDAP, Kerberos)
  1-  Débordements de tampon (buffer overflows)
  1-  Surveillance système : Logs, HIDS, Forensics 
  1-  Contrôle d\'accès (SELinux, GRSecurity, ...)
  1-  Chiffrement de données
  \end{itemize} 
1-  Sécurité des systèmes Windows NT
  \begin{itemize}
  1-  Principes généraux de sécurité de Windows NT
  1-  Active directory
  1-  Mécanismes de sécurité niveau système
  1-  Sécurité client/serveur de Windows NT
  1-  Nouveautés dans Windows 7
  \end{itemize} 
1-  Systèmes de détection d\'intrusion
  \begin{itemize}
  1-  Principes généraux : Introduction aux IDS
  1-  Exploitation des IDS 
  \end{itemize}', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Notions de C et programmation shell
- Notions d\'architecture des ordinateurs', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des systèmes d\'exploitation' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Webmining et réseaux sociaux' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Webmining et réseaux sociaux', '3', '20', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.', '* Savoir identifier et explorer intelligemment diverses sources d\'informations offertes par le web. 
* Objectif', '* Fouille dans les réseaux sociaux.
* Systèmes de recommandation.
* Données ouvertes.
* Recherche d\'information.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Webmining et réseaux sociaux' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('UE35', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Architecture applicatives réparties' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Architecture applicatives réparties', '3', '20', '20', '10', '0', '4', '4', 'Français_', 'Unité obligatoire. Commune avec le master MIAGE.', '* Fournir les outils nécessaires à l\'analyse, la mise en place et l\'exploitation de systèmes d\'informations répartis.
* Apporter une solide formation sur la répartition des données et des traitements dans un Système d\'Information (SI), suivant deux axes :
outils avancés pour la modélisation et la gestion des SI (UML, design patterns, etc.) et SI distribués contemporains (architectures multi-tiers, plateformes applicatives).', 'Ce module se compose de deux parties complémentaires, portant sur les aspects théoriques et pratiques des systèmes d\'information répartis:

* Concepts et méthodes des SI. Dans cette partie l\'étudiant est sensibilisé aux pratiques modernes des systèmes d\'information,
en vue d\'une prise en charge plus efficace des phases d\'analyse et de conception d\'applications d\'entreprise :
  
  \item Typologie des SI et exemples significatifs
  \item UML et processus de développement unifié
  \item Patron de conception (Design Patterns)
  \item Organisation Informatique en entreprise
   
* Concepts et mise en oeuvre des SI répartis. Cette partie est essentiellement articulée autour de la plate forme J2EE.
Dans un premier temps, l\'étudiant se familiarise avec les outils sous-jacents :
  
  \item Appel d\'objets répartis via RMI
  \item Echange de messages entre applications distantes via JMS
  \item Persistance d\'objets (utilisation de différents frameworks)
  \item Concept de transaction répartie
   
 
Puis il étudie et met en oeuvre des applications multi-tiers sur une plateforme J2EE :
  
  * Concept de bean métier (EJB)
  * Intégration des différents types d\'EJB
  
  De nombreuses manipulations pratiques sont réalisées, en s\'appuyant sur le langage Java (RMI, EJB, Corba, ...).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Système et répartition.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Architecture applicatives réparties' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation et stratégie d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Simulation et stratégie d\'entreprise', '3', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '* Connaissance du monde de l\'entreprise.', 'Les étudiants sont mis en situation de gérer une entreprise à travaers des décisions d\'ordre commercial, financier et de production. Ces entreprises sont en concurrence sur le marché, et sont en mesure d\'évaluer régulièrement leurs résultats à l\'aide des documents financiers et d\'études de positionnement. Ainsi cette situation de gestion d\'entreprise est l\'occasion d\'appliquer les principaux concepts en statégies et marketing, et d\'élaborer des tableaux de bord afin de guider les étudiants dans leurs décisions et d\'en mesurer les impacts financier.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation et stratégie d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='Chaker.HAOUET@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Chaker', 'HAOUET', 'Chaker.HAOUET@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='Chaker.HAOUET@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des communications' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Sécurité des communications', '3', '20', '20', '0', '0', '4', '4', 'Français_', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel. Unité commune avec le master MIAGE.', '* Comprendre en profondeur les mécanismes garantissant la sécurité des systèmes et réseaux en thème de
confidentialité, d\'authentification et de disponibilité. 
* Modéliser un protocole à partir d\'une spécification textuelle et manipuler un outil de simulation et de vérification.', 'Ce module introduit et familiarise les étudiants avec des notions de sécurité relatives aux communications.
Après un survol historique de la compétition perpétuelle entre cryptographie et cryptanalyse, avec comme point clé
la seconde guerre mondiale et le système Enigma, les standards actuels de chiffrements symétriques et asymétriques
sont étudiés en profondeur. Les technologies actuelles permettent des communications synchrones sur des distances
de plusieurs centaines ou milliers de kilomètres. De plus ces communications peuvent contenir des informations
confidentielles et peuvent également nécessiter une authentification des personnes en communication
(communication entre un tiers et un centre de paiement par exemple). Des protocoles de sécurité sont développés
afin de garantir les propriétés mentionnées précédemment. 
Ce module présente les mécanismes d\'authentification,
de confidentialité et d\'intégrité de données et ainsi que quelques protocoles comme Kerberos.
Enfin, le dernier point traité dans ce module démontre que des algorithmes de chiffrement parfaits ne suffisent pas pour garantir
la sécurité d\'un protocole de communication. Les étudiants sont invités à manipuler un outil de simulation et de
vérification de protocoles de sécurité afin de détecter d\'éventuelles failles logiques de conception.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Notions de Mathématiques discrètes, réseaux.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Sécurité des communications' AND _ECTS_='4' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
