SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Math');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1-MASE');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L1-MASE');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1-MASE');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à l'économétrie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à l'économétrie', '5SE04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à l'économétrie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '15', '0', '0', '0', '3', '3', 'Français_', 'L'objectif du cours est de donner à l'étudiant les moyens de mener ses premières régressions simples, de comprendre et d'analyser leurs premiers résultats.', 'Dans ce cours, seront examinés les régressions MCO dans le cadre d'un modèle simple de la forme $y=a.x+b$, les propriétés des estimateurs obtenus, les tests à mener sur de tels estimateurs (tests d'hypothèse, intervalles de confiance, prévisions).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse 1', '2MT05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '60', '6', '6', 'Français_', 'S'initier aux méthodes plus fines d'analyse des fonctions réelles.', '
 
  * Continuité uniforme,
  * Dérivation, fonctions dérivables sur un intervalle, dérivée d'une fonction réciproque,
  * Théorème de Taylor, développements limités,
  * Introduction à l'intégrale de Riemann,
  * Calcul des primitives.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algèbre bilinéaire et géométrie euclidienne');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algèbre bilinéaire et géométrie euclidienne', '4MT06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algèbre bilinéaire et géométrie euclidienne');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', 'Découvrir l'algèbre bilinéaire et ses liens avec la géométrie.', '
 
  * Dual d'un espace vectoriel,
  * formes quadratiques,
  * formes quadratiques réelles,
  * espaces vectoriels euclidiens : projections orthogonales, adjoint,
  * espaces affines euclidiens : classification des isométries du plan et de l'espace,
  * applications : côniques et quadriques, polynômes orthogonaux.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 2', '2AG12', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre et s'exprimer de manière plus autonome dans des situations de séjour d'études universitaires en pays anglophone (niveau européen : B1).', 'Travail de compréhension et d'expression orale et écrite à partir de documents authentiques simples et/ou cours centrés sur le monde universitaire anglo-saxon. Supports : vidéo, audio, articles de presse', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction aux sciences économiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction aux sciences économiques', '1SE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction aux sciences économiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '15', '0', '0', '3', '3', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Probabilités discrètes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Probabilités discrètes', '4MT08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Probabilités discrètes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '36', '0', '0', '5', '5', 'Français_', 'S'initier aux probabilités discrètes.', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction au raisonnement math\'ematique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction au raisonnement math\'ematique', '1MT02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction au raisonnement math\'ematique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '60', '6', '6', 'Français_', 'Savoir mettre en \oe uvre un raisonnement mathématique de base.', '
 
  * Logique \'el\'ementaire, implication, quantificateurs,
  * Les différents types de démonstrations en mathématiques (implication directe, récurrence, preuve par l'absurde ...),
  * Manipulations ensemblistes, application d'un ensemble vers un autre,
  * Applications injectives, surjectives, bijectives,
  * Nombres complexes,
  * Systèmes lin\'eaires, familles libres, matrices dans $\mathbb{R}^2$ et $\mathbb{R}^3$.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Topologie des espaces métriques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Topologie des espaces métriques', '5MT04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Topologie des espaces métriques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', '', '
 
  * Distances, normes
  * Convergences de suites, continuité
  * Espaces complets
  * Espaces compacts
  * Espaces vectoriels normés, applications linéaires continues
  * Connexité

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Microéconomie et comportements stratégiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Microéconomie et comportements stratégiques', '4SE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Microéconomie et comportements stratégiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '25', '0', '0', '4', '4', 'Français_', '', '

Comportements stratégiques: Le cours présente les principes de comportement des entreprises en concurrence imparfaite (monopole discriminant, concurrence monopolistique, duopole, oligopole). Il présente des instruments permettant d'analyser la concurrence sur un marché, et étudie les conséquences des imperfections de concurrence, tant normatives (intervention publique) que positives (rigidité macroéconomique des prix). Ce cours constitue une introduction à l'économie industrielle.
Microéconomie: Ce cours dispensé en travaux dirigés se proposent d'illustrer l'enseignement de microéconomie au moyen de jeux économiques (dilemme du prisonnier, enchères, « concours de beauté »). Il se termine par une étude sectorielle d'économie industrielle.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Unité d'enseignement libre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Unité d'enseignement libre', '2UL04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Unité d'enseignement libre');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '3', '3', 'Français_', 'Comprendre comment ce qu'on apprend dans le cadre d'un diplôme déjà très spécialisé ; s'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L'unité d'ouverture est à choisir, en début du semestre, parmi la centaine d'enseignements dédiés à cet usage et offerts par toutes les composantes de l'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d'unités d'ouverture :

* Sport.
* Traitement de signal et d'image.
* Droit de l'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l'espace, la voix.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'La page du site de l'université dédiée aux unités d'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2
', 'Biblio
', '', '
Unité obligatoire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algèbre 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algèbre 1', '2MT06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algèbre 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '60', '6', '6', 'Français_', 'Se familiariser avec les polynômes. Apprendre l'algèbre linéaire et manipuler des matrices.', ' 
  * Arithmétique des polynômes, décomposition des fractions rationnelles,
  * Espaces et sous-espaces vectoriels,
  * Bases en dimension finie, théorie de la dimension,
  * Applications linéaires, 
  * Matrices, calcul matriciel,
  * Déterminant.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algèbre 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algèbre 2', '3MT08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algèbre 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', 'Se former à l'étude spectrale de matrices.', '
 
  * Valeurs propres, vecteurs propres,
  * Polynôme caractéristique,
  * Diagonalisation - Trigonalisation,
  * Polynômes d'endomorphismes,
  * Polynômes annulateurs,
  * Anneaux de polynômes [optionnel].
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 1', '1AG11', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '
Être à même de préparer un projet de séjour d'études universitaires en pays anglophone dans une langue écrite et orale simple.
', '
Travail de compréhension et d'expression orale et écrite, à partir de documents authentiques simples, ou courts, centrés sur le monde universitaire anglo-saxon.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à la microéconomie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à la microéconomie', '2SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à la microéconomie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '48', '5', '5', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Suites et fonctions réelles');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Suites et fonctions réelles', '1MT03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Suites et fonctions réelles');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '60', '6', '6', 'Français_', 'Ce module d'analyse traite des suites et fonctions réelles. Les notions de limite, de continuité, de dérivabilité sont proprement établies et permettent alors l'étude précise de suites et de fonctions.', '
 
  * Structures d'ordre, majorants-minorants, bornes supérieures et inférieures,
  * Suites numériques: étude, convergence, suites récurrentes,
  * Fonctions numériques: limite, continuité,
  * Dérivabilité, fonctions usuelles, étude de fonctions,
  * Fonctions réciproques.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '
