DECLARE @id_compo int;DECLARE @id_filiere int;DECLARE @id_promo int;DECLARE @id_matiere int;DECLARE @id_ens1 int;DECLARE @id_ens2 int;DECLARE @id_compo int; INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES ( (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info'),Info);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_, _LIBELLE_FILIERE_,_ID_COMPO) VALUES ( (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm1' AND _ID_COMPO_= (SELECT _ID_COMPOInfo'),m1,Info);
SET @id_compo = (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info');
SET @id_filiere = (SELECT _ID_COMPO_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ' m1');
SET @id_promo = (SELECT _ID_COMPO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = ' MIAGE.tex');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Analyse de données'),@id_promo,'Analyse de données','UE11','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Analyse de données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '0', '24', '0', '3', '3', 'Français_', '
	  - Savoir analyser et synthétiser un jeu de données par des techniques
	statistiques descriptives ou multivariées usuelles.
	  - Savoir manipuler les
	procédures d\'analyse statistique du logiciel SAS.
', '
Principales méthodes d\'analyse de données:
	- Statistiques descriptives usuelles (rappels)
	- Analyse en Composantes Principales (ACP)
	- Analyse Factorielle des Correspondances (AFC)
	- Analyse des Correspondances Multiples (ACM)
	- Méthodes de Classification (hiérarchique et non hiérarchique)
Travaux Dirigés:
	- Apprentissage de SAS
	- Recueil, nettoyage, recodage, mise en forme des données
	- Applications des méthodes vues en cours à des jeux de données exemples.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Didier' AND _PRENOM_ENS_='CHEVEAU' AND _EMAIL_ENS_='Didier.CHEVEAU@univ-orleans.fr'),'Didier', 'CHEVEAU', 'Didier.CHEVEAU@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Didier' AND _PRENOM_ENS_='CHEVEAU' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Types abstraits de données'),@id_promo,'Types abstraits de données','UE 12','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Types abstraits de données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '24', '0', '0', '4', '4', 'Français_', '
	  - Développer les capacités d\'abstraction et de généralisation et connaître les
	raisonnements par récurrence et induction.
', '
	- Génie logiciel :
	distinction spécification/implémentation,
	indépendance de l\'application par rapport à l\'implémentation,
	multiplicité des implémentations, raffinements successifs,
	modularité, réutilisabilité.
	- Présentation d\'un formalisme pour les spécifications de types abstraits
	algébriques :
	profils, préconditions, axiomes,
	propriétés : spécifications suffisantes, spécifications complètes.
	notion de modèle; le cas particulier du modèle des termes de la sigmaalgèbre.
	- Mise en oeuvre en Ada :
	types abstraits, fonctions de classe,
	implémentations génériques, classe des implémentations,
	sigma-modèle, optimisation du modèle.
	- Catalogue de structures : piles, files, liste, tables, arbres ...
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='Jean-Jacques.LACRAMPE@univ-orleans.fr'),'Jean-Jacques', 'LACRAMPE', 'Jean-Jacques.LACRAMPE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Complexité des algorithmes'),@id_promo,'Complexité des algorithmes','UE 13','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Complexité des algorithmes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '3', '3', 'Français_', '
	  - Être capable de prédire si un algorithme devrait ou non aboutir à un
	programme ayant un temps de calcul / un besoin en espace raisonnable.
	  - Être capable d\'estimer les ressources nécessaires quand le volume de
	données à traiter augmente.
', '
	- Notions de complexité.
	- Coût en temps et en espace, dans le pire des cas et en moyenne.
	- Problèmes d\'optimalité.
	- Mesure empirique, test de performance.
	- Coût du passage à l\'échelle.
	- Calcul formel de la complexité (et temps) : itératif et récursif.
	- De nombreux exemples illustrent le cours, parmi lesquels on peut citer :
		  - algorithmes de recherche, algorithmes de tri (Quick-sort, Heap-sort, tri radix...),
		  - algorithmes sur les graphes (composantes connexes, chemin minimal...).
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jérôme' AND _PRENOM_ENS_='DURAND-LOSE' AND _EMAIL_ENS_='Jerome.DURAND-LOSE@univ-orleans.fr'),'Jérôme', 'DURAND-LOSE', 'Jerome.DURAND-LOSE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jérôme' AND _PRENOM_ENS_='DURAND-LOSE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Langages formels et automates'),@id_promo,'Langages formels et automates','UE 14','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Langages formels et automates');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '24', '0', '0', '3', '3', 'Français_', '
	  - Savoir définir formellement des langages, comprendre le fonctionnement
	des automates d\'états finis et des automates à pile et leur utilisation dans la reconnaissance de mots.
', '
	- Généralités
		  - Vocabulaire, mots, langages.
		  - Grammaires, dérivations.
		  - Différents types de grammaires et de langages.
		  - Généralités sur les reconnaisseurs.
	- Les langages réguliers
		  - Expressions régulières.
		  - Grammaires linéaires à droite.
		  - Automates finis non-déterministes et déterministes.
		  - Algorithmes de déterminisation et de minimisation.
		  - Algorithmes de passages entre expressions régulières, grammaires linéaires à droite et automates finis.
	- Les langages indépendants du contexte
		  - Grammaires indépendantes du contexte.
		  - Automates à pile.
		  - Rapports entre grammaires indépendantes du contexte et automates à pile.
	- Etude de l\'analyse descendante LL.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Wadoud' AND _PRENOM_ENS_='BOUSDIRA' AND _EMAIL_ENS_='Wadoud.BOUSDIRA@univ-orleans.fr'),'Wadoud', 'BOUSDIRA', 'Wadoud.BOUSDIRA@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Wadoud' AND _PRENOM_ENS_='BOUSDIRA' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Ingénierie des SI'),@id_promo,'Ingénierie des SI','UE 15','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Ingénierie des SI');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '24', '0', '0', '3', '3', 'Français_', '
	  - Apprendre à planifier, concevoir et mettre en place un projet de système d\'information décisionnel.
	  - Savoir modéliser un système décisionnel.
	  - Être capable d\'optimiser l\'exécution de rapports.
