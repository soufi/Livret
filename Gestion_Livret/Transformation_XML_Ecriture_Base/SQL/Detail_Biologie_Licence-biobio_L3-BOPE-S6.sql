SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BOPE-S6');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L3-BOPE-S6');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BOPE-S6');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage laboratoire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage laboratoire', 'SOL6ST03', '');
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biologie évolutive et moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biologie évolutive et moléculaire', 'SOL6BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biologie évolutive et moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '12', '8', '0', '5', '5', 'Français_', ' 
  * Appréhender les contraintes phylogénétiques dans la classification évolutive des espèces. Maîtriser les principales méthodes de reconstruction utilisées en phylogénie moléculaire. Ces approches seront soutenues par l’enseignement de connaissances fondamentales et techniques en biologie moléculaire associées à l’étude de la structure des génomes et de leurévolution.
 
', '
La réalité de l’évolution. Caractéristiques et mécanismes biologiques de l’évolution des lignées. Classification et phylogénèse : méthodes (cladistique, phénétique) et principes de la reconstruction phylogénétique (utilisation des logiciels PAUP, Mega). Notions d’évolution des génomes, d’horloge moléculaire, de duplication et pertes de gènes, éléments mobiles (transposons), transferts horizontaux de gènes. Techniques de biologie moléculaire liées à l’étude des génomes.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biologie des populations');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biologie des populations', 'SOL6BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biologie des populations');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '12', '12', '0', '5', '5', 'Français_', ' 
  * Appréhender les modèles de base en dynamique et génétique des populations. Comprendre les problèmes inhérents à la conservation et aux invasions d’espèces animales et végétales. Compétences visées : capacité à lire et à comprendre les publications des revues internationales, consacrées aux aspects fondamentaux et appliqués de la biologie des populations.
 
', '
Dynamique, génétique et évolution de populations d’animaux et de plantes. Applications aux domaines de
l’exploitation (espèces non domestiques), du contrôle (espèces jugées nuisibles, invasions) et de la conservation (espèces menacées d’extinction).
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage terrain : écologie du littoral-faune marine');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage terrain : écologie du littoral-faune marine', 'SOL6BO07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage terrain : écologie du littoral-faune marine');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '12', '0', '3', '3', 'Français_', ' 
  * Apprentissage de la reconnaissance d’organismes animaux en rapport avec la diversité et l’écologie des sites rencontrés lors du stage. Formation et préparation aux carrières de l’enseignement. Préparation aux métiers de l’environnement et à la gestion des écosystèmes.
 
', '
Trois journées en Normandie consacrées aux organismes animaux de la zone intertidale, suivies d’analyses et de démonstrations au laboratoire. Ces études se font sur la base d’excursions sur différents biotopes représentatifs du milieu (observation des organismes et de l’environnement, prélèvements d’échantillons) et sont axées essentiellement sur la faune marine, les insectes et les oiseaux. Elles permettent la mise en relation entre biodiversité et conditions du milieu. Les séances en laboratoire sont des démonstrations (systématique, dissection, morphologie comparée, etc...) à partir des échantillons récoltés. D’autres études sont réalisées in situ afin de déterminer la diversité, la répartition et la quantification des organismes représentatifs des variations du milieu (salinité, durée d’immersion ou d’émersion, nature du substrat...).
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Tests statistiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Tests statistiques', 'SOL6BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Tests statistiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '3', '3', 'Français_', ' 
  * Autonomie dans l’analyse des données.
 
', '
Utilisation des outils statistiques classiques pour l’interprétation des résultats expérimentaux et la conception d’expériences dans le domaine des sciences de la vie (écologie, physiologie, génétique, agronomie, médecine, etc.). Décisions statistiques relatives aux proportions, aux espérances et aux variances ; tests d’indépendance, d’homogénéité et d’ajustement ; tests non paramétriques ; plans d’expérience ; corrélation et régression linéaire simple.
', '', '', '', '', '', '
', 'Biblio
', '', '
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physiologie humaine et comparée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physiologie humaine et comparée', 'SOL6BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physiologie humaine et comparée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '34', '0', '14', '0', '5', '5', 'Français/Anglais_', ' 
  * Ce module présente les notions de base en physiologie animale et humaine nécessaires pour une compréhension des mécanismes physiologiques chez l’humain. 
 
', '
Compartiments liquidiens de l’organisme. Hématologie, bases d’immunologie. Physiologie des systèmes cardio-vasculaire et respiratoire : aspects anatomo-fonctionnels et régulations. Fonctionnement du système digestif, cheminement de l’aliment de la bouche à l’absorption intestinale. Physiologie du néphron. Physiologie osseuse et de l’ossification. Introduction aux neurosciences : organisation du cerveau, activités du système nerveux central et périphérique, bases de physiologie sensorielle. Introduction à l’endocrinologie : organisation d’une glande, physiologie hormonale. Physiologie de la reproduction : de la production des gamètes à la naissance ; liens entre système hypothamo-hypophysaire et gonades. Les travaux pratiques illustreront le cours sous formes d’ateliers expérimentaux, certaines des activités proposées pourront être enseignées en anglais. L’organisation générale anatomique de l’animal, nécessaire pour la compréhension des aspects physiologiques, sera illustrée à l’aide du modèle murin.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST / PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ouverture Maths pour prépa-concours, entraînement au concours');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ouverture Maths pour prépa-concours, entraînement au concours', 'UEL', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ouverture Maths pour prépa-concours, entraînement au concours');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '0', '0', 'Français_', ' 
  * Permettre à des étudiants d’acquérir des connaissances utiles pour passer les concours d’accès aux écoles nationales vétérinaires (concours ENV- voie B), les concours d’ingénieurs agro (concours ENSA voie B) mais également certains concours administratifs.
 
', '
Exercices pour entraînement au concours.
', '', '', '', 'E 50\% + O 25\% + TP 25\%', 'E 66\% + TP 33\%', '
', 'Biblio
', '', 'Parcours renforcé
');