SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Math');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-Pluri');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Prépro : Sensibilisation à l'enseignement des arts à l'école primaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Prépro : Sensibilisation à l'enseignement des arts à l'école primaire', '', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Prépro : Sensibilisation à l'enseignement des arts à l'école primaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '
* Aperçu des politiques et des pratiques d'éducation artistique scolaire,
* analyse de séquences et d'outils pédagogiques,
* étude théorique et pratique de modalités de rencontre avec des \oe uvres et des démarches artistiques.

', '
* Découvrir l'enseignements des arts visuels et de l'éducation musicale en milieu scolaire (apports pratiques et théoriques, modalité d'interventions, actions en partenariat, etc.;
* Identifier ses repères artistiques et culturels personnels, les développer et les compléter, en vue de transpositions pédagogiques possibles à destination d'un public scolaire (médiation ou intervention culturelle, enseignement généraliste ou spécialisé).
* Favoriser les rencontres réelles avec des \oe uvres ou des artistes.
* Entrevoir des liens avec d'autres disciplines.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle choix 2.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mathématiques - Géométrie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mathématiques - Géométrie', '6MT51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mathématiques - Géométrie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '24', '0', '0', '0', '0', 'Français_', 'Caractériser les isométries du plan et de l'espace.', '

* Espaces affines et applications affines, barycentre, projections, groupe affine, homothéties;
* espace affine euclidien et isométries, produit scalaire, orthogonalité, groupe orthogonal et groupe spécial orthogonal, projecteurs orthogonaux.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physique', '5PY51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '16', '0', '4', '4', 'Français_', 'Acquisition de connaissances en physique afin de comprendre quelques phénomènes rencontrés dans la vie courante.', '

* Historique sur l'évolution de certains concepts en physique au travers du temps.
* Notions de base en électricité et mécanique.
* \'Etude de quelques phénomènes physiques, de leur utilisation et applications pour différents instruments et dans différents domaines.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Entomofaune et flore de la région Centre');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Entomofaune et flore de la région Centre', '5BO11', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Entomofaune et flore de la région Centre');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '4', '32', '0', '4', '4', 'Français_', '

* Permettre à l'étudiant de découvrir des milieux naturels de notre région, participer à l'inventaire de la faune et de la flore par la réalisation d'un herbier personnel et d'une boîte de référence d'insectes. 
* Savoir reconnaître les espèces courantes de la flore et de la faune de la région. 
* Savoir utiliser une faune et une flore.

', '

* Inventaire et diversité taxonomique des principaux groupes d'animaux.
* Floristique et systématique du monde végétal. Clefs pour le détermination des taxons rencontrés.
* Mesure des indices de diversité. Observation sur le terrain (un groupe TP terrain encadré par 2 enseignants) et analyses en laboratoire (TP).

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Prépro : Sensibilisation à l'enseignement des histoire-géographie à l'école primaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Prépro : Sensibilisation à l'enseignement des histoire-géographie à l'école primaire', '', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Prépro : Sensibilisation à l'enseignement des histoire-géographie à l'école primaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases anatomiques des grandes fonctions animales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases anatomiques des grandes fonctions animales', '5BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases anatomiques des grandes fonctions animales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '14', '0', '10', '0', '3', '3', 'Français_', 'Acquisition de l'anatomie et de l'histologie des grandes fonctions avant d'appréhender la
physiologie.', '

* Cours : Organisation des tissus : tissus épithéliaux - conjonctifs - musculaires. Description anatomique et histologique des appareils : circulatoires - respiratoire - digestif excréteur et reproducteur.
* TP : Illustration du cours à partir de préparations et de coupes histologiques - \'Etude de l'organisation de tous les appareils présentés en cours chez une souris. Les TP pourront être enseignés en anglais.

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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Enseigner : posture et identité');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Enseigner : posture et identité', '', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Enseigner : posture et identité');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '

* Prendre la mesure des écarts possibles entre le métier désiré, le métier réel et le métier prescrit. 
* Connaître le référentiel de compétences de la formation des maîtres. 
* \^Etre capable de décrire, analyser et comparer des pratiques professionnelles en identifiant les compétences prescrites.

', '

