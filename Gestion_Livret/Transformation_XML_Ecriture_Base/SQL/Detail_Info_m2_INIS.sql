DECLARE @id_compo int;DECLARE @id_filiere int;DECLARE @id_promo int;DECLARE @id_matiere int;DECLARE @id_ens1 int;DECLARE @id_ens2 int;DECLARE @id_compo int; INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES ( (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info'),Info);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_, _LIBELLE_FILIERE_,_ID_COMPO) VALUES ( (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_= (SELECT _ID_COMPOInfo'),m2,Info);
SET @id_compo = (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info');
SET @id_filiere = (SELECT _ID_COMPO_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ' m2');
SET @id_promo = (SELECT _ID_COMPO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = ' INIS.tex');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Sécurité des applications nomades'),@id_promo,'Sécurité des applications nomades','UE 31','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Sécurité des applications nomades');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Capacité à configurer correctement une machine virtuelle Java en fonction d\'une politique de sécurité donnée.
	- Maîtrise des subtilités du langage Java ayant un impact sur la sécurité des applications.
	- Connaissance des propriétés de sureté du code assurées par les machines virtuelle Java et des techniques d\'analyse sous-jacentes.
	- Application de ces techniques à des propriétés de sécurité spécifiques.
', '
Ce cours porte sur la sécurité des applications J2ME (Java 2 Mobile Edition) et se décompose en deux parties.
La première partie traite des problèmes liés à la configuration de la politique de sécurité de la machine virtuelle
(security manager, chargeur de classe, contrôle  d\'accès, signature de classes, ...) et des bonnes pratiques de programmation.
Plusieurs aspects du langage Java (héritage, modificateurs,   sérialisation, JNI...) pouvant avoir un impact sur la sécurité des  applications seront étudiés.
En particulier, l\'accent sera mis, au travers d\'une étude de la spécification du langage, sur les pratiques de développement Java conduisant à la production d\'un code robuste.
La seconde partie du cours portera sur le code exécuté par la machine virtuelle et la spécification de cette dernière.
En particulier, les mécanismes de vérification de bytecode mis en oeuvre par la machine virtuelle (principalement basés sur la sureté du typage)
et les techniques d\'analyse sous-jacentes seront étudiés. Finalement, ces techniques d\'analyse seront généralisées afin de permettre
leur application à des propriétés de sécurité plus précises.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Système d\'informations géographiques nomades'),@id_promo,'Système d\'informations géographiques nomades','UE 32','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Système d\'informations géographiques nomades');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Développer des applications nomades basées sur la géo-localisation et utilisant des SIG.
', '
	- Apprentissage des principaux systèmes de géo-localisation utilisés dans l\'informatique nomade. Etude des principes et des outils des systèmes d\'informations géographiques (SIG).
	- Analyse des architectures matérielles  et logicielles des SIG nomades.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Un' AND _PRENOM_ENS_='professionnel du BRGM' AND _EMAIL_ENS_='Bureau de Recherches Géologiques et Minières'),'Un', 'professionnel du BRGM', 'Bureau de Recherches Géologiques et Minières');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Un' AND _PRENOM_ENS_='professionnel du BRGM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Architecture applicatives réparties'),@id_promo,'Architecture applicatives réparties','UE 33','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Architecture applicatives réparties');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '20', '10', '0', '4', '4', 'Français_', '
	- Fournir les outils nécessaires à l\'analyse, la mise en place et l\'exploitation de systèmes d\'informations répartis.
	- Apporter une solide formation sur la répartition des données et des traitements dans un Système d\'Information (SI), suivant deux axes :
	outils avancés pour la modélisation et la gestion des SI (UML, design patterns, etc.) et SI distribués contemporains (architectures multi-tiers, plateformes applicatives).
