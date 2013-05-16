SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BGST-S6');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L3-BGST-S6');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BGST-S6');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Maîtriser sa voix, son corps, l’espace et le tableau pour enseigner et communiquer');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Maîtriser sa voix, son corps, l’espace et le tableau pour enseigner et communiquer', 'UEL', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Maîtriser sa voix, son corps, l’espace et le tableau pour enseigner et communiquer');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '3', '3', 'Français_', ' 
  * Apprendre à connaître et à contrôler sa voix, son trac, prévenir les mauvaises habitudes et la fatigue vocale. Prendre en compte l'espace et être conscient de son corps dans cet espace. Choisir ses intentions, donner du sens à son discours, réguler les interventions et les comportements des élèves. Apprendre à utiliser efficacement le tableau en s’appliquant à l’écriture cursive à vocation professionnelle.
 
', '

* Information santé pour la prévention des fatigues vocales en situation d’enseignement ou de communication.
* Travaux pratiques :
 \subitem travail corporel : décontraction, posture, respiration ; travail vocal : souplesse, expressivité, endurance ;
 \subitem maîtrise du corps dans l'espace : regard, expression du visage, silences, distance, déplacements ;
 \subitem lecture de textes, prise de parole, simulations de situations professeur/élèves ;
 \subitem travail de l’écriture cursive au tableau et équilibrage oral/écrit.
', '', '', '', 'E 50\% + O 25\% + TP 25\%', 'E 66\% + TP 33\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage naturalistes II : diversité des algues marines');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage naturalistes II : diversité des algues marines', 'SOL6BO08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage naturalistes II : diversité des algues marines');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '24', '0', '3', '3', 'Français_', ' 
  * Identifier les principales algues des cotes françaises. Réaliser un alguier.
 
', '
Etude sur le terrain (3 jours) des macroalgues benthiques. Observation des algues dans leur milieu naturel, identification des échantillons récoltés par analyse en laboratoire.
', '', '', '', '', 'E 66\% + TP 33\%', '
', 'Biblio
', '', 'Parcours BOPE / BBV / BGST
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Géologie de la France');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Géologie de la France', 'SOL6GE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Géologie de la France');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '6', '22', '0', '5', '5', 'Français_', ' 
  * L'étude de la géologie de la France et de l'Europe doit être l'occasion d'illustrer des concepts développés dans
d'autres modules. L'ordre chronologique des différents cycles permet une analyse plus aisée des événements car l’héritage des
phénomènes anciens joue un rôle important.
 
', '
Le visage actuel de l'Europe et de la France : Grands ensembles géomorphologiques : domaine méditerranéen (arcs
tyrrhéniens et égéens; bassins océaniques), reliefs alpins, massifs cristallins paléozoiques et précambriens, grands bassins
sédimentaires L'évolution précambrienne de l'Europe : Les chaînes anté-cadomiennes d'Europe septentrionale (Scandinavie et Îles
britanniques). La chaîne du Protérozoïque supérieur : la chaîne néoprotérozoïque (cadomienne) en France. L'évolution paléozoïque en France et la formation du socle de l'Europe : Structure et évolution de la chaîne varisque d'après l'étude des principaux massifs français : Ardenne, Massif Armoricain, Massif Central, Vosges. Aperçu sur les noyaux hercyniens des chaînes alpines (Massifs cristallins internes et externes, zone axiale des Pyrénées, Maures, Corse) - Aperçu sur les autres segments varisques d'Europe : Ibérie, Massif de Bohème - Les autres orogènes paléozoïques en Europe : la chaîne calédonienne de Scandinavie et du Nord des Îles britanniques, l'Oural. L'évolution méso-cénozoïque de la France : Les accumulations sédimentaires des bassins parisien et aquitain : points communs et différences, cas du bassin du Sud-est - La formation des chaînes alpines du Trias au Miocène inférieur : le rifting téthysien, structures et métamorphismes alpins. La chaîne pyrénéenne et ses dépendances languedociennes et provençales. Formation et évolution de la marge armoricaine Le rifting ouest européen d'après les exemples français : fossés d'Alsace, Bresse, Limagnes. La formation du Golfe du Lion et la rotation du microbloc corso-sarde. Géodynamique actuelle de la France : données de la géodésie (GPS), les mouvements actuels et la sismicité, la gravimétrie et ses anomalies de grande longueur d'onde Événements récents : variations eustatiques, glaciations et volcanismes quaternaires, la crise messinienne. TD/TP : Illustration du cours par l'analyse de documents : cartes topographiques et géologiques Réalisations de schémas structuraux et de coupes à différentes échelles 1/50 000; 1/250 000; 1/10$^6$ Étude de documents géophysiques (par exemple cartes gravi/mag, profils ECORS et autres, mécanismes au foyer, sismicité, flux de chaleur).', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stages naturalistes : écologie du littoral-faune marine / Eduterre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stages naturalistes : écologie du littoral-faune marine / Eduterre', 'SOL6BO17', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stages naturalistes : écologie du littoral-faune marine / Eduterre');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '18', '18', '0', '4', '4', 'Français_', ' 
  * Apprentissage de la reconnaissance d’organismes animaux en rapport avec la diversité et l’écologie des sites
