DECLARE @id_compo int;DECLARE @id_filiere int;DECLARE @id_promo int;DECLARE @id_matiere int;DECLARE @id_ens1 int;DECLARE @id_ens2 int;DECLARE @id_compo int; INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES ( (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info'),Info);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_, _LIBELLE_FILIERE_,_ID_COMPO) VALUES ( (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_= (SELECT _ID_COMPOInfo'),m2,Info);
SET @id_compo = (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = ' Info');
SET @id_filiere = (SELECT _ID_COMPO_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ' m2');
SET @id_promo = (SELECT _ID_COMPO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = ' VIP.tex');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Informatique ambiante'),@id_promo,'Informatique ambiante','UE 31 ','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Informatique ambiante');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '61', '0', '64', '0', '10', '10', 'Français_', '
	- Comprendre et mettre en place des transferts de données via des réseaux de communication sans fils.
	- Réaliser des programmes bien construits, fiables et sécurisés.
	- Maitriser les architectures et programmations parallèles.
	- Mettre en en place des programmes ergonomiques et visuels (utilisation de graphismes 2D ou 3D).
', '
1. Réseaux de communication
	 - Connaitre les différentes technologies de communication sans fil.
	 - Sélectionner la technologie la plus adaptée à une situation donnée.
	 - Mettre en place un système de communication sans fils (Bluetooth, Wifi, RFID, ....).
	 - Identifier les différents systèmes d\'exploitation et leurs limites (cas des systèmes mobiles).
2. Informatique Graphique
	 - Comprendre les architectures (matérielles et logicielles) permettant une programmation parallèle.
	 - Réaliser des programmes déployés sur GPU.
	 - Mettre en place des interfaces ergonomiques.
	 - Utiliser les bibliothèques usuelles de génération et de visualisation de graphismes 2D et 3D.
3. Design logiciel
	 - Comprendre et appliquer les méthodes de conception et de qualité logicielle.
	 - Mettre en \oe uvre des procédures de test logiciel.
	 - Connaitre les failles de sécurité liées au développement logiciel ou aux réseaux de communication.
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité orbligatoire.\\Cette unité se passe sur le site de l\'école Polytech\'Orléans dans la spécialité "');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Rémy' AND _PRENOM_ENS_='LECOGNE' AND _EMAIL_ENS_='Remy.LECOGNE@univ-orleans.fr'),'Rémy', 'LECOGNE', 'Remy.LECOGNE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Rémy' AND _PRENOM_ENS_='LECOGNE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Imagerie opérationnelle'),@id_promo,'Imagerie opérationnelle','UE 32','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Imagerie opérationnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '74', '51', '0', '0', '10', '10', 'Français_', '
	- Maîtriser les aspects théoriques des méthodes de traitement des images.
	- Être capable de d\'établir des plans de tests pertinents pour valider les techniques de vision et d\'imagerie mises en \oe uvre.
	- Être capable de fusionner les informations en provenance de différents capteurs et savoir prendre des décisions.
	- Objectif
', '
1. Analyse d\'images
	 - Choisir les outils logiciels adaptés à une problématique
	 - Savoir segmenter une image
	 - Résoudre un problème mal posé par des méthodes inverses
	 - Détecter des contours par modèles déformables
	 - Reconnaitre des formes dans une image
	 - Classifier des objets dans des bases d\'images
	 - Tatouer une image pour cacher des informations
	 - Synthétiser des images texturées
2. Traitements vidéo
	 - Indexer une vidéo par le contenu
	 - Analyser une séquence vidéo
	 - Suivre une cible dans une séquence vidéo
	 - Modéliser la prise de vue et le déplacement d\'une caméra 
	 - Faire un panorama avec une mosaïque d\'images
	 - Exploiter la réalité augmentée 
	 - Reconstruire des objets 3D par tomographie 
3. Tests, contrôle et validation
	 - Analyse multivariable (ACP) et réduction de dimensionnalité
	 - Savoir choisir des vecteurs tests, une base de données, une vérité terrain
	 - Choisir des critères de validation
	 - Réaliser un plan de contrôles
4. Fusion de données
	 - Fusionner des données par approches probabiliste, floue et fonctions de croyance
	 - Traiter des données sur GPU pour télévision 3D
	 - Embarquer un traitement d\'image 
	 - Traiter des images couleurs
	 - Fouille de données pour l\'extraction de connaissances
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité orbligatoire.\\Cette unité se passe sur le site de l\'école Polytech\'Orléans dans la spécialité "Écotechnologies Électroniques et Optiques". ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr'),'Rachid', 'JENNANE', 'Rachid.JENNANE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Management opérationnel'),@id_promo,'Management opérationnel','UE 33 ','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Management opérationnel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '24', '16', '0', '4', '4', 'Français_', '
	- Optimiser son comportement, son relationnel et son organisation pour tenir et développer son rôle d\'ingénieur au sein d\'une entreprise.
	- Acquérir les méthodes de l\'animation d\'équipe et de la négociation.
	- Comprendre les ressorts de la motivation.
	- Participer aux réunions et entretiens avec efficacité.
	- Utiliser les outils de management de la qualité et du développement durable.
	- Valoriser son stage.
