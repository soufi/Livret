SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Master-BBMB', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M1-S2');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Modèles expérimentaux');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Modèles expérimentaux', 'SOM2BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Modèles expérimentaux');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '0', '32', '0', '5', '5', 'Français_', ' 
  * Permettre aux étudiants d’appréhender les outils génétiques les plus récents et leurs applications en particulier dans les domaines des pathologies humaines.
* Savoir appliquer les connaissances acquises au cours des modules théoriques et de se confronter à l’analyse de résultats expérimentaux..
 
', '
1- Approche expérimentale en génétique : étude d’une maladie neurodégénérative humaine chez la drosophile, caractérisation du phénotype, recherche de mutants enhancers ou suppresseurs, caractérisation par « plasmid rescue », séquençage et analyse de banques de données des gènes enhancers ou suppresseurs. 2- Culture et étude de la spéciation in vitro de cellules souches neurales 3- Traitement de souris par un (des) xénobiotique(s) neuroactif(s) : conséquences comportementales et histologiques. Pathologies monogéniques : du défaut moléculaire à la physiopathologie. Plusieurs exemples de maladies monogéniques communes seront développés. Obtention et utilisation des modèles animaux : souris, drosophile, C. elegans. Données obtenues à partir des modèles. La diversité des approches de la cytogénétique et de la génomique à haute résolution. Utilisation de bases de données (Ensembl, Omim,USCS,DGV...). Apport des génomes : Génomique comparative et le choix des modèles. Enseignement basé notamment sur des exemples de  pathologies du langage et de la cognition.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB - Option Génétique et neuropathologies
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Immunologie 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Immunologie 2', 'SOM2BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Immunologie 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '0', '12', '0', '3', '3', 'Français_', ' 
  * L’objectif majeur de ce module est de permettre aux étudiants une compréhension aisée des mécanismes cellulaires et moléculaires les plus subtils du fonctionnement normal du système immunitaire et de ses déficiences.
 
', '
Immunité adaptative : Développement, fonctions et dysfonctions des lymphocytes. Homéostasie et mémoire immunologique.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB et Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Outils de développement technologique, économie d'entreprise');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Outils de développement technologique, économie d'entreprise', 'SOM2SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Outils de développement technologique, économie d'entreprise');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '60', '0', '0', '0', '7', '7', 'Français_', ' 
  * Sensibiliser aux problématiques de gestion d’une entreprise.
 
', '
Introduction à la gestion et à l’innovation dans les entreprises : l’innovation au sein des PME, animée par Fabienne Ermel, actuellement directrice générale d’une PME de l’agro-alimentaire dans la région Centre. Mme Ermel a également une expérience au sein de structures de financement de l’innovation, et propose ainsi un panorama des politiques d’aide à l’innovation en France, Les outils de gestion au sein des entreprises, présentés par Nathalie Dubost, Maître de Conférences à l’IAE d’Orléans. L’objectif de cette partie est de montrer, à l’aide d’un exemple de création d’entreprise, comment la comptabilité et la finance aident à la prise de décision et au pilotage d’une entreprise (choix d’investissements, calcul de coûts, documents de synthèse). Le marketing, présenté par Sandra Rimbert, Maître de Conférences à l’IAE d’Orléans. Les étudiants devront présenter un projet marketing à partir d’un thème donné par l’enseignante, en utilisant la méthodologie marketing préalablement exposée
', '', '', '', 'Ecrit 100\%', 'Oral\%', '
', 'Biblio
', '', '
Passerelle MESC2A
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases génomiques en physiopathologies');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases génomiques en physiopathologies', 'SOM2BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases génomiques en physiopathologies');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '48', '24', '0', '0', '7', '7', 'Français_', ' 
  * Physiologie des systèmes intégrés des fonctions cérébrales, Mécanismes de spéciation, de différenciation et d'intégration des cellules du système nerveux. Compréhension des mécanismes de physiologie moléculaire en liaison avec les pathologies.
 
