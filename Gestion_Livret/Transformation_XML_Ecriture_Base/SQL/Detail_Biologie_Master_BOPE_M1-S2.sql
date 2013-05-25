SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie_Master');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'BOPE', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M1-S2');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'M1-S2');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M1-S2');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Agents de perturbation dans les écosystèmes terrestres' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Agents de perturbation dans les écosystèmes terrestres', '2', '24', '8', '16', '0', '5', '5', 'Français_', '* Donner à l’étudiant un panorama des agents de perturbations biotiques et abiotiques dans les écosystèmes terrestres, des problèmes qu’ils posent et des modalités de gestion.', 'Perturbations biotiques et abiotiques, phytophagie, guildes de ravageurs, phytopathologie, gestion chimique et biologique des ravageurs, perturbations abiotiques.', '', '', '', '', '', 'Ecologie générale, notions d’entomologie générale.', '', 'Biblio', '', '');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Agents de perturbation dans les écosystèmes terrestres' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Aurélien' AND _PRENOM_ENS_='Sallé' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Aurélien', 'Sallé', 'aurelien.salle@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Aurélien' AND _PRENOM_ENS_='Sallé' AND _EMAIL_ENS_='aurelien.salle@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Ecotoxicologie et phytoremédiation' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Ecotoxicologie et phytoremédiation', '2', '28', '12', '8', '0', '5', '5', 'Français_', '* Acquisition des  connaissances récentes liées à l’effet de la pollution sur la santé humaine et les écosystèmes.', 'Connaissances modernes sur les principaux types de pollution terrestre, de leurs effets sur les êtres vivants et les écosystèmes, et des possibilités de réhabilitation des milieux pollués. Exemples majeurs de pollution. Les polluants et leur mode d’action : pollution domestique, pollution industrielle, pollution agricole, pollution atmosphérique. Biotransformation, bioaccumulation et biomagnification des polluants. La réhabilitation des milieux pollués et les possibilités offertes par la phytoremédiation. Etude de cas concrets. Risques liés à l’utilisation des OGM.', '', '', '', '', '', 'Ecologie générale et Physiologie.', '', 'Biblio', '', '');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Ecotoxicologie et phytoremédiation' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Domenico' AND _PRENOM_ENS_='Morabito' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Domenico', 'Morabito', 'domenico.morabito@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Domenico' AND _PRENOM_ENS_='Morabito' AND _EMAIL_ENS_='domenico.morabito@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet Professionnel et connaissance de l\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Projet Professionnel et connaissance de l\'entreprise', '2', '0', '24', '0', '0', '3', '3', 'Français_', '* faire réfléchir l’étudiant sur ses motivations et ses ambitions professionnelles ; le faire se positionner par rapport à la continuation en thèse ou à l’entrée dans la vie active ; sensibiliser les étudiants à la connaissance des métiers de la recherche.', 'Construction d’un projet professionnel ; visites d’entreprises, de collectivités locales, organismes ; préparation de CV, techniques de recherche d’emploi, informations sur les concours de recrutement de chercheurs et enseignants-chercheurs, ingénieurs…, table ronde sur les exigences du milieu professionnel, avec participation de représentants du publique et du privé. Connaissance de l’entreprise (grandes fonctions, grands types d’activités); connaissance des différents secteurs de recherche (public et privé); notions d’économie et de gestion (éléments de base); conférences et témoignages de parcours professionnels;  contacts avec le milieu professionnel.', '', '', '', '', 'Oral\%', 'Bon niveau d’ordre général pratique.', '', 'Biblio', '', 'Spécialités BBMB et BOPE / Passerelle MESC2A');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet Professionnel et connaissance de l\'entreprise' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Olivier' AND _PRENOM_ENS_='Richard William Même Philippe Herrandez' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Olivier', 'Richard William Même Philippe Herrandez', 'olivier.richard@univ-orleans.fr william.meme@univ-orleans.fr philippe.herrandez@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Olivier' AND _PRENOM_ENS_='Richard William Même Philippe Herrandez' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr william.meme@univ-orleans.fr philippe.herrandez@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Stage', '2', '0', '12', '0', '0', '3', '3', 'Français_', '* Prise de contact avec le monde professionnel de la recherche et le travail de chercheur.', 'Stage de 2 mois en laboratoire de recherche, ou en entreprise ou collectivité locale : participation à la construction d’un protocole, la réalisation d’une expérience ou d’un projet ; mise en forme des résultats ; traitement des données ; interprétation ; présentation orale et écrite.', '', '', '', 'Ecrit 100\%', 'Oral\%', 'Bon niveau d’ordre général pratique.', '', 'Biblio', '', 'Spécialités BBMB et BOPE / Passerelle MESC2A');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'François' AND _PRENOM_ENS_='lieutier' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'François', 'lieutier', 'francois.lieutier@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='François' AND _PRENOM_ENS_='lieutier' AND _EMAIL_ENS_='francois.lieutier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Ouverture à l\'international' AND _ECTS_='1' AND _CODE_MAT_='IP');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IP', 'Ouverture à l\'international', '2', '0', '12', '0', '0', '1', '1', 'Anglais_', '* Préparer l’étudiant à faire un entretien  d’embauche dans la langue anglaise (savoir communiquer dans le milieu professionnel).', 'Savoir communiquer dans le milieu professionnel (CV, lettre, téléphone, entretien de recrutement, participer à une réunion), valider son niveau d’anglais par une certification en langues, niveau B2 (TOEIC, CLES).', '', '', '', 'Ecrit 75\% + Oral 50\%', 'Oral\%', 'Bon niveau d’ordre général pratique.', '', 'Biblio', '', 'Spécialités BBMB et BOPE / Passerelle MESC2A');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Ouverture à l\'international' AND _ECTS_='1' AND _CODE_MAT_='IP');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Lupka' AND _PRENOM_ENS_='Mihajlovska' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Lupka', 'Mihajlovska', 'lupka.mihajlovska@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Lupka' AND _PRENOM_ENS_='Mihajlovska' AND _EMAIL_ENS_='lupka.mihajlovska@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Agronomie et amélioration des plantes' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Agronomie et amélioration des plantes', '2', '25', '5', '18', '0', '5', '5', 'Français_', '* Connaissances des méthodologies d’amélioration, production et exploitation des plantes notamment cultivées.', 'Amélioration des plantes cultivées, processus de propagation des espèces végétales d’intérêt agronomique  (reproduction sexuée, multiplication végétative traditionnelle, in vitro, hors sol, initiation à la transgénèse) et utilisation des plantes pour la production de molécules à visée pharmacologique ou agroalimentaire (cultures cellulaires et ingénierie métabolique).', '', '', '', '', '', '', '', 'Biblio', '', '');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Agronomie et amélioration des plantes' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Stéphane' AND _PRENOM_ENS_='Maury' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Stéphane', 'Maury', 'stephane.maury@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Stéphane' AND _PRENOM_ENS_='Maury' AND _EMAIL_ENS_='stephane.maury@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Influence de l’environnement sur le développement des plantes' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Influence de l’environnement sur le développement des plantes', '2', '28', '4', '16', '0', '5', '5', 'Français_', '* Connaissances approfondies des mécanismes physiologiques, biochimiques et moléculaires qui régissent les interactions entre les plantes et leur environnement.', 'Quelques mécanismes fondamentaux du contrôle du développement des plantes : Perception de l’environnement ; lumière et photomorphogenèse ; vernalisation ; gravitropisme.  Croissance et développement ; rôle du métabolisme secondaire ; lignine ; rôle des phytohormones et modes d’actions moléculaires.', '', '', '', '', '', 'Connaissance générale sur la physiologie,  la croissance et le développement des végétaux.', '', 'Biblio', '', '');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Influence de l’environnement sur le développement des plantes' AND _ECTS_='5' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Daniel' AND _PRENOM_ENS_='Hagège' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Daniel', 'Hagège', 'daniel.hagege@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Daniel' AND _PRENOM_ENS_='Hagège' AND _EMAIL_ENS_='daniel.hagege@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais Scientifique et communication' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais Scientifique et communication', '2', '0', '24', '0', '0', '3', '3', 'Français_', '* Savoir présenter un rapport de travail en anglais et commenter le déroulement d’une expérimentation.', 'Faire un bilan du stage de l’année passée et résumer les visites d’entreprises en anglais. Commenter le déroulement d’un atelier technologique en anglais. Se préparer à des entretiens en anglais pour une embauche (thèse ou poste R & D)', '', '', '', '', '', 'Bon niveau d’ordre général pratique, oral et écrite, assez bonne connaissance de la langue spécifique de son domaine scientifique et technique.', '', 'Biblio', '', 'Spécialités BBMB et BOPE / Passerelle MESC2A');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais Scientifique et communication' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Lucile' AND _PRENOM_ENS_='Mollet' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Lucile', 'Mollet', 'lucile.mollet@cnrs-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Lucile' AND _PRENOM_ENS_='Mollet' AND _EMAIL_ENS_='lucile.mollet@cnrs-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Olivier' AND _PRENOM_ENS_='Richard' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Olivier', 'Richard', 'olivier.richard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Olivier' AND _PRENOM_ENS_='Richard' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
