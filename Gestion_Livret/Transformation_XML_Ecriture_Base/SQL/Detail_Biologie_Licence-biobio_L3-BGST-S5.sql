SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BGST-S5');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L3-BGST-S5');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BGST-S5');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Approches psychologiques et sociologiques pour l'enseignement');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Approches psychologiques et sociologiques pour l'enseignement', 'UEL', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Approches psychologiques et sociologiques pour l'enseignement');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '0', '0', 'Français_', ' 
  * Comprendre, en particulier pour les non-spécialistes, ce que la psychologie et la sociologie, en tant que disciplines, apportent aux situations d'enseignement.
* A partir des approches en psychologie et en sociologie, pouvoir entrer dans une posture d'observateur des élèves.
 
', '
a) Approches psychologiques :
- découverte de quelques sous-domaines de la psychologie, leurs démarches et objets d'études ;
- apports de ces approches à la compréhension de situations scolaires, à partir de vidéos de classe et de productions d'élèves.
b) Approches sociologiques :
- découverte de thématiques et méthodologies en sociologie de l'Ecole ;
- analyse aux différents cycles de la scolarisation, analyse de situations vécues par les étudiants et analyse de vidéos', '', '', '', 'E 50\% + O 25\% + TP 25\%', 'E 66\% + TP 33\%', '
', 'Biblio
', '', 'Parcours renforcé
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Pétrologie endogène II');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Pétrologie endogène II', 'SOL5GO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Pétrologie endogène II');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '12', '24', '0', '0', '0', 'Français_', ' 
  * Connaître les modes de mise en place magmatiques. Connaître les textures et structures des roches magmatiques. Connaître les séries magmatiques dans leurs environnements géodynamiques. Maîtriser le choix du radiochronomètre approprié au mode de mise en place. Maîtriser les principes de la géochimie appliqués au magmatisme. Appréhender le métamorphisme comme un phénomène dynamique. Interpréter les textures microscopiques en termes de successions paragénétiques. Reconstituer des trajets P-T approximatifs.
 
', '
\textbf{Pétrologie magmatique.} Cours : Mise en place des roches volcaniques et plutoniques ; le magmatisme dans son cadre géodynamique, les grandes séries magmatiques TD : diagrammes de phases ; bilans de masse, principes et modèles géochimiques TP : description macroscopique et microscopique des grands types de roches magmatiques 
\textbf{Pétrologie métamorphique.} Cours : Approche dynamique du métamorphisme : trajets P-T, évolutions minéralogiques et texturales, lien avec le cadre géodynamique – Les migmatites : caractéristiques, modes de formation, lien avec le métamorphisme au sens strict – Les différents métamorphismes observés dans les Alpes. TD : Représentation des compositions de minéraux et desparagenèses dans les diagrammes triangulaires ACF, A’KF et AFM– Utilisation des diagrammes AFMpour suivre les évolutions paragénétiques des métapélites dans différents contextes géodynamiques– Construction et exploitation de chemins P-T en utilisant les résultats demodèles numériques TP : Etude microscopique de quelques paragenèses des métapélites et des métabasites – Travail sur les faciès métamorphiques et sur la reconstitution grossière de chemins P-T.
', '', '', '', '', '', '
', '
%\begin{itemize
', '', 'Parcours renforcé
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à la physiologie cellulaire et à l'embryologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à la physiologie cellulaire et à l'embryologie', 'SOL5BO13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à la physiologie cellulaire et à l'embryologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '46', '2', '0', '0', '5', '5', 'Français_', ' 
  * Physiologie : Connaissance du fonctionnement des biomembranes, de la signalisation nerveuse et de la physiologie des cellules excitables, introduction aux techniques d’électrophysiologie et l’étude des canaux ioniques et des courants transmembranaires. Connaissance en neuro-antomie et du fonctionnement du système nerveux central.
* Embryologie : Connaissance des grandes lignes du développement animal. Acquérir un espritsynthétique afin de généraliser la majorité des phénomènes étudiés.
 
', '
\textbf{Partie Physiologie cellulaire :} Le fonctionnement des cellules excitables (cellules nerveuses, cellules musculaires striées et lisses, cellules sécrétrices). Etude du rôle de la membrane plasmique et des échanges membranaires passifs et actifs dans le fonctionnement de la cellule excitable (notions de gradients de concentration, de flux ioniques à travers les membranes semiperméables, les canaux ioniques et les transporteurs). Le potentiel d’action neuronal et la propagation de l’information nerveuse et neuro-musculaire. Le couplage excitation-contraction des muscles striés et lisses. Première approche de la neurotransmission (neurotransmetteurs, récepteurs membranaires, la synapse) et exemples de pathologies liées aux dysfonctionnements de ces systèmes. La physiologie cardiaque : organisation générale du tissu cardiaque au niveau macroscopique et microscopique (cardiomyocytes). Etude de l’activité électrique au niveau cellulaire (le tissu pacemaker, le tissu conducteur, les potentiels d’action) et global (l’électrocardiogramme). L’activité mécanique cardiaque (le couplage excitation-contraction, la révolution cardiaque). \textbf{Sensibilité et traitements sensoriels :} Etude de la transduction, l’encodage, transmission et de la perception des stimuli de l’environnement. Fonctionnement de la chaîne d’événements de l’activation des récepteurs périphériques à l’intégration cérébrale en prenant comme exemple la somesthésie,l’olfaction et la gustation. \textbf{Embryologie :} Différents types d’œufs. Polarités et axes corporels. Types de développements embryonnaire et post -embryonnaire chez les invertébrés et vertébrés. Lignée germinale. Annexes embryonnaires. Induction, compétence et gradient morphogénétique. Mécanisme des gènes de développement. Notions d’embryologie expérimentale.
', '', '', '', '', '', '
', 'Biblio
', '', '
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chaînes et bassins');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chaînes et bassins', 'SOL5GO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chaînes et bassins');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '28', '0', '6', '6', 'Français_', ' 
  * Cette unité apporte une description détaillée des grands types de chaînes de montagnes et des bassins sédimentaires. Elle permet la compréhension de l'architecture des orogènes dans leurs cadres géodynamiques et celle de la place des accumulations sédimentaires avant, pendant et après la tectonique et des mécanismes responsables de la formation de ces objets. L'enseignement magistral est complété par l'apprentissage de la cartographie et de l'établissement de coupes géologiques et de
