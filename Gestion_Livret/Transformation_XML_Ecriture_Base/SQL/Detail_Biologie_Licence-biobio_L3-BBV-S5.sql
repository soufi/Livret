SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BBV-S5');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet bibliographique tutoré');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet bibliographique tutoré', 'SOL5PJ02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet bibliographique tutoré');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '6', '0', '0', '1', '1', 'Français_', '
 
  * Mieux connaitre l’utilisation de la recherche dans le domaine végétal pour des applications diverses.
 ', '
Il s’agira pour l’étudiant de travailler sur un projet de recherche bibliographique dans le domaine de la biologie végétale, de la physiologie végétale ou des biotechnologies utilisant le monde végétal. A partir d’une série de documents scientifiques de base fournis par l’enseignant, l’étudiant réalisera un rapport bibliographique s’appuyant sur des découvertes scientifiques allant des résultats de référence jusqu’aux résultats les plus récents.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Régulation de l'expression des gènes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Régulation de l'expression des gènes', 'SOL5BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Régulation de l'expression des gènes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '12', '12', '0', '5', '5', 'Français_', ' 
  * Comprendre les mécanismes de base qui gouvernent l'activité des gènes.
 
', '
Mécanismes généraux de la régulation de la transcription et de la traduction chez les procaryotes. Notions de signaux exogènes et endogènes de la régulation. Étude détaillée de quelques systèmes de régulation chez les procaryotes : approches biologiques, physiologiques, génétiques et moléculaires. Mécanismes de régulation chez les eucaryotes : régulation transcriptionnelle : séquences régulatrices et facteurs de transcription. Complexes d’initiation de la transcription. Structure de la chromatine et expression génique. Régulation post-transcriptionnelle : modifications des ARNm (coiffe, épissage, polyadénylation), durée de vie des ARNm, régulation par les petits ARN. Régulation de l’initiation de la traduction. Régulation post-traductionnelle : modifications et durée de vie des protéines.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Croissance et développement des végétaux');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Croissance et développement des végétaux', 'SOL5BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Croissance et développement des végétaux');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '12', '0', '4', '4', 'Français_', ' 
  * Acquisition des connaissances de base de la physiologie du développement des plantes.
 
', '
Les phytohormones (les principales familles, biosynthèse et dégradation, transport, rôles physiologiques, utilisations pratiques) - La graine : de la mise en réserve à la mobilisation - La germination - La floraison (vernalisation, photopériodisme, thermopériodisme, théories de la floraison, morphogenèse florale)
', '', '', '', '', '', '

', 'Heller et al.-T1 et 2 (Dunod) ; Mazliak et al. (Hermann) ; Laval-Martin et Mazliak (Hermann) ; Guignard- Biochimie végétale (Dunod 2000) ; Luttge, Kluge et Bauer, Botanique (Tec et Doc 1996) ; Anderson-Beardall : Molecular activities of plant cells. (Blackwell Scientific Pub.) ; Campbell : Biologie (De Boeck Université) ; Nultsch : Botanique générale (De Boeck Université) ; Taiz and Zeiger : Plant physiology (Sinauer) ; Buchanan, Gruissem and Jones, Biochemistry and molecular biology (Amer. Soc. Plant Physiol.)

', '', '
Parcours BOPE / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Lois de probabilités et estimations de paramètres usuels');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Lois de probabilités et estimations de paramètres usuels', 'SOL5BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Lois de probabilités et estimations de paramètres usuels');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '3', '3', 'Français_', ' 
  * Acquisition de connaissances de bases en statistique.
 
', '
Notion de variable aléatoire (VA) ; VA qualitatives, VA quantitatives discrètes et continues ; principales lois de probabilité et leur utilisation en biologie ; estimation de paramètres et intervalles de confiance.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE / BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse spectroscopique des biomolécules');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse spectroscopique des biomolécules', 'SOL5BH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse spectroscopique des biomolécules');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '26', '10', '0', '0', '4', '4', 'Français_', ' 
  * Fournir les bases des spectroscopies utilisées couramment aujourd’hui dans l’analyse des molécules et macromolécules biologiques.
 
', '

