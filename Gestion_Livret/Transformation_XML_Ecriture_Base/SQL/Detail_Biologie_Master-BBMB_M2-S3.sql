SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Master-BBMB', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S3');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'M2-S3');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S3');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Aspects structuraux des pathologies');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Aspects structuraux des pathologies', 'SOM3BO07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Aspects structuraux des pathologies');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', ' 
  * Acquérir une connaissance approfondie des mécanismes moléculaires par lesquels les machineries cellulaires performent les fonctions biologiques.   
 
', '
Etude des grandes fonctions biologiques de la cellule et des mécanismes moléculaires à la base de leurs régulations : réplication et réparation de l’ADN, transcription et régulation de l’expression génique, régulations post-transcriptionnelles et export des ARNs messagers. Implication des différentes régulations des fonctions biologiques dans les dysfonctionnements cellulaires à l’origine de pathologies.  
', '', '', '', '', '', '
', 'Biblio
', '', '
Option Biologie Moléculaire et Cellulaire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ateliers technologiques - 2 - Bioingénierie moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ateliers technologiques - 2 - Bioingénierie moléculaire', 'SOM3BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ateliers technologiques - 2 - Bioingénierie moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '20', '0', '5', '5', 'Français_', ' 
  * Maitriser les techniques et connaissances de l’ADN recombinant : de la séquence du gène à la fonction de la protéine.
 
', '
Le génie génétique comme outil moderne pour l’amélioration des biocatalyseurs – Transformation d’une enzyme hydrolytique en un outil performant de synthèse - Applications dans les biotechnologies blanches.
', '', '', '', '', 'Ecrit 100\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Aspects génétiques des pathologies');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Aspects génétiques des pathologies', 'SOM3BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Aspects génétiques des pathologies');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', ' 
  * Acquérir des connaissances approfondies sur des problématiques de recherche utilisant une approche génétique.
 
', '
Conférences de recherche portant sur les applications de la génétique dans différents domaines de la biologie. Les principales thématiques abordées sont : l’épigénétique, l’utilisation des outils génétiques (exemples : le système Cre/lox pour la bio-mimagerie, UAS/Gal4 et l’IRM….), la génétique humaine, la génomique et transcriptomique. Le contenu peut varier d’une année sur l’autre pour être au plus près des derniers résultats de la recherche dans le domaine.
', '', '', '', '', '', '
', 'Biblio
', '', '
Option Biologie Moléculaire et Cellulaire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Synthèse documentaire/bibliographique et projet de stage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Synthèse documentaire/bibliographique et projet de stage', 'SOM3PJ02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Synthèse documentaire/bibliographique et projet de stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '6', '0', '0', '2', '2', 'Français_', ' 
  * Aptitude à situer son travail dans un contexte scientifique et à définir un programme de recherche ; maîtrise des techniques de l’exposé oral et écrit, en français et en anglais.
 
', '
Travail en liaison avec le maître de stage du semestre 4 : Réalisation d’une synthèse bibliographique ou documentaire situant le sujet du stage de longue durée dans les programmes de l’équipe d’accueil et le contexte international, et débouchant sur l'élaboration du projet de recherche/travail de l'étudiant.
', '', '', '', '', 'Ecrit 100\%', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bioimagerie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bioimagerie', 'SOM3BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bioimagerie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Maîtriser les nouvelles technologies d'imagerie cellulaire et de l’imagerie in-vivo. Acquérir des techniques d’analyse pour l’évaluation qualitative et quantitative des mécanismes cellulaires  et du matériel biologique. 
 
', '
Application de la microscopie de fluorescence dans la recherche fondamentale et biomédicale Microscopie confocale de fluorescence mono et multiphotons,. F-techniques (FRAP, FRET, FLIM, FCS et SPT) ;  imagerie en temps réel, imagerie spectrale, TIRF. Imagerie in vivo : basée sur les Rayons-X (radiographie, tomodensitometrie) ; Imagerie radioisotopique (scintigraphie, tomographie à émission de positon. Imagerie Optique (bioluminescence, fluorescence dans le champ visible et proche infra-rouge) ; Imagerie par résonnance magnétique, Imagerie par ultra-sons. 
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ateliers technologiques - 1 - Méthodologie Transfert de gènes et Bioingéniérie cellulaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ateliers technologiques - 1 - Méthodologie Transfert de gènes et Bioingéniérie cellulaire', 'SOM3BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ateliers technologiques - 1 - Méthodologie Transfert de gènes et Bioingéniérie cellulaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '20', '0', '5', '5', 'Français_', ' 
  * Exploiter et comparer différentes méthodes non virales pour transférer de l’ADN plasmidique ; production d’une lignée génétiquement modifiée et validation de la transformation.
 
', '
Acquérir la connaissance et maitrise des techniques utilisées en transfert de gènes. Les expériences réalisées concerneront l’exploitation des vecteurs chimiques et de méthodes physiques (électroporation et nucléofection) ; transformation d’une lignée cellulaire et imagerie cellulaire.
', '', '', '', '', 'Ecrit 100\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ateliers technologiques - 3 - Aalyse génomique fonctionnelle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ateliers technologiques - 3 - Aalyse génomique fonctionnelle', 'SOM3BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ateliers technologiques - 3 - Aalyse génomique fonctionnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '20', '0', '5', '5', 'Français_', ' 
  * Connaissances et maîtrises des techniques modernes de l’approche génétique et génomique: de l’anomalie chromosomique à l’identification de séquences cibles.
 
', '
ChIP : Immunoprécipitation de la chromatine pontée. Cet atelier vise à initier les étudiants à de nouvelles approches pour mettre en évidence les sites de fixation d’un facteur de transcription, de protéines chromatiniennes, les modifications épigénétiques. Les différentes étapes du ChIP seront abordées avec leurs problèmes. FISH : De la cytogénétique conventionnelle à l'approche génomique : cet atelier concernera la mise en œuvre d'une analyse génétique du caryotype à l'approche génomique.
', '', '', '', '', 'Ecrit 100\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biostatistiques 2 : Modèle linéaire et analyse multivariées');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biostatistiques 2 : Modèle linéaire et analyse multivariées', 'SOM3BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biostatistiques 2 : Modèle linéaire et analyse multivariées');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '12', '0', '0', '3', '3', 'Français_', ' 
  * Maîtrise des méthodes spécialisées de la statistique couramment utilisées dans les Sciences de la vie.
