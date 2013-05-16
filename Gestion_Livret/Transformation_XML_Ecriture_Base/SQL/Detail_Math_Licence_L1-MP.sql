SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Math');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1-MP');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Interférences et diffraction');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Interférences et diffraction', '4PY06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Interférences et diffraction');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '18', '30', '4', '4', 'Français_', 'Donner les connaissances de base en optique ondulatoire.', '

*
Notion d'onde, l'onde progressive plane monochromatique (OPPM);
Le phénomène d'interférence à 2 ondes; -Condition d'interférence de la lumière, différence de marche, déphasage, ordre d'interférence;
* 
Interférences non localisées : - Conditions nécessaires à la formation d'interférences non localisées ; - Exemples de montages optiques permettant de former ce type d'interférences : fentes d'Young, miroir de Lloyd, miroirs de Fresnel, bi-lentilles de Billet.
*
Interférences localisées : - Conditions nécessaires à la formation d'interférences localisées et principales propriétés de ce type d'interférences : - Interférence par des lames à faces parallèles;- Interférences de "coin d'air"; - Exemples montage optique permettant l'observation de ces interférences : l'interféromètre Michelson.
*
Diffraction : - Principe d'Huygens-Fresnel, diffraction par une fente fine, 2 fentes fines; - Diffraction par $N$ fentes fines, réseau en transmission ; - Diffraction par une ouverture circulaire, résolution des instruments d'optique.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algorithmique et programmation 3');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algorithmique et programmation 3', '3IF02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algorithmique et programmation 3');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', 'Maîtrise des bases de la conception et de la programmation objet.', 'Présentation de l'approche objet (valeurs + message), bases de conception/analyse objet.
Notions de classes, méthodes, attributs, encapsulation, héritage (simple), interface, classes internes, exceptions... Mise en \oe uvre des interfaces graphiques et de la programmation événementielle.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (1 parmi 3).
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Lois fondamentales d'électricité linéaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Lois fondamentales d'électricité linéaire', '1PY03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Lois fondamentales d'électricité linéaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '12', '24', '3', '3', 'Français_', '
Acquérir les notions de base en électricité. Savoir analyser et câbler un circuit constitué de dipôles linéaires. Mesurer des tensions, des fréquences et des déphasages.
', '
\'Etude des circuits électriques linéaires en continu et alternatif. Les notions abordées sont les dipôles passifs et actifs, leurs associations, les théorèmes de Thévenin et de Norton, la puissance instantanée et la puissance complexe, les fonctions de transfert, la réponse temporelle d'un circuit et le régime transitoire. Les éléments de mathématiques (nombres complexes, équations aux dérivées ordinaires) seront utilisées dans ce module.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Géométrie du plan et de l'espace');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Géométrie du plan et de l'espace', '3MT12', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Géométrie du plan et de l'espace');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '36', '0', '0', '6', '6', 'Français_', '', '
* Relations d'équivalence et quotients,
* actions de groupes,
* notions de géométrie affine : points et vecteurs,
* repères, barycentres,
* droites et plans dans l'espace,
* applications affines,
* géométrie dans $\mathbb{C}$.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (1 parmi 3).
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Relativité et physique subatomique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Relativité et physique subatomique', '6PY07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Relativité et physique subatomique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '0', '0', 'Français_', 'Acquérir les bases de la relativité restreinte et de la physique subatomique pour pouvoir les appliquer à des phénomènes de la physique en général; avoir une introduction à la physique moderne.', '
Physique subatomique :: principe de la relativité; l'expérience de Michelson-Morley; transformation de Lorentz-Poincaré (TLP) : dilatation du temps, contraction de la longueur; Cône de lumière et l'espace-temps; invariants relativistes ; quadrivecteurs et mécanique relativiste ; Relation et conservation énergie-masse ; \'Electromagnétisme : tenseur du champ, équation de Maxwell sous forme tensorielle, invariance TLP ; principe d'équivalence, courbure de l'espace-temps.
Relativité :: noyaux et radioactivité; accélérateurs et collisionneurs ; forces faible et forte; familles des particules ; le photon comme boson; effets Compton.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle : au choix parmi 3.
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Optique matricielle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Optique matricielle', '2MT13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Optique matricielle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '2', '2', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (parmi 2). 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mécanique analytique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mécanique analytique', '5PY05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mécanique analytique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '3', '3', 'Français_', 'Notions de mécanique analytique. Décrire les comportements des systèmes à plusieurs degrés de liberté. Décrire les comportements des systèmes continus.', '