', '
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à la macroéconomie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à la macroéconomie', '2SE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à la macroéconomie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '48', '5', '5', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Suites et séries de fonctions');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Suites et séries de fonctions', '4MT05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Suites et séries de fonctions');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '24', '0', '0', '5', '5', 'Français_', 'Apprendre à manipuler des suites de fonctions et des intégrales dépendant d'un paramètre.', '
 
  * Suites et séries de fonctions,
  * Séries entières, séries de Fourier,
  * Intégrales dépendant d'un paramètre.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = '\'Econométrie linéaire avancée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, '\'Econométrie linéaire avancée', '6SE03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='\'Econométrie linéaire avancée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6 ');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '15', '0', '0', '5', '5', 'Français_', '', '
Ce cours présente les fondements de l'économétrie à partir du modèle des moindres carrés ordinaires. Il présente les techniques d'estimation, de test et de prévisions dans ce cadre, puis aborde les problèmes associés à l'invalidité des hypothèses des moindres carrés et fait suite au séminaire d'économétrie.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Politique monétaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Politique monétaire', '3SE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Politique monétaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '7.5', '0', '0', '4', '4', 'Français_', 'Ce cours vise à fournir aux étudiants des outils d'analyse des phénomènes monétaires et financiers.', '
On s'interroge sur les questions suivantes:

* Les déterminants et la stabilité de la demande de monnaie;
* Les mécanismes et les contraintes liés à la création et la destruction monétaire;
* Les canaux de transmission de la politique monétaire en économie fermée : coût du capital, effets de richesse; canal du crédit, partage prix quantité;
* La politique monétaire en économie ouverte : contraintes liées à la fixité des changes, canal des taux de change en système de changes flexibles.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algorithmique et programmation 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algorithmique et programmation 1', '1IF02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algorithmique et programmation 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '15', '45', '6', '6', 'Français_', 'Maîtriser les concepts élémentaires de l'algorithmique et être capable de les traduire dans le langage C.', 'Algorithmique élémentaire : expressions, variables, instructions, séquences, conditionnelles, boucles, tableaux, preuves, invariants, traduction dans le langage Java.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 6');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 6', '6AG36', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 6');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre l'information exprimée dans des messages complexes sur le domaine des sciences et technologies, et s'exprimer sur ce même domaine à l'oral avec un degré suffisant de spontanéité et de fluidité (niveau européen B2).', '
Travail de compréhension et d'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et des avancées scientifiques.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Insertion professionnelle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Insertion professionnelle', '5IF02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Insertion professionnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '12', '3', '3', 'Français_', 'Se préparer à l'insertion professionnelle.', 'Préparation de CV, de lettres de motivation, gestion de carrière.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Fonctions de plusieurs variables, courbes et surfaces paramétrées');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Fonctions de plusieurs variables, courbes et surfaces paramétrées', '4MT07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Fonctions de plusieurs variables, courbes et surfaces paramétrées');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '24', '0', '0', '5', '5', 'Français_', '', '
 
  * Fonctions de plusieurs variables,
  * Intégrales multiples,
  * Courbes et surfaces paramétrées.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 4');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 4', '4AG24', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 4');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Analyser dans une langue simple et cohérente les rapports entre science et société à l'écrit et à l'oral (niveau européen : B1+).', 'Travail de compréhension et d'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', 'Unité obligatoire.');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Intermédiaires et marchés financiers');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Intermédiaires et marchés financiers', '4SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Intermédiaires et marchés financiers');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '0', '0', '0', '2', '2', 'Français_', 'Organisation et fonctionnement des marchés financiers. \'Etude des banques et autres intermédiaires financiers.', '
La partie du cours consacrée à l'étude des marchés financiers s'ouvre par l'étude du fonctionnement d'un marché financier. L'exemple d'Euronext est choisi pour évoquer certains aspects descriptifs ayant trait à l'organisation du marché. Ensuite, le cours analyse les deux actifs financiers fondamentaux: les actions et les obligations. Enfin, une introduction à la théorie du portefeuille et à la théorie du marché du capital vient clore le cours.\\
La seconde partie du cours est consacrée à l'étude des intermédiaires financiers et plus particulièrement des banques. Il s'agit d'une part d'analyser leur rôle dans le financement de l'économie, notamment depuis la déréglementation financière en vigueur depuis la décennie 80. Il s'agit d'autre part d'aborder les aspects prudentiels de l'activité bancaire en évoquant les différents risques qui lui sont spécifiques ainsi que la réglementation qui en découle (par exemple, la réforme Bâle II).
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mathématiques numériques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mathématiques numériques', '3MT10', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mathématiques numériques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '36', '4', '4', 'Français_', 'Se familiariser avec le logiciel de calcul matriciel Scilab.', '
 
  * Introduction à Scilab,
  * Manipulation de données matricielles,
  * Construction de vecteurs, matrices, extraction de sous-matrices,
  * Représentation graphique 2D,
  * Suites récurrentes,
  * Systèmes linéaires - Pivot de Gauss,
  * Générateurs aléatoires, lois uniformes, simulation de lois discrètes,
  * Introduction aux équations différentielles,
  * Quelques problèmes de mathématiques appliquées.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse 2', '3MT09', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', 'Approfondir les notions sur les suites, et s'initier aux intégrales généralisées', '
 
  * Suites de Cauchy - Suites extraites - Théorème de Bolzano-Weierstrass,
  * Séries numériques,
  * Intégrales généralisées.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Statistiques approfondies');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Statistiques approfondies', '6SE04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Statistiques approfondies');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '15', '0', '0', '5', '5', 'Français_', '', 'Le cours de Statistiques approfondies au semestre 6 du parcours économétrie complète et approfondit pour les économètres le cours de statistiques donné au semestre 5 à tous les parcours de la licence économie gestion.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Calcul différentiel et optimisation');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Calcul différentiel et optimisation', '6MT04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Calcul différentiel et optimisation');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', '', '
 
  * Différentielle d'ordre 1,
  * Inversion locale, théorème des fonctions implicites,
  * Différentielle d'ordre 2, formule de Taylor,
  * Extrema liés.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Statistiques appliquées à l'économie et à la gestion');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Statistiques appliquées à l'économie et à la gestion', '5SE03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Statistiques appliquées à l'économie et à la gestion');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '15', '0', '0', '4', '4', 'Français_', 'Ce cours de statistique mathématique a pour principal objectif d'initier les étudiants aux méthodes d'inférence statistique et à la théorie des tests. Il s'inscrit dans le prolongement des cours de statistique descriptive et de probabilités des deux premières années de la licence.', '
Ce cours comporte deux parties. 

