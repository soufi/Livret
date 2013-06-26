SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Info');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Info');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'm2', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'm2' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'CCI.old');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'CCI.old');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'CCI.old');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Initiation', '3', '8', '0', '8', '0', '0', '0', 'Fran�ais_', 'petite_DESCRIPTION', '* Remettre � un m�me niveau de base tous les �tudiants et les familiariser avec le fonctionnement des ordinateurs et les outils informatiques usuels', 'Fondements de l\'informatique : codage des donn�es, traitements, structure g�n�rale d\'un ordinateur
Utilisation des syst�mes d\'exploitation de type Unix.
Outils logiciels bureautique et internet.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Initiation' AND _ECTS_='0' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Fr�d�ric' AND _PRENOM_ENS_='Dabrowski' AND _EMAIL_ENS_='Fr�d�ric.Dabrowski@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Fr�d�ric', 'Dabrowski', 'Fr�d�ric.Dabrowski@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Fr�d�ric' AND _PRENOM_ENS_='Dabrowski' AND _EMAIL_ENS_='Fr�d�ric.Dabrowski@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Syst�mes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Syst�mes', '3', '10', '10', '15', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', '* Utilisation et administration de syst�mes d\'exploitation', 'Architecture de syst�mes d\'exploitation
Utilisation d\'Unix
Administration Unix', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Syst�mes' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie ROBERT@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sophie', 'ROBERT', 'Sophie ROBERT@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sophie' AND _PRENOM_ENS_='ROBERT' AND _EMAIL_ENS_='Sophie ROBERT@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 2', '4', '0', '0', '0', '0', '5', '5', 'Fran�ais_', 'R�alisation d\'une application r�partie.', '* Mise en oeuvre dans un exemple d\'application r�aliste des concepts vus dans les modules informatique de la p�riode consid�r�e.', 'LONGUE_DESCRIPTION', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'AbdelAli', 'ED-DBALI', 'AbdelAli.ED-DBALI@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de donn�es' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Bases de donn�es', '3', '20', '25', '25', '0', '6', '6', 'Fran�ais_', 'petite_DESCRIPTION', '* Donner aux �tudiants les grandes lignes des diverses fonctionnalit�s d�un SGBD relationnel.   
  * Introduire les techniques de mod�lisation de donn�es.  
  * Apprendre et ma�triser le langage de manipulation et d�interrogation de bases de donn�es�: SQL.', 'Structure fonctionnelle et Architecture d�un SGBD.
Probl�matique de la mod�lisation logique des donn�es.
Mod�le relationnel, Langage SQL
Interrogation de donn�es du mod�le relationnel.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de donn�es' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='Khalem' AND _EMAIL_ENS_='Laure.Khalem@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'Khalem', 'Laure.Khalem@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='Khalem' AND _EMAIL_ENS_='Laure.Khalem@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='10' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Stage', '4', '10', '0', '0', '0', '10', '10', 'Fran�ais_', 'Variable selon le sujet du stage.', '* Permettre d�une part de mettre en pratique les enseignements dispens�s pendant l�ann�e et d�autre part de familiariser les �tudiants avec la vie professionnelle afin de permettre leur insertion.', 'LONGUE_DESCRIPTION', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='10' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pr�nom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation de  gestion d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Simulation de  gestion d\'entreprise', '3', '0', '24', '0', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', '* Au terme de cette simulation, les �tudiants doivent�pouvoir g�rer le temps, travailler en groupe, g�rer les conflits, � 
  * Connaissance du monde de l\'entreprise', 'Simulation visant � amener les groupes (chacun repr�sentant une entreprise en concurrence avec les autres), apr�s avoir formalis� une strat�gie, � prendre des d�cisions d�ordre commercial, de production, d�investissement et de financement. Dans ce cadre, ils mettent en ?uvre la plupart des outils financiers et pr�visionnels connus.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Le jeu fait appel aux connaissances des �tudiants ainsi qu�� la r�flexion et l�imagination.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Simulation de  gestion d\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='Chaker.HAOUET@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Chaker', 'HAOUET', 'Chaker.HAOUET@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Chaker' AND _PRENOM_ENS_='HAOUET' AND _EMAIL_ENS_='Chaker.HAOUET@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Applications internet' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Applications internet', '4', '20', '24', '24', '0', '5', '5', 'Fran�ais_', 'petite_DESCRIPTION', '* D�veloppement et maintenance de sites et applications intra/internet', 'Les langages HTML, XHTML, feuilles de style CSS.
Applications r�parties�: le mod�le client/serveur.
Langages pour les pages web dynamiques : PHP, MySQL
S�curit� des applications r�parties.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'D�veloppement et maintenance de sites et applications intra/internet.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Applications internet' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'AbdelAli', 'ED-DBALI', 'AbdelAli.ED-DBALI@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli.ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='G�nie logiciel' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'G�nie logiciel', '4', '20', '24', '24', '0', '5', '5', 'Fran�ais_', 'petite_DESCRIPTION', '* Acquisition des connaissances de bases d\'UML, d\'une m�thodologie permettant d\'analyser un probl�me, d\'en r�aliser la mod�lisation, puis d\'�laborer une mise en oeuvre sous forme d\'une application informatique. 
  * Connaissance des notions de la gestion de projets.', 'Mod�lisation UML : diagrammes de classes, de s�quences, d\'�tats-transition et de cas d\'utilisation.