schémas structuraux à diverses échelles. Il aboutit à l'acquisition de méthodes géologiques d'études d'objets géologiques comme une chaîne de montagnes ou un bassin.
 
', '
\textbf{Cours.} Chaînes intracontinentales, de subduction, d’obduction et de collision. Accrétion et collage. Régimes thermiques et déformations de la croûte continentale; liaison tectonique-métamorphisme ; "metamorphic core complexes"; exhumation syn- et post-collision. Bassins intracontinentaux en extension et coulissement, grabens et hémigrabens, bassins d’avant-pays et intramontagneux.
\textbf{TP.} Cartographie à différentes échelles : coupes géologiques (plis, nappes, chevauchements) ; schémas structuraux ; analyse de cartes Dans le cadre des activités de travail personnel non-présentiel, il est demandé de préparer un exposé par groupe de 2 ou 3 étudiants portant sur l'analyse critique d'un article scientifique. Il s'agit pour les étudiants de lire un article court en anglais traitant d'un point moins approfondi du cours ou d'un exemple de chaîne ou de bassin non traité. Ils doivent en extraire les grandes idées et les restituer oralement à leurs collègues. A la suite de l'exposé, l'enseignant intervient pour corriger les points mal compris ou apporter d'autres précisions.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases anatomiques des grandes fonctions animales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases anatomiques des grandes fonctions animales', 'SOL5BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases anatomiques des grandes fonctions animales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '14', '0', '10', '0', '3', '3', 'Français_', ' 
  * Acquisition de l’anatomie et de l’histologie des grandes fonctions avant d’appréhender la physiologie.
 
', '

* Cours : Organisation des tissus : tissus épithéliaux – conjonctifs – musculaires. Description anatomique et histologique des appareils : circulatoire – respiratoire – digestif excréteur et reproducteur. 
* TP illustration du cours à partir de préparations et de coupes histologiques – Etude de l’organisation de tous les appareils présentés en cours chez une souris. Les TP pourront être enseignés en anglais.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BOPE/ BMC / BGST / PLURI
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
