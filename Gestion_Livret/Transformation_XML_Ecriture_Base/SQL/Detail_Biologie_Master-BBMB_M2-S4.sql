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
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage', 'SOM4ST02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '8', '0', '0', '30', '30', 'Français/Anglais_', ' 
  * Initiation à la recherche dans les domaines de la spécialité; Mettre les étudiants en contact avec le monde professionnel par la pratique d'une activité scientifique au sein d'un laboratoire (public ou privé).
 
', '
Stage de recherche de 4,5 mois dans un laboratoire (labo + terrain) ou en entreprise, dans les domaines des spécialités : réalisation d'un petit programme de recherche (de l'hypothèse à l'interprétation).
', '', '', '', 'Ecrit 50\% + Oral 50\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
