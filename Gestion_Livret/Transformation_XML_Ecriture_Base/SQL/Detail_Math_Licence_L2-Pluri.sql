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
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Réseaux', '3', '10', '10', '15', '0', '3', '3', 'Français_', '* Principes et pratique des réseaux locaux informatiques.', '* Architecture des réseaux : structure en couches, protocoles, services.
  * Réseaux locaux sous UDP-TCP/IP, Ethernet.
  * Protocoles de routage : RIP, OSPF, BGP.
  * Principaux protocoles Internet : DNS (annuaire de noms de domaines) SMTP (mail), FTP (transfert de fichiers), HTTP (web) ...', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Réseaux' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Applications internet' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Applications internet', '4', '20', '24', '24', '0', '5', '5', 'Français_', '* Développer et maintenir des sites et applications intra/internet.', '* Les langages HTML, XHTML, feuilles de style CSS.
  * Applications réparties : le modèle client/serveur.
  * Langages pour les pages web dynamiques : PHP, MySQL
  * XML.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Applications internet' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 1', '3', '0', '0', '0', '0', '3', '3', 'Français_', '* Mise en oeuvre dans un exemple d\'application réaliste des concepts vus dans les modules informatique de la période considérée.', 'Réalisation d\'une applications mettant en oeuvre les notions vues dans les modules Algorithmique, Programmation objet 1, Bases de données, Systèmes et Réseaux.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Initiation', '3', '8', '0', '8', '0', '0', '0', 'Français_', '* Remettre à un même niveau de base tous les étudiants et les familiariser avec le fonctionnement des ordinateurs et les outils informatiques usuels.', '* Fondements de l\'informatique : codage des données, traitements, structure générale d\'un ordinateur
  * Utilisation des systèmes d\'exploitation de type Unix.
  * Outils logiciels bureautique et internet.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Adresse de la plateforme de cours en ligne de la formation : http://celene.univ-orleans.fr/course/category.php?id=367', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 2', '4', '0', '0', '0', '0', '5', '5', 'Français_', '* Mise en oeuvre dans un exemple d\'application réaliste des concepts vus dans les modules informatique de la période considérée.', 'Développer une application web en mettant en \oe uvre les concepts appris en génie logiciel et applications internet.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 1' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation objet 1', '3', '20', '25', '25', '0', '6', '6', 'Français_', '* Introduction à la programmation objet dans un langage impératif. 
  * Mise en oeuvre d\'algorithmes dans ce langage.', '* Introduction à la programmation, algorithmes de base
  * Programmation objet: classe, objet, état, méthode, communication entre objets.
  * Récurrence. 
  * Tableaux, Tris.
  * Interfaces.
  * Héritage.
  * Exceptions.
  * Entrées/sorties.
  * Introduction à la notation UML.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 1' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Génie logiciel' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Génie logiciel', '4', '20', '24', '24', '0', '5', '5', 'Français_', '* Acquisition des connaissances de bases d\'UML, d\'une méthodologie permettant d\'analyser un problème, d\'en réaliser la modélisation, puis d\'élaborer une mise en oeuvre sous forme d\'une application informatique. 
  * Connaissance des notions de la gestion de projets.', '* Modélisation UML : diagrammes de classes, de séquences, d\'états-transition et de cas d\'utilisation.
  * Pratique d\'un atelier de génie logiciel.
  * Méthodologie d\'analyse et de conception objet.
  * Introduction aux patrons de conception (design patterns).
  * Introduction à la gestion de projets.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Génie logiciel' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Algorithmique', '3', '15', '15', '0', '0', '3', '3', 'Français_', '* Comprendre le fonctionnement d\'un algorithme donné.
  * Concevoir des algorithmes pour un problème simple donné.
  * Savoir utiliser des structures de données.', '* Notions : variables, affectation, conditionnelle, itération, récursion.
  * Algorithmes simples sur les tableaux.
  * Algorithmes de tri.', '', '', '', '', '', 'Mathématiques élémentaires', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Anglais', '3', '0', '20', '0', '0', '3', '3', 'Français_', '* S\'exprimer couramment et efficacement dans une langue riche, souple et nuancée dans le domaine de la spécialité, exposer son opinion de manière claire, détaillée et structurée.', 'Etude des techniques de présentation orale : amélioration de la prononciation, organisation du discours, guidage de l\'auditoire, élaboration d\'aides visuelles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Anglais non professionnel', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='10' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Stage', '4', '10', '0', '0', '0', '10', '10', 'Français_', '* Permettre d\'une part de mettre en pratique les enseignements dispensés pendant l\'année et d\'autre part de familiariser 
  les étudiants avec la vie professionnelle afin de permettre leur insertion.', 'Stage de 4 à 6 mois consécutifs dans une entreprise, suivi par un enseignant et donnant lieu à la rédaction d\'un mémoire puis 
d\'une soutenance en présence d\'un jury mixte d\'enseignants et de responsables de l\'entreprise.\\
Le sujet est variable selon le stage.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='10' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation de  gestion d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Simulation de  gestion d\'entreprise', '3', '0', '24', '0', '0', '3', '3', 'Français_', '* Au terme de cette simulation, les étudiants doivent pouvoir gérer le temps, travailler en groupe, gérer les conflits, ... 
  * Connaitre le monde de l\'entreprise.', 'Simulation visant à amener les groupes (chacun représentant une entreprise en concurrence avec les autres), après avoir formalisé une stratégie, 
à prendre des décisions d\'ordre commercial, de production, d\'investissement et de financement. Dans ce cadre, ils mettent en \oe uvre la 
plupart des outils financiers et prévisionnels connus.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Le jeu fait appel aux connaissances des étudiants ainsi qu\'à la réflexion et l\'imagination.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation de  gestion d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Bases de données', '3', '20', '25', '25', '0', '6', '6', 'Français_', '* Donner aux étudiants les grandes lignes des diverses fonctionnalités d\'un SGBD relationnel.   
  * Introduire les techniques de modélisation de données.  
  * Apprendre et maîtriser le langage de manipulation et d\'interrogation de bases de données : SQL.', '* Structure fonctionnelle et Architecture d\'un SGBD.
  * Problématique de la modélisation logique des données.
  * Modèle relationnel, Langage SQL.
  * Interrogation de données du modèle relationnel.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Systèmes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Systèmes', '3', '10', '10', '15', '0', '3', '3', 'Français_', '* Utilisation et administration de systèmes d\'exploitation.', '* Architecture de systèmes d\'exploitation.
  * Utilisation d\'Unix.
  * Administration Unix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Systèmes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation objet 2', '4', '20', '24', '24', '0', '5', '5', 'Français_', '* Savoir développer une application avec un langage orienté objet utilisant des structures de données récursives, interface graphique et interface avec une base de donnée.', '* Généricité.
  * Classes internes.
  * Implantation de structures de données.
  * Collections des bibliothèques standards.
  * Programmation événementielle.
  * Interface graphique.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Modules Algorithmique, Programmation objet 1', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
