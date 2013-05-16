SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie_Master');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'BOPE', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M1-S1');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'M1-S1');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M1-S1');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais scientifique 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais scientifique 1', 'SOM1AG41', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais scientifique 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Anglais_', ' 
  * Savoir présenter un rapport de travail en anglais et commenter le déroulement d’une opération.
 
', '
Remise à niveau, Conversation en anglais avec les moyens audio-visuels modernes (e-mail, video-projecteur…)', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biologie Moléculaire et Cellulaire Expérimentales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biologie Moléculaire et Cellulaire Expérimentales', 'SOM1BH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biologie Moléculaire et Cellulaire Expérimentales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '48', '0', '5', '5', 'Français_', ' 
  * Cette unité entièrement consacrée au travail expérimental vise à permettre d'acquérir une bonne pratique de quelques techniques fondamentales utilisées en biologies moléculaire et cellulaire.
 
', '
Construction de vecteurs d’expression avec gènes rapporteurs pour l’analyse de la domiciliation de protéines de fusion (gène GFP). Cultures cellulaire et transfection de vecteurs d’expression permettant l’analyse de l’activité de promoteurs (gène rapporteur luciférase, luminométrie). PCR : application à la détection de mutations ponctuelles. Méthode semi-quantitative pour la quantification d’ARN spécifiques. Interactions protéine/protéine \textit{in vitro} par chromatographie d'affinité : techniques du GST pull-down et analyse par western blot.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Dynamique et fonctionnement des écosystèmes terrestres');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Dynamique et fonctionnement des écosystèmes terrestres', 'SOM1BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Dynamique et fonctionnement des écosystèmes terrestres');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '31', '9', '8', '0', '5', '5', 'Français_', ' 
  * Compréhension synthétique de l’organisation spatiale, temporelle et fonctionnelle des écosystèmes terrestres et de leurs interrelations.  Perception de la place et du rôle de l’homme en tant qu’élément constitutif et moteur.  Acquisition des connaissances de base sur les principaux facteurs de perturbation et leur contrôle par les activités humaines.
 
', '
I. Fonctionnement et dynamique : Caractéristiques et originalités des écosystèmes forestiers, des ripisylves, des agrosystèmes, et relations avec les activités humaines ; structure fonctionnelle ; interactions forêt-grandes cultures ; les sols agricoles et forestiers ; les symbioses du sol; les relations plantes-animaux et les relations végétal-pathogènes ; rôle des relations trophiques dans les fluctuations cycliques.
II. Les facteurs de perturbations dans les écosystèmes exploités et artificiels : Définition, différentes échelles de perturbation; facteurs biotiques de perturbation : dynamique de population de ravageurs; phytopathologie ; impact sur les écosystèmes forestiers et agricoles et méthodes de protection; contraintes abiotiques (sécheresse, polluants, fertilisants); L'homme, relations avec l'environnement et devenir des civilisations.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Facteurs de la distribution des organismes et évolution des espèces');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Facteurs de la distribution des organismes et évolution des espèces', 'SOM1BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Facteurs de la distribution des organismes et évolution des espèces');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '12', '12', '0', '3', '3', 'Français_', ' 
  * Connaissances récentes en biogéographie et évolution et compréhension des mécanismes de l’évolution, à toutes les échelles de temps et d’espace.
 
', '
Biogéographie générale, des origines à aujourd'hui (facteurs de distribution des espèces, géographie passée et actuelle, distribution de la vie sur terre, les glaciations : causes et conséquences, l'émergence de l’homme et ses conséquences sur la biodiversité, évolution de la population humaine, modifications environnementales et biogéographie); Les bases des mécanismes évolutifs ; mécanismes de spéciation et d’extinction (anagénèse et spéciation, l'espèce et les problèmes associés, systématique moléculaire); Méthodes permettant de reconstituer les évènements en biogéographie historique : phylogéographie; différenciation des populations, modes de dispersion des organismes. Dynamique de l'évolution.', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biostat 1 : Initiation à "R"');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biostat 1 : Initiation à "R"', 'SOM1BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biostat 1 : Initiation à "R"');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * Maîtriser les tests statistiques couramment utilisés dans les Sciences de la Vie.
* Acquérir une autonomie dans l’analyse des données en utilisant le logiciel "R".
 
', '
- Présentation de "R" : objets de données, fonctions et opérateurs ; manipulations des objets de données ; fonctions de statistique descriptives ; création de graphiques usuels.
- Utilisation de "R" : lois de probabilités ; tests statistiques : comparaison d’effectifs, de proportions, de moyennes, de médianes, de variances et de distribution ; corrélations entre variables ; régression linéaire.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Expression du génôme eucaryote');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Expression du génôme eucaryote', 'SOM1BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Expression du génôme eucaryote');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '14', '10', '0', '5', '5', 'Français_', ' 
  * Approfondir la connaissance des mécanismes de régulation de l'expression génique au niveau transcriptionnel, post transcriptionnel et traductionnel. Présentation des techniques les plus récentes utilisées dans le domaine de recherche.
 
', '
Régulation au niveau de l’ADN : Régulation transcriptionnelle (mode d’activation des facteurs de transcription), post-transcriptionnelle (coiffe des ARNm et polyadénylation), traductionnelle (initiation coiffe dépendante et indépendante), Epissage alternatif, constitutif et en trans), structure génique complexes , méthodologie ( étude du transcriptome, hybridation différentielle, puces à ADN, criblage virtuel de banque de données, RT-PCR quantitative, technique de double hybride).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB et BOPE / Passerelle MESC2A
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ecologie du paysage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ecologie du paysage', 'SOM1BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ecologie du paysage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '14', '4', '0', '4', '4', 'Français_', ' 
  * Fournir aux étudiants les bases pour la compréhension de l'organisation des paysages et de leur évolution.
 
', '
Rôle de l'hétérogénéité, des activités humaines et des perturbations dans l'organisation et l'évolution des systèmes écologiques; les structures spatiales des paysages (hétérogénéité, fragmentation, connectivité, notions d'échelle et de hiérarchie); les changements d'occupation des terres (approche régionale, approche locale, exemples); dynamique des cours d'eau et des corridors, exemples; organisation des paysages; Télédetection.
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialité BOPE
');