* Calcul variationnel, principe de moindre action, coordonnées généralisées, équations de Lagrange, systèmes conservatifs, frottement solide et visqueux. 
* Transformation de Legendre, équations de Hamilton, lois de conservation. 
* Application aux systèmes à plusieurs degrés de liberté, pulsations propres, modes propres, mouvements libres et exités. 
* Systèmes discrets à $n$ degrés de liberté(avec n grand), propagation d'une onde. Introduction aux systèmes continus : vibrations transversales des cordes,longitudinales des barres, libres et exitées.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Optique de Fourier');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Optique de Fourier', '6PY05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Optique de Fourier');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '4', '4', 'Français_', 'L'objectif de ce module est d'apporter aux étudiants une méthode utilisable dans divers domaines de la physique : optique, électronique, acoustique. ', 'Les phénomènes d'interférences et de diffraction sont présentés en utilisant le formalisme de Fourier. En application des phénomènes d'interférences on abordera les systèmes spectroscopiques. On étudiera ensuite le problème de la formation et du traitement des images. On verra comment utiliser le filtrage optique pour éliminer l'information inutile soit à grande, soit à petite échelle, et pour travailler le contraste afin de détecter des objets de phase.\vskip 0mm
Les bases mathématiques et la démarche de cet enseignement sont basées sur l'analyse de Fourier. Grâce à l'optique de Fourier, on montre les similitudes entre l'optique instrumentale et l'électronique. Dans les deux disciplines on voit que le signal à la sortie d'un appareil (optique ou électronique) apparaît comme la convolution du signal d'entrée avec la réponse impulsionnelle de l'appareil. Le complément expérimental indispensable à cet enseignement est donné dans le module "mesures physiques" du même semestre.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle : au choix parmi 3.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Unité d'enseignement libre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Unité d'enseignement libre', '', '');
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 5');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 5', '5AG35', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 5');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre l'information exprimée dans des messages complexes sur le domaine des sciences et technologies et s'exprimer sur ce même domaine à l'écrit dans un registre de langue approprié.', '
Travail de compréhension et d'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', ' 
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Calculus & calcul formel');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Calculus & calcul formel', '3MT13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Calculus & calcul formel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '48', '5', '5', 'Français_', 'Le but de ce module est d'aider les étudiants à mieux appréhender les calculs.', '

* La partie "calculus" permet de passer en revue les principaux points calculatoires qui doivent être maîtrisés pour la suite de la licence. Elle traite des fonctions usuelles, suites, dérivation, intégration, calculs de primitives, équations différentielles et d'algèbre (matrices, déterminants).
* La partie "calcul formel" est faite sur le logiciel "Sage". Après une prise en main du logiciel et de son mode de programmation, plusieurs exemples sont traités, comme les graphiques, les suites récurrentes, les résolutions exactes de systèmes linéaires et des équations différentielles.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (1 parmi 3). 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet de fin d'étude');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet de fin d'étude', '6ST01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet de fin d'étude');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '4', '8', '8', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mécanique des solides et vibration');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mécanique des solides et vibration', '3PY05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mécanique des solides et vibration');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '48', '6', '6', 'Français_', 'Pouvoir mettre en équation, analyser théoriquement et prédire l'évolution d'un solide indéformable simple et d'un système mécanique dans leurs mouvements.', '
Cinématique : 