rencontrés lors du stage. Formation et préparation aux carrières de l’enseignement. Préparation aux métiers de l’environnement
et à la gestion des écosystèmes.
* L’objectif de ce module est de faire découvrir, la géodiversité régionale ainsi que les ressources associées (eau, géothermie, matériaux...). Savoir lire un paysage, extrapoler les observations de surface au sous-sol, découvrir les principaux réservoirs. Réaliser une analyse critique des données.
 
', '

* Faune Marine : trois journées en Normandie consacrées aux organismes animaux de la zone intertidale, suivies d’analyses et de démonstrations au laboratoire. Ces études se font sur la base d’excursions sur différents biotopes représentatifs du milieu (observation des organismes et de l’environnement, prélèvements d’échantillons) et sont axées essentiellement sur la faune marine, les insectes et les oiseaux. Elles permettent la mise en relation entre biodiversité et conditions du milieu. Les séances en laboratoire sont des démonstrations (systématique, dissection, morphologie comparée, etc...) à partir des échantillons récoltés. D’autres études sont réalisées in situ afin de déterminer la diversité, la répartition et la quantification des organismes représentatifs des variations du milieu (salinité, durée d’immersion ou d’émersion, nature du substrat...).
* Eduterre : sortie de terrain (6h) : Présentation de la Géologie régionale. Présentation de la géologie du Loiret. Lithologie, succession stratigraphique et histoire géologique : calcaires de Beauce, sables de Sologne et alluvions de la Loire. Découverte d’affleurements clés et de phénomènes karstiques (effondrements, résurgences,...). Incidences sur la circulation des eaux souterraines et l’occupation des sols. Visite de stations de pompage et de piézomètre. Travaux pratiques en salle 6,5h Découverte des principaux réservoirs de données sur le sous-sol et les ressources en eau souterraine. Comment accéder aux données, comment les utiliser ? Découverte d’Eduterre (ressources géoscientifiques du BRGM pour l'éducation), et accès aux données sur Google Earth. Réalisations de scénarii sur l’état des lieux de la Nappe de Beauce (quantité/qualité).

', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biologie évolutive et moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biologie évolutive et moléculaire', 'SOL6BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biologie évolutive et moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '12', '8', '0', '5', '5', 'Français_', ' 
  * Appréhender les contraintes phylogénétiques dans la classification évolutive des espèces. Maîtriser les principales méthodes de reconstruction utilisées en phylogénie moléculaire. 
 
', '
La réalité de l’évolution. Caractéristiques et mécanismes biologiques de l’évolution des lignées. Classification et phylogénèse : méthodes (cladistique, phénétique) et principes de la reconstruction phylogénétique (utilisation des logiciels PAUP, Mega). Notions d’évolution des génomes, d’horloge moléculaire, de duplication et pertes de gènes, éléments mobiles (transposons), transferts horizontaux de gènes. Techniques de biologie moléculaire liées à l’étude des génomes.
', '', '', '', '', '', '
', 'Biblio
', '', 'Parcours BOPE / BGST
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