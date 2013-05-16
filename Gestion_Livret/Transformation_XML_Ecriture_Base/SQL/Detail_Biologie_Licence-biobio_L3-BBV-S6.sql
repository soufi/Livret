SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BBV-S6');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biotechnologie appliquée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biotechnologie appliquée', 'SOL6BH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biotechnologie appliquée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '12', '16', '0', '5', '5', 'Français_', ' 
  * Les objectifs majeurs de cette unité sont 1) d’apporter les connaissances de base de biotechnologies impliquant les techniques de l’ADN recombinant 2) de savoir définir la procédure expérimentale de choix en fonction de chaque problématique 3) d’en développer les applications d’aujourd’hui et de demain.
 
', '
\textit{Production de molécules d’intérêt par génie génétique} : présentation des différents systèmes de production de protéines recombinantes en définissant leurs différents avantages et inconvénients : systèmes confinés procaryotes (bactéries : E. coli, Bacillus...) et eucaryotes (levures, cellules d’insecte, cellules de mammifère), systèmes ouverts (animaux et plantes transgéniques).
\textit{Comment construire des animaux transgéniques} : pour améliorer la race, comme bioréacteur, comme modèles animaux de pathologies humaines, pour la correction d’un déficit, l’étude de la régulation des gènes... Présentation des différentes possibilités comme la micro-injection, pour l’amélioration de la race, l’utilisation de cellules ES pour l’invalidation de gènes en vue de l’élaboration de modèles animaux, de valider un ADN médicament... 
\textit{Notion de thérapie génique} : utilisation de vecteur pour le transfert du gène : les vecteurs viraux.
\textit{Transgénèse végétale} : du système de transgénèse naturelle des agrobactéries à leur utilisation en biotechnologie végétale. Les agrobactéries, outils naturels d’ingénierie génétique : infection des végétaux par les bactéries du sol, les plasmides Ti, les mécanismes de transfert de l’ADN-T, les vecteurs binaires, les techniques de coculture et de coinoculation. 
\textit{Les méthodes de transgénèse alternatives} : électroporation, biolistique, vecteurs viraux, magnifection, etc. Avantages et limites. 
\textit{Applications de la transgénèse végétale} : transfert de gènes d’intérêt agronomique, gènes de résistance aux herbicides, gènes de résistance aux insectes ravageurs (maïs Bt, toxines de Bacillus thuringiensis) ; transfert de gènes pour l’amélioration des qualités nutritives, augmentation de la teneur en acides aminés indispensables, modulation de la teneur en lipides, augmentation de la teneur en composés édulcorants, synthèse de $\beta$-carotène (golden rice) ; la cellule végétale une usine de production de molécules d’intérêt thérapeutique, vaccins comestibles, immunothérapie passive avec des planticorps, synthèse de protéines humaines ; production pour l’industrie agroalimentaire et autres, etc... 
\textit{Les limites et problèmes actuels de la transgénèse végétale} : méthodes alternatives, intégration ciblée des gènes d’intérêt, transplastomique, suppression des gènes de sélection, etc...
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 6');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 6', 'SOL6AG36', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 6');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * Comprendre l’information exprimée dans des messages complexes sur le domaine des Sciences et Technologies et s’exprimer sur ce même domaine à l’oral avec un degré de spontanéité et de fluidité (niveau européen B2).
 
', '
Travail de compréhension et d’expression à partir de documents authentiques longs et/ou complexes, portant sur des innovations technologiques, des découvertes ou avancées scientifiques.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BMC / BOPE / BGST / BBV / PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Transduction des signaux chez les plantes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Transduction des signaux chez les plantes', 'SOL6BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Transduction des signaux chez les plantes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '4', '8', '0', '3', '3', 'Français_', ' 
  * Connaissances générales en agronomie.
 
', '
Perception de l’environnement par les plantes (généralités)- Les récepteurs impliqués dans la perception ; Rôle des régulateurs à phosphorelais : les récepteurs à l’éthylène, les récepteurs aux cytokinines, Rôle des LeucineRichRepeat Récepteur Kinases. Acteurs de la transduction et messagers secondaires : les protéines G hétérotrimériques, les petites protéines G, les protéines kinases, les phosphatases, les phospholipases, le calcium, l'AMPc, l'adénosine-diphosphate-ribose cyclique. Le système ubiquitine/protéasome.
', '', '', '', '', '', 'Taiz et Zeiger (Sinauer), revues spécialisées (Trends in plant Sciences)

', 'Biblio
', '', 'Parcours BOPE / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Fixation de l'azote et agroéconomie végétale');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Fixation de l'azote et agroéconomie végétale', 'SOL6BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Fixation de l'azote et agroéconomie végétale');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '4', '20', '0', '5', '5', 'Français_', ' 
  * Acquisition des connaissances de base de la physiologie végétales.
 
