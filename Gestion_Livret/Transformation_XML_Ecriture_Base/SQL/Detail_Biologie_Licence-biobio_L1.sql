SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L1');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie en solution 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie en solution 2', 'SOL2CH14 SSL2CH14', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie en solution 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '11', '3', '0', '3', '3', 'Français_', ' 
  * Aborder les notions de base de la chimie en solution, avec applications à la biologie : équilibres d’oxydo-réduction, cinétique chimique.
 
', '
Approfondissement des notions de pH, et d'oxydo-réduction (notions non abordées en chimie en solution 1)), conductivité solubilité  et cinétique. Applications à la biologie.', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases de la génétique des populations');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases de la génétique des populations', 'SOL2BO03 SSL2BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases de la génétique des populations');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '6', '6', '0', '0', '2', '2', 'Français_', ' 
  * Acquérir les bases de la génétique des populations
 
', '
Notions de génétique des populations. Le modèle de Hardy Weinberg. La sélection. Les mutations. La migration. Le hasard et la dérive. 
TP : Modélisation dérive génétique
', '', '', '', '', '', '
', 'Biblio
', '', '
Ossature - tous parcours 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Atomistique et thermodynamique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Atomistique et thermodynamique', 'SOL1CH02 SSL1CH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Atomistique et thermodynamique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '17', '16', '15', '0', '5', '5', 'Français_', ' 
  * Bases de chimie générale.
 
', '

* Structure de l'atome (le noyau, les électrons : introduction des orbitales atomiques), formation des liaisons (introduction des orbitales moléculaires)
* Radioactivité, quelques propriétés moléculaires (moment dipolaire, énergies de liaison, ...)
* Gaz parfaits, premier et deuxième principes de thermodynamique.

', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à la biologie cellulaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à la biologie cellulaire', 'SOL1BO02 SSL1BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à la biologie cellulaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '6', '12', '0', '4', '4', 'Français_', ' 
  * Sensibiliser l’étudiant à la diversité du monde vivant et lui faire connaître son organisation.
 
', '

* Acaryotes, Procaryotes et Eucaryotes : Définition, classification, multiplication. 
* Description de la cellule : membrane plasmique, parois, système membranaire interne, organites semi-autonome, cytosquelette. 
* Différenciation cellulaire : types cellulaires et structure des cellules spécialisées. 
* Particularité de la cellule végétale : plastes, paroi, vacuoles, pigments… 
* TP : Apprentissage de quelques techniques d’observation de la cellule et illustration du cours. 

', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse des données en biosciences');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse des données en biosciences', 'SOL1BO03 SSL1BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse des données en biosciences');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '6', '6', '0', '0', '2', '2', 'Français_', ' 
  * Eléments statistiques de base pour les applications écologiques et physiologiques en Travaux Dirigés.
 
', '
Représentation des données dans le domaine biologique ; valeurs centrales et de dispersion. Distribution normale et épreuves de normalité. Test de comparaison des moyennes (Student). Applications en écologie : Régression linéaire simple, covariance, corrélation, test de signification du coefficient de corrélation, loi de Poisson, Chi2 d'ajustement à la loi de Poisson. Applications en biochimie-physiologie et génétique : les principes énoncés en cours seront appliqués à des analyses de données issues de travaux dans le domaine bio-santé. Il sera mis l’accent en particulier sur la pertinence d’emploi de tel ou tel test statistique et la présentation graphique des résultats (moyenne, écart type, erreur standard à la moyenne…)
', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Parasitisme et grandes endémies');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Parasitisme et grandes endémies', 'SOL2BO06 SSL2BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Parasitisme et grandes endémies');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '0', '6', '0', '3', '3', 'Français_', ' 
  * Connaissance des principaux parasites de l’Homme et des animaux domestiques et notion d’écologie parasitaire.
 
', '
Les grandes parasitoses mondiales. Les parasites animaux d’intérêts médicaux Morphologie et cycle parasitaire. Répartition géographiques et coûts des principales parasitoses humaines. Traitements.  Notion d’épidémiologie.', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Principe de la génétique formelle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Principe de la génétique formelle', 'SOL2BO02 SSL2BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Principe de la génétique formelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '16', '8', '0', '4', '4', 'Français_', ' 
  * Acquérir les bases de la génétique formelle permettant d’interpréter la ségrégation des caractères héréditaires.
 
