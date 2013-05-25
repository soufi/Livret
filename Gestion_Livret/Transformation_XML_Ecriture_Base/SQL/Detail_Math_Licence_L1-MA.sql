SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Math');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Math');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1-MA');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L1-MA');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L1-MA');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 3' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 3', '3', '0', '24', '0', '0', '3', '3', 'Français_', 'Découvrir les bases de l\'anglais scientifique et les utiliser à l\'écrit et à l\'oral.', 'Travail de compréhension et d\'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 1 & 2 ou environ 450 heures de formation équivalente.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 3' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et séries de fonctions' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Suites et séries de fonctions', '4', '24', '24', '0', '0', '5', '5', 'Français_', 'Apprendre à manipuler des suites de fonctions et des intégrales dépendant d\'un paramètre.', '* Suites et séries de fonctions,
  * Séries entières, séries de Fourier,
  * Intégrales dépendant d\'un paramètre.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 2 au semestre 3.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et séries de fonctions' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données et internet' AND _ECTS_='5' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Bases de données et internet', '3', '12', '0', '24', '0', '5', '5', 'Français_', 'Être à même de concevoir et réaliser une application web dynamique utilisant une base de données relationnelles.', 'Architecture LAMP (Linux, Apache, MySQL, PHP). Modélisation d\'une base de donnée : modélisation conceptuelle (entité-association) ; modélisation logique (relationnelle). Manipulation de données avec SQL. Structuration de pages web statiques et dynamiques. Réalisation d\'une application web dynamique (type PHP / MySQL).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Maîtrise des bases de l\'algorithmique et de la programmation (pour la réalisation de l\'application web).', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Bases de données et internet' AND _ECTS_='5' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jérôme' AND _PRENOM_ENS_='Durand-Lose' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jérôme', 'Durand-Lose', 'jerome.durand-lose@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jérôme' AND _PRENOM_ENS_='Durand-Lose' AND _EMAIL_ENS_='jerome.durand-lose@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse des données' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse des données', '4', '0', '0', '0', '24', '3', '3', 'Français_', '', '* Initiation aux méthodes élémentaires d\'analyse multidimensionnelle. En quantitatif, Analyse en Composantes Principales (ACP) ; en qualitatif, Analyse Factorielle des Correspondances (AFC) ;
  * Applications à des jeux de données exemples (avec le logiciel R).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse des données' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sophie' AND _PRENOM_ENS_='Jacquot' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sophie', 'Jacquot', 'sophie.jacquot@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sophie' AND _PRENOM_ENS_='Jacquot' AND _EMAIL_ENS_='sophie.jacquot@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Topologie des espaces métriques' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Topologie des espaces métriques', '5', '24', '36', '0', '0', '6', '6', 'Français_', '', '* Distances, normes
  * Convergences de suites, continuité
  * Espaces complets
  * Espaces compacts
  * Espaces vectoriels normés, applications linéaires continues
  * Connexité', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Topologie des espaces métriques' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 3' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Algorithmique et programmation 3', '3', '24', '36', '0', '0', '6', '6', 'Français_', 'Maîtrise des bases de la conception et de la programmation objet.', 'Présentation de l\'approche objet (valeurs + message), bases de conception/analyse objet.
