SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie_Master');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie_Master');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'BOPE', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'BOPE' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S3');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'M2-S3');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'M2-S3');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Synthèse documentaire/bibliographique et projet de stage');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Synthèse documentaire/bibliographique et projet de stage', 'SOM3PJ02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Synthèse documentaire/bibliographique et projet de stage');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '6', '0', '0', '2', '2', 'Français_', ' 
  * Aptitude à situer son travail dans un contexte scientifique et à définir un programme de recherche ; maîtrise des techniques de l’exposé oral et écrit, en français et en anglais.
 
', '
Travail en liaison avec le maître de stage du semestre 4 : Réalisation d’une synthèse bibliographique ou documentaire situant le sujet du stage de longue durée dans les programmes de l’équipe d’accueil et le contexte international, et débouchant sur l'élaboration du projet de recherche/travail de l'étudiant.
', '', '', '', '', 'Ecrit 100\%', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Base de données et SIG');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Base de données et SIG', 'SOM3IF18', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Base de données et SIG');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '24', '0', '4', '4', 'Français_', ' 
  * Donner à l’étudiant une formation de base sur la construction de bases de données et leur utilisation en SIG.
 
', '
Construction, gestion et utilisation d’une base de données, présentation et récupération
de bases vecteurs nationales, généralités SIG, utilisation de logiciel SIG (Mapinfo), utilisation de
bases de données classiques type CORINE, analyse de bases de données, analyses spatiales et
statistiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Réponse des végétaux aux contraintes physiques et agression pathologiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Réponse des végétaux aux contraintes physiques et agression pathologiques', 'SOM3BO14', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Réponse des végétaux aux contraintes physiques et agression pathologiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '6', '0', '0', '4', '4', 'Français_', ' 
  * Approche des mécanismes de résistance et de défense des plantes aux contraintes biotiques et abiotiques et de leurs effets sur les populations d’agresseurs.
 
', '
Approche des mécanismes de résistance et de défense des plantes aux contraintes biotiques et abiotiques et de leurs effets sur les populations d’agresseurs. Contraintes abiotiques :Aspects physiologiques, moléculaires et génétiques de la réponse des plantes (forêt et grandes cultures) aux contraintes abiotiques (sécheresse, choc osmotique, polluants, contraintes mécaniques et thermiques). Amélioration génétique pour la résistance. Agressions biotiques : Mécanismes de résistance aux agressions pathologiques. Exemples en forêt et grandes cultures ; conséquences pour la dynamique des populations d’agresseurs ; rôle modulateur des facteurs abiotiques. Amélioration génétique pour la résistance.
', '', '', '', 'Ecrit 100\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Filières professionnelles');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Filières professionnelles', 'SOM3IP00', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Filières professionnelles');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '0', '0', '0', '2', '2', 'Français_', ' 
  * Consolider les connaissances de l’entreprise dans des domaines pointus comme la protection des inventions, le management en équipe.
 
', '
-Présentation de laboratoires dans les différents secteurs biotechnologiques, cosmétiques, pharmaceutiques. Introduction au droit des affaires; l'activité économique et commerciale; le cadre juridique de l'activité d'entreprise (contrat, la responsabilité de l'entreprise); réglementation du travail. Société de projet et l'innovation: entreprises, l'entrepreneuriat et l'innovation, la stratégie marketing et études de marché. Gestion de projet : gestion de l'équipe, négociation du contrat, protection de l'innovation :la propriété intellectuelle, des outils sur le témoignage de l'invention, le brevet et le droit d'auteur. Protection de la propriété industrielle : outils de la protection des inventions. Les différents brevets ; forme et contenu. Les méthodes de recherche.
', '', '', '', 'Ecrit 50\% + Oral 50\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais scientifique 2');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais scientifique 2', 'SOM3AG23', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais scientifique 2');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Anglais_', ' 
  * Savoir présenter un rapport de travail en anglais et commenter le déroulement d’une expérimentation.
 