', '
Le modèle mendélien mono et dihybridisme.
Notions fondamentales en génétique formelle : Le gène, Génotype/Phénotype, dominance récessivité, mutation, allèles, allèles multiples, allèles létaux, complémentation, pléiotropie, Interaction entre les gènes
Théorie Chromosomique de l’hérédité. Distance génétique, cartographie des loci.
Génétique humaine. L’analyse des pedigrees.
Génétique formelle des phages et des bactéries.
TP : Croisements Drosophiles, Polymorphisme de l’amylase', '', '', '', '', '', '
', 'Biblio
', '', '
Ossature - tous parcours 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Cours Paléoenvironnement, stratigraphie et paléontologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Cours Paléoenvironnement, stratigraphie et paléontologie', 'SOL2ST01 SSL2ST01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Cours Paléoenvironnement, stratigraphie et paléontologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '6', '24', '0', '6', '6', 'Français_', ' 
  * Notion de stratigraphie, échelle biostratigraphique, variabilité climatique naturelle, histoire de la vie.
 
', '
La caractérisation du paysage (relief terrestre) - L'enregistrement du temps (grands principes de stratigraphie, lithostratigraphie, biostratigraphie, chimiostratigraphie) - Histoire des climats et environnements (paléoclimats, paléoenvironnements, marqueurs paléoclimatiques et paléoenvironnementaux) - Histoire de la vie (grandes étapes de la vie et crises biologiques)', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet personnel et professionnel - techniques de communications');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet personnel et professionnel - techniques de communications', 'SOL1PP01 SSL1PP01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet personnel et professionnel - techniques de communications');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '2', '14', '0', '0', '3', '3', 'Français_', ' 
  * Recherche d’informations sur les métiers (sites internet appropriés, nécessité de mise à jour pour ce type d’information). 
* Prise de parole lors d’interviews et face à un public. 
* Réalisation d’une production écrite sous forme de poster.
 
', '
Après une présentation générale des objectifs de l’UE et des modalités de recherche documentaire au cours d’un premier cours magistral, l’élaboration d’une fiche de projet individuel sera réalisée par l’étudiant. A l’issue du dépouillement de ces fiches, des groupes de travail (3-4 étudiants) seront organisés pour les séances de TD suivantes. Ces séances seront destinées à préparer une présentation sous forme de poster et de diaporama informatisés soutenu oralement lors de la dernière séance.Des séances spécifiques seront consacrées à la prise de parole en public, la capacité à s’exprimer avec/sans notes, aux techniques d’interview, d’entretien et à la rédaction écrite. La réalisation du diaporama informatique sera facilitée par le travail en deux séances de TP (initiation au logiciel, réalisation du document). La présentation finale sera construite autour d’une recherche de documents sur le métier ou l’activité choisie en début de semestre, et d’une rencontre avec un professionnel. Le travail personnel sera guidé par un enseignant lors des séances de TD. Le SUIO sera présenté et l’étudiant devra l’utiliser dans sa démarche personnelle. Un rapport individuel issu du travail produit pendant le module sera remis pour évaluation lors de la dernière séance de TD', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 2', 'SOL2AG12 SSL2AG12', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Comprendre et s’exprimer de manière plus autonome dans des situations de séjour d’études universitaires en pays anglophone (niveau européen : B1).
 
', '
Travail de compréhension et d’expression orale et écrite à partir de documents authentiques simples et / ou courts centrés sur le monde universitaire anglo-saxon.', '', '', '', '', '', '
', 'Biblio
', '', '
Ossature - tous parcours 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algues et mycètes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algues et mycètes', 'SOL2BO07 SSL2BO07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algues et mycètes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '4', '10', '0', '3', '3', 'Français_', ' 
  * Intérêts économiques et biologie des algues et des champignons.
 