Notions de classes, méthodes, attributs, encapsulation, héritage (simple), interface, classes internes, exceptions... Mise en \oe uvre des interfaces graphiques et de la programmation événementielle.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Programmation impérative, algorithmes et structures de données (algorithmique et programmation 1 et 2).', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 3' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Mathieu' AND _PRENOM_ENS_='Liedloff' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Mathieu', 'Liedloff', 'mathieu.liedloff@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Mathieu' AND _PRENOM_ENS_='Liedloff' AND _EMAIL_ENS_='mathieu.liedloff@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Unité d\'enseignement libre', '5', '0', '0', '0', '20', '3', '3', 'Français_', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Outils numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Outils numériques', '6', '0', '0', '0', '36', '4', '4', 'Français_', '\'Etudier des méthodes numériques itératives de résolution de problèmes mathématiques (résoudre une équation, calculer une intégrale, représenter une courbe, minimiser une fonction) issus de modèles concrets. Mettre en \oe uvre ces méthodes sous Scilab.', '* Rappels sur les recherches des zéros, quadratures;
  * interpolation;
  * notions d\'optimisation numérique : descentes de gradient.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Connaître le langage Scilab ; avoir intégré les notions d\'analyse du semestre 5.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Outils numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Cécile', 'Louchet', 'cecile.louchet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='cecile.louchet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Atelier de l\'informaticien' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Atelier de l\'informaticien', '1', '0', '0', '0', '24', '3', '3', 'Français_', 'Installer, administrer, et utiliser un système Linux sur un PC.', 'Notions sur le matériel, les systèmes d\'exploitation, et les réseaux. Installation, administration, et utilisation d\'un système Linux sur un PC.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Atelier de l\'informaticien' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Réty' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pierre', 'Réty', 'pierre.rety@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pierre' AND _PRENOM_ENS_='Réty' AND _EMAIL_ENS_='pierre.rety@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UL');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UL', 'Unité d\'enseignement libre', '2', '0', '20', '0', '0', '3', '3', 'Français_', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', 'Unité obligatoire');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UL');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques empiriques' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Statistiques empiriques', '6', '0', '0', '0', '24', '2', '2', 'Français_', '', '* Notion de modèle statistique et d\'estimateur, estimateurs empiriques (moments)
  * Notions de consistance (LNG). Intervalles de confiance pour la moyenne d\'échantillons gaussiens, intervalles de confiance approchés par théorème central limite.
  * Estimation par maximum de vraisemblance
  * Notion de tests statistiques  
  * Application avec le logiciel R.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Statistiques descriptives (unité du semestre 2).', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques empiriques' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Didier' AND _PRENOM_ENS_='Chauveau' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Didier', 'Chauveau', 'didier.chauveau@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Didier' AND _PRENOM_ENS_='Chauveau' AND _EMAIL_ENS_='didier.chauveau@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Probabilités', '6', '24', '36', '0', '0', '6', '6', 'Français_', '', '* Formalisme probabiliste
  * Variables aléatoires
  * Mesure image, loi d\'une variable aléatoire
  * Lois à densité, exemples usuels
  * Loi d\'un vecteur aléatoire
  * Indépendance
  * Moments
  * Diverses formes de convergence, espaces $L^p$
  * Loi des grands nombres.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Athanasios', 'Batakis', 'athanasios.batakis@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités discrètes' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Probabilités discrètes', '4', '18', '36', '0', '0', '5', '5', 'Français_', 'S\'initier aux probabilités discrètes.', '* Espace des possibles - Modélisation de phénomènes aléatoires ;
* Notions de dénombrement ;
* Calculs des probabilités : union disjointe, formule des probabilités totales, formule du crible
* Probabilités conditionnelles, indépendance, formule de Bayes, Variables aléatoires discrètes - Lois usuelles - Moments ;
* Sensibilisation à la loi des grands nombres.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi les modules de mathématiques du semestre 3.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités discrètes' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au C2I' AND _ECTS_='3' AND _CODE_MAT_='II');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'II', 'Préparation au C2I', '1', '0', '0', '0', '24', '3', '3', 'Français_', 'Maîtriser les compétences D1, D2, D3, et D5 du référentiel national C2I1.', 'Préparation aux domaines de compétences du réferentiel national suivant:

D1: Travailler dans un environnement numérique évolutif,
D2: Être responsable à l\'aire du numérique,
D3: Produire, traiter, exploiter et diffuser des documents numériques,
D5: Travailler en réseau, communiquer et collaborer.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', '', '', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au C2I' AND _ECTS_='3' AND _CODE_MAT_='II');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='Kahlem' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'Kahlem', 'laure.kahlem@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='Kahlem' AND _EMAIL_ENS_='laure.kahlem@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Groupes, symétries, divisibilité' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Groupes, symétries, divisibilité', '2', '0', '0', '0', '60', '6', '6', 'Français_', '', '* Le plan et l\'espace euclidien : produit scalaire, produit vectoriel,
  * Symétries dans le plan,
  * groupes : définitions et exemples,
  * groupes cycliques, groupes symétriques, groupes diédraux,
  * symétries des polyèdres,
  * groupes abéliens finis,
  * anneaux : définitions et exemples,
  * divisibilité des polynômes.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Arithmétique et Introduction au raisonnement mathématique au semestre 1.', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 1 (parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Groupes, symétries, divisibilité' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Luc', 'Hillairet', 'luc.hillairet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='luc.hillairet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Optique matricielle' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Optique matricielle', '2', '0', '0', '0', '24', '2', '2', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (parmi 2).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Optique matricielle' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Gerald' AND _PRENOM_ENS_='Kneller' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Gerald', 'Kneller', 'gerald.kneller@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Gerald' AND _PRENOM_ENS_='Kneller' AND _EMAIL_ENS_='gerald.kneller@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse 1', '2', '0', '0', '0', '60', '6', '6', 'Français_', 'S\'initier aux méthodes plus fines d\'analyse des fonctions réelles.', '* Continuité uniforme,
  * Dérivation, fonctions dérivables sur un intervalle, dérivée d\'une fonction réciproque,
  * Théorème de Taylor, développements limités,
  * Introduction à l\'intégrale de Riemann,
  * Calcul des primitives.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Suites et fonctions réelles au S1.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 1' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 1', '1', '0', '24', '0', '0', '3', '3', 'Français_', 'Être à même de préparer un projet de séjour d\'études universitaires en pays anglophone dans une langue écrite et orale simple.', 'Travail de compréhension et d\'expression orale et écrite, à partir de documents authentiques simples, ou courts, centrés sur le monde universitaire anglo-saxon.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 1' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Murielle' AND _PRENOM_ENS_='Pasquet' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Murielle', 'Pasquet', 'murielle.pasquet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Murielle' AND _PRENOM_ENS_='Pasquet' AND _EMAIL_ENS_='murielle.pasquet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse 2', '3', '24', '36', '0', '0', '6', '6', 'Français_', 'Approfondir les notions sur les suites, et s\'initier aux intégrales généralisées', '* Suites de Cauchy - Suites extraites - Théorème de Bolzano-Weierstrass,
  * Séries numériques,
  * Intégrales généralisées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 1 au semestre 2.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mesure et intégration' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Mesure et intégration', '5', '24', '36', '0', '0', '6', '6', 'Français_', '', '* Tribus, mesures ; mesure de Lebesgue
  * Intégrale par rapport à une mesure
  * Théorèmes de convergence monotone, de convergence dominée 
  * Théorème de Fubini
  * Convolution
  * Transformée de Fourier
  * Espaces $L^p$.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mesure et intégration' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Athanasios', 'Batakis', 'athanasios.batakis@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 6', '6', '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre l\'information exprimée dans des messages complexes sur le domaine des sciences et technologies, et s\'exprimer sur ce même domaine à l\'oral avec un degré suffisant de spontanéité et de fluidité (niveau européen B2).', 'Travail de compréhension et d\'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et des avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 5 ou environ 500 heures de formation équivalente.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Groupes et applications' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Groupes et applications', '5', '20', '40', '0', '0', '6', '6', 'Français_', '', '* Rappels et compléments sur les groupes
  * Extensions de corps
  * Groupes résolubles
  * Les groupes classiques : le groupe linéaires, le groupe orthogonal, le groupe unitaire
  * Le demi-plan de Poincaré.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Groupes et applications' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Géométrie du plan et de l\'espace' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Géométrie du plan et de l\'espace', '3', '24', '36', '0', '0', '6', '6', 'Français_', '', '* Relations d\'équivalence et quotients,