', '
Métabolisme azoté et fixation symbiotique. Du blé au pain- De la vigne au vin. Sorties : utilisation des farines boulangères ; laboratoire de recherche sur la qualité des blés ; entreprise vinicole.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BGST / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage laboratoire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage laboratoire', 'SOL6ST04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage laboratoire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', ' 
  * Initiation au travail de recherche en laboratoire.
 
', '
Stage en laboratoire académique ou industriel dans le domaine du parcours envisagé. La durée est de 4 à 6 semaines (détails de l’organisation fourni durant le semestre 5, avec signature d‘une convention de stage.
', '', '', '', '', 'E 66\% + TP 33\%', '
', 'Biblio
', '', 'Parcours BOPE / BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Culture végétale in vitro');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Culture végétale in vitro', 'SOL6BO14', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Culture végétale in vitro');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '8', '16', '0', '4', '4', 'Français_', ' 
  * Connaître les bases de la culture in vitro ; Savoir manipuler en conditions d’asepsie ; Maîtriser la technique ;
Savoir l'utiliser comme un outil d'étude des processus de croissance et de développement des végétaux ; Etre capable de
l'adapter à des problèmes posés par les professionnels de la production et de l'amélioration.
 
', '
Bases historiques et physiologiques (totipotence cellulaire ; aptitude à la dédifférenciation ; propriétés des hormones
végétales) de la culture /in vitro/ ; Technologie de la culture /in vitro/ (caractéristiques de l'explant ; composition du milieu de
culture ; effets de l'atmosphère gazeuse ; asepsie) ; Applications de la culture /in vitro/ (micropropagation ; embryogenèse
somatique ; amélioration sanitaire et génétique ; variation soma-clonale ; production de métabolites secondaires ; utilisation
industrielle de la technique).', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Molécules naturelles');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Molécules naturelles', 'SOL6BO13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Molécules naturelles');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '12', '18', '0', '4', '4', 'Français_', ' 
  * Acquisition des connaissances de base de la physiologie végétale.
 
', '
Connaissance des principales molécules d'origine végétales utilisables en bio-industries, voies de biosynthèse et
applications.
', '', '', '', '', '', '
', 'Pharmacognosie J. Bruneton Tec-Doc
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Microbiologie appliquée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Microbiologie appliquée', 'SOL6BH03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Microbiologie appliquée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '16', '0', '4', '4', 'Français_', ' 
  * Donner un aperçu des différentes utilisations potentielles des micro-organismes, de connaître les
démarches et de savoir effectuer des contrôles bactériologiques de l’eau et en agro-alimentaire
 
', '
Interactions entre micro-organismes : Associations synergiques et antagonistes, commensalisme, mutualisme,
parasitisme. Microbiologie du sol et de l’eau : Les grands cycles (Carbone, Azote, Soufre) ; auto-épuration et biodégradation (ex : xénobiotiques, lixiviats, résidus industriels). Techniques d’analyse des eaux et du sol. Microbiologie médicale : Virus et bactéries pathogènes (habitat, épidémiologie, pouvoir pathogène, diagnostic, traitement). Microbiologie industrielle : Fermentations d’intérêts économiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Métabolisme normal et pathologique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Métabolisme normal et pathologique', 'SOL6BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Métabolisme normal et pathologique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '8', '0', '0', '4', '4', 'Français_', ' 
  * Métabolisme humain avancé et son contrôle hormonal ; pathologies associées.
 
', '
Rappels des principales voies du métabolisme glucidique et lipidique ; métabolisme des acides aminés (élimination de l’azote ; cycle de l’urée ; biosynthèse des acides aminés non indispensables). Intégration métabolique tissulaire ; métabolisme « en situation » : état post-prandial ; jeûne pathologique et non pathologique, métabolisme musculaire. Métabolisme des nucléotides (biosynthèse ; chimiothérapie anticancéreuse ; dégradation) ; métabolisme du cholestérol (trafic intratissulaire et athérosclérose) et de l’hème. Modes de contrôle hormonal et pathologies associées.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BMC / BBV
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage terrain : diversité des algues marines');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage terrain : diversité des algues marines', 'SOL6BO08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage terrain : diversité des algues marines');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '24', '0', '3', '3', 'Français_', ' 
  * Identifier les principales algues des cotes françaises. Réaliser un alguier.
 
', '
Etude sur le terrain (3 jours) des macroalgues benthiques. Observation des algues dans leur milieu naturel, identification des échantillons récoltés par analyse en laboratoire.
', '', '', '', '', 'E 66\% + TP 33\%', '
', 'Biblio
', '', 'Parcours BOPE / BBV / BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Virologie moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Virologie moléculaire', 'SOL6BH05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Virologie moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', ' 
  * Acquérir des connaissances dans le domaine de la virologie;
 
', '
Présentation du monde viral. Modes de réplication des virus. Interactions virus/cellule. Diagnostic et traitements
anti-viraux. Action anti-virale du système immunitaire et stratégies d’échappement du virus. Vaccins et vecteurs viraux.
Particularités des virus des végétaux. Exemples : VIH, Rougeole, Hépatites, Virus émergents, Virus de plantes, ...
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BBV / BMC
');