', '
Ce module se compose de deux parties complémentaires, portant sur les aspects théoriques et pratiques des systèmes d\'information répartis:
	- Concepts et méthodes des SI. Dans cette partie l\'étudiant est sensibilisé aux pratiques modernes des systèmes d\'information,
	en vue d\'une prise en charge plus efficace des phases d\'analyse et de conception d\'applications d\'entreprise :
		  - Typologie des SI et exemples significatifs
		  - UML et processus de développement unifié
		  - Patron de conception (Design Patterns)
		  - Organisation Informatique en entreprise
	- Concepts et mise en oeuvre des SI répartis. Cette partie est essentiellement articulée autour de la plate forme J2EE.
	Dans un premier temps, l\'étudiant se familiarise avec les outils sous-jacents :
		  - Appel d\'objets répartis via RMI
		  - Echange de messages entre applications distantes via JMS
		  - Persistance d\'objets (utilisation de différents frameworks)
		  - Concept de transaction répartie
Puis il étudie et met en oeuvre des applications multi-tiers sur une plateforme J2EE :
	  - Concept de bean métier (EJB)
	  - Intégration des différents types d\'EJB
  De nombreuses manipulations pratiques sont réalisées, en s\'appuyant sur le langage Java (RMI, EJB, Corba, ...).
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. Commune avec le master MIAGE.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Frederic.MOAL@univ-orleans.fr'),'Frédéric', 'MOAL', 'Frederic.MOAL@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='MOAL' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr'),'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet 1'),@id_promo,'Projet 1','UE 37','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	- Mise en pratique des principes et techniques étudiés dans les unités d\'enseignement.
', '
Réalisation d\'une application en rapport avec les UE du semestre. 
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr'),'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr'),'Frédéric', 'DABROWSKI', 'Frederic.DABROWSKI@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Initiation à la recherche'),@id_promo,'Initiation à la recherche','UE 38','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Initiation à la recherche');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '57', '0', '0', '0', '7', '7', 'Français_', '
	- L\'objectif est d\'initier l\'étudiant à une démarche scientifique et de le familiariser à un travail de recherche bibliographique. 
	- Les tutoriaux ont pour objectif d\'appréhender quelques thématiques de recherche et d\'introduire des techniques récentes ou fondamentales.
', '
Initiation au stage recherche :
	- introduction d\'outils pour aborder un stage de recherche en laboratoire
	- présentation du cycle de tutoriaux, des thématiques, des possibilités de poursuites en thèse et plus largement du milieu de la recherche académique ou industrielle
	- présentation des projets académiques proposés au semestre 4
Cycle de tutoriaux :
	- 2 tutoriaux longs (d\'une durée totale de 9h; soit 2 fois 3 séances de 1h30) seront axés sur une thématique préalablement
	choisie et pour laquelle un renforcement est sollicité par le laboratoire.
	- 20 tutoriaux courts (de 1h30 chacun) articulés autour de thématiques telles que la résolution par contraintes,
	l\'apprentissage, extraction de connaissances, le parallélisme, la réalité virtuelle, la sécurité et sûreté des logiciels,
	les modèles de calculs, l\'algorithmique et la théorie des graphes, ...
Ces tutoriaux se voudront à la fois introductifs et concrets, mais ils apporteront également des connaissances pointues sur des domaines maîtrisés par les intervenants. 
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité conseillée pour ceux qui se destinent à la recherche.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr'),'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr'),'Frédéric', 'DABROWSKI', 'Frederic.DABROWSKI@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Frédéric' AND _PRENOM_ENS_='DABROWSKI' AND _EMAIL_ENS_='Frederic.DABROWSKI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Simulation et stratégie d\'entreprise'),@id_promo,'Simulation et stratégie d\'entreprise','UE 39','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Simulation et stratégie d\'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '
	- Connaissance du monde de l\'entreprise.