', '
Biologie et reproduction des algues et des champignons, initiation à la reconnaissance des champignons. Intérêts économiques, pharmaceutiques et biotechnologiques des algues et des champignons ', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Panorama du monde animal et végétal');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Panorama du monde animal et végétal', 'SOL1BO01 SSL1BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Panorama du monde animal et végétal');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '3', '15', '0', '5', '5', 'Français_', ' 
  * Sensibiliser l’étudiant à la diversité du monde vivant et lui faire connaître son organisation.
 
', '
Origine de la vie et grandes étapes de sa complexification .Eubactéries, archées, eucaryotes ; les diverses lignées unicellulaires et pluricellulaires ; les plans d’organisation du monde animal (feuillets embryonnaires, coelome, ..) et caractères généraux des grands embranchements. Plans d’organisation du monde végétal, les étapes de l’acquisition des différents organes des algues aux angiospermes; particularités des mycètes.
', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ecologie générale : environnement et fonctionnement de la biosphère');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ecologie générale : environnement et fonctionnement de la biosphère', 'SOL2BO05 SSL2BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ecologie générale : environnement et fonctionnement de la biosphère');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '6', '6', '0', '3', '3', 'Français_', ' 
  * Montrer comment la connaissance du fonctionnement de la biosphère, en liaison avec les activités humaines, peut permettre de comprendre les problèmes environnementaux actuels, d'envisager des solutions et d'appréhender les problèmes futurs.
 
', '
Quelques problèmes environnementaux et notions d'interdépendance; organisation générale de la biosphère (bilan énergétique, circulation atmosphérique, organisation spatiale); organisation fonctionnelle (chaînes et réseaux trophiques, perturbations d'origine humaine); circulation de la matière et cycles biogéochimiques (eau, carbone, azote, oxygène), et relations avec les activités humaines; flux d'énergie (bilans énergétiques, productivité, efficacité des écosystèmes naturels et anthropisés); organisation des biocénoses, biogéographie et fonctionnement des grands biomes terrestres; notions de biodiversité.', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Cours Minéralogie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Cours Minéralogie', 'SOL2ST02 SSL2ST02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Cours Minéralogie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '6', '24', '0', '6', '6', 'Français_', ' 
  * Connaissances du monde minéral dans sa diversité et ses principes – Apprentissage des méthodes d’identification des minéraux.
 
', '

*[CM :] Définition d’un minéral – Bases élémentaires de cristallographie et cristallochimie – Notions de symétrie cristalline – Présentation des critères de détermination macroscopique des minéraux – Notions d’optique cristalline pour la détermination des minéraux à l’aide du microscope polarisant – La classification des minéraux et leur répartition dans le globe – Présentation des grandes familles de minéraux (cristallochimie, gisements, applications industrielles).
*[TD :] La symétrie des mailles élémentaires – Calcul de formules structurales.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie en solution 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie en solution 1', 'SOL2CH04 SSL2CH04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie en solution 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '8', '7', '9', '0', '3', '3', 'Français_', ' 
  * Aborder les notions de base de la chimie en solution, avec applications à la biologie : les équilibres chimiques, pH de solutions aqueuses, dosages acides-bases, précipitation, complexation.
 
', '
Equilibres, pH d'une solution aqueuse, Oxydo-réduction. Ces chapitres seront abordés avec le minimum de notions nécessaires
', '', '', '', '', '', '
', 'Biblio
', '', '
Ossature - tous parcours 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'UEL IUFM - Histoire Géo ou EPS à l'école');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'UEL IUFM - Histoire Géo ou EPS à l'école', '???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='UEL IUFM - Histoire Géo ou EPS à l'école');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '0', '0', '3', '3', 'Français_', ' 
  * ???
 
', '???', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours enseignement PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Méthodologie, analyse et recherche documentaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Méthodologie, analyse et recherche documentaire', 'SOL2BO04 SSL2BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Méthodologie, analyse et recherche documentaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '14', '0', '0', '3', '3', 'Français_', ' 
  * Ce module se veut comme une première approche du monde la recherche dans le domaine de la biologie de la santé. Il doit permettre à l’étudiant d’appréhender de façon concrète les découvertes les plus récentes et d’acquérir la démarche et la méthodologie nécessaire dans la recherche d’information scientifique. 
 