* translation et rotation d'un solide ; 
* géométrie de masses ; 
* éléments cinétiques d'un système de points mécaniques et d'un solide indéformable ; 
* théorèmes généraux : étude dynamique, étude énergétique ; 
* contact entre solides et lois de frottement.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (1 parmi 3). 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Magnétisme dans le vide');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Magnétisme dans le vide', '4PY07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Magnétisme dans le vide');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '19', '20', '9', '0', '4', '4', 'Français_', 'Acquérir les bases fondamentales de la magnétostatique, des phénomènes électromagnétiques dépendant du temps et le phénomène de propagation des ondes électromagnétiques dans le vide', '

* Electrocinétique : définition de la densité et de l'intensité de courant ; loi d'Ohm locale.
* Magnétostatique : Loi de Biot et Savart; propriété du champ magnétique : flux conservatif, théorème d'Ampère; force de laplace et de Lorentz; interactions magnétiques entre circuits électriques : théorème de Maxwell: équations locales du champ magnétostatique; potentiel vecteur.
* Induction électromagnétique : observation du phénomène; loi de Faraday et de Lenz; auto-induction et induction mutuelle des circuits électriques;énergie potentielle magnétostatique.
* Equation de Maxwell : écriture dans le cas général et dans le vide; équation de propagation dans le vide.
* Ondes électromagnétiques progressives planes monochromatiques dans le vide;structure de l'onde; superposition d'ondes planes, ondes stationnaires; polarisation de l'onde; transport de l'énergie, vecteur de Poynting, intensité des ondes électromagnétiques.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Statistiques empiriques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Statistiques empiriques', '6MT07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Statistiques empiriques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '2', '2', 'Français_', '', '
 
  * Notion de modèle statistique et d'estimateur, estimateurs empiriques (moments)
  * Notions de consistance (LNG). Intervalles de confiance pour la moyenne d'échantillons gaussiens, intervalles de confiance approchés par théorème central limite.
  * Estimation par maximum de vraisemblance
  * Notion de tests statistiques  
  * Application avec le logiciel R.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physique quantique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physique quantique', '6PY01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physique quantique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '4', '4', 'Français_', 'Introduction aux concepts de la physique quantique.', '

* Concepts et phénomènes quantiques. Dualité onde-corpuscule. Inégalités de Heisenberg. 
* Fonction d'ondes. Equation de Schrödinger. \'Etats stationnaires. Notions d'opérateurs, valeurs moyennes. \'Etats liés. Quantification des énergies. 
* Potentiels périodiques. Notions de bandes d'énergie. Expérience de Sterne et Guerlach.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Atelier de l'informaticien');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Atelier de l'informaticien', '1IF04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Atelier de l'informaticien');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '3', '3', 'Français_', '
Installer, administrer, et utiliser un système Linux sur un PC.
', '
Notions sur le matériel, les systèmes d'exploitation, et les réseaux. Installation, administration, et utilisation d'un système Linux sur un PC
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Analyse numérique matricielle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Analyse numérique matricielle', '5MT05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Analyse numérique matricielle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '3', '3', 'Français_', '', '
 
  * Inversion de matrices,
  * Décompositions de matrices,
  * Moindres carrés,
  * Mise en \oe uvre avec le logiciel Scilab de calcul matriciel.

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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mécanique du point');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mécanique du point', '2PY01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mécanique du point');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '9', '51', '6', '6', 'Français_', 'Reprendre de façon plus formelle et rigoureuse les concepts abordés par les étudiants dans le secondaire (cinématique, lois fondamentales de la mécanique, concepts d'énergie cinétique, potentielle et mécanique).', '

