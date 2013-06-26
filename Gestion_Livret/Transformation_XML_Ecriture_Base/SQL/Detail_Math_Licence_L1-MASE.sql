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
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à l\'économétrie' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Introduction à l\'économétrie', '5', '15', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'L\'objectif du cours est de donner à l\'étudiant les moyens de mener ses premières régressions simples, de comprendre et d\'analyser leurs premiers résultats.', 'Dans ce cours, seront examinés les régressions MCO dans le cadre d\'un modèle simple de la forme $y=a.x+b$, les propriétés des estimateurs obtenus, les tests à mener sur de tels estimateurs (tests d\'hypothèse, intervalles de confiance, prévisions).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à l\'économétrie' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Grégory' AND _PRENOM_ENS_='Levieuge' AND _EMAIL_ENS_='gregory.levieuge@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Grégory', 'Levieuge', 'gregory.levieuge@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Grégory' AND _PRENOM_ENS_='Levieuge' AND _EMAIL_ENS_='gregory.levieuge@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5SE04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse 1', '2', '0', '0', '0', '60', '6', '6', 'Français_', 'Unité obligatoire.', 'S\'initier aux méthodes plus fines d\'analyse des fonctions réelles.', '* Continuité uniforme,
  * Dérivation, fonctions dérivables sur un intervalle, dérivée d\'une fonction réciproque,
  * Théorème de Taylor, développements limités,
  * Introduction à l\'intégrale de Riemann,
  * Calcul des primitives.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Suites et fonctions réelles au S1.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2MT05', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre bilinéaire et géométrie euclidienne' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre bilinéaire et géométrie euclidienne', '4', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', 'Découvrir l\'algèbre bilinéaire et ses liens avec la géométrie.', '* Dual d\'un espace vectoriel,
  * formes quadratiques,
  * formes quadratiques réelles,
  * espaces vectoriels euclidiens : projections orthogonales, adjoint,
  * espaces affines euclidiens : classification des isométries du plan et de l\'espace,
  * applications : côniques et quadriques, polynômes orthogonaux.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Algèbre 2 au semestre 3.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre bilinéaire et géométrie euclidienne' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='jean.renault@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean', 'Renault', 'jean.renault@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean' AND _PRENOM_ENS_='Renault' AND _EMAIL_ENS_='jean.renault@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4MT06', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 2' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 2', '2', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Comprendre et s\'exprimer de manière plus autonome dans des situations de séjour d\'études universitaires en pays anglophone (niveau européen : B1).', 'Travail de compréhension et d\'expression orale et écrite à partir de documents authentiques simples et/ou cours centrés sur le monde universitaire anglo-saxon. Supports : vidéo, audio, articles de presse', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 1 ou environ 400 heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 2' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2AG12', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction aux sciences économiques' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Introduction aux sciences économiques', '1', '24', '15', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction aux sciences économiques' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Christophe' AND _PRENOM_ENS_='Lavialle' AND _EMAIL_ENS_='christophe.lavialle@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Christophe', 'Lavialle', 'christophe.lavialle@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Christophe' AND _PRENOM_ENS_='Lavialle' AND _EMAIL_ENS_='christophe.lavialle@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1SE01', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités discrètes' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Probabilités discrètes', '4', '18', '36', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', 'S\'initier aux probabilités discrètes.', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi les modules de mathématiques du semestre 3.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités discrètes' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4MT08', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction au raisonnement math\'ematique' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Introduction au raisonnement math\'ematique', '1', '0', '0', '0', '60', '6', '6', 'Français_', 'Unité obligatoire.', 'Savoir mettre en \oe uvre un raisonnement mathématique de base.', '* Logique \'el\'ementaire, implication, quantificateurs,
  * Les différents types de démonstrations en mathématiques (implication directe, récurrence, preuve par l\'absurde ...),
  * Manipulations ensemblistes, application d\'un ensemble vers un autre,
  * Applications injectives, surjectives, bijectives,
  * Nombres complexes,
  * Systèmes lin\'eaires, familles libres, matrices dans $\mathbb{R}^2$ et $\mathbb{R}^3$.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mathématiques de Terminale S.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction au raisonnement math\'ematique' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='cecile.louchet@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Cécile', 'Louchet', 'cecile.louchet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Cécile' AND _PRENOM_ENS_='Louchet' AND _EMAIL_ENS_='cecile.louchet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1MT02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Topologie des espaces métriques' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Topologie des espaces métriques', '5', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', '', '* Distances, normes
  * Convergences de suites, continuité
  * Espaces complets
  * Espaces compacts
  * Espaces vectoriels normés, applications linéaires continues
  * Connexité', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Topologie des espaces métriques' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5MT04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Microéconomie et comportements stratégiques' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Microéconomie et comportements stratégiques', '4', '30', '25', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', '', 'Comportements stratégiques: Le cours présente les principes de comportement des entreprises en concurrence imparfaite (monopole discriminant, concurrence monopolistique, duopole, oligopole). Il présente des instruments permettant d\'analyser la concurrence sur un marché, et étudie les conséquences des imperfections de concurrence, tant normatives (intervention publique) que positives (rigidité macroéconomique des prix). Ce cours constitue une introduction à l\'économie industrielle.
Microéconomie: Ce cours dispensé en travaux dirigés se proposent d\'illustrer l\'enseignement de microéconomie au moyen de jeux économiques (dilemme du prisonnier, enchères, « concours de beauté »). Il se termine par une étude sectorielle d\'économie industrielle.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Le cours destiné plus particulièrement aux étudiants de 2ème année de sciences économiques et gestion.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Microéconomie et comportements stratégiques' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Christophe' AND _PRENOM_ENS_='Rault' AND _EMAIL_ENS_='christophe.rault@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Christophe', 'Rault', 'christophe.rault@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Christophe' AND _PRENOM_ENS_='Rault' AND _EMAIL_ENS_='christophe.rault@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4SE01', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UL');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UL', 'Unité d\'enseignement libre', '2', '0', '20', '0', '0', '3', '3', 'Français_', 'Unité obligatoire', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UL');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2UL04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre 1', '2', '0', '0', '0', '60', '6', '6', 'Français_', 'Unité obligatoire.', 'Se familiariser avec les polynômes. Apprendre l\'algèbre linéaire et manipuler des matrices.', '* Arithmétique des polynômes, décomposition des fractions rationnelles,
  * Espaces et sous-espaces vectoriels,
  * Bases en dimension finie, théorie de la dimension,
  * Applications linéaires, 
  * Matrices, calcul matriciel,
  * Déterminant.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Introduction au raisonnement mathématique au S1.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 1' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Patrick' AND _PRENOM_ENS_='Maheux' AND _EMAIL_ENS_='patrick.maheux@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Patrick', 'Maheux', 'patrick.maheux@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Patrick' AND _PRENOM_ENS_='Maheux' AND _EMAIL_ENS_='patrick.maheux@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2MT06', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Algèbre 2', '3', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', 'Se former à l\'étude spectrale de matrices.', '* Valeurs propres, vecteurs propres,
  * Polynôme caractéristique,
  * Diagonalisation - Trigonalisation,
  * Polynômes d\'endomorphismes,
  * Polynômes annulateurs,
  * Anneaux de polynômes [optionnel].', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Algèbre 1 au semestre 2.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algèbre 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3MT08', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 1' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 1', '1', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Être à même de préparer un projet de séjour d\'études universitaires en pays anglophone dans une langue écrite et orale simple.', 'Travail de compréhension et d\'expression orale et écrite, à partir de documents authentiques simples, ou courts, centrés sur le monde universitaire anglo-saxon.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 1' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Murielle' AND _PRENOM_ENS_='Pasquet' AND _EMAIL_ENS_='murielle.pasquet@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Murielle', 'Pasquet', 'murielle.pasquet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Murielle' AND _PRENOM_ENS_='Pasquet' AND _EMAIL_ENS_='murielle.pasquet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1AG11', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à la microéconomie' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Introduction à la microéconomie', '2', '0', '0', '0', '48', '5', '5', 'Français_', 'Unité obligatoire.', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à la microéconomie' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Gilbert' AND _PRENOM_ENS_='Colletaz' AND _EMAIL_ENS_='gilbert.colletaz@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Gilbert', 'Colletaz', 'gilbert.colletaz@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Gilbert' AND _PRENOM_ENS_='Colletaz' AND _EMAIL_ENS_='gilbert.colletaz@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2SE02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et fonctions réelles' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Suites et fonctions réelles', '1', '0', '0', '0', '60', '6', '6', 'Français_', 'Unité obligatoire.', 'Ce module d\'analyse traite des suites et fonctions réelles. Les notions de limite, de continuité, de dérivabilité sont proprement établies et permettent alors l\'étude précise de suites et de fonctions.', '* Structures d\'ordre, majorants-minorants, bornes supérieures et inférieures,
  * Suites numériques: étude, convergence, suites récurrentes,
  * Fonctions numériques: limite, continuité,
  * Dérivabilité, fonctions usuelles, étude de fonctions,
  * Fonctions réciproques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Mathématiques de Terminale S.', '', '', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et fonctions réelles' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Philippe' AND _PRENOM_ENS_='Anker' AND _EMAIL_ENS_='jean-philippe.anker@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Jean-Philippe', 'Anker', 'jean-philippe.anker@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Jean-Philippe' AND _PRENOM_ENS_='Anker' AND _EMAIL_ENS_='jean-philippe.anker@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1MT03', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à la macroéconomie' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Introduction à la macroéconomie', '2', '0', '0', '0', '48', '5', '5', 'Français_', 'Unité obligatoire.', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Introduction à la macroéconomie' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Françoise' AND _PRENOM_ENS_='Le Quéré' AND _EMAIL_ENS_='francoise.le\_quere@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Françoise', 'Le Quéré', 'francoise.le\_quere@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Françoise' AND _PRENOM_ENS_='Le Quéré' AND _EMAIL_ENS_='francoise.le\_quere@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2SE01', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et séries de fonctions' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Suites et séries de fonctions', '4', '24', '24', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', 'Apprendre à manipuler des suites de fonctions et des intégrales dépendant d\'un paramètre.', '* Suites et séries de fonctions,
  * Séries entières, séries de Fourier,
  * Intégrales dépendant d\'un paramètre.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 2 au semestre 3.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Suites et séries de fonctions' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4MT05', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='\'Econométrie linéaire avancée' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', '\'Econométrie linéaire avancée', '6', '30', '15', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', '', 'Ce cours présente les fondements de l\'économétrie à partir du modèle des moindres carrés ordinaires. Il présente les techniques d\'estimation, de test et de prévisions dans ce cadre, puis aborde les problèmes associés à l\'invalidité des hypothèses des moindres carrés et fait suite au séminaire d\'économétrie.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Cours d\'initiation à l\'économétrie du semestre 5.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='\'Econométrie linéaire avancée' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Raphaëlle' AND _PRENOM_ENS_='Bellando' AND _EMAIL_ENS_='raphaelle.bellando@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Raphaëlle', 'Bellando', 'raphaelle.bellando@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Raphaëlle' AND _PRENOM_ENS_='Bellando' AND _EMAIL_ENS_='raphaelle.bellando@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('6SE03', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Politique monétaire' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Politique monétaire', '3', '24', '7.5', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', 'Ce cours vise à fournir aux étudiants des outils d\'analyse des phénomènes monétaires et financiers.', 'On s\'interroge sur les questions suivantes:

* Les déterminants et la stabilité de la demande de monnaie;
* Les mécanismes et les contraintes liés à la création et la destruction monétaire;
* Les canaux de transmission de la politique monétaire en économie fermée : coût du capital, effets de richesse; canal du crédit, partage prix quantité;
* La politique monétaire en économie ouverte : contraintes liées à la fixité des changes, canal des taux de change en système de changes flexibles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Les cours de Macroéconomie monétaire et Politique monétaire sont indissociables (L2 S3).', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Politique monétaire' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Yannick' AND _PRENOM_ENS_='Lucotte' AND _EMAIL_ENS_='yannick.lucotte@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Yannick', 'Lucotte', 'yannick.lucotte@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Yannick' AND _PRENOM_ENS_='Lucotte' AND _EMAIL_ENS_='yannick.lucotte@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3SE01', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 1' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Algorithmique et programmation 1', '1', '0', '0', '15', '45', '6', '6', 'Français_', 'Unité obligatoire.', 'Maîtriser les concepts élémentaires de l\'algorithmique et être capable de les traduire dans le langage C.', 'Algorithmique élémentaire : expressions, variables, instructions, séquences, conditionnelles, boucles, tableaux, preuves, invariants, traduction dans le langage Java.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Algorithmique et programmation 1' AND _ECTS_='6' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1IF02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 6', '6', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Comprendre l\'information exprimée dans des messages complexes sur le domaine des sciences et technologies, et s\'exprimer sur ce même domaine à l\'oral avec un degré suffisant de spontanéité et de fluidité (niveau européen B2).', 'Travail de compréhension et d\'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et des avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 5 ou environ 500 heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('6AG36', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Insertion professionnelle' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'IF', 'Insertion professionnelle', '5', '0', '0', '0', '12', '3', '3', 'Français_', 'Unité obligatoire.', 'Se préparer à l\'insertion professionnelle.', 'Préparation de CV, de lettres de motivation, gestion de carrière.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Insertion professionnelle' AND _ECTS_='3' AND _CODE_MAT_='IF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pôle' AND _PRENOM_ENS_='Avenir' AND _EMAIL_ENS_='poleavenir.ove@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Pôle', 'Avenir', 'poleavenir.ove@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Pôle' AND _PRENOM_ENS_='Avenir' AND _EMAIL_ENS_='poleavenir.ove@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5IF02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions de plusieurs variables, courbes et surfaces paramétrées' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Fonctions de plusieurs variables, courbes et surfaces paramétrées', '4', '24', '24', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', '', '* Fonctions de plusieurs variables,
  * Intégrales multiples,
  * Courbes et surfaces paramétrées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 2.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Fonctions de plusieurs variables, courbes et surfaces paramétrées' AND _ECTS_='5' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Martin' AND _PRENOM_ENS_='Grensing' AND _EMAIL_ENS_='martin.grensing@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Martin', 'Grensing', 'martin.grensing@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Martin' AND _PRENOM_ENS_='Grensing' AND _EMAIL_ENS_='martin.grensing@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4MT07', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 4' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 4', '4', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Analyser dans une langue simple et cohérente les rapports entre science et société à l\'écrit et à l\'oral (niveau européen : B1+).', 'Travail de compréhension et d\'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques. Supports : vidéo, audio, articles de presse.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 3 ou environ 450 heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 4' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Michèle' AND _PRENOM_ENS_='Cimolino' AND _EMAIL_ENS_='michele.cimolino@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Michèle', 'Cimolino', 'michele.cimolino@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Michèle' AND _PRENOM_ENS_='Cimolino' AND _EMAIL_ENS_='michele.cimolino@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4AG24', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Intermédiaires et marchés financiers' AND _ECTS_='2' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Intermédiaires et marchés financiers', '4', '30', '0', '0', '0', '2', '2', 'Français_', 'Unité obligatoire.', 'Organisation et fonctionnement des marchés financiers. \'Etude des banques et autres intermédiaires financiers.', 'La partie du cours consacrée à l\'étude des marchés financiers s\'ouvre par l\'étude du fonctionnement d\'un marché financier. L\'exemple d\'Euronext est choisi pour évoquer certains aspects descriptifs ayant trait à l\'organisation du marché. Ensuite, le cours analyse les deux actifs financiers fondamentaux: les actions et les obligations. Enfin, une introduction à la théorie du portefeuille et à la théorie du marché du capital vient clore le cours.\\
La seconde partie du cours est consacrée à l\'étude des intermédiaires financiers et plus particulièrement des banques. Il s\'agit d\'une part d\'analyser leur rôle dans le financement de l\'économie, notamment depuis la déréglementation financière en vigueur depuis la décennie 80. Il s\'agit d\'autre part d\'aborder les aspects prudentiels de l\'activité bancaire en évoquant les différents risques qui lui sont spécifiques ainsi que la réglementation qui en découle (par exemple, la réforme Bâle II).', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Intermédiaires et marchés financiers' AND _ECTS_='2' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sébastien' AND _PRENOM_ENS_='Galanti' AND _EMAIL_ENS_='sebastien.galanti@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sébastien', 'Galanti', 'sebastien.galanti@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sébastien' AND _PRENOM_ENS_='Galanti' AND _EMAIL_ENS_='sebastien.galanti@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Noureddine', 'El Jaouhari', 'noureddine.el-jaouhari@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Noureddine' AND _PRENOM_ENS_='El Jaouhari' AND _EMAIL_ENS_='noureddine.el-jaouhari@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('4SE02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Mathématiques numériques', '3', '0', '0', '0', '36', '4', '4', 'Français_', 'Unité obligatoire.', 'Se familiariser avec le logiciel de calcul matriciel Scilab.', '* Introduction à Scilab,
  * Manipulation de données matricielles,
  * Construction de vecteurs, matrices, extraction de sous-matrices,
  * Représentation graphique 2D,
  * Suites récurrentes,
  * Systèmes linéaires - Pivot de Gauss,
  * Générateurs aléatoires, lois uniformes, simulation de lois discrètes,
  * Introduction aux équations différentielles,
  * Quelques problèmes de mathématiques appliquées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi les modules de mathématiques de première année.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques numériques' AND _ECTS_='4' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='carine.lucas@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Carine', 'Lucas', 'carine.lucas@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Carine' AND _PRENOM_ENS_='Lucas' AND _EMAIL_ENS_='carine.lucas@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3MT10', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Analyse 2', '3', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', 'Approfondir les notions sur les suites, et s\'initier aux intégrales généralisées', '* Suites de Cauchy - Suites extraites - Théorème de Bolzano-Weierstrass,
  * Séries numériques,
  * Intégrales généralisées.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Analyse 1 au semestre 2.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse 2' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3MT09', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques approfondies' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Statistiques approfondies', '6', '30', '15', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', '', 'Le cours de Statistiques approfondies au semestre 6 du parcours économétrie complète et approfondit pour les économètres le cours de statistiques donné au semestre 5 à tous les parcours de la licence économie gestion.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Statistiques du semestre 5.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques approfondies' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Cem' AND _PRENOM_ENS_='Ertur' AND _EMAIL_ENS_='cem.ertur@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Cem', 'Ertur', 'cem.ertur@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Cem' AND _PRENOM_ENS_='Ertur' AND _EMAIL_ENS_='cem.ertur@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('6SE04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calcul différentiel et optimisation' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Calcul différentiel et optimisation', '6', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', '', '* Différentielle d\'ordre 1,
  * Inversion locale, théorème des fonctions implicites,
  * Différentielle d\'ordre 2, formule de Taylor,
  * Extrema liés.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Calcul différentiel et optimisation' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='luc.hillairet@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Luc', 'Hillairet', 'luc.hillairet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Luc' AND _PRENOM_ENS_='Hillairet' AND _EMAIL_ENS_='luc.hillairet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('6MT04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques appliquées à l\'économie et à la gestion' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Statistiques appliquées à l\'économie et à la gestion', '5', '24', '15', '0', '0', '4', '4', 'Français_', 'Unité obligatoire.', 'Ce cours de statistique mathématique a pour principal objectif d\'initier les étudiants aux méthodes d\'inférence statistique et à la théorie des tests. Il s\'inscrit dans le prolongement des cours de statistique descriptive et de probabilités des deux premières années de la licence.', 'Ce cours comporte deux parties. 

* La première partie est consacrée aux méthodes d\'estimation des paramètres d\'un modèle statistique. 
* La seconde partie introduit la théorie des tests et propose différentes applications aux tests paramétriques et aux tests d\'adéquation.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Statistique descriptive et probabilités des deux premières années de la licence.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Statistiques appliquées à l\'économie et à la gestion' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Dominique' AND _PRENOM_ENS_='Hurlin' AND _EMAIL_ENS_='dominique.hurlin@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Dominique', 'Hurlin', 'dominique.hurlin@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Dominique' AND _PRENOM_ENS_='Hurlin' AND _EMAIL_ENS_='dominique.hurlin@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5SE03', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 5' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 5', '5', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Comprendre l\'information exprimée dans des messages complexes sur le domaine des sciences  er technologies et s\'exprimer sur ce même domaine à l\'écrit dans un registre de langue approprié.', 'Travail de compréhension et d\'expression à partir de documents authentiques longs et/ou complexes portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi anglais 3 & 4 ou environ 500 heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 5' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='herve.perreau@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Hervé', 'Perreau', 'herve.perreau@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='herve.perreau@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5AG35', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mesure et intégration' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Mesure et intégration', '5', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', '', '* Tribus, mesures ; mesure de Lebesgue
  * Intégrale par rapport à une mesure
  * Théorèmes de convergence monotone, de convergence dominée 
  * Théorème de Fubini
  * Convolution
  * Transformée de Fourier
  * Espaces $L^p$.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mesure et intégration' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Athanasios', 'Batakis', 'athanasios.batakis@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5MT07', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Projet personnel et professionnel', '2', '2', '10', '0', '0', '2', '2', 'Français_', 'Unité optionnelle. Option 1 (1 parmi 3).', 'Initiation à la recherche documentaire, au travail en groupes, à la présentation orale et à la présentation d\'un poster.', '* Cours : présentation des objectifs. Modalités de recherche documentaire.
Présentation du SUIO. \'Elaboration d\'une fiche de projet individuel.
* TD : Recherche massive de documents sur le métier ou l\'activité choisie. Préparation d\'une rencontre avec un professionnel correspondant au projet. Préparation du rapport écrit, du poster et de la soutenance.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Projet personnel et professionnel' AND _ECTS_='2' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Guillaume', 'Havard', 'guillaume.havard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Guillaume' AND _PRENOM_ENS_='Havard' AND _EMAIL_ENS_='guillaume.havard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('2PP02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Problèmes et méthodes de la science économique' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Problèmes et méthodes de la science économique', '1', '24', '0', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', '', '', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Problèmes et méthodes de la science économique' AND _ECTS_='3' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Christophe' AND _PRENOM_ENS_='Lavialle' AND _EMAIL_ENS_='christophe.lavialle@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Christophe', 'Lavialle', 'christophe.lavialle@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Christophe' AND _PRENOM_ENS_='Lavialle' AND _EMAIL_ENS_='christophe.lavialle@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1SE02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Macroéconomie monétaire' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Macroéconomie monétaire', '3', '24', '0', '7.5', '0', '4', '4', 'Français_', '???', '', 'Ce cours vise à fournir aux étudiants des outils d\'analyse des phénomènes monétaires et financiers.
On s\'interroge sur les questions suivantes:

* Les déterminants et la stabilité de la demande de monnaie;
* Les mécanismes et les contraintes liés à la création et la destruction monétaire;
* Les canaux de transmission de la politique monétaire en économie fermée : coût du capital, effets de richesse; canal du crédit, partage prix quantité;
* La politique monétaire en économie ouverte : contraintes liées à la fixité des changes, canal des taux de change en système de changes flexibles.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Les cours de Macroéconomie monétaire et Politique Monétaire sont indissociables) (L2 S3)', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Macroéconomie monétaire' AND _ECTS_='4' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Grégory' AND _PRENOM_ENS_='Levieuge' AND _EMAIL_ENS_='gregory.levieuge@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Grégory', 'Levieuge', 'gregory.levieuge@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Grégory' AND _PRENOM_ENS_='Levieuge' AND _EMAIL_ENS_='gregory.levieuge@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3SE02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse des données' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'SE', 'Analyse des données', '5', '30', '15', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', '', '* Généralités sur l\'analyse de données.
* Analyse en composantes principales (ACP)
* Analyse factorielle discriminante (AFD)
* Classification automatique; méthodes hiérarchiques
* Applications sur ordinateurs.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Analyse des données' AND _ECTS_='5' AND _CODE_MAT_='SE');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Amine' AND _PRENOM_ENS_='Lahiani' AND _EMAIL_ENS_='amine.lahiani@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Amine', 'Lahiani', 'amine.lahiani@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Amine' AND _PRENOM_ENS_='Lahiani' AND _EMAIL_ENS_='amine.lahiani@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Nawfal', 'Elhage Hassan', 'nawfal.elhage\_hassan@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Nawfal' AND _PRENOM_ENS_='Elhage Hassan' AND _EMAIL_ENS_='nawfal.elhage\_hassan@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('5SE02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 3' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 3', '3', '0', '24', '0', '0', '3', '3', 'Français_', 'Unité obligatoire.', 'Découvrir les bases de l\'anglais scientifique et les utiliser à l\'écrit et à l\'oral.', 'Travail de compréhension et d\'expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', 'Avoir suivi Anglais 1 + 2 ou environ 450 heures de formation équivalente.', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 3' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Sylvain', 'Gendron', 'sylvain.gendron@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Sylvain' AND _PRENOM_ENS_='Gendron' AND _EMAIL_ENS_='sylvain.gendron@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('3AG23', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'MA', 'Probabilités', '6', '24', '36', '0', '0', '6', '6', 'Français_', 'Unité obligatoire.', '', '* Formalisme probabiliste
  * Variables aléatoires
  * Mesure image, loi d\'une variable aléatoire
  * Lois à densité, exemples usuels
  * Loi d\'un vecteur aléatoire
  * Indépendance
  * Moments
  * Diverses formes de convergence, espaces $L^p$
  * Loi des grands nombres.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Probabilités' AND _ECTS_='6' AND _CODE_MAT_='MA');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Athanasios', 'Batakis', 'athanasios.batakis@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Athanasios' AND _PRENOM_ENS_='Batakis' AND _EMAIL_ENS_='athanasios.batakis@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('6MT05', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques pour la finance' AND _ECTS_='5' AND _CODE_MAT_='EF');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'EF', 'Mathématiques pour la finance', '6', '30', '15', '0', '0', '5', '5', 'Français_', 'Unité obligatoire.', '', 'Le cours de mathématiques pour la finance donne aux étudiants les bases mathématiques pour aborder l\'étude théorique des marchés financiers.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'Ressources', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Mathématiques pour la finance' AND _ECTS_='5' AND _CODE_MAT_='EF');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'William' AND _PRENOM_ENS_='Marois' AND _EMAIL_ENS_='william.marois@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'William', 'Marois', 'william.marois@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='William' AND _PRENOM_ENS_='Marois' AND _EMAIL_ENS_='william.marois@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@etu.univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Pierre', 'Debs', 'pierre.debs@etu.univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Pierre' AND _PRENOM_ENS_='Debs' AND _EMAIL_ENS_='pierre.debs@etu.univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('DLO6EF10', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'UND', 'Unité d\'enseignement libre', '3', '0', '0', '0', '20', '3', '3', 'Français_', 'Unité obligatoire.', 'Comprendre comment ce qu\'on apprend dans le cadre d\'un diplôme déjà très spécialisé ; s\'insérer dans le large champ des connaissances et des savoirs auxquels on sera confronté dans son expérience professionnelle ou personnelle.', 'L\'unité d\'ouverture est à choisir, en début du semestre, parmi la centaine d\'enseignements dédiés à cet usage et offerts par toutes les composantes de l\'université (Sciences, Droit-