', '
\begin{description}
-[Rôle et missions]
Styles de management et évolution des missions de l\'ingénieur. La notion de responsabilité d\'un poste. 
La relation client-fournisseur interne et l\'arbitrage. La relation client-fournisseur externe : négocier des achats des ventes.
Les liens entre le stage d\'ingénieur et le management.
-[Travailler en équipe]
Typologie des comportements au sein d\'une équipe. Réunions d\'information et de résolution de problèmes. 
Entretiens de management et d\'évaluation. Donner des directives. Motiver ses collègues. Gérer les cas difficiles et les conflits. 
S\'organiser, faire le suivi. Gérer le stress.
-[Management de la qualité et du développement durable]
Méthodes et outils du management de qualité et de la résolution de problème. Développement durable : 
démarche intégrée, indicateur et prévention des risques.
\end{description}
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité orbligatoire.\\Cette unité se passe sur le site de l\'école Polytech\'Orléans. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Jean-Jacques' AND _PRENOM_ENS_='YVERNAULT' AND _EMAIL_ENS_='Jean-Jacques.YVERNAULT@univ-orleans.fr'),'Jean-Jacques', 'YVERNAULT', 'Jean-Jacques.YVERNAULT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Jean-Jacques' AND _PRENOM_ENS_='YVERNAULT' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Simulation et stratégie d\'entreprise'),@id_promo,'Simulation et stratégie d\'entreprise','UE 34','1');
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
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Initiation à la recherche'),@id_promo,'Initiation à la recherche','UE 35','1');
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
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité conseillée pour ceux qui se destinent à la recherche.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie.ROBERT@univ-orleans.fr'),'Sophie', 'ROBERT', 'Sophie.ROBERT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr'),'Rachid', 'JENNANE', 'Rachid.JENNANE@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet'),@id_promo,'Projet','UE 36','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '
	- Mise en pratique des principes et techniques étudiés dans les unités d\'enseignement.
', '
Réalisation d\'une application en rapport avec les UE du semestre. 
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', '');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie.ROBERT@univ-orleans.fr'),'Sophie', 'ROBERT', 'Sophie.ROBERT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr'),'Rachid', 'JENNANE', 'Rachid.JENNANE@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Programmation multi-c\oe urs'),@id_promo,'Programmation multi-c\oe urs','UE 41','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Programmation multi-c\oe urs');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Capacité à exploiter correctement et efficacement les différents niveau de parallèlisme présents dans les architectures actuelles.
	- Capacité à choisir une architecture en fonction d\'un problème donné.
	- Capacité à utiliser ces compétences dans les domaines du calcul scientifique et du traitement d\'images.
', '
Ce cours porte sur l\'exploitation des différents niveaux de parallélisme présents dans la quasi-totalité des architectures actuelles. Ces niveaux (multi-coeurs, unités vectorielles et cartes graphiques) seront d\'abord présentés, en particulier, les problématiques de programmation liées aux spécificités de ces architectures seront étudiés (hyperthreading, pipeline, cache, modèle mémoire, alignement).
Après une introduction aux structures de données adaptées au parallélisme en mémoire partagée, la programmation de ces architectures sera étudiée au travers d\'exemples touchant au calcul scientifique et au traitement d\'images. La programmation des processeurs multi-coeurs reposera sur l\'utilisation des Pthreads, d\'OpenMP, d\'Intel TBB et sur une présentation du concept de transaction. La programmation de cartes graphiques reposera sur l\'utilisation de CUDA et les jeux d\'instructions SSE et Altivec seront utilisés pour la programmation des unités vectorielles intégrées dans les processeurs. Une vision plus
haut-niveau sera donnée au travers de la librairie OpenCL. Finalement, l\'accent sera mis sur la combinaison de ces différents niveaux de parallélisme, la mesure des performances et l\'adéquation
entre problèmes et choix d\'architectures/algorithmes adaptés. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sylvain' AND _PRENOM_ENS_='JUBERTIE' AND _EMAIL_ENS_='Sylvain.JUBERTIE@univ-orleans.fr'),'Sylvain', 'JUBERTIE', 'Sylvain.JUBERTIE@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sylvain' AND _PRENOM_ENS_='JUBERTIE' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Visualisation avancée'),@id_promo,'Visualisation avancée','UE 42','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Visualisation avancée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Comprendre différentes techniques de visualisation d\'information scientifique. Comprendre le fonctionnement d\'une application graphique nomade.
	- Aborder sur des exemples les principes des applications  de visualisation scientifique portants sur des données massives de type geo-scientifique ou biologie moléculaire.