', '
	- Introduction aux systèmes décisionnel – datawarehouse
	- Rappels de modélisation de données
	- Modélisation des systèmes d\'information
	- Outil d\'intégration de données (suite ETL Talend*)
	- Outil de gestion de base de données (SGBD Access/Dbase)
	- Sensibilisation aux performances de bases de données (Optimisation des requêtes, Tables d\'agrégats)
	- Outil de restitution de données (suite Business Objects)
	- Travaux dirigés :
		  - Création et modélisation d\'une base de données Access/Dbase
		  - Création d\'un projet Business Objects (Création d\'univers et de rapports dédiés)
		  - Projet encadré de création d\'un datawarehouse.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Amory' AND _PRENOM_ENS_='DE TADEO' AND _EMAIL_ENS_=''),'Amory', 'DE TADEO', '');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Amory' AND _PRENOM_ENS_='DE TADEO' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Interfaces Homme-Machine'),@id_promo,'Interfaces Homme-Machine','UE 16','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Interfaces Homme-Machine');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '24', '6', '0', '4', '4', 'Français_', '
	  - Compréhension des architectures Modèle Vue Contrôleur.
	  - Maîtriser le développement et la maintenance d\'IHM pour les architectures clients légers et clients lourds.
', '
	- Principes de la programmation événementielle, le modèle MVC.
	- Définition et programmation des interfaces graphiques en client « lourd ».
	- Illustration et mise en oeuvre avec le langage Java/SWING.
	- Architectures des interfaces Web (JSP/servlets ...), le modèle MVC 2.
	- Utilisation des frameworks Javascript / Exemple de GWT (Google Web Toolkit).
	- Les interfaces des terminaux portables / Exemple d\'Android.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Gestion de production'),@id_promo,'Gestion de production','UE 17','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Gestion de production');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', '
	  - Objectif *************