* actions de groupes,
* notions de géométrie affine : points et vecteurs,
* repères, barycentres,
* droites et plans dans l\'espace,
* applications affines,
* géométrie dans $\mathbb{C}$.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Géométrie du plan et de l\'espace' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean', 'Renault', 'jean.renault@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='jean.renault@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calcul différentiel et optimisation' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Calcul différentiel et optimisation', '6', '24', '36', '0', '0', '6', '6', 'Français_', '', '* Différentielle d\'ordre 1,
  * Inversion locale, théorème des fonctions implicites,
  * Différentielle d\'ordre 2, formule de Taylor,
  * Extrema liés.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calcul différentiel et optimisation' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Luc', 'Hillairet', 'luc.hillairet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='luc.hillairet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre 2', '3', '24', '36', '0', '0', '6', '6', 'Français_', 'Se former à l\'étude spectrale de matrices.', '* Valeurs propres, vecteurs propres,
  * Polynôme caractéristique,
  * Diagonalisation - Trigonalisation,
  * Polynômes d\'endomorphismes,
  * Polynômes annulateurs,
  * Anneaux de polynômes [optionnel].', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Algèbre 1 au semestre 2.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='\'Equations différentielles ordinaires : théorie et méthodes numériques' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', '\'Equations différentielles ordinaires : théorie et méthodes numériques', '6', '24', '24', '0', '0', '5', '5', 'Français_', '', '* Définition et exemples
  * Notion de solution maximale, lemme de Gronwall, applications
  * Théorème de Cauchy-Lipschitz, théorème des bouts 
  * Stabilité  
  * Méthodes numériques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Unités d\'analyse des semestres précédents.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='\'Equations différentielles ordinaires : théorie et méthodes numériques' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Stéphane' AND _PRENOM_ENS_='Cordier' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Stéphane', 'Cordier', 'stephane.cordier@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Stéphane' AND _PRENOM_ENS_='Cordier' AND _EMAIL_ENS_='stephane.cordier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Arithmétique dans Z' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Arithmétique dans Z', '1', '0', '0', '0', '24', '3', '3', 'Français_', 'Grâce aux exemples d\'arithmétique élémentaire, découvrir l\'importance de quelques structures algébriques.', '* Divisibilité,
  * PGCD-PPCM,
  * théorèmes de Bézout et de Gauss,
  * décomposition en produits de facteurs premiers,
  * congruences.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mathématiques de Terminale S.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Arithmétique dans Z' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Emmanuel' AND _PRENOM_ENS_='Cépa' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Emmanuel', 'Cépa', 'emmanuel.cepa@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Emmanuel' AND _PRENOM_ENS_='Cépa' AND _EMAIL_ENS_='emmanuel.cepa@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions holomorphes' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Fonctions holomorphes', '6', '0', '0', '0', '36', '4', '4', 'Français_', 'S\'initier à l\'analyse complexe.', '* Définition, exemples
  * Formule intégrale de Cauchy
  * Théorèmes de Liouville, d\'Alembert, principe du maximum  
  * Théorème des résidus, application au calcul d\'intégrales.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions holomorphes' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Michel' AND _PRENOM_ENS_='Zinsmeister' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Michel', 'Zinsmeister', 'michel.zinsmeister@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Michel' AND _PRENOM_ENS_='Zinsmeister' AND _EMAIL_ENS_='michel.zinsmeister@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction au raisonnement math\'ematique' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Introduction au raisonnement math\'ematique', '1', '0', '0', '0', '60', '6', '6', 'Français_', 'Savoir mettre en \oe uvre un raisonnement mathématique de base.', '* Logique \'el\'ementaire, implication, quantificateurs,
  * Les différents types de démonstrations en mathématiques (implication directe, récurrence, preuve par l\'absurde ...),
  * Manipulations ensemblistes, application d\'un ensemble vers un autre,
  * Applications injectives, surjectives, bijectives,
  * Nombres complexes,
  * Systèmes lin\'eaires, familles libres, matrices dans $\mathbb{R}^2$ et $\mathbb{R}^3$.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mathématiques de Terminale S.', '', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction au raisonnement math\'ematique' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Cécile', 'Louchet', 'cecile.louchet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='cecile.louchet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Unité d\'enseignement libre', '4', '0', '20', '0', '0', '3', '3', 'Français_', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Insertion professionnelle' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Insertion professionnelle', '5', '0', '0', '0', '12', '3', '3', 'Français_', 'Se préparer à l\'insertion professionnelle.', 'Préparation de CV, de lettres de motivation, gestion de carrière.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Insertion professionnelle' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pôle' AND _PRENOM_ENS_='Avenir' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pôle', 'Avenir', 'poleavenir.ove@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pôle' AND _PRENOM_ENS_='Avenir' AND _EMAIL_ENS_='poleavenir.ove@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 4' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 4', '4', '0', '24', '0', '0', '3', '3', 'Français_', 'Analyser dans une langue simple et cohérente les rapports entre science et société à l\'écrit et à l\'oral (niveau européen : B1+)', 'Travail de compréhension et d\'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 3 ou environ 450 heures de formation équivalente.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 4' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Michèle' AND _PRENOM_ENS_='Cimolino' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Michèle', 'Cimolino', 'michele.cimolino@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Michèle' AND _PRENOM_ENS_='Cimolino' AND _EMAIL_ENS_='michele.cimolino@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Champs électrostatiques' AND _ECTS_='6' AND _CODE_MAT_='PY');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PY', 'Champs électrostatiques', '3', '19', '20', '9', '0', '6', '6', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 1 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Champs électrostatiques' AND _ECTS_='6' AND _CODE_MAT_='PY');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Gerald' AND _PRENOM_ENS_='Kneller' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Gerald', 'Kneller', 'gerald.kneller@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Gerald' AND _PRENOM_ENS_='Kneller' AND _EMAIL_ENS_='gerald.kneller@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre 1', '2', '0', '0', '0', '60', '6', '6', 'Français_', 'Se familiariser avec les polynômes. Apprendre l\'algèbre linéaire et manipuler des matrices.', '* Arithmétique des polynômes, décomposition des fractions rationnelles,
  * Espaces et sous-espaces vectoriels,
  * Bases en dimension finie, théorie de la dimension,
  * Applications linéaires,
  * Matrices, calcul matriciel,
  * Déterminant.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Introduction au raisonnement mathématique au S1.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Patrick' AND _PRENOM_ENS_='Maheux' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Patrick', 'Maheux', 'patrick.maheux@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Patrick' AND _PRENOM_ENS_='Maheux' AND _EMAIL_ENS_='patrick.maheux@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions de plusieurs variables, courbes et surfaces paramétrées' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Fonctions de plusieurs variables, courbes et surfaces paramétrées', '4', '24', '24', '0', '0', '5', '5', 'Français_', '', '* Fonctions de plusieurs variables,
  * Intégrales multiples,
  * Courbes et surfaces paramétrées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 2.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions de plusieurs variables, courbes et surfaces paramétrées' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Martin' AND _PRENOM_ENS_='Grensing' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Martin', 'Grensing', 'martin.grensing@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Martin' AND _PRENOM_ENS_='Grensing' AND _EMAIL_ENS_='martin.grensing@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse numérique matricielle' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse numérique matricielle', '5', '0', '0', '0', '24', '3', '3', 'Français_', '', '* Inversion de matrices,
  * Décompositions de matrices,
  * Moindres carrés.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi ``Mathématiques numériques\'\' au semestre 3 et l\'ensemble des modules d\'algèbre des semestres précédents.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse numérique matricielle' AND _ECTS_='3' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Carine', 'Lucas', 'carine.lucas@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='carine.lucas@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 5' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 5', '5', '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre l\'information exprimée dans des messages complexes sur le domaine des sciences  er technologies et s\'exprimer sur ce même domaine à l\'écrit dans un registre de langue approprié.', 'Travail de compréhension et d\'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi anglais 3 & 4 ou environ 500 heures de formation équivalente.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 5' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Hervé', 'Perreau', 'herve.perreau@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='herve.perreau@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Mathématiques numériques', '3', '0', '0', '0', '36', '4', '4', 'Français_', 'Se familiariser avec le logiciel de calcul matriciel Scilab.', '* Introduction à Scilab,
  * Manipulation de données matricielles,
  * Construction de vecteurs, matrices, extraction de sous-matrices,
  * Représentation graphique 2D,
  * Suites récurrentes,
  * Systèmes linéaires - Pivot de Gauss,
  * Générateurs aléatoires, lois uniformes, simulation de lois discrètes,
  * Introduction aux équations différentielles,
  * Quelques problèmes de mathématiques appliquées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi les modules de mathématiques de première année.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Carine', 'Lucas', 'carine.lucas@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='carine.lucas@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et fonctions réelles' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Suites et fonctions réelles', '1', '0', '0', '0', '60', '6', '6', 'Français_', 'Ce module d\'analyse traite des suites et fonctions réelles. Les notions de limite, de continuité, de dérivabilité sont proprement établies et permettent alors l\'étude précise de suites et de fonctions.', '* Structures d\'ordre, majorants-minorants, bornes supérieures et inférieures,
  * Suites numériques: étude, convergence, suites récurrentes,
  * Fonctions numériques: limite, continuité,
  * Dérivabilité, fonctions usuelles, étude de fonctions,
  * Fonctions réciproques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mathématiques de Terminale S.', '', '', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et fonctions réelles' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Philippe' AND _PRENOM_ENS_='Anker' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean-Philippe', 'Anker', 'jean-philippe.anker@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean-Philippe' AND _PRENOM_ENS_='Anker' AND _EMAIL_ENS_='jean-philippe.anker@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mécanique des solides et vibration' AND _ECTS_='6' AND _CODE_MAT_='PY');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PY', 'Mécanique des solides et vibration', '3', '0', '0', '0', '48', '6', '6', 'Français_', 'Pouvoir mettre en équation, analyser théoriquement et prédire l\'évolution d\'un solide indéformable simple et d\'un système mécanique dans leurs mouvements.', 'Cinématique : 