', '
Les étudiants sont mis en situation de gérer une entreprise à travaers des décisions d\'ordre commercial, financier et de production. Ces entreprises sont en concurrence sur le marché, et sont en mesure d\'évaluer régulièrement leurs résultats à l\'aide des documents financiers et d\'études de positionnement. Ainsi cette situation de gestion d\'entreprise est l\'occasion d\'appliquer les principaux concepts en statégies et marketing, et d\'élaborer des tableaux de bord afin de guider les étudiants dans leurs décisions et d\'en mesurer les impacts financier. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='Chaker.HAOUET@univ-orleans.fr'),'Chaker', 'HAOUET', 'Chaker.HAOUET@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Pratique des contraintes'),@id_promo,'Pratique des contraintes','UE 34 : WIN','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Pratique des contraintes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Modélisation et résolution de problèmes par approche déclarative.
', '
Ce module s\'inscrit dans une démarche déclarative et descriptive pour modéliser et résoudre des problèmes combinatoires complexes et professionellement pertinents.
On y montre l\'application des contraintes dans un éventail de problèmes réels, en mettant l\'accent sur la pratique de la modélisation et l\'utilisation des outils.
Il s\'inscrit dans la continuité du module PLC de M1 qui présente le paradigme de la programmation logique et offre une introduction aux contraintes. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Bich' AND _PRENOM_ENS_='DAO' AND _EMAIL_ENS_='Bich.DAO@univ-orleans.fr'),'Bich', 'DAO', 'Bich.DAO@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Bich' AND _PRENOM_ENS_='DAO' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Webmining et réseaux sociaux'),@id_promo,'Webmining et réseaux sociaux','UE35 : WIN','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Webmining et réseaux sociaux');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Savoir identifier et explorer intelligemment diverses sources d\'informations offertes par le web. 
	- Objectif
', '
	- Fouille dans les réseaux sociaux.
	- Systèmes de recommandation.
	- Données ouvertes.
	- Recherche d\'information.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='Matthieu.EXBRAYAT@univ-orleans.fr'),'Matthieu', 'EXBRAYAT', 'Matthieu.EXBRAYAT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Matthieu' AND _PRENOM_ENS_='EXBRAYAT' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Extraction de connaissances dans les BD'),@id_promo,'Extraction de connaissances dans les BD','UE 36 : WIN','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Extraction de connaissances dans les BD');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '20', '10', '0', '4', '4', 'Français_', '
	- Utilisation d\'outils : Weka, RapidMiner.
	- Définir le problème d\'apprentissage : modèle à acquérir, données nécessaires, techniques applicables.
	- Appliquer des techniques d\'apprentissage.
', '
	- Les différents types d\'apprentissage et les différentes tâches 
	- Classification supervisée : arbre de décision, modèles probabilistes, machines à vecteur support, noyaux
	- Evaluation des modèles
	- Classification non supervisée : par partitionnement, hiérarchique, conceptuelle
	- Recherche de règles d\'association 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme. Unité commune avec le master MIAGE.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr'),'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Sécurité des communications'),@id_promo,'Sécurité des communications','UE 34 : SSL','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Sécurité des communications');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '20', '0', '0', '4', '4', 'Français_', '
	- Comprendre en profondeur les mécanismes garantissant la sécurité des systèmes et réseaux en thème de
	confidentialité, d\'authentification et de disponibilité. 
	- Modéliser un protocole à partir d\'une spécification textuelle et manipuler un outil de simulation et de vérification.
', '
Ce module introduit et familiarise les étudiants avec des notions de sécurité relatives aux communications.
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
vérification de protocoles de sécurité afin de détecter d\'éventuelles failles logiques de conception. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel. Unité commune avec le master MIAGE.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Sécurité des systèmes d\'exploitation'),@id_promo,'Sécurité des systèmes d\'exploitation','UE 35 : SSL','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Sécurité des systèmes d\'exploitation');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, '');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Connaître les grands principes de fonctionnement d\'un système d\'exploitation.
	- Connaître les différents mécanismes permettant de sécuriser un système d\'exploitation.
	- Acquérir la capacité à administrer un système type UNIX/Windows.
	- Acquérir la capacité à sécuriser et maintenir la sécurité d\'un système d\'exploitation.
	- Acquérir la capacité à analyser et rétablir un système compromis.