', '
	-  Les composantes d\'un système de gestion de production
	-  Elaboration du plan directeur de production
	-  Gestion des données techniques (nomenclatures, gammes)
	-  Calcul des besoins et des charges
	-  Gestion des stocks et des ordres, ordonnancement et suivi d\'atelier, atelier flexible.
	-  La réduction des stocks, la méthode KANBAN, le juste à temps.
	-  Liaisons avec les autres fonctions et les autres processus.
	-  Gestion de la chaîne logistique.
	-  Sous-système d\'information et de décision pour la gestion de production. Choix d\'informatisation.
	-  Aperçu sur les progiciels de gestion de la production. Intégration dans un ERP.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_=''),'Prénom', 'NOM', '');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet Professionnel'),@id_promo,'Projet Professionnel','UE 18','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet Professionnel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '12', '0', '0', '2', '2', 'Français_', '
	  - Rédiger son projet professionnel à court et moyen termes : quel type d\'activité, d\'entreprise, quelle structure, rémunération, lieu de travail...
	  - Faire ressortir les atouts de sa candidature pour de prochains entretiens de recrutement : savoir / savoir faire / savoir être.
	  - Première approche des attentes des recruteurs : l\'importance de la maîtrise de son projet pour se montrer convaincant.
	  - Autres compétences: Communication orale - persuasion - esprit de synthèse - sens des réalités - initiative - créativité - enthousiasme - management de projet - planification - confiance en soi.
', '
Réflexion sur le projet professionnel : trouver le bon compromis entre
l\'imaginaire et le réalisme.
	-  Pourquoi définir un projet professionnel / Les enjeux
	-  Construire son projet en fonction de ses motivations et de ses
	compétences
	-  Les questions à se poser
	-  Travail sur les "savoirs"
	-  Savoir faire : les 8 familles de compétences attendus par les employeurs
	-  Travail sur les savoirs être et la personnalité: le langage des couleurs - les
	ancrages de carrières - les sources de motivation et les priorités attendus
	de la vie professionnelle - les valeurs.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='Catherine.JULIE-BONNET@univ-orleans.fr'),'Catherine', 'JULIÉ-BONNET', 'Catherine.JULIE-BONNET@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Catherine' AND _PRENOM_ENS_='JULIÉ-BONNET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet Informatique'),@id_promo,'Projet Informatique','UE 19','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet Informatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	  - Mise en oeuvre de la décomposition spécification/implémentation ;
	  - Organisation d\'un travail collaboratif sur cette base ;
	  - Acquisition d\'un outil d\'interface graphique par auto-apprentissage ;
	  - Introduction à l\'utilisation répartie d\'une structure de donnée (architecture client-serveur).
', '
Réalisation d\'un projet sur un thème transversal à la formation, à partir
d\'un énoncé informel, dans un cadre collaboratif par groupe de quatre
étudiants tirés au sort.
Déroulement en deux phases :
	- Rédaction commune au groupe d\'une spécification algébrique à partir de
	l\'énoncé et validation de cette spécification,
	- Réalisation d\'au moins deux implémentations de la structure de données
	utilisables indifféremment par l\'application.
Application sous trois formes qui partagent le même coeur\,:
	- une version console,
	- une version graphique,
	- une version répartie
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='Jean-Jacques.LACRAMPE@univ-orleans.fr'),'Jean-Jacques', 'LACRAMPE', 'Jean-Jacques.LACRAMPE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jean-Jacques' AND _PRENOM_ENS_='LACRAMPE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 110','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, '');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	  - Maîtriser les compétences nécessaires pour valider un niveau B2. 
', '
	- Affiner la compréhension de documents (écrits et audiovisuels) plus
	complexes, renforcer les stratégies de lectures, pratiquer l\'expression
	écrite, notamment savoir rédiger une synthèse.
	- Travail de la compréhension orale et écrite de documents professionnels.
