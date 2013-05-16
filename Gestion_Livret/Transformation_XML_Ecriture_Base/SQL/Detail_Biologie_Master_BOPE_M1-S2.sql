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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Agents de perturbation dans les écosystèmes terrestres');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Agents de perturbation dans les écosystèmes terrestres', 'SOM2BO08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Agents de perturbation dans les écosystèmes terrestres');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '8', '16', '0', '5', '5', 'Français_', ' 
  * Donner à l’étudiant un panorama des agents de perturbations biotiques et abiotiques dans les écosystèmes terrestres, des problèmes qu’ils posent et des modalités de gestion.
 
', '
Perturbations biotiques et abiotiques, phytophagie, guildes de ravageurs, phytopathologie, gestion chimique et biologique des ravageurs, perturbations abiotiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ecotoxicologie et phytoremédiation');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ecotoxicologie et phytoremédiation', 'SOM2BO07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ecotoxicologie et phytoremédiation');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '12', '8', '0', '5', '5', 'Français_', ' 
  * Acquisition des  connaissances récentes liées à l’effet de la pollution sur la santé humaine et les écosystèmes.
 
', '
Connaissances modernes sur les principaux types de pollution terrestre, de leurs effets sur les êtres vivants et les écosystèmes, et des possibilités de réhabilitation des milieux pollués. Exemples majeurs de pollution. Les polluants et leur mode d’action : pollution domestique, pollution industrielle, pollution agricole, pollution atmosphérique. Biotransformation, bioaccumulation et biomagnification des polluants. La réhabilitation des milieux pollués et les possibilités offertes par la phytoremédiation. Etude de cas concrets. Risques liés à l’utilisation des OGM.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet Professionnel et connaissance de l'entreprise');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet Professionnel et connaissance de l'entreprise', 'SOM2PR01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet Professionnel et connaissance de l'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * faire réfléchir l’étudiant sur ses motivations et ses ambitions professionnelles ; le faire se positionner par rapport à la continuation en thèse ou à l’entrée dans la vie active ; sensibiliser les étudiants à la connaissance des métiers de la recherche.
 
', '
Construction d’un projet professionnel ; visites d’entreprises, de collectivités locales, organismes ; préparation de CV, techniques de recherche d’emploi, informations sur les concours de recrutement de chercheurs et enseignants-chercheurs, ingénieurs…, table ronde sur les exigences du milieu professionnel, avec participation de représentants du publique et du privé. Connaissance de l’entreprise (grandes fonctions, grands types d’activités); connaissance des différents secteurs de recherche (public et privé); notions d’économie et de gestion (éléments de base); conférences et témoignages de parcours professionnels;  contacts avec le milieu professionnel.
', '', '', '', '', 'Oral\%', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage', 'SOM2ST01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '0', '0', '3', '3', 'Français_', ' 
  * Prise de contact avec le monde professionnel de la recherche et le travail de chercheur.
 
', '
Stage de 2 mois en laboratoire de recherche, ou en entreprise ou collectivité locale : participation à la construction d’un protocole, la réalisation d’une expérience ou d’un projet ; mise en forme des résultats ; traitement des données ; interprétation ; présentation orale et écrite.
', '', '', '', 'Ecrit 100\%', 'Oral\%', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ouverture à l'international');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ouverture à l'international', 'SOM2IP00', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ouverture à l'international');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '0', '0', '1', '1', 'Anglais_', ' 
  * Préparer l’étudiant à faire un entretien  d’embauche dans la langue anglaise (savoir communiquer dans le milieu professionnel).
 
', '
Savoir communiquer dans le milieu professionnel (CV, lettre, téléphone, entretien de recrutement, participer à une réunion), valider son niveau d’anglais par une certification en langues, niveau B2 (TOEIC, CLES).
', '', '', '', 'Ecrit 75\% + Oral 50\%', 'Oral\%', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Agronomie et amélioration des plantes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Agronomie et amélioration des plantes', 'SOM2BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Agronomie et amélioration des plantes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '25', '5', '18', '0', '5', '5', 'Français_', ' 
  * Connaissances des méthodologies d’amélioration, production et exploitation des plantes notamment cultivées.
 
', '
Amélioration des plantes cultivées, processus de propagation des espèces végétales d’intérêt agronomique  (reproduction sexuée, multiplication végétative traditionnelle, in vitro, hors sol, initiation à la transgénèse) et utilisation des plantes pour la production de molécules à visée pharmacologique ou agroalimentaire (cultures cellulaires et ingénierie métabolique).
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Influence de l’environnement sur le développement des plantes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Influence de l’environnement sur le développement des plantes', 'SOM2BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Influence de l’environnement sur le développement des plantes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '4', '16', '0', '5', '5', 'Français_', ' 
  * Connaissances approfondies des mécanismes physiologiques, biochimiques et moléculaires qui régissent les interactions entre les plantes et leur environnement.
 
', '
Quelques mécanismes fondamentaux du contrôle du développement des plantes : Perception de l’environnement ; lumière et photomorphogenèse ; vernalisation ; gravitropisme.  Croissance et développement ; rôle du métabolisme secondaire ; lignine ; rôle des phytohormones et modes d’actions moléculaires.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais Scientifique et communication');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais Scientifique et communication', 'SOM2AG42', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais Scientifique et communication');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * Savoir présenter un rapport de travail en anglais et commenter le déroulement d’une expérimentation.
 
', '
Faire un bilan du stage de l’année passée et résumer les visites d’entreprises en anglais. Commenter le déroulement d’un atelier technologique en anglais. Se préparer à des entretiens en anglais pour une embauche (thèse ou poste R & D)
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