* Initiation à la modélisation.
 
', '
 Intérêts du modèle linéaire : modèles et sous-modèles, méthodes d’estimations des paramètres du modèle linéaire. - Modèles linéaires ne comportant que des facteurs (ANOVA) : tests, interprétations et comparaisons multiples de moyennes; - Modèles linéaires ne comportant que des régresseurs : tests, interprétations, choix de régresseurs ; - Modèles linéaires combinant facteurs et régresseurs; - Analyses factorielles (analyse en composantes principales, analyse factorielle des correspondances, analyse discriminante).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Immunologie 3');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Immunologie 3', 'SOM3BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Immunologie 3');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Découvrir les nouveaux concepts en immunologie et les méthodes expérimentales utilisées pour analyser et influencer les réponses immunitaires.
 
', '
Divers aspects de l’immunologie cellulaire et moléculaire sont abordés sur la base d’enseignements réalisés essentiellement sous forme de conférences. Les intervenants sont des chercheurs spécialisés dans diverses thématiques. Seront  abordés les modes de régulation et de dérégulation du système immunitaire, les mécanismes de défense et de tolérance aux contacts des microorganismes et de signaux de dangers…
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Techniques analyse chimique : applications instrumentales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Techniques analyse chimique : applications instrumentales', 'SOM3CH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Techniques analyse chimique : applications instrumentales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '0', '12', '0', '3', '3', 'Français/Anglais_', ' 
  * Acquérir les compétences théoriques et techniques en analyse chimique.
 
', '
Approche théorique et pratiquedesméthodes chromatographiques : chromatographie d’échange d’ions, chromatographie de paires d’ions. Electrophorèse capillaire. Traitement de l’échantillon. Couplages des méthodes chromatographiques et de la spectrométrie de masse.Travaux Pratiques : méthodes séparatives (GC, HPLC, HPTLC), méthodes spectrales (IR, UV, SM) et traitement de l’échantillon (ASE, SPME).
', '', '', '', '', '', '
', 'Biblio
', '', '
Option Techniques Bio-Industrielles
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Filières professionnelles');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Filières professionnelles', 'SOM3IP00', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Filières professionnelles');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '0', '0', '0', '2', '2', 'Français_', ' 
  * Consolider les connaissances de l’entreprise dans des domaines pointus comme la protection des inventions, le management en équipe.
 
', '
-Présentation de laboratoires dans les différents secteurs biotechnologiques, cosmétiques, pharmaceutiques. Introduction au droit des affaires; l'activité économique et commerciale; le cadre juridique de l'activité d'entreprise (contrat, la responsabilité de l'entreprise); réglementation du travail. Société de projet et l'innovation: entreprises, l'entrepreneuriat et l'innovation, la stratégie marketing et études de marché. Gestion de projet : gestion de l'équipe, négociation du contrat, protection de l'innovation :la propriété intellectuelle, des outils sur le témoignage de l'invention, le brevet et le droit d'auteur. Protection de la propriété industrielle : outils de la protection des inventions. Les différents brevets ; forme et contenu. Les méthodes de recherche.
', '', '', '', 'Ecrit 50\% + Oral 50\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Thérapies innovantes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Thérapies innovantes', 'SOM3BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Thérapies innovantes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', ' 
  * Acquérir des connaissances approfondies sur les nouvelles thérapies.
 
', '
Cycles de conférences de recherche.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biotechnologie végétale');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biotechnologie végétale', 'SOM3BO09', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biotechnologie végétale');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '8', '4', '12', '0', '3', '3', 'Français/Anglais_', ' 
  * cquisition des connaissances théoriques et savoir-faire technologiques nécessaires à la mise en œuvre d’un protocole de transformation génétique visant à la régénération de plantes transgéniques.
 
', '
les principales techniques de transgénèse végétale (Agrobacterium tumefaciens, méthodes directes par électroporation ou biolistique), applications à l’amélioration des plantes et à la production de molécules d’intérêt industriel, stratégies (gènes homologues ou hétérologues, sens antisens RNAi cosuppression, unigènes, multigènes, types de caractères introduits : agronomiques, qualitatifs, molecular Pharming), techniques, et applications de la transgénèse végétale). Les plantes OGM dans le monde, Transformation génétique du tabac via Agrobacterium tumefaciens (gène rapporteur gus), mise en évidence de l’expression du gène rapporteur, extraction d’ADN et détection d’un transgène par PCR.  Réalisation de transgénèse de tabac avec une construction promoteur rapporteur Gus. (confection de milieux et solutions, co-culture, repiquage, observation, test X gluc).
', '', '', '', '', '', '
', 'Biblio
', '', '
Option Techniques Bio-Industrielles
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais scientifique 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais scientifique 2', 'SOM3AG23', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais scientifique 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Anglais_', ' 
  * Savoir présenter un rapport de travail en anglais et commenter le déroulement d’une expérimentation.
 
', '
Faire un bilan du stage de l’année passée et résumer les visites d’entreprises en anglais. Commenter le déroulement d’un atelier technologique en anglais. Se préparer à des entretiens en anglais pour une embauche (thèse ou poste R & D).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