* translation et rotation d\'un solide ; 
* géométrie de masses ; 
* éléments cinétiques d\'un système de points mécaniques et d\'un solide indéformable ; 
* théorèmes généraux : étude dynamique, étude énergétique ; 
* contact entre solides et lois de frottement.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mécanique du point; Mathématiques pour sciences physiques 1 & 2', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mécanique des solides et vibration' AND _ECTS_='6' AND _CODE_MAT_='PY');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Isabelle' AND _PRENOM_ENS_='Rannou' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Isabelle', 'Rannou', 'isabelle.rannou@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Isabelle' AND _PRENOM_ENS_='Rannou' AND _EMAIL_ENS_='isabelle.rannou@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 2' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 2', '2', '0', '24', '0', '0', '3', '3', 'Français_', 'Comprendre et s\'exprimer de manière plus autonome dans des situations de séjour d\'études universitaires en pays anglophone (niveau européen : B1)', 'Travail de compréhension et d\'expression orale et écrite à partir de documents authentiques simples et/ou cours centrés sur le monde universitaire anglo-saxon. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'avoir suivi Anglais 1 ou environ 400 heures de formation équivalente', 'Ressources', 'Biblio', '', 'Unité obligatoire');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 2' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calculus & calcul formel' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Calculus & calcul formel', '3', '0', '0', '0', '48', '5', '5', 'Français_', 'Le but de ce module est d\'aider les étudiants à mieux appréhender les calculs.', '* La partie "calculus" permet de passer en revue les principaux points calculatoires qui doivent être maîtrisés pour la suite de la licence. Elle traite des fonctions usuelles, suites, dérivation, intégration, calculs de primitives, équations différentielles et d\'algèbre (matrices, déterminants).
* La partie "calcul formel" est faite sur le logiciel "Sage". Après une prise en main du logiciel et de son mode de programmation, plusieurs exemples sont traités, comme les graphiques, les suites récurrentes, les résolutions exactes de systèmes linéaires et des équations différentielles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (1 parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calculus & calcul formel' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Carine', 'Lucas', 'carine.lucas@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='carine.lucas@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet de fin d\'étude' AND _ECTS_='8' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Projet de fin d\'étude', '6', '0', '0', '0', '4', '8', '8', 'Français_', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet de fin d\'étude' AND _ECTS_='8' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Projet personnel et professionnel', '2', '2', '10', '0', '0', '2', '2', 'Français_', 'Initiation à la recherche documentaire, au travail en groupes, à la présentation orale et à la présentation d\'un poster', 'Cours : 

* présentation des objectifs,
* modalités de recherche documentaire,
* présentation du SUIO,
* élaboration d\'une fiche de projet individuel.

TD : 

* recherche massive de documents sur le métier ou l\'activité choisie,
* préparation d\'une rencontre avec un professionnel correspondant au projet,
* préparation du rapport écrit, du poster et de la soutenance.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 1 (parmi 3).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Unité d\'enseignement libre', '3', '0', '0', '0', '20', '3', '3', 'Français_', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 1' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Algorithmique et programmation 1', '1', '0', '0', '15', '45', '6', '6', 'Français_', 'Maîtriser les concepts élémentaires de l\'algorithmique et être capable de les traduire dans le langage C', 'Algorithmique élémentaire : expressions, variables, instructions, séquences, conditionnelles, boucles, tableaux, preuves, invariants, traduction dans le langage Java.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 1' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques descriptives' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Statistiques descriptives', '2', '0', '0', '0', '24', '2', '2', 'Français_', '', '* Présentation et prise en main du logiciel R,
  * Analyse des variables qualitatives et quantitatives.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', 'Unité optionnelle. Option 2 (parmi 2).');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques descriptives' AND _ECTS_='2' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sophie' AND _PRENOM_ENS_='Jacquot' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sophie', 'Jacquot', 'sophie.jacquot@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sophie' AND _PRENOM_ENS_='Jacquot' AND _EMAIL_ENS_='sophie.jacquot@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre bilinéaire et géométrie euclidienne' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre bilinéaire et géométrie euclidienne', '4', '24', '36', '0', '0', '6', '6', 'Français_', 'Découvrir l\'algèbre bilinéaire et ses liens avec la géométrie.', '* Dual d\'un espace vectoriel,
  * formes quadratiques,
  * formes quadratiques réelles,
  * espaces vectoriels euclidiens : projections orthogonales, adjoint,
  * espaces affines euclidiens : classification des isométries du plan et de l\'espace,
  * applications : côniques et quadriques, polynômes orthogonaux.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Algèbre 2 au semestre 3.', 'Ressources', 'Biblio', '', 'Unité obligatoire.');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre bilinéaire et géométrie euclidienne' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean', 'Renault', 'jean.renault@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='jean.renault@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, '1');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, '2');