Pratique d\'un atelier de g�nie logiciel.
M�thodologie d\'analyse et de conception objet.
Introduction aux patrons de conception (design patterns).
Introduction � la gestion de projets', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='G�nie logiciel' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Michel' AND _PRENOM_ENS_='COUVREUR' AND _EMAIL_ENS_='Jean-Michel.COUVREUR@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean-Michel', 'COUVREUR', 'Jean-Michel.COUVREUR@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean-Michel' AND _PRENOM_ENS_='COUVREUR' AND _EMAIL_ENS_='Jean-Michel.COUVREUR@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation objet 2', '4', '20', '24', '24', '0', '5', '5', 'Fran�ais_', 'petite_DESCRIPTION', '* Savoir d�velopper une application avec un langage orient� objet utilisant des structures de donn�es r�cursives, interface graphique et interface avec une base de donn�e.', 'G�n�ricit�.
Classes internes.
Implantation de structures de donn�es.
Collections des biblioth�ques standards.
Programmation �v�nementielle.
Interface graphique.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Modules Algorithmique, Programmation objet 1', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet 2' AND _ECTS_='5' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'KAHLEM', 'Laure.KAHLEM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='R�seaux' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'R�seaux', '3', '10', '10', '15', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', 'Ressources', 'Architecture des r�seaux : structure en couches, protocoles, services
R�seaux locaux sous UDP-TCP/IP, Ethernet
Protocoles de routage : RIP, OSPF, BGP
Principaux protocoles Internet : DNS (annuaire de noms de domaines) SMTP (mail), FTP (transfert de fichiers), HTTP (web) ...', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '}Module Initiation 
{ 
  * Principes et pratique des r�seaux locaux informatiques', 'Biblio} 
 
\vfill', '', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='R�seaux' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli .ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'AbdelAli', 'ED-DBALI', 'AbdelAli .ED-DBALI@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='AbdelAli' AND _PRENOM_ENS_='ED-DBALI' AND _EMAIL_ENS_='AbdelAli .ED-DBALI@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Projet 1', '3', '0', '0', '0', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', '* Mise en oeuvre dans un exemple d\'application r�aliste des concepts vus dans les modules informatique de la p�riode consid�r�e', 'R�alisation d\'une applications mettant en oeuvre les notions vues dans les modules Algorithmique, Programmation objet 1, Bases de donn�es, Syst�mes et R�seaux.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet 1' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'KAHLEM', 'Laure.KAHLEM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='KAHLEM' AND _EMAIL_ENS_='Laure.KAHLEM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Algorithmique', '3', '15', '15', '0', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', '* A l\'issue de ce module l\'�tudiant doit pouvoir comprendre le fonctionnement d\'un algorithme donn�, concevoir des algorithmes pour un probl�me simple donn�,  savoir utiliser des structures de donn�es', 'Notions : variables, affectation, conditionnelle, it�ration, r�cursion.
Algorithmes simples sur les tableaux.
Algorithmes de tri.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Math�matiques �l�mentaires', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pr�nom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Anglais', '3', '0', '20', '0', '0', '3', '3', 'Fran�ais_', 'petite_DESCRIPTION', '* S�exprimer couramment et efficacement dans une langue riche, souple et nuanc�e dans le domaine de la sp�cialit�, exposer son opinion de mani�re claire, d�taill�e et structur�e.', 'Etude des techniques de pr�sentation orale�: am�lioration de la prononciation, organisation du discours, guidage de l�auditoire, �laboration d�aides visuelles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Anglais non professionnel', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pr�nom', 'NOM', 'Prenom.NOM@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pr�nom' AND _PRENOM_ENS_='NOM' AND _EMAIL_ENS_='Prenom.NOM@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet�1' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Programmation objet�1', '3', '20', '25', '25', '0', '6', '6', 'Fran�ais_', 'petite_DESCRIPTION', '* Introduction � la programmation objet dans un langage imp�ratif. 
  * Mise en oeuvre d\'algorithmes dans ce langage.', 'Introduction � la programmation, algorithmes de base
Programmation objet: classe, objet, �tat, m�thode, communication entre objets.
R�currence. 
Tableaux, Tris.
Interfaces.
H�ritage.
Exceptions.
Entr�es/sorties.
Introduction � la notation UML.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Module Initiation', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Programmation objet�1' AND _ECTS_='6' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Thi' AND _PRENOM_ENS_='Bich Hanh Dao' AND _EMAIL_ENS_='Thi-Bich-Hanh.Dao univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Thi', 'Bich Hanh Dao', 'Thi-Bich-Hanh.Dao univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Thi' AND _PRENOM_ENS_='Bich Hanh Dao' AND _EMAIL_ENS_='Thi-Bich-Hanh.Dao univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