', '
1- Une partie de cet enseignement a pour but l'étude des systèmes intégrés impliquant les mécanismes cellulaire et moléculaire au cours du développement et chez l'adulte (cellules souches) dans le cadre des processus mnésique (mémoire & oubli), d'apprentissage et de plasticité cérébrale. 2- Une deuxième partie (20h) sera consacrée à l'étude de pathologies humaines en mettant en relation la sémiologie et l'étiologie de la maladie : maladies neurodégénératives (Alzheimer ou Creutzfeldt-Jakob ou Huntington), cancers cérébraux, autisme et retard mental. L'enseignement est assuré par des universitaires physiologistes et biologistes cellulaire et par des cliniciens du CHRO.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB - Option Génétique et neuropathologies
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Statistiques appliquées aux bio-industries');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Statistiques appliquées aux bio-industries', 'SOM2MT02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Statistiques appliquées aux bio-industries');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '36', '0', '0', '0', '5', '5', 'Français_', ' 
  * Présentation de méthodes d’analyse de données et de classification ; Savoir mettre en œuvre des plans d’expériences et l’analyse de données brutes. Applications en biologie. Traitement statistique sur ordinateur. Utilisation du langage R.
 
', '
Analyse de données : ACP, AFC, AFCM ; Classification : hiérarchies, Moyennes mobiles, arbres de décision. Mini-projet présentant des applications dans les bio-industries. Plans d’expériences ;  Analyse de données, tests statistiques : Anova, test de Student, tests non paramétriques. Analyse de données avec SAS et Excel.', '', '', '', 'Ecrit 100\%', 'Oral\%', '
', 'Biblio
', '', '
Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bioinformatique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bioinformatique', 'SOM2BH07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bioinformatique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '48', '0', '0', '5', '5', 'Français_', ' 
  * Former le chercheur de demain aux outils en ligne de traitement de données expérimentales (comparaison de séquence, analyse structurale par utilisation d’outil de visualisation PyMOL).
 
', '
Description et utilisation de banques de données. Analyse de séquences nucléiques et protéiques. Prédiction de l’organisation de gènes. Méthodes prédictives de structures secondaires. Visualisation de structures tridimensionnelles. Comparaisons de séquences (principes, matrices de calcul, logiciels d’alignement, recherche d’homologies, identification de motifs, alignements multiples). Modélisation des interactions moléculaires. Etude comparative de la séquence des génomes. Phylogénie. Utilisation des logiciels graphiques de visualisation et modélisation des bio-molécules. Modélisation comparative.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB et Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Relation structure-fonction');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Relation structure-fonction', 'SOM2BH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Relation structure-fonction');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '48', '0', '0', '0', '5', '5', 'Français_', ' 
  * connaissance de la biochimie et de la structure des protéines et des acides nucléiques.
 
', '
Interactions protéines-protéines à la jonction entre cellules endothéliales, agrégation de protéines et neurodégénérescence, coordination des réseaux sanguins et nerveux, radeaux lipidiques comme principe d'organisation membranaire. De la structure des ARN à leurs fonctions. Interactions Ligand-protéine : Enzymologie et réceptologie moléculaires, mécanismes de reconnaissance, allostérie, applications (docking, évolution dirigée, exemples tirés de publications).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB - Option Biologie Moléculaire et Structurale
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Techniques expérimentales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Techniques expérimentales', 'SOM2BH03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Techniques expérimentales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '36', '0', '36', '0', '7', '7', 'Français_', ' 
  * Connaissance pratique de la production, purification de protéine recombinante pour des études de cristallographie et de RMN.
 
', '
Études de la structure des protéines par RMN, par spectrométrie de fluorescence, par spectrométrie de masse, par dichroïsme circulaire. Études des interactions protéine-ligand. Imagerie par Résonance Magnétique.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BBMB - Option Biologie Moléculaire et Structurale
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