Supports :
	- Documents sonores, vidéos d\'intérêt scientifique (technologies informatiques) ;
	- Documents écrits s\'entraîner à la lecture rapide ;
	- Rattrapage et approfondissement en autonomie semi-guidée labo multimédia.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Francoise.TASSARD@univ-orleans.fr'),'Marie-Françoise', 'TASSARD', 'Marie-Francoise.TASSARD@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Système et Répartition'),@id_promo,'Système et Répartition','UE 21','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Système et Répartition');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '36', '36', '0', '0', '5', '5', 'Français_', '
	  - Etudier les mécanismes internes des systèmes d\'exploitation et la
	synchonisation des processus répartis.
', '
	- Désignation de l\'information
	- Allocation mémoire
	- Mécanismes d\'exécution
	- Gestion des activités parallèles
	- Sémaphores
	- Moniteurs
	- Gestion de ressources
	- Processus et threads
	- Systèmes de fichiers
	- Synchronisation de systèmes distribués
	- Sécurité
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Réseaux : protocoles et mobilité'),@id_promo,'Réseaux : protocoles et mobilité','UE 22','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Réseaux : protocoles et mobilité');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '12', '12', '0', '3', '3', 'Français_', '
	  - Être capable d\'installer et configurer un réseau hétérogène (filaire et sans fil).
	  - Savoir spécifier des protocoles nouveaux