* \'Etudes de documents textuels, audio, vidéo ou multimédia en rapport avec les compétences des enseignants dans les domaines de la relation éducative, de la pédagogie et de la didactique des disciplines.
* Enseignement sur les valeurs de l'éducation, l'éthique et la déontologie.
* Appropriation du référentiel de compétences du professeur.
* Méthodologie d'analyse de situations professionnelles.
* Conception et exploitation d'enquètes documentaires réalisées auprès des acteurs du terrain (professeurs, élèves, parents, équipes éducatives, chefs d'établissement...)
* \'Etude de cas, analyses de pratiques ou études de situations professionnelles sur la base d'observations directes (enquètes) ou indirectes (documents textuels, audio, vidéo ou multimédia).

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Théâtre, poésie et textes de réflexion');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Théâtre, poésie et textes de réflexion', '6FC51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Théâtre, poésie et textes de réflexion');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, '6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '24', '0', '0', '5', '5', 'Français_', '

* Donner des repères en histoire littéraire; 
* étudier des textes littéraires classiques et contemporains dans le domaine du théâtre et de la poésie ; 
* s'initier à la synthèse de textes de réflexion;
* systématiser l'apprentissage de la grammaire de phrase;
* connaître les règles d'organisation du lexique français.

', '\begin{description}
\item[Littérature]

* appropriation des notions mises en jeu dans l'approche littéraire du théâtre et de la poésie,
* analyse de textes littéraires,
* approche des mouvements esthétiques.

\item[Langue]

* éléments de grammaire de phrase (approfondissement),
* niveaux de langue, figures de style et organisation du lexique français (dont formation des mots).

\item[Argumentation]

* lecture, analyse et production d'écrits de réflexion.

\end{description}
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physiologie humaines et comparées');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physiologie humaines et comparées', '6BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physiologie humaines et comparées');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '34', '0', '14', '0', '0', '0', 'Français_', 'Ce module présente les notions de base physiologie anaimale et humaine nécessaires pour une compréhension des mécanismes physiologiques chez l'humain. Il constitue les bases nécessaires pour un étudiant de biologie des organismes, les fondements (à renforcer lors de la préparation au {\sc capes svt}), pour un étudiant du parcours {\sc bgst} et l'essentiel pour un enseignement dans les classes de l'école élémentaire (étudiants du parcours pluri).', '

* Compartiments liquidiens de l'organisme. Hématologie, bases d'immunologie. Physiologie des systèmes cardio-vasculaire et respiratoire : aspects anatomo-fonctionnels et régulations; Fonctionnement du système digestif, cheminement de l'aliment de la bouche à l'absorbtion intestinale. Physiologie du néphron. Physiologie osseuse et de l'ossification. 
* Introduction aux neurosciences : organisation du cerveau, activités du système nerveux central et périphérique, bases de physiologie sensorielle.
* Introduction à l'endocrinologie : organisation d'une glande, physiologie hormonale. 
* Physiologie de la reproduction : de la production des gamètes à la naissance; liens entre système hypothamo-hypophysaire et gonades.

Les travaux pratiques illustreront le cours sous formes d'ateliers expérimentaux. Certaines des activités proposées pourront être enseignées en anglais.
L'organisation générale anatomique de l'animal, nécessaire pour la compréhension des aspects physiologiques, sera illustrée à l'aide du modèle murin.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Mathématiques 1 : Les nombres');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Mathématiques 1 : Les nombres', '5MT51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Mathématiques 1 : Les nombres');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '30', '0', '0', '5', '5', 'Français_', 'Théorie des nombres entiers, divisibilité et passage des nombres rationnels aux réels.', '
 
* Arithmétique : {\sc pgcd}, {\sc ppcm}, nombres premiers, congruences, écriture en base $a$.
* Nombres réels : décimaux, rationnels, développement décimal.

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Français');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Français', '5FC51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Français');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '28', '0', '12', '5', '5', 'Français_', '

* Connaître les formes narratives en termes de type d'écrits, de type de séquences textuelles et de genres; 
* connaître des éléments de narratologie et de critique littéraire;
* connaître les éléments de base des grammaires de texte et de phrase.

', '
\begin{description}
\item[Littérature]
 
* appropriation des notions mises en jeu dans l'approche littéraire des genres narratifs majeurs (le roman, la nouvelle, le conte, la fable),
* analyse de textes littéraires narratifs (registres réaliste, fantastique, merveilleux),
* production d'écrits narratifs et descriptifs.

\item[Grammaire]
 