* La première partie est consacrée aux méthodes d'estimation des paramètres d'un modèle statistique. 
* La seconde partie introduit la théorie des tests et propose différentes applications aux tests paramétriques et aux tests d'adéquation.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 5');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 5', '5AG35', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 5');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre l'information exprimée dans des messages complexes sur le domaine des sciences  er technologies et s'exprimer sur ce même domaine à l'écrit dans un registre de langue approprié.', '
Travail de compréhension et d'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', ' 
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mesure et intégration');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mesure et intégration', '5MT07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mesure et intégration');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', '', '
 
  * Tribus, mesures ; mesure de Lebesgue
  * Intégrale par rapport à une mesure
  * Théorèmes de convergence monotone, de convergence dominée 
  * Théorème de Fubini
  * Convolution
  * Transformée de Fourier
  * Espaces $L^p$.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet personnel et professionnel');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet personnel et professionnel', '2PP02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet personnel et professionnel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '2', '10', '0', '0', '2', '2', 'Français_', 'Initiation à la recherche documentaire, au travail en groupes, à la présentation orale et à la présentation d'un poster.', '

* Cours : présentation des objectifs. Modalités de recherche documentaire.
Présentation du SUIO. \'Elaboration d'une fiche de projet individuel.
* TD : Recherche massive de documents sur le métier ou l'activité choisie. Préparation d'une rencontre avec un professionnel correspondant au projet. Préparation du rapport écrit, du poster et de la soutenance.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 1 (1 parmi 3).
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Problèmes et méthodes de la science économique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Problèmes et méthodes de la science économique', '1SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Problèmes et méthodes de la science économique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '0', '0', '3', '3', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Macroéconomie monétaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Macroéconomie monétaire', '3SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Macroéconomie monétaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '0', '7.5', '0', '4', '4', 'Français_', '', '
Ce cours vise à fournir aux étudiants des outils d'analyse des phénomènes monétaires et financiers.
On s'interroge sur les questions suivantes:

* Les déterminants et la stabilité de la demande de monnaie;
* Les mécanismes et les contraintes liés à la création et la destruction monétaire;
* Les canaux de transmission de la politique monétaire en économie fermée : coût du capital, effets de richesse; canal du crédit, partage prix quantité;
* La politique monétaire en économie ouverte : contraintes liées à la fixité des changes, canal des taux de change en système de changes flexibles.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '???');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse des données');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse des données', '5SE02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse des données');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '15', '0', '0', '5', '5', 'Français_', '', '
* Généralités sur l'analyse de données.
* Analyse en composantes principales (ACP)
* Analyse factorielle discriminante (AFD)
* Classification automatique; méthodes hiérarchiques
* Applications sur ordinateurs.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 3');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 3', '3AG23', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 3');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Découvrir les bases de l'anglais scientifique et les utiliser à l'écrit et à l'oral.', 'Travail de compréhension et d'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Probabilités');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Probabilités', '6MT05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Probabilités');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', '', '
 
  * Formalisme probabiliste
  * Variables aléatoires
  * Mesure image, loi d'une variable aléatoire
  * Lois à densité, exemples usuels
  * Loi d'un vecteur aléatoire
  * Indépendance
  * Moments
  * Diverses formes de convergence, espaces $L^p$
  * Loi des grands nombres.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mathématiques pour la finance');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mathématiques pour la finance', 'DLO6EF10', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mathématiques pour la finance');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '15', '0', '0', '5', '5', 'Français_', '', 'Le cours de mathématiques pour la finance donne aux étudiants les bases mathématiques pour aborder l'étude théorique des marchés financiers.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Unité d'enseignement libre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Unité d'enseignement libre', '', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Unité d'enseignement libre');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '20', '3', '3', 'Français_', 'Comprendre comment ce qu'on apprend dans le cadre d'un diplôme déjà très spécialisé ; s'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L'unité d'ouverture est à choisir, en début du semestre, parmi la centaine d'enseignements dédiés à cet usage et offerts par toutes les composantes de l'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d'unités d'ouverture :

* Sport.
* Traitement de signal et d'image.
* Droit de l'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l'espace, la voix.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'La page du site de l'université dédiée aux unités d'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Préparation au C2I');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Préparation au C2I', '1II01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Préparation au C2I');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '3', '3', 'Français_', '
Maîtriser les compétences D1, D2, D3, et D5 du référentiel national C2I1.
', '
Préparation aux domaines de compétences du réferentiel national suivant:

D1: Travailler dans un environnement numérique évolutif,
D2: Être responsable à l'aire du numérique,
D3: Produire, traiter, exploiter et diffuser des documents numériques,
D5: Travailler en réseau, communiquer et collaborer.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '
', '
', '', '
Unité obligatoire. 
');
