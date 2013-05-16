SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Math');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L2-Pluri');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L2-Pluri');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L2-Pluri');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Réseaux');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Réseaux', 'UE 34', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Réseaux');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '10', '15', '0', '3', '3', 'Français_', ' 
  * Principes et pratique des réseaux locaux informatiques.
 
', '
 
  * Architecture des réseaux : structure en couches, protocoles, services.
  * Réseaux locaux sous UDP-TCP/IP, Ethernet.
  * Protocoles de routage : RIP, OSPF, BGP.
  * Principaux protocoles Internet : DNS (annuaire de noms de domaines) SMTP (mail), FTP (transfert de fichiers), HTTP (web) ... 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet 1', 'UE 36', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', ' 
  * Mise en oeuvre dans un exemple d'application réaliste des concepts vus dans les modules informatique de la période considérée.
 
', '
Réalisation d'une applications mettant en oeuvre les notions vues dans les modules Algorithmique, Programmation objet 1, Bases de données, Systèmes et Réseaux. 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet 2', 'UE 44', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '5', '5', 'Français_', ' 
  * Mise en oeuvre dans un exemple d'application réaliste des concepts vus dans les modules informatique de la période considérée.
 
', '
Développer une application web en mettant en \oe uvre les concepts appris en génie logiciel et applications internet. 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage', 'UE 45', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '0', '0', '0', '10', '10', 'Français_', ' 
  * Permettre d'une part de mettre en pratique les enseignements dispensés pendant l'année et d'autre part de familiariser 
  les étudiants avec la vie professionnelle afin de permettre leur insertion.
 
', '
Stage de 4 à 6 mois consécutifs dans une entreprise, suivi par un enseignant et donnant lieu à la rédaction d'un mémoire puis 
d'une soutenance en présence d'un jury mixte d'enseignants et de responsables de l'entreprise.\\
Le sujet est variable selon le stage. 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Programmation objet 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Programmation objet 2', 'UE 43', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Programmation objet 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '24', '24', '0', '5', '5', 'Français_', ' 
  * Savoir développer une application avec un langage orienté objet utilisant des structures de données récursives, interface graphique et interface avec une base de donnée.
 
', '
 
  * Généricité.
  * Classes internes.
  * Implantation de structures de données.
  * Collections des bibliothèques standards.
  * Programmation événementielle.
  * Interface graphique. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases de données');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases de données', 'UE 32', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases de données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '25', '25', '0', '6', '6', 'Français_', ' 
  * Donner aux étudiants les grandes lignes des diverses fonctionnalités d'un SGBD relationnel.   
  * Introduire les techniques de modélisation de données.  
  * Apprendre et maîtriser le langage de manipulation et d'interrogation de bases de données : SQL.
 
', '
 
  * Structure fonctionnelle et Architecture d'un SGBD.
  * Problématique de la modélisation logique des données.
  * Modèle relationnel, Langage SQL.
  * Interrogation de données du modèle relationnel. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Systèmes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Systèmes', 'UE 33', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Systèmes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '10', '15', '0', '3', '3', 'Français_', ' 
  * Utilisation et administration de systèmes d'exploitation.
 
', '
 
  * Architecture de systèmes d'exploitation.
  * Utilisation d'Unix.
  * Administration Unix. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais', 'UE 38', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '3', '3', 'Français_', ' 
  * S'exprimer couramment et efficacement dans une langue riche, souple et nuancée dans le domaine de la spécialité, exposer son opinion de manière claire, détaillée et structurée.
 
', '
Etude des techniques de présentation orale : amélioration de la prononciation, organisation du discours, guidage de l'auditoire, élaboration d'aides visuelles. 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algorithmique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algorithmique', 'UE 31', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algorithmique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '15', '15', '0', '0', '3', '3', 'Français_', ' 
  * Comprendre le fonctionnement d'un algorithme donné.
  * Concevoir des algorithmes pour un problème simple donné.
  * Savoir utiliser des structures de données.
 
', '
 
  * Notions : variables, affectation, conditionnelle, itération, récursion.
  * Algorithmes simples sur les tableaux.
  * Algorithmes de tri. 
 
', '', '', '', '', '', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Génie logiciel');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Génie logiciel', 'UE 42', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Génie logiciel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '24', '24', '0', '5', '5', 'Français_', ' 
  * Acquisition des connaissances de bases d'UML, d'une méthodologie permettant d'analyser un problème, d'en réaliser la modélisation, puis d'élaborer une mise en oeuvre sous forme d'une application informatique. 
  * Connaissance des notions de la gestion de projets. 
 
', '
 
  * Modélisation UML : diagrammes de classes, de séquences, d'états-transition et de cas d'utilisation.
  * Pratique d'un atelier de génie logiciel.
  * Méthodologie d'analyse et de conception objet.
  * Introduction aux patrons de conception (design patterns).
  * Introduction à la gestion de projets.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Initiation');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Initiation', 'UE 30', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Initiation');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '8', '0', '8', '0', '0', '0', 'Français_', ' 
  * Remettre à un même niveau de base tous les étudiants et les familiariser avec le fonctionnement des ordinateurs et les outils informatiques usuels.
 
', '
 
  * Fondements de l'informatique : codage des données, traitements, structure générale d'un ordinateur
  * Utilisation des systèmes d'exploitation de type Unix.
  * Outils logiciels bureautique et internet. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Adresse de la plateforme de cours en ligne de la formation : http://celene.univ-orleans.fr/course/category.php?id=367
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Programmation objet 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Programmation objet 1', 'UE 35', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Programmation objet 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '25', '25', '0', '6', '6', 'Français_', ' 
  * Introduction à la programmation objet dans un langage impératif. 
  * Mise en oeuvre d'algorithmes dans ce langage. 
 
', '
 
  * Introduction à la programmation, algorithmes de base
  * Programmation objet: classe, objet, état, méthode, communication entre objets.
  * Récurrence. 
  * Tableaux, Tris.
  * Interfaces.
  * Héritage.
  * Exceptions.
  * Entrées/sorties.
  * Introduction à la notation UML. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Applications internet');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Applications internet', 'UE 41', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Applications internet');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '24', '24', '0', '5', '5', 'Français_', ' 
  * Développer et maintenir des sites et applications intra/internet.
 
', '
 
  * Les langages HTML, XHTML, feuilles de style CSS.
  * Applications réparties : le modèle client/serveur.
  * Langages pour les pages web dynamiques : PHP, MySQL
  * XML. 
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Simulation de  gestion d'entreprise');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Simulation de  gestion d'entreprise', 'UE 37', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Simulation de  gestion d'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * Au terme de cette simulation, les étudiants doivent pouvoir gérer le temps, travailler en groupe, gérer les conflits, ... 
  * Connaitre le monde de l'entreprise.
 
', '
Simulation visant à amener les groupes (chacun représentant une entreprise en concurrence avec les autres), après avoir formalisé une stratégie, 
à prendre des décisions d'ordre commercial, de production, d'investissement et de financement. Dans ce cadre, ils mettent en \oe uvre la 
plupart des outils financiers et prévisionnels connus. 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