\'Economie-Gestion, Sport). Voici quelques exemples d\'unités d\'ouverture :

* Sport.
* Traitement de signal et d\'image.
* Droit de l\'informatique.
* Problèmes économiques contemporains.
* Histoire du cinéma, histoire des arts.
* Enseigner : posture et identité professionnelles.
* Lecture critique du réchauffement climatique.
* Maîtriser son expression ; les enjeux de la communication orale : le corps, l\'espace, la voix.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', 'La page du site de l\'université dédiée aux unités d\'ouverture : http://www.univ-orleans.fr/scolarite/inscriptions/?page=2', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Unité d\'enseignement libre' AND _ECTS_='3' AND _CODE_MAT_='UND');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Vittoria', 'Pierfelice', 'vittoria.pierfelice@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Vittoria' AND _PRENOM_ENS_='Pierfelice' AND _EMAIL_ENS_='vittoria.pierfelice@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('UE48', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au C2I' AND _ECTS_='3' AND _CODE_MAT_='II');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'II', 'Préparation au C2I', '1', '0', '0', '0', '24', '3', '3', 'Français_', 'Unité obligatoire.', 'Maîtriser les compétences D1, D2, D3, et D5 du référentiel national C2I1.', 'Préparation aux domaines de compétences du réferentiel national suivant:

D1: Travailler dans un environnement numérique évolutif,
D2: Être responsable à l\'aire du numérique,
D3: Produire, traiter, exploiter et diffuser des documents numériques,
D5: Travailler en réseau, communiquer et collaborer.', '', '', '', '$\frac{(CC+2*CT)}{3}$', 'CT', '', '', '', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Préparation au C2I' AND _ECTS_='3' AND _CODE_MAT_='II');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Laure' AND _PRENOM_ENS_='Kahlem' AND _EMAIL_ENS_='laure.kahlem@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Laure', 'Kahlem', 'laure.kahlem@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Laure' AND _PRENOM_ENS_='Kahlem' AND _EMAIL_ENS_='laure.kahlem@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Alexandre', 'Tessier', 'alexandre.tessier@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Alexandre' AND _PRENOM_ENS_='Tessier' AND _EMAIL_ENS_='alexandre.tessier@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('1II01', @id_mod);