', '
Faire un bilan du stage de l’année passée et résumer les visites d’entreprises en anglais. Commenter le déroulement d’un atelier technologique en anglais. Se préparer à des entretiens en anglais pour une embauche (thèse ou poste R & D).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Biostatistiques 2 : Modèle linéaire et analyse multivariées');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Biostatistiques 2 : Modèle linéaire et analyse multivariées', 'SOM3BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Biostatistiques 2 : Modèle linéaire et analyse multivariées');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '12', '0', '0', '3', '3', 'Français_', ' 
  * Maîtrise des méthodes spécialisées de la statistique couramment utilisées dans les Sciences de la vie.
* Initiation à la modélisation.
 
', '
 Intérêts du modèle linéaire : modèles et sous-modèles, méthodes d’estimations des paramètres du modèle linéaire. - Modèles linéaires ne comportant que des facteurs (ANOVA) : tests, interprétations et comparaisons multiples de moyennes; - Modèles linéaires ne comportant que des régresseurs : tests, interprétations, choix de régresseurs ; - Modèles linéaires combinant facteurs et régresseurs; - Analyses factorielles (analyse en composantes principales, analyse factorielle des correspondances, analyse discriminante).
', '', '', '', '', '', '
', 'Biblio
', '', '
Spécialités BBMB / BOPE
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Dynamique et structuration des populations');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Dynamique et structuration des populations', 'SOM3BO13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Dynamique et structuration des populations');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '6', '0', '0', '4', '4', 'Français_', ' 
  * Acquisition des connaissances essentielles sur la diversité génétique et ses applications pratiques.
 
', '
Approfondissement de l’organisation et du rôle de la diversité génétique, notamment dans la structuration génétique des populations de ravageurs, d’hôtes et de pathogènes. Les phénomènes de coévolution sont étudiés en considérant les interactions plantes-insectes. Enfin, un volet est consacré à la conservation, la gestion et la valorisation des ressources génétiques ainsi qu’à l’amélioration génétique.
', '', '', '', '', '', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Gestion des écosystèmes terrestres');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Gestion des écosystèmes terrestres', 'SOM3BO08', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Gestion des écosystèmes terrestres');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '32', '4', '0', '0', '4', '4', 'Français_', ' 
  * Apporter des connaissances élémentaires de gestion des écosystèmes et des populations, ainsi que d’économie de l’environnement. Savoir mobiliser ses connaissances théoriques pour résoudre un cas concret de gestion environnementale.
 
', '
Montrer comment, à partir d'un problème environnemental concret, la recherche peut conduire à proposer des solutions pour la gestion des écosystèmes. Exemples de thèmes développés: Gestion forestière ; protection phytosanitaire et biodiversité ; invasions biologiques ; agriculture durable ; gestion des espèces protégées ; gestion des populations de gibier ; gestion par le feu ; écologie et rôle du paysage ; économie et éthique de l’environnement ; changement global ; ou autres thèmes : conférences en français ou anglais ; exposés d’étudiants.
', '', '', '', 'Ecrit 100\%', 'Oral 100\%', '
', 'Biblio
', '', '
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Entomologie approfondie et gestion des populations d’insectes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Entomologie approfondie et gestion des populations d’insectes', 'SOM3BO15', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Entomologie approfondie et gestion des populations d’insectes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '30', '6', '0', '0', '4', '4', 'Français_', '', '
(i)  Relations plantes-insectes présentées à différentes échelles, en prenant en compte le rôle modulateur des facteurs environnementaux. Importance de la physiologie des insectes pour leurs adaptations, notamment en considérant l’intervention éventuelle d’autres organismes (symbiotes, pathogènes); (ii) Biologie de la conservation des insectes menacés par les modifications de leur habitat et par l’introduction d’espèces nouvelles de plantes et d’insectes ; (iii) Communication chimique chez les insectes non-sociaux et sociaux. Application de ces connaissances pour comprendre comment mieux gérer les populations d’agresseurs ; (iv) Complexité des systèmes génétiques impliqués dans la reproduction et le comportement des insectes, dont les insectes sociaux.', '', '', '', 'Ecrit 100\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
');