', '
1. 1) Concepts de base sur l\'administration Unix / Windows
	  - Boot loader et procédure de boot matériel
	  - Les démons et le lancement de services
	  - Les comptes utilisateurs
	  - Le noyau : fonctionnement, modules, configuration et compilation
	  - Les différents types de fichiers
2. Modèles de sécurité
	  - Contrôle d\'accès MAC, RBAC, MLS, BLP
	  - Propriétés de sécurité
	  - Séparation de privilèges
3. Sécurité d\'un système Linux
	  - Sécurité système : authentification, autorisation, single sign on (LDAP, Kerberos)
	  - Débordements de tampon (buffer overflows)
	  - Surveillance système : Logs, HIDS, Forensics 
	  - Contrôle d\'accès (SELinux, GRSecurity, ...)
	  - Chiffrement de données
4. Sécurité des systèmes Windows NT
	  - Principes généraux de sécurité de Windows NT
	  - Active directory
	  - Mécanismes de sécurité niveau système
	  - Sécurité client/serveur de Windows NT
	  - Nouveautés dans Windows 7
5. Systèmes de détection d\'intrusion
	  - Principes généraux : Introduction aux IDS
	  - Exploitation des IDS 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Qualité et certification'),@id_promo,'Qualité et certification','UE 36 : SSL','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Qualité et certification');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '4', '4', 'Français_', '
	- Connaître les différents référentiels qualité.
	- Connaître les différentes techniques d\'audit.
	- Savoir mettre en oeuvre une méthode de certification.
', '
1. Qualité logiciel :
	  - Présentation de la Qualité, historique, bases de la démarche, définitions, coûts, gains, processus
	  - Présentation des normes et référentiels Qualité (ISO 9001, CMM, ISO SPICE), assurance qualité logiciel
	  - Plan d\'assurance de la qualité logicielle
	  - Qualité produit, ISO 9126, métrologie (qualimétrie logicielle), gestion de configuration, gestion des changements
	  - Qualité dans la relation client/fournisseur, MOA/MOE, sous-traitants, tableaux de bord
2. Certification :
	  - Systèmes de management du Sysème d\'information
	  - ISO 27000, 2700x et méthode d\'audit (EBIOS, MEHARI, OCTAVE, ITIL, COBIT)
	  - Certifications (audit et organismes)
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Développement avancé d\'applications nomades'),@id_promo,'Développement avancé d\'applications nomades','UE 41','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Développement avancé d\'applications nomades');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Fournir à l\'étudiant les connaissances matérielles embarquées dans les téléphones "nouvelle génération".
	- Familiariser l\'étudiant à la programmation d\'application de réalité augmentée. Avoir connaissance du cadre légal régissant ce type d\'applications.
', '
Ce module présente les nouvelles ressources embarquées dans les téléphones "nouvelle génération" menant à de nouveaux types d\'applications
communément appelées "applications de réalité augmentée". Le spectre d\'applications imaginables est alors conséquents,
cependant elles doivent respecter un cadre légal. Ainsi, ce cours rappelle également la législation régissant ce type d\'applications.
1. Présentation des ressources matérielles : Wifi, Bluetooth, capteurs, accéléromètres
2. Description des différentes API selon le support
3. Interactions avec des services WEB
4. Cas d\'étude : un exemple de développement d\'une application "réalité augmentée"
5. Publication des applications 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Web services et interopérabilité'),@id_promo,'Web services et interopérabilité','UE 42','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Web services et interopérabilité');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '15', '15', '10', '0', '3', '3', 'Français_', '
	- Comprendre l\'architecture et les technologies sous-jacentes des Services Web, pour permettre l\'interopérabilité entre des systèmes d\'information hétérogènes.
