SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Master-BBMB', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Master-BBMB' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S4');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'M2-S4');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S4');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='30' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Stage', '3', '0', '8', '0', '0', '30', '30', 'Français/Anglais_', 'Spécialités BBMB / BOPE', '* Initiation à la recherche dans les domaines de la spécialité; Mettre les étudiants en contact avec le monde professionnel par la pratique d\'une activité scientifique au sein d\'un laboratoire (public ou privé).', 'Stage de recherche de 4,5 mois dans un laboratoire (labo + terrain) ou en entreprise, dans les domaines des spécialités : réalisation d\'un petit programme de recherche (de l\'hypothèse à l\'interprétation).', '', '', '', 'Ecrit 50\% + Oral 50\%', 'Ecrit 100\%', 'Unité SOM3PJ02 "Synthèse bibliographique et projet de recherche".', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage' AND _ECTS_='30' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Chantal' AND _PRENOM_ENS_='Pichon François Lieutier Daniel Hagège' AND _EMAIL_ENS_='chantal.pichon@univ-orleans.fr francois.lieutier@univ-orleans.fr daniel.hagege@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Chantal', 'Pichon François Lieutier Daniel Hagège', 'chantal.pichon@univ-orleans.fr francois.lieutier@univ-orleans.fr daniel.hagege@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Chantal' AND _PRENOM_ENS_='Pichon François Lieutier Daniel Hagège' AND _EMAIL_ENS_='chantal.pichon@univ-orleans.fr francois.lieutier@univ-orleans.fr daniel.hagege@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOM4ST02', @id_mod);