*[Spectroscopie optique :] Notions générales ; spectroscopie UV-visible, d’absorption, de fluorescence, de phosphorescence ; spectroscopie infra rouge. Initiation au dichroïsme circulaire.
*[RMN des bio-molécules :] Principes généraux : propriétés magnétiques des noyaux atomiques ; appareillage et séquenceurs d’impulsion ; le signal RMN ; les Paramètres de la RMN : déplacement chimique, couplage scalaire, nOe, temps de relaxation. Initiation aux spectres 1D/2D/3D. Résolution des structures de protéines.
*[Spectrométrie de masse :] Domaines d’utilisation. Description de base d’un spectromètre de masse : sources d’ions (EI, CI, FAB, ESI et MALDI) ; analyseurs (quadripôle, magnétique, temps de vol, trappe ionique, résonance cyclotronique) et
détecteurs. Spectrométrie de masse en tandem, séquençage des peptides, analyse du protéome.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Insertion professionnelle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Insertion professionnelle', 'SOL5IP01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Insertion professionnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '9', '0', '0', '1', '1', 'Français_', ' 
  * Rendre actif la démarche étudiante pour une insertion après la Licence (emploi, formation complémentaire, Master). Connaissance du tissu économique dans le domaine des Sciences de la Vie. Réflexion de l’étudiant sur son projet personnel. Elaboration d’un CV niveau L, d’une demande de stage niveau L.
 
', '

* (4h par des intervenants du domaine) Découverte de l’entreprise privée (dans le domaine des Sciences de la Vie) : rôle économique, organisation, fonctionnement, types de métiers, modes de recrutement, droit du travail (4h par des intervenants du domaine) Découverte de l’entreprise publique (dans le domaine des Sciences de la vie : CNRS/INRA/Université etc ...) : statuts, buts, organisation hiérarchiques et carrières, modes de financement, modes de recrutement.
* Travail en groupe (TD groupe de 20) Initiation à la rédaction d’un CV, d’une lettre de motivation dans le cadre d’une demande de stage ou d’inscription en Master. Première approche de la situation de l’entretien de recrutement (niveau L, objectif le stage ou l’insertion en M1). Sensibilisation aux moyens pour rechercher l’information sur les stages et les emplois (secteur privé). Utilisation des ressources en ligne sur les métiers de la fonction publique.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE / BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 5');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 5', 'SOL5AG35', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 5');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Comprendre l’information exprimée dans des messages complexes sur le domaine des Sciences et Technologies et s’exprimer sur ce même domaine à l’écrit dans un registre de langue approprié.
 
', '
Travail de compréhension et d’expression orale à partir de documents authentiques longs et/ou complexes, portant sur des innovations technologiques, des découvertes ou avancées scientifiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE / BMC/ BBV / BGST / PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biodiversité');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biodiversité', 'SOL5BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biodiversité');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '4', '4', '40', '0', '5', '5', 'Français_', ' 
  * Permettre à l’étudiant de découvrir des milieux naturels de notre région, participer à l’inventaire de la faune et de la flore par la réalisation d’un herbier personnel et d’une boite de référence d’insectes.
 
', '

* Inventaire et diversité taxonomique des principaux groupes d’animaux. Floristique et systématique du monde végétal. Clefs pour la détermination des taxons rencontrés. Mesure des indices de diversité.
* Observations sur le terrain (un groupe TP terrain encadré par deux enseignants) et analyses en laboratoire (TP)

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE / BBV / BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Maths prépa concours : techniques de calcul en mathématiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Maths prépa concours : techniques de calcul en mathématiques', 'UEL', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Maths prépa concours : techniques de calcul en mathématiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '3', '3', 'Français_', ' 
  * Permettre à des étudiants d’acquérir des connaissances utiles pour passer les concours d’accès aux écoles nationales vétérinaires (concours ENV- voie B), les concours d’ingénieurs agro (concours ENSA voie B) mais également certains concours administratifs.
 
', '
Les thèmes suivants seront abordés. Les notions minimales de cours seront données afin de privilégier les exemples.

* Fonctions numériques de la variable réelle / Intégrales / Equations différentielles
* Suites / Algèbre Linéaire /Probabilités

', '', '', '', 'Examen 67 \% ; TP 33 \%', 'Examen 67 \% ; TP 33 \%', '
', 'Biblio
', '', '
UE pouvant être prise aussi en semestre 3
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Evolution et adaptation des angiospermes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Evolution et adaptation des angiospermes', 'SOL5BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Evolution et adaptation des angiospermes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '14', '12', '10', '0', '4', '4', 'Français_', ' 
  * Acquérir les connaissances sur l’évolution et l’adaptation des plantes aux milieux.
 
', '
Evolution et adaptation des végétaux au milieu : Compléments sur la reproduction et l’évolution de l’appareil reproducteur des angiospermes. Notions de classification. Adaptations morphologiques et anatomiques des végétaux aux différentes contraintes environnementales. Perception des signaux de contrainte : lumière, température, gravité...
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE / BBV / BGST
');