', '
Ce module permet de comprendre l\'intérêt et les technologies sous-jacentes mises en \oe uvre dans les architectures de type
Services Web (SOAP, WSDL, HTTP, XML...). Le cours magistral présente les technologies et les outils (libres et commerciaux)
et les séances de travaux dirigés sur machines permettent de mettre en pratique les notions présentées en développant deux
SI sous java J2EE et Microsoft .NET qui interopèrent à l\'aide d\'une architecture orientée service. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. Commune avec le master MIAGE.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Visualisation avancée de données'),@id_promo,'Visualisation avancée de données','UE 43 : WIN','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Visualisation avancée de données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Comprendre différentes techniques de visualisation d\'information scientifique.
	- Comprendre le fonctionnement d\'une application graphique nomade.
	- Aborder sur des exemples les principes des applications  de visualisation scientifique portants sur des données massives de type geo-scientifique ou biologie moléculaire.
', '
La complexité sémantique et la massivité des données issues de mesures scientifiques, de simulations numériques ou
d\'immenses bases de données disponibles sur le réseau, rendent indispensable le recours à la médiation visuelle pour
en permettre une appréhension la plus riche possible.  La mise en oeuvre de  techniques de visualisation élaborées
conduit à utiliser des architectures parallèles et distribués pour faire face à la complexité des traitements numériques
en amont ou propre au rendu visuel. Cette puissance de traitement peut être mise en oeuvre pour simplifier le rendu
afin de l\'adapter à un rendu nomade, mais elle  peut aussi adapter les données en post-traitement pour que celles-ci
soient analysées via un vaste environnement de Réalité Virtuelle multi-écrans plus ou moins distant sur le réseau.
Nous présentons dans ce cours  les fondements du pipeline graphique parallèle, les différentes techniques de rendu
scientifique, les moyens d\'adapter le rendu nomade aux gros volumes de données complexes et enfin nous abordons
la visualisation scientifique utilisant les techniques avancées de Réalité Virtuelle au service de la performance.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='Sebastien.LIMET@univ-orleans.fr'),'Sébastien', 'LIMET', 'Sebastien.LIMET@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Fouille de données et de textes'),@id_promo,'Fouille de données et de textes','UE 44 : WIN','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Fouille de données et de textes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '15', '15', '10', '0', '3', '3', 'Français_', '
	- Compléter les connaissances acquises en fouille de données et acquérir de nouvelles compétences sur la fouile de données textuelles. 
	- Les données textes ont pris une importance croissante avec le développement d\'Internet qui permet de récupérer rapidement des masses de documents.
	- Il est important d\'avoir des outils permettant de traiter les documents, que ce soit pour la classification,
	la recherche d\'informations, la structuration de connaissances sur un domaine, le web sémantique, ...
', '
Cet enseignement permet d\'une part, d\'introduire des techniques importantes, principalement statistiques et bayésiennes,
non présentées dans le module Extraction de Connaissances dans les BD, d\'autre part, d\'élargir la problématique à des
types de données complexes comme les données textuelles.
1. Algorithme de fouille de données (approfondissement)
	  - apprentissage statistique (réseaux de neurones, machines à vecteur support, ...)
	  - apprentissage bayésien
2. Extraction de Connaissances à partir de textes 
	  - Préparation des données
	  - Documents structurés (XML, ...)
	  - Classification de documents 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. Commune avec le master MIAGE. A choisir pour le parcours WIN : Web, Intelligence et Nomadisme.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr'),'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Réseaux, sécurité et nomadisme'),@id_promo,'Réseaux, sécurité et nomadisme','UE 43 : SSL','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Réseaux, sécurité et nomadisme');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Découvrir les différents types de réseaux sans fils (IP, GSM, ...).
	- Connaître les spécificités des réseaux IP sans fils.
	- Connaître les protocoles de sécurité classiques.
	- Être capable de sécuriser une architecture réseau pour des applications nomades.