', '
	- Spécification de protocoles (à l\'aide des automates d\'états finis étendus)
	- Étude détaillée des protocoles : TCP, DHCP et NAT
	- Les réseaux mobiles et mobilité : Étude du protocole 802.11 (wifi), éléments de sécurité dans les réseaux sans fils (WEP, WPA, ...), autres protocoles sans fils (Bluetooth, WiMax, GPRS, ...).
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli.ED-DBALI@univ-orleans.fr'),'AbdelAli', 'ED-DBALI', 'AbdelAli.ED-DBALI@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Ingénierie des connaissances'),@id_promo,'Ingénierie des connaissances','UE 23 ','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Ingénierie des connaissances');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '3', '3', 'Français_', '
	  - L\'objectif de ce cours est d\'initier les étudiants à la modélisation des
	connaissances dans un cadre formel, permettant des inférences et des
	raisonnements.
	  -  Les formats et les données du web sémantiques
	permettent d\'illustrer ces notions dans un cadre réaliste, qui oblige à tenir
	compte du vocabulaire normalisé déjà existant (sous la forme
	d\'ontologies).
', '
{Histoire de l\'intelligence artificielle et de l\'ingénierie des connaissances,
modélisation et représentation des connaissances via la logique
(propositionnelle et du premier ordre) ou des langages formels,
formalisation du raisonnement (chaînages avant et arrière, méthode des
tableaux), formats du web sémantique et langages associés (notation 3,
RDF, OWL, SPARQL...), ontologies et inférences dans le web sémantique.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr'),'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Méthodes avancées de conception'),@id_promo,'Méthodes avancées de conception','UE 24','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Méthodes avancées de conception');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '24', '0', '0', '4', '4', 'Français_', '
	  - Maîtriser la complexité des dépendances lors d\'un développement orienté objet d\'envergure.
	  - Appliquer des méthodologies agiles de gestion de projet.
', '
	- Principes de conception modulaire et évolutive des logiciels
	- Motifs de conception - "Design Patterns"
	- Mise en oeuvre en Java
	- Programmation orientée aspect
	- Méthodes agiles de développement
	- Illustration par SCRUM
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Test et qualité du logiciel'),@id_promo,'Test et qualité du logiciel','UE 25','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Test et qualité du logiciel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '0', '24', '0', '3', '3', 'Français_', '
	  - Manipuler des outils assurant une cohérence de style de programmation,
	rédiger des spécifications de tests fonctionnels à partir d\'un cahier des
	charges, manipuler les différents niveaux de tests.
', '
Ce module s\'inscrit dans le cadre de la qualité du logiciel. En particulier, il
focalise sur différents outils et méthodes permettant de mesurer la qualité
de développement du logiciel. La qualité du développement est scindée en
deux catégories : qualité dite "syntaxique" et qualité dite "sémantique".

Pour la première catégorie, différents outils/plugins comme PMD et
Checkstyle sont introduits, expliqués en détail et enfin mis en pratique sur
des cas d\'étude. Pour la seconde, la qualité est mesurée à partir de tests.

Les différents niveaux de tests définis par l\'ISTQB (International Software
Testing Qualifications Board) seront étudiés (tests unitaires, tests
d\'intégration, tests fonctionnels et tests de d\'acceptation) puis mis en
pratique sur des cas concrets.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_=''),'Prénom', 'NOM', '');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Analyse financière'),@id_promo,'Analyse financière','UE 26','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Analyse financière');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '12', '0', '0', '3', '3', 'Français_', '
	  - Etre capable de réaliser une analyse de la santé financière d\'une entreprise
	commerciale, grâce à la lecture d\'un bilan (équilibre), d\'un compte de
	résultats (croissance, rentabilité) et du cash-flow (capacité
	d\'autofinancement et solvabilité).
', '
Initiation à l\'analyse financière comprenant la lecture d\'un bilan, d\'un
compte de résultats, de la trésorerie (notion de cash-flow) et se terminant
par la présentation d\'un tableau de flux financiers, permettant ensuite une
ouverture ultérieure sur la gestion financière.
	- Stratégie d\'entreprise et stratégie financière.
	- Les concepts fondamentaux : fonds de roulement, besoin en fonds de roulement, trésorerie.
	- Les instruments d\'analyse de la situation financière : examen des documents comptables, recherche d\'indicateurs : ratios, soldes intermédiaires, scores, tableau de financement.
	- Les outils d\'une approche dynamique : le fonds de roulement normatif,
	les choix en matière d\'investissement, l\'incidence du risque, les modes de financement.
	- La gestion de la trésorerie.
	- Conclusion : le diagnostic financier.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Philippe' AND _PRENOM_ENS_='BRIVET' AND _EMAIL_ENS_=''),'Philippe', 'BRIVET', '');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Philippe' AND _PRENOM_ENS_='BRIVET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Simulation et jeu d\'entreprise'),@id_promo,'Simulation et jeu d\'entreprise','UE 27','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Simulation et jeu d\'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	  - Connaitre le monde de l\'entreprise.
', '
Simulation du fonctionnement d\'une entreprise en fonction des données
internes et externes ainsi que des décisions prises par les gestionnaires.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Gilles' AND _PRENOM_ENS_='LE FLOIC' AND _EMAIL_ENS_='Gilles.LE_FLOIC@univ-orleans.fr'),'Gilles', 'LE FLOIC', 'Gilles.LE_FLOIC@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Gilles' AND _PRENOM_ENS_='LE FLOIC' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Techniques de communication'),@id_promo,'Techniques de communication','UE 28','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Techniques de communication');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	  - **************
', '
	- Les entretiens d\'embauche et le rapport de stage :
		  - Les différents types d\'entretien.
		  - Les simulations avec autoscopie.
	- La conduite de réunion :
		  - Intervenir en réunion, s\'affirmer ; animer la réunion, aboutir.
		  - Apprendre à analyser les attitudes et les signes verbaux et non verbaux.
	- La gestion du temps : quels outils permettent de mieux gérer son temps.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_=''),'Prénom', 'NOM', '');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet informatique'),@id_promo,'Projet informatique','UE 29','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet informatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	  - Maîtriser l\'analyse et la mise en oeuvre d\'un système d\'information réparti.
', '
Etude et développement d\'un système d\'information distribué.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 210','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '2', '2', 'Français_', '
	  - Savoir faire une présentation orale.
	  - Maîtriser les compétences nécessaires pour valider un niveau B2.
', '
	- Entraînement aux techniques de communication orale : Présentation powerpoint (présentation du stage en entreprise).
	- Prise de parole en situation : réunion, négociation.
	- Poursuite du travail sur des sujets de société en vue de la validation du CLES 2.
Supports : Documents écrits et sonores.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='Marie-Francoise.TASSARD@univ-orleans.fr'),'Marie-Françoise', 'TASSARD', 'Marie-Francoise.TASSARD@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Marie-Françoise' AND _PRENOM_ENS_='TASSARD' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