', '
La complexité sémantique et la massivité des données issues de mesures scientifiques, de simulations numériques ou d\'immenses bases de données disponibles sur le réseau, rendent indispensable le recours à la médiation visuelle pour en permettre une appréhension la plus riche possible.  La mise en oeuvre de  techniques de visualisation élaborées conduit à utiliser des architectures parallèles et distribués pour faire face à la complexité des traitements numériques en amont ou propre au rendu visuel. Cette puissance de traitement peut être mise en oeuvre pour simplifier le rendu afin de l\'adapter à un rendu nomade, mais elle  peut aussi adapter les données en post-traitement pour que celles-ci soient analysées via un vaste environnement de Réalité Virtuelle multi-écrans plus ou moins distant sur le réseau.
Nous présentons dans ce cours  les fondements du pipeline graphique parallèle, les différentes techniques de rendu scientifique, les moyens d\'adapter le rendu nomade aux gros volumes de données complexes et enfin nous abordons la visualisation scientifique utilisant les techniques avancée de Réalité Virtuelle au service de la performance. 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire. ');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 0, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='Sebastien.LIMET@univ-orleans.fr'),'Sébastien', 'LIMET', 'Sebastien.LIMET@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sébastien' AND _PRENOM_ENS_='LIMET' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Fouille d\'images'),@id_promo,'Fouille d\'images','UE 43','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Fouille d\'images');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '15', '0', '0', '3', '3', 'Français_', '
	- Apporter à l\'étudiant une double compétence dans les techniques d\'apprentissage en général et dans leur application aux images en particulier.
', '
Ce module explore les différentes techniques et compétences nécessaires à la fouille d\'images, depuis la description synthétique des images jusqu\'aux techniques d\'apprentissage automatique.
La description synthétique des images consiste à extraire un nombre restreint de descripteurs numériques, représentatifs du contenu de l\'image, la décrivant sur un plan local ou global (orientations ou couleurs dominantes, texture...). Nous étudierons ou rappellerons différentes méthodes d\'extraction de descripteurs, tels que les histogrammes, les matrices de cooccurence ou encore les ondelettes. Nous verrons également comment extraire les points d\'intérêt au sein des images.
Par ailleurs, nous présenterons différentes facettes de l\'apprentissage automatique, d\'abord de manière générale, puis dans le cadre de leur application aux images.
Nous aborderons la notion de distance ou similarité, nous montrerons comment elle peut s\'appliquer pour des recherches locales (images similaires, classification par plus proche voisin...) ou globale (structuration de l\'espace des images, clustering...).
Nous étudierons l\'impact de connaissances a priori sur l\'efficacité des méthodes (approches non supervisées, supervisées, semi-supervisées). 
', 'Contrôle continue et terminal', 'CC et CT', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', 'Unité obligatoire.');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='Christel.VRAIN@univ-orleans.fr'),'Christel', 'VRAIN', 'Christel.VRAIN@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Christel' AND _PRENOM_ENS_='VRAIN' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Préparation au stage recherche'),@id_promo,'Préparation au stage recherche','UE 44','1');
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
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Prénom' AND _PRENOM_ENS_='NAAAAOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr'),'Prénom', 'NAAAAOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Prénom' AND _PRENOM_ENS_='NAAAAOM' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Projet'),@id_promo,'Projet','UE 45','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Projet');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '6', '6', 'Français_', '
	- Mise en pratique des principes et techniques étudiés dans les unités d\'enseignement.
', '
Réalisation d\'une application en rapport avec les UE du semestre. 
', 'Contrôle continue et terminal', 'Rapport et soutenance de projet', 'CT', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources', 'Biblio', '7', '');
 INSERT IGNORE INTO livret_pre_requis (_ID_MAT_FILS_, _ID_MAT_,_DESCRIPTION_) VALUES (@id_matiere, 1, '');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie.ROBERT@univ-orleans.fr'),'Sophie', 'ROBERT', 'Sophie.ROBERT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr'),'Rachid', 'JENNANE', 'Rachid.JENNANE@univ-orleans.fr');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Rachid' AND _PRENOM_ENS_='JENNANE' AND _EMAIL_ENS_='Rachid.JENNANE@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Anglais'),@id_promo,'Anglais','UE 46','1');
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
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES ((SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_=@id_promo AND _LIBELLE_PROMO_='Stage'),@id_promo,'Stage','UE 47','1');
SET @id_matiere = (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_PROMO_='Stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO, _ID_MAT, _SEMESTRE) VALUES (@id_promo, @id_matiere, 'Semestre 4');
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
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie.ROBERT@univ-orleans.fr'),'Sophie', 'ROBERT', 'Sophie.ROBERT@univ-orleans.fr');
SET @id_ens1 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES ((SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ ='' AND _PRENOM_ENS_='' AND _EMAIL_ENS_=''),'', '', '');
SET @id_ens2 = (SELECT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_=' ' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MAT_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);