', '
Protocoles et sécurité:\\
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
Intégrité, confidentialité et disponibilité des données sur les réseaux sans fil (filtrage des adresses MAC, WEP/WPA/WPA2, AAA : Radius, Portail Captif, VPN). 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Analyse statique'),@id_promo,'Analyse statique','UE 44 : SSL','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Analyse statique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, '');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Connaissances des fondements de l\'analyse statique de programmes.
	- Capacité à utiliser ces connaissances pour le développement d\'outils de sûreté et de sécurité.
', '
La vérification de propriétés dynamiques des programmes, comme par exemple l\'absence d\'accès à des pointeurs nuls, est un problème généralement indécidable.
L\'interprétation abstraite dont traite ce cours fournit un cadre formel et des outils permettant de déterminer des approximations décidables
de ces propriétés pour lesquelles il est possible de dériver des systèmes de type, de vérification et d\'analyse statique.
Ce cours introduit les connaissances nécessaires à la mise oeuvre des techniques d\'interprétation abstraite (théorie des ordres,
théorie des points fixes, connexions de Galois,...). Des exemples concrets d\'utilisation de ces techniques seront étudiés et des outils
d\'analyse statique existants (Frama-C, Astree) seront présentés. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. A choisir pour le parcours SSL : Sûreté et Sécurité du Logiciel.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet 2'),@id_promo,'Projet 2','UE 45','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	- Mise en pratique de principes et de techniques étudiés dans les unités d\'enseignement. 
', '
Réalisation d\'une application en rapport avec les UE du semestre. 
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', '');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 47','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '
	- Savoir négocier des contrats.
', '
Étude des technique de présentation orale : amélioration de la prononciation, organisation du discours, guidage de l\'auditoire, élaboration d\'aides visuelles. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Cédric' AND _PRENOM_ENS_='SARRE' AND _EMAIL_ENS_='Cedric.SARRE@univ-orleans.fr'),'Cédric', 'SARRE', 'Cedric.SARRE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Cédric' AND _PRENOM_ENS_='SARRE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Stage'),@id_promo,'Stage','UE 48','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, '');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '12', '12', 'Français_', '
	- Appliquer tous les concepts vu durant le master.
', '
	- Un stage en entreprise à temps complet de 4 à 6 mois ou
	- Un stage de recherche  à  temps complet de 4 à 6 mois dans un laboratoire au sein d\'une équipe de
	recherche confronte l\'étudiant au monde de la recherche et lui permet à  la fois d\'approfondir et d\'individualiser
	la formation de base. Bien qu\'il soit conseillé de faire le stage en laboratoire de recherche, le stage peut se dérouler
	dans un service de recherche et développement d\'une entreprise.
La recherche du stage est à l\'initiative de l\'étudiant.
Cependant, le sujet doit être validé par les responsables de la formation. Le stage fait l\'objet d\'une convention
engageant l\'entreprise ou le laboratoire, l\'université et l\'étudiant.  
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='alfred.hitchcock@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='alfred.hitchcock@univ-orleans.fr'),'Alfred', 'HITCHCOCK', 'alfred.hitchcock@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Alfred' AND _PRENOM_ENS_='HITCHCOCK' AND _EMAIL_ENS_='alfred.hitchcock@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Préparation au stage recherche'),@id_promo,'Préparation au stage recherche','UE 46','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Préparation au stage recherche');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '6', '6', 'Français_', '
	- Savoir réaliser un état de l\'art dans un domaine spécialisé de la recherche en informatique et être à même d\'amorcer une démarche scientifique.
', '
	- Réalisation d\'un état de l\'art ou/et d\'une expérimentation dans un domaine précis de l\'informatique.
	- Initiation à la recherche.
Les étudiants assistent à 4h de cours pour avoir les prérequis pour ce module.
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité conseillée pour ceux qui se destinent à la recherche.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