', '
Des cours-conférences sont destinés à présenter des approches biochimiques, physiologiques et génétiques de pathologies humaines d’actualité. Par une présentation démarrant des fondements les plus simples accessibles par tous, et suivis des découvertes les plus récentes, l’étudiant comprendra en quoi la recherche peut apporter des solutions à plus ou moins brève échéance.
Les thématiques de ces cours pourront évoluer chaque année en fonction de l’actualité biomédicale : des sujets comme l’obésité, l’hypertension artérielle et ses conséquences cardio-vasculaires, la maladie d’Alzheimer, la mucoviscidose pourront par exemple être abordées.   
Les thématiques proposées en cours-conférences seront ensuite reprises en TD avec un travail sur documents scientifiques afin de compléter et conforter les notions acquises en cours', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement PLURI
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Molécules du vivant');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Molécules du vivant', 'SOL1BH01 SSL1BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Molécules du vivant');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '10', '10', '0', '5', '5', 'Français_', ' 
  * Bases moléculaires de la biologie.
 
', '

* Protéines : acides aminés - propriétés physico-chimiques. Structure primaire des protéines. Structure secondaire : hélice $\alpha$ , feuillets $\beta$.
* Lipides : acides gras, triglycérides, glycéro-phospholipides, stéroïdes. Membranes et surface cellulaire, structure, composition des protéines membranaires.
* Oses : nomenclature, mono et diholosides, polyosides de réserve et de structure. 
* Acides nucléiques : structure primaire : bases puriques et pyrimidiques.  Nucléosides, nucléotides. Structure secondaire : liaisons faibles, double brin, double hélice, séquençage chimique de l’ADN. 
* Enzymologie : rappels de cinétique chimique ; structure et mécanisme d’action des enzymes ; régulation de l’activité enzymatique ; 
* Introduction au métabolisme : glycolyse et cycle de Krebs ; oxydations phosphorylantes.

', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Préparation au C2i (Certificat informatique et internet)');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Préparation au C2i (Certificat informatique et internet)', 'SOL1II01 SSL1II01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Préparation au C2i (Certificat informatique et internet)');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '0', '3', '3', 'Français_', '', '
Cette UE a pour objectif de développer les compétences de base nécessaires à l’usage des Technologies de l’Information et de la Communication telles que définies dans le référentiel national du C2i niveau 1 et de préparer les étudiants à la certification. ', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Organisation et fonctionnement de la cellule eucaryote');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Organisation et fonctionnement de la cellule eucaryote', 'SOL2BO01 SSL2BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Organisation et fonctionnement de la cellule eucaryote');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '4', '0', '0', '3', '3', 'Français_', ' 
  * Initiation au fonctionnement de la cellule eucaryote.
 
', '
La membrane plasmique : structure et transport des molécules. Réticulum endoplasmique. Appareil de Golgi. Lysosome….  Le noyau : Introduction à l’expression des gènes et le cycle cellulaire.', '', '', '', '', '', '
', 'Biblio
', '', '
Ossature - tous parcours 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases de la chimie organique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases de la chimie organique', 'SOL2CH06 SSL2CH06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases de la chimie organique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '12', '0', '0', '3', '3', 'Français_', ' 
  * Connaissances fondamentales de la chimie bio-organique réactionnelle.
 
', '
Initiation à la chimie organique : Etude des grandes réactivités (Substitution, Elimination, Addition) associées aux fonctions essentielles du monde du vivant, les insaturations (alcène et alcynes) les fonctions alcool, carbonyle, pour une meilleure compréhension des phénomènes biochimiques. Présentation des réactivités, mécanismes et des intermédiaires réactionnels.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 1', 'SOL1AG11 SSL1AG11', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Etre à même de préparer un projet de séjour d’études universitaires en pays anglophone dans une langue écrite et orale simple et suffisamment claire.
 
', '
Travail de compréhension et d’expression orale et écrite à partir de documents authentiques simples et / ou courts centrés sur le monde universitaire anglo-saxon.
', '', '', '', '', '', '
', 'Biblio
', '', '
Tronc commun 
');