* Analyse dimensionnelle et unités,
* Cinématique du point,
* Dynamique du point dans un référentiel galiléen,
* Travail, puissance, énergies (cinétique, potentielle et mécanique),
* Oscillateurs mécaniques (oscillateurs harmonique libre, amorti, en oscillations forcées, résonance),
* Forces centrales, forces de gravitation, satellites.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 1 (parmi 3). 
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = '\'Equations différentielles ordinaires : théorie et méthodes numériques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, '\'Equations différentielles ordinaires : théorie et méthodes numériques', '6MT06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='\'Equations différentielles ordinaires : théorie et méthodes numériques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '24', '0', '0', '5', '5', 'Français_', '', '
 
  * Définition et exemples
  * Notion de solution maximale, lemme de Gronwall, applications
  * Théorème de Cauchy-Lipschitz, théorème des bouts 
  * Stabilité  
  * Méthodes numériques.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Unité d'enseignement libre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Unité d'enseignement libre', '2UL05', '');
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 3');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 3', '3AG23', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 3');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Découvrir les bases de l'anglais scientifique et les utiliser à l'écrit et à l'oral', '
Travail de compréhension et d'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases de données et internet');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases de données et internet', '3IF03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases de données et internet');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '0', '24', '0', '5', '5', 'Français_', 'Être à même de concevoir et réaliser une application web dynamique utilisant une base de données relationnelles.', 'Architecture LAMP (Linux, Apache, MySQL, PHP). Modélisation d'une base de donnée : modélisation conceptuelle (entité-association) ; modélisation logique (relationnelle). Manipulation de données avec SQL. Structuration de pages web statiques et dynamiques. Réalisation d'une application web dynamique (type PHP / MySQL).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (1 parmi 3). 
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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Statistiques descriptives');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Statistiques descriptives', '2MT09', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Statistiques descriptives');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '0', '24', '2', '2', 'Français_', '', '
 
  * Présentation et prise en main du logiciel R,
  * Analyse des variables qualitatives et quantitatives.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 2 (parmi 2). 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 4');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 4', '4AG24', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 4');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Analyser dans une langue simple et cohérente les rapports entre science et société à l'écrit et à l'oral (niveau européen : B1+)', 'Travail de compréhension et d'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Champs électrostatiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Champs électrostatiques', '3PY01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Champs électrostatiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '19', '20', '9', '0', '6', '6', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 1 (1 parmi 3).
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 2', '2AG12', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre et s'exprimer de manière plus autonome dans des situations de séjour d'études universitaires en pays anglophone (niveau européen : B1)', 'Travail de compréhension et d'expression orale et écrite à partir de documents authentiques simples et/ou cours centrés sur le monde universitaire anglo-saxon. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Projet personnel et professionnel');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Projet personnel et professionnel', '2PP02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Projet personnel et professionnel');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 2');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '2', '10', '0', '0', '2', '2', 'Français_', 'Initiation à la recherche documentaire, au travail en groupes, à la présentation orale et à la présentation d'un poster', 'Cours : 

* présentation des objectifs,
* modalités de recherche documentaire,
* présentation du SUIO,
* élaboration d'une fiche de projet individuel.

TD : 

* recherche massive de documents sur le métier ou l'activité choisie,
* préparation d'une rencontre avec un professionnel correspondant au projet,
* préparation du rapport écrit, du poster et de la soutenance.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle. Option 1 (parmi 3).
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Thermodynamique et statique des fluides');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Thermodynamique et statique des fluides', '5PY15', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Thermodynamique et statique des fluides');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '22', '22', '16', '0', '5', '5', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Algorithmique et programmation 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Algorithmique et programmation 1', '1IF02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Algorithmique et programmation 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 1');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '15', '45', '6', '6', 'Français_', 'Maîtriser les concepts élémentaires de l'algorithmique et être capable de les traduire dans le langage C', 'Algorithmique élémentaire : expressions, variables, instructions, séquences, conditionnelles, boucles, tableaux, preuves, invariants, traduction dans le langage Java.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ondes électromagnétiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ondes électromagnétiques', '5PY16', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ondes électromagnétiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '0', '0', '3', '3', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
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
  * Formes quadratiques,
  * formes quadratiques réelles,
  * Espaces vectoriels euclidiens : projections orthogonales, adjoint,
  * espaces affines euclidiens : classification des isométries du plan et de l'espace,
  * Applications : coniques et quadriques, polynômes orthogonaux.
 
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