* éléments de grammaire textuelle,
* éléments de grammaire de phrase.

\end{description}
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie, énergie et environnement');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie, énergie et environnement', '6CH51', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie, énergie et environnement');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '28', '8', '12', '0', '5', '5', 'Français_', 'Outre l'acquisition de connaissances pratiques et théoriques en chimie, les objectifs de cette unité sont de montrer l'influence de la chimie dans la vie quotidienne et de susciter l'envie de comprendre et d'expliquer le fonctionnement de ce qui nous entoure.', '
* Notions de base en chimie, axées sur la matière, ses différents états (solide, liquide, gaz) et ses transformations.
* Les différentes sources d'énergie (fossiles, nucléaire, renouvelables) et leur impact sur l'environnement.
* Les propriétés physico-chimiques de l'air et de l'eau (aspects généraux, caractéristiques et pollutions).
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 6');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 6', '6AG36', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 6');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '24', '3', '3', 'Français_', 'Comprendre l'information exprimée dans des messages complexes sur le domaine des sciences et technologies, et s'exprimer sur ce même domaine à l'oral avec un degré suffisant de spontanéité et de fluidité (niveau européen B2).', '
Travail de compréhension et d'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et des avancées scientifiques.
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Prépro : Sensibilisation à l'enseignement de l'éducation physique et sportive à l'école primaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Prépro : Sensibilisation à l'enseignement de l'éducation physique et sportive à l'école primaire', '', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Prépro : Sensibilisation à l'enseignement de l'éducation physique et sportive à l'école primaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '
* Découvrir l'enseignement de l'EPS et de ses particularités (et ainsi renforcer une capacité d'observation et d'analyse de l'acte d'enseignement);
* Donner "confiance en soi" à des étudiants dans leur pratique physique;
* Aider au choix de l'option proposée au CRPE (concours professeur des écoles).

', '

* Relevé des représentations initiales des étudiants sur l'EPS puis construction
d'une grille d'observation (ou adaptation de celle construite dans un autre module de sensibilisation aux métiers de l'enseignement.
* Observation de séances d'EPS en classe à partir de la grille construite puis analyse ensemble.
* Pratique de différentes activités et sportives en liaison avec leur enseignement à l'école (maternelle et élémentaire) pour la réussite de tous(seront ici abordées les notions de motivation, de différentiation, de réussite scolaire, de métacognition, de plaisir d'agir)...

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité optionnelle choix 1.
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Paysages et objets géologiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Paysages et objets géologiques', '6GE01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Paysages et objets géologiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 6');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '14', '10', '12', '0', '4', '4', 'Français_', '', '
CM :: Eléments de pétrographie, de géodynamique, de géomorphologie et de paléontologie. Volcans et séismes, risques naturels.
TD :: Pétrographie macroscopique, paléontologie des grands groupes fossiles.
TP :: Initiation à la lecture des cartes topographiques et géologiques. Sortie géologique (1 journée).

', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Informatique : C2I');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Informatique : C2I', '5II01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Informatique : C2I');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 5');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', '

* Comprendre les systèmes informatiques (matériels, systèmes d'exploitation, réseaux);
* se familiariser avec les systèmes informatiques.

', '
\begin{description}
\item[Architecture PC :]

* les différentes composantes (principales caractéristiques, fonctions...) : carte-mère, processeur, mémoire, carte graphique, disque dur, lecteur graveur DVD/Blu-ray...
* principe de fonctionnement d'un PC
* montage matériel d'un PC
* Bios et SETUP (différentes rubriques, réglages, optimisation...)
* les ressources systèmes (RAM, E/S, DMA, IRQ), gestion des ressources, gestion des conflits, conséquences d'un conflit, résolution.

\item[Système d'exploitation :]

* système d'exploitation (notions fondamentales, exemples : famille Windows, famille Linux)
* Partition (primaire, étendue, active, lecteurs logiques...)
* Système de gestion de fichiers : FAT32, NFTS, EXT3, EXT4, ...
* Installation d'un système double boot (Windows/Ubuntu)
* Optimisation système.

\item[Réseau :]

* Notions de base (matériels, protocoles,...)
* Réseau Egal/Egal, Client/Serveur, Internet, Extranet, Intranet
* Installation d'un réseau
* partage de ressources

\end{description}
', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Ressources
', 'Biblio
', '', '
Unité obligatoire. 
');
