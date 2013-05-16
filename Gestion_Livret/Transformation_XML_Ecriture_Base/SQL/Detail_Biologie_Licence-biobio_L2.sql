SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L2');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L2');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L2');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Morphologie et reproduction des plantes');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Morphologie et reproduction des plantes', 'SOL4BO01 SSL4BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Morphologie et reproduction des plantes');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '23', '4', '21', '0', '5', '5', 'Français_', ' 
  * Connaissance sur l’anatomie et la reproduction des Embryophytes.
 
', '
Organisation anatomique des appareils végétatif et reproducteur des Plantes, des mousses (Bryophytes) aux plantes à fleurs (Angiospermes).
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ouverture maths pour prépa-concours : entraînement au concours');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ouverture maths pour prépa-concours : entraînement au concours', '???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ouverture maths pour prépa-concours : entraînement au concours');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '0', '0', 'Français_', ' 
  * Permettre à des étudiants d’acquérir des connaissances utiles pour passer les concours d’accès aux écoles nationales vétérinaires (concours ENV- voie B), les concours d’ingénieurs agro (concours ENSA voie B) mais également certains concours administratifs.
 
', '
Exercices pour entrainement au concours.', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général renforcé
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Génétique fonctionnelle');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Génétique fonctionnelle', 'SOL4BO05 SSL4BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Génétique fonctionnelle');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '8', '6', '0', '3', '3', 'Français_', ' 
  * Montrer comment l’analyse formelle chez un organisme modèle peut permettre d’aborder des problèmes de santé humaine.
 
', '
Analyse niveau diploide et haploide. Etude des voies métaboliques et des mutations. Les gènes suppresseurs. Génétique extrachromosomique. Modèle levure pour l’étude des gènes humains. Etude de l’interactome. TP : Test de complémentation chez la levure
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Introduction à la physiologie cellulaire et à l'embryologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Introduction à la physiologie cellulaire et à l'embryologie', 'SOL3BO05 SSL3BO05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Introduction à la physiologie cellulaire et à l'embryologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '46', '2', '0', '0', '5', '5', 'Français_', ' 
  * Physiologie : Connaissance du fonctionnement des biomembranes, de la signalisation nerveuse et de la physiologie des cellules excitables, introduction aux techniques d’électrophysiologie et l’étude des canaux ioniques et des courants transmembranaires. Connaissance en neuro-antomie et du fonctionnement du système nerveux central.
* Embryologie : Connaissance des grandes lignes du développement animal. Acquérir un espritsynthétique afin de généraliser la majorité des phénomènes étudiés.
 
', '
\textbf{Partie Physiologie cellulaire :} Le fonctionnement des cellules excitables (cellules nerveuses, cellules musculaires striées et lisses, cellules sécrétrices). Etude du rôle de la membrane plasmique et des échanges membranaires passifs et actifs dans le fonctionnement de la cellule excitable (notions de gradients de concentration, de flux ioniques à travers les membranes semiperméables, les canaux ioniques et les transporteurs). Le potentiel d’action neuronal et la propagation de l’information nerveuse et neuro-musculaire. Le couplage excitation-contraction des muscles striés et lisses. Première approche de la neurotransmission (neurotransmetteurs, récepteurs membranaires, la synapse) et exemples de pathologies liées aux dysfonctionnements de ces systèmes. La physiologie cardiaque : organisation générale du tissu cardiaque au niveau macroscopique et microscopique (cardiomyocytes). Etude de l’activité électrique au niveau cellulaire (le tissu pacemaker, le tissu conducteur, les potentiels d’action) et global (l’électrocardiogramme). L’activité mécanique cardiaque (le couplage excitation-contraction, la révolution cardiaque). \textbf{Sensibilité et traitements sensoriels :} Etude de la transduction, l’encodage, transmission et de la perception des stimuli de l’environnement. Fonctionnement de la chaîne d’événements de l’activation des récepteurs périphériques à l’intégration cérébrale en prenant comme exemple la somesthésie,l’olfaction et la gustation. \textbf{Embryologie :} Différents types d’œufs. Polarités et axes corporels. Types de développements embryonnaire et post -embryonnaire chez les invertébrés et vertébrés. Lignée germinale. Annexes embryonnaires. Induction, compétence et gradient morphogénétique. Mécanisme des gènes de développement. Notions d’embryologie expérimentale.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement Pluridisciplinaire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases d'embryologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases d'embryologie', 'SOL3BO02 SSL3BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases d'embryologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '22', '12', '14', '0', '5', '5', 'Français_', ' 
  * Connaissance des grandes lignes du développement animal. Acquérir un esprit synthétique
afin de généraliser la majorité des phénomènes étudiés.
 
', '

* [\bf{Cours}] : Différents types d’œufs. Polarités et axes corporels. Types de développements
embryonnaire et post-embryonnaire chez les invertébrés et vertébrés. Lignée germinale. Annexes
embryonnaires. Induction, compétence et gradient morphogénétique. Mécanisme des gènes de
développement.
* [\bf{TD-TP}] : Travail à partir de lames histologiques et de photographies, en application du cours.
Embryogenèse : Oursin, Amphibiens, Oiseaux, Souris. Annexes embryonnaires. Développement
embryonnaires et post-embryonnaires des Insectes.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 3');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 3', 'SOL3AG23 SSL3AG23', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 3');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Découvrir les bases de l’anglais scientifique et les utiliser à l’écrit et à l’oral.
 
', '
Travail de compréhension et d’expression à partir de documents authentiques simples et/ou courts
portant sur des innovations technologiques, des découvertes.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement 
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Histoire des sciences naturelles');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Histoire des sciences naturelles', '???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Histoire des sciences naturelles');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '0', '0', '0', '3', '3', 'Français_', ' 
  * Donner une idée de la démarche scientifique et présenter, par quelques exemplesbiologiques, l'évolution des connaissances scientifiques au cours du temps.
 
', '
A quoi sert l'histoire des sciences. Du savoir à la science. Histoire des classifications ou comment ordonner la nature. Débat création-évolution. Histoire des neurosciences: comment l'Homme essaie de comprendre le fonctionnement de son cerveau: de la préhistoire à nos jours. Histoire de la microbiologie.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Purification et analyse des molécules biologiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Purification et analyse des molécules biologiques', 'SOL4BH03 SSL4BH03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Purification et analyse des molécules biologiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '0', '30', '0', '5', '5', 'Français_', ' 
   
', '
Protéines : extraction. Centrifugation. précipitations. Ultrafiltration. Dialyse. Méthodes chromatographiques : échangeurs d’ions, chromatofocalisation, tamisage moléculaire, affinité. Méthodes électrophorétiques : électrophorèse zonale, électrofocalisation, isotachophorèse, électrophorèse capillaire, SDS/bmercaptoéthanol. Transfert Western. Acides nucléiques. Oses et lipides : chromatographie sur couches minces, chromatographie en phase gazeuse (CPG), 
chromatographie liquide haute performance (HPLC.).
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Initiation à la valorisation des ressources végétales');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Initiation à la valorisation des ressources végétales', 'SOL4BO06 SSL4BO06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Initiation à la valorisation des ressources végétales');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '0', '0', '2', '2', 'Français_', ' 
 
', '
Pourquoi les plantes fabriquent elles des métabolites secondaires ? Quel intérêt pour l'homme? Exemples de valorisations de métabolites secondaires dans les domaines pharmaceutiques, alimentaires ou cosmétiques, avantages et contraintes.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physiologie des cellules excitables');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physiologie des cellules excitables', 'SOL3BO01 SSL3BO01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physiologie des cellules excitables');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '24', '8', '16', '0', '5', '5', 'Français_', ' 
  * Connaissance du fonctionnement des biomembranes, de la signalisation nerveuse et de la physiologie des cellules excitables, introduction aux techniques d’électrophysiologie et l’étude des canaux ioniques et des courants transmembranaires. Connaissance en neuro-antomie et du fonctionnement du système nerveux central.
 
', '
\textbf{Physiologie cellulaire} : fonctionnement des cellules excitables (cellules nerveuses, musculaires striées et lisses, sécrétrices). Rôle de la membrane plasmique et des échanges membranaires passifs et actifs dans le fonctionnement de la cellule excitable (gradients de concentration, de flux ioniques à travers les membranes semi-perméables, les canaux ioniques et les transporteurs). Potentiel d’action neuronal et propagation de l’information nerveuse et neuro-musculaire. Couplage excitation-contraction des muscles striés et lisses. Première approche de la neurotransmission (neurotransmetteurs, récepteurs membranaires, synapse) et exemples de pathologies. \textbf{Physiologie cardiaque} : organisation générale du tissu cardiaque au niveau macroscopique et microscopique (cardiomyocytes). Etude de l’activité électrique au niveau cellulaire (tissu pacemaker, tissu conducteur, potentiels d’action) et global (électrocardiogramme). L’activité mécanique cardiaque (le couplage excitation-contraction, la révolution cardiaque).Les travaux pratiques illustreront les contenus du cours par des expérimentations sur tissu vivant (nerf isolé, préparation nerf-muscle), observation de coupes histologiques et modélisation informatique (le potentiel d’action neuronal, les canaux ioniques). 
\textbf{Sensibilité et traitements sensoriels} : étude de la transduction, l’encodage, transmission et de la perception des stimuli de l’environnement. Fonctionnement de la chaîne d’événements de l’activation des récepteurs périphériques à l’intégration cérébrale (somesthésie, olfaction et gustation).
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Stage d'observation en école, collège ou lycée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Stage d'observation en école, collège ou lycée', 'IUFM ???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Stage d'observation en école, collège ou lycée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français_', ' 
  * Connaître le travail réel d'un enseignant en classe.
 
', '
Préparation du stage :
%
%* L'observation et son utilisation
%* Construction de thèmes et d'outils d'observation
%* Compte rendu et analyse des situations éducatives observées
%* Méthodologie du rapport de stage
%
L'observation et son utilisation ; Construction de thèmes et d'outils d'observation ; Compte rendu et analyse des situations éducatives observées ; Méthodologie du rapport de stage
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Communication cellulaire et pharmacologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Communication cellulaire et pharmacologie', 'SOL4BO03 SSL4BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Communication cellulaire et pharmacologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '5', '11', '0', '4', '4', 'Français_', ' 
  * L’initiation à la connaissance du médicament permettra d’aborder les fondements du fonctionnement des récepteurs cellulaires d’une part et des cibles d’agents pharmacologiques d’autre part. En employant quelques exemples précis, faire comprendre à l’étudiant les interrelations cellulaires qui soustendent la situation normale ou pathologique.
 
', '
Communications intercellulaires et transfert d’informations via les systèmes récepteurs. Les grandes familles de récepteurs. Première approche des notions de transduction du signal. Interaction ligand-récepteur. Pharmacologie fondamentale et appliquée : les grands groupes de médicaments évoqués à l’aide d’exemples physiopathologiques. L’implication du biologiste dans l’élaboration et/ou la production d’un nouveau médicament. Origine des molécules pharmacologiquement actives : les molécules naturelles animale ou végétales ; à partir d’exemples concrets, étude de la découverte d’un médicament.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Tectonique et géophysique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Tectonique et géophysique', 'SOL3ST01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Tectonique et géophysique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '26', '10', '24', '0', '6', '6', 'Français_', ' 
  * Connaissances générales en géophysique et en tectonique. Notions d’analyse de la déformation et sur le comportement mécanique des solides. Techniques de construction de coupes et de lecture de cartes géologiques.
 
', '
Cours : Géophysique interne et dynamique lithosphérique. Tectonique : cinématique et déformations aux limites des plaques, régimes tectoniques. Rappels sur les contraintes et la rhéologie. Quantification de la déformation finie. Objets structuraux : failles, plis, schistosité/foliation et linéations, boudinage. Exemples de structures régionales: rifts, domaines transformants, grandes structures des marges actives (prismes d'accrétion, chaînes de subduction, obduction, bassins arrière-arc), chaînes intracontinentales, chaînes de collision.
TD : Géophysique : gravimétrie, magnétisme et paléomagnétisme, mécanisme au foyer des séismes.
TP : Analyse de cartes géologiques, construction de coupes, éléments de dessin cartographique, notions de construction des cartes géologiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Anglais 4');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Anglais 4', 'SOL4AG24 SSL4AG24', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Anglais 4');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '24', '0', '0', '3', '3', 'Français/Anglais_', ' 
  * Analyser dans une langue simple et cohérente les rapports entre science et société à l’écrit et à l’oral (niveau européen : B1+).
 
', '
Travail de compréhension et d’expression à partir de documents authentiques simples et/ou courts portant sur des innovations technologiques, des découvertes et avancées scientifiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Photosynthèse et nutrition carbonée');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Photosynthèse et nutrition carbonée', 'SOL3BH12 SSL2BH12', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Photosynthèse et nutrition carbonée');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '2', '4', '0', '2', '2', 'Français_', ' 
  * cquisition des bases fondamentales de la physiologie et de la biochimie végétales.
 
', '
Les bases de la photosynthèse; photosynthèse des plantes en C3 : acte photochimique et fixation du CO$_2$ atmosphérique (Cycle de Calvin), biosynthèse de l'amidon et du saccharose. Photorespiration, photosynthèse des plantes en C4 et CAM.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Les algues');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Les algues', 'SOL4BO07', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Les algues');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '6', '2', '4', '0', '1', '1', 'Français_', ' 
  * Intérêts économiques et biologie des algues.
 
', '
Biologie et reproduction des algues. Intérêts économiques, pharmaceutiques et biotechnologiques des algues.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Découverte de l'école et des institutions éducatives');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Découverte de l'école et des institutions éducatives', '???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Découverte de l'école et des institutions éducatives');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '0', '0', 'Français_', ' 
  * ???
 
', '
???', '', '', '', 'Examen 67 \% ; TP 33 \%', 'Examen 67 \% ; TP 33 \%', '
', 'Biblio
', '', '
Parcours Enseignement BGST et Pluridisciplinaire
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'L'eau, les minéraux et la plante');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'L'eau, les minéraux et la plante', 'SOL4BO04 SSL4BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='L'eau, les minéraux et la plante');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '14', '8', '14', '0', '4', '4', 'Français_', ' 
  * Acquisition des bases fondamentales de physiologie et biochimie végétales.
 
', '
L'eau et la plante, nutrition minérale hors azote, le transport des assimilats. Phytoremediation, engrais, rôle des mycorhizes dans l'absorption de l'eau et du phosphate.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Microbiologie générale');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Microbiologie générale', 'SOL4BH02 SSL4BH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Microbiologie générale');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '26', '6', '18', '0', '5', '5', 'Français_', ' 
  * Faire découvrir la microbiologie en fournissant les connaissances indispensables sur les microorganismes (structure, mode de division, taxinomie...) puis en préciser les méthodes d’étude et d’analyse. Cet enseignement axé principalement sur la bactériologie, donnera les bases nécessaires au contrôle et à la maîtrise du développement des microorganismes nécessaire dans différents domaines (industrie, recherche, milieu médical, agroalimentaire...).
 
', '
Microorganismes: Structure et organisation cellulaire (bactéries, fungi, bactériophages). Les transferts naturels de matériel génétique chez les microorganismes : aspects physiologiques (conjugaison, transformation, transduction et reproduction des bactériophages). Croissance microbienne : Cinétique, types trophiques, nutriments, métabolisme. Systématique bactérienne : Méthodes de la taxinomie, les grands groupes bactériens, techniques d’identification. Notions de virologie : Principaux types de virus animaux et végétaux. Maîtrise des populations bactériennes : Procédés de décontamination. Notions d’épidémiologie, virulence, pouvoir pathogène, toxines.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie organique expérimentale');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie organique expérimentale', 'SOL4CH05 SSL4CH05', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie organique expérimentale');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '24', '0', '3', '3', 'Français_', ' 
  * Maîtrise des techniques de purifications et d’analyse, maîtrise des méthodes et pratiques d’expérimentation dans un laboratoire de chimie organique.
 
', '
Méthodes de synthèse et Bonnes Pratiques en laboratoire de chimie organique. Expérimentations des réactions et techniques essentielles au laboratoire de chimie organique.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Enzymologie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Enzymologie', 'SOL3BH13 SSL3BH13', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Enzymologie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '12', '6', '12', '0', '3', '3', 'Français_', ' 
  * Connaissance des bases de l'enzymologie.
 
', '
Définitions, origine de la catalyse, Cinétique michaelienne, Modèles d’inhibition, application des enzymes en sciences, en santé, en agroalimentaire et en environnement.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ecologie des peuplements');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ecologie des peuplements', 'SOL4BO02 SSL4BO02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ecologie des peuplements');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '4', '16', '0', '4', '4', 'Français_', ' 
  * Familiariser l’étudiant avec l’organisation et la dynamique des peuplements, un domaine essentiel pour la compréhension du fonctionnement de la biosphère.
 
', '
Caractères fondamentaux de l'organisation des peuplements; équilibre dynamique et colonisation des îles; les facteurs de l’organisation et de la dynamique des peuplements (rôles de la compétition, de la prédation, du parasitisme, des ressources, de la variabilité spatiale et temporelle) ; dynamique des peuplements et évolution, coévolution; organisation des biocénoses (structure spatiale et temporelle, successions écologiques, biodiversité); structure de quelques communautés de la zone tempérée : forêts, prairies, cultures, lacs, étangs, rivières,.... comparaison et caractères généraux; études théoriques et pratiques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Pétrologie endogène 1');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Pétrologie endogène 1', 'SOL4ST02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Pétrologie endogène 1');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '6', '24', '0', '5', '5', 'Français_', ' 
  * Identifier les minéraux cardinaux des roches magmatiques macroscopiquement et microscopiquement. Décrire et interpréter des textures courantes des roches plutoniques et volcaniques Connaître les grands processus magmatiques : genèse et différenciation des magmas Maîtriser les diagrammes de phases binaires dans les systèmes magmatiques Maîtriser la représentation graphique des processus de fusion partielle et de cristallisation fractionnée, bilans de masse, application sous tableur Mettre en œuvre le calcul normatif, application sous tableur Appréhender le phénomène métamorphique dans sa diversité Connaître le lien entre le métamorphisme et la géodynamique Reconnaître les principales roches métamorphiques après observation de leurs minéraux et de leurs caractères texturaux et structuraux Interpréter les paragenèses minérales en termes de séquences métamorphiques et en termes de faciès métamorphiques.
 
', '
\textbf{Pétrologie magmatique} Cours : Définitions ; nomenclature et classifications des roches magmatiques ; processus de genèse et de différenciation des magmas TD : diagrammes de phases ; calcul de norme CIPW TP : description macroscopique et microscopique des grands types de roches magmatiques. \textbf{Pétrologie métamorphique} Cours : Présentation préliminaire des roches métamorphiques et du métamorphisme – Les facteurs du métamorphisme – La nomenclature des roches métamorphiques fondée sur leur minéralogie, leur texture et leur structure - Approche statique du métamorphisme : degré de métamorphisme et faciès métamorphiques – Le métamorphisme de contact TP : Détermination macroscopique et microscopique des minéraux, des textures et des structures des roches métamorphiques – Détermination des noms des roches métamorphiques
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Physique pour les biosciences');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Physique pour les biosciences', 'SOL3PY06 SSL3PY06', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Physique pour les biosciences');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '13', '14', '9', '0', '4', '4', 'Français_', ' 
  * Ce module s’attache à donner aux étudiants les outils physiques nécessaires en Sciences de la Vie. Le but essentiel est de mettre en évidence certaines lois de comportement pouvant être décrites par les mêmes formalismes, tout en reliant ces lois à des exemples pris dans le domaine de la biologie.
 
', '
Cours et TD :

* Rappels de mathématiques.
* Lois de comportement : Croissance et décroissance exponentielles / Equilibre dynamique / Régulation /Applications : Élimination d’une substance (notion de clairance) - Phénomènes de régulation biologique (respiration, glycémie, équilibre hormonal)
* Eléments de mécanique des fluides : Hydrostatique /Écoulement des fluides parfaits / Viscosité

Travaux pratiques : Loi exponentielle (absorption d’un rayonnement par une substance) / Lentille
minces (application à l’œil)
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bases de biologie moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bases de biologie moléculaire', 'SOL3BH01 SSL3BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bases de biologie moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '26', '22', '0', '0', '5', '5', 'Français_', ' 
  * Acquérir les connaissances de base sur les mécanismes fondamentaux de la transmissionde l’information génétique.
 
', '

* Biologie moléculaire et dogme central de la biologie. Transmission de l’information génétique : du gène à la protéine.
* Structure des acides nucléiques (ADN / ARN), supports de l’information génétique.
* Conservation de l’information génétique : réplication et notions de réparation de l’ADN.
* Expression des gènes : production d’ARN (transcription).
* Finalisation du message génétique chez les organismes eucaryotes : maturation des ARN messagers (modifications post-transcriptionnelles).
* Décryptage du code génétique : traduction des ARNm ; acteurs de la traduction et mécanismes.
* Modifications des protéines (modifications post traductionnelles).
* Notions de technologies en biologie moléculaire.

', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Bassins sédimentaires');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Bassins sédimentaires', 'SOL4ST01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Bassins sédimentaires');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '10', '2', '12', '0', '3', '3', 'Français_', ' 
  * Connaissance approfondie des facteurs contrôlant la sédimentation. Maîtrise des principaux outils d’investigation stratigraphique. Capacité d’interpréter des coupes sismiques réflexion à différentes résolutions, ainsi que les faciès sédimentaires. Connaissance de l’architecture 3D de bassins sédimentaires types.
 
', '
\textbf{Cours :} Présentation des principaux outils de cartographie et de prélèvements du remplissage sédimentaire au sein de bassins actuels. Lecture et analyse des paramètres contrôlant l’enregistrement sédimentaire : stratigraphies génétique et sismique (applications). Flux sédimentaire, accommodation et subsidence, cartes isobathes, isopaques, architecture 3D des corps sédimentaires et des bassins. \textbf{TD/TP} : Principe et interprétation de la sismique réflexion (différentes échelles), application aux corps sédimentaires (affleurements, carottages), architecture 3D des corps sédimentaires : marqueurs du climat et de la tectonique.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie organique');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie organique', 'SOL3CH02 SSL3CH02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie organique');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '12', '0', '5', '5', 'Français_', ' 
  * Pouvoir identifier, nommer différentes fonctions et composés chimiques. Connaître et
comprendre des transformations chimiques. Approche de la stratégie de synthèse. Initiation à la
synthèse multiétapes.
 
', '
Exploration des fonctions essentielles et avancées de la chimie organique réactionnelle : Les fonctions acides et dérivés, chimie du benzène; chimie des énolates; réaction de Wittig/WittigHorner; Les amines et aminoacides; introduction aux réactions péricycliques (DielsAlder).
', '', '', '', 'Ecrit 100\%', 'Ecrit 100\%', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Sédimentologie et pétrologie sédimentaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Sédimentologie et pétrologie sédimentaire', 'SOL3ST02', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Sédimentologie et pétrologie sédimentaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '4', '24', '0', '5', '5', 'Français_', ' 
  * Acquisition des bases de sédimentologie (processus d’érosion, transport et dépôt pour les différents types d’environnements) et de diagenèse.
* Identification macroscopique et microscopique des minéraux et des roches sédimentaires
* Acquisition des outils (figures, structures et textures sédimentaires) de diagnostique des environnements sédimentaires
 
', '
Cours : Dynamique et environnement sédimentaires, paléogéograhie, sédimentation continentale (glaciaire, fluviatile, lacustre, éolienne), sédimentation marine (plateforme, talus, profonde), sédimentation organique, diagenèses minérale et organique.
TD : Figures et structures sédimentaires ; Minéralogie sédimentaire, classification 
TP : Minéralogie et classification des roches sédimentaires ; Granulométrie, exoscopie des sables et morphométrie des galets pour les sédiments et macrofaciès des roches consolidées (détritiques silicoclastiques, carbonatées, siliceuses non-détritiques, résiduelles, évaporitiques et carbonées), figures et structures sédimentaires et microfaciès.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Chimie pour les biosciences');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Chimie pour les biosciences', 'SOL4CH04 SSL4CH04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Chimie pour les biosciences');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '8', '4', '12', '0', '2', '2', 'Français_', ' 
  * Utilisation des notions de chimie de base, acquises en 1ère année de licence pour comprendre quelques phénomènes quotidiens : maladies du sang liées à la dérégulation de son acidité, extraction et distillation du pétrole, introduction aux polymères
 
', '
Application des notions de chimie générale à différents domaines de la vie courante et à différents problèmes en biologie: chimie des solutions, extraction et distillation du pétrole, introduction aux polymères. Application pratique de la chimie générale au dosage des produits courants (produits alimentaires, médicaments, produits ménagers, composés d’intérêt biologique).
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Ecologie : les relations populations-environnement');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Ecologie : les relations populations-environnement', 'SOL3BO04 SSL3BO04', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Ecologie : les relations populations-environnement');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '16', '4', '4', '0', '3', '3', 'Français_', ' 
  * Les populations sont les pièces élémentaires des systèmes écologiques. Etudier les relations des populations avec leur environnement abiotique et biotique, c'est se donner les notions de base pour la compréhension du fonctionnement des écosystèmes.
 
', '
Les facteurs abiotiques et leur influence sur les êtres vivants (facteurs limitants et adaptation des organismes, facteurs climatiques, hydrologiques et édaphiques); les populations et leurs interactions (paramètres démographiques, croissance et fluctuations des populations, stratégies démographiques, facteurs de régulation, densité-dépendance, compétitions, prédation, parasitisme, interactions positives); notions de base sur la structure et l'organisation des peuplements (paramètres fondamentaux: richesse spécifique, diversité, niche écologique).
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours général et enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Métabolisme général');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Métabolisme général', 'SOL3BH11 SSL3BH11', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Métabolisme général');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '20', '10', '0', '0', '3', '3', 'Français_', ' 
  * Connaissance des métabolismes glucidique et lipidique humain de base.
 
', '
Présentation dans l’espèce humaine des voies métaboliques de base des glucides (catabolisme et anabolisme) : glycolyse, cycle de Krebs et oxydations phosphorylantes, néoglucogenèse, voies des pentoses, glycogène), des lipides (acides gras et triglycérides : biosynthèse et dégradation) et des corps cétoniques ; intégration métabolique tissulaire. Différents modes de contrôle hormonal de ces voies (insuline, glucagon, adrénaline) et pathologies associées.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Techniques en biologie moléculaire');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Techniques en biologie moléculaire', 'SOL4BH01 SSL4BH01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Techniques en biologie moléculaire');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '18', '12', '0', '5', '5', 'Français_', ' 
  * Acquérir les bases nécessaires à la compréhension et à la réalisation des techniques de biologie moléculaire utilisées en recherche fondamentale, médicale et biotechnologique.
 
', '
Techniques de bases de la manipulation des acides nucléiques (Extraction, purification, dosage, électrophorèse, enzymes de restriction et de modification, mutagénèse dirigée, transformation de E.coli. Notions de vecteurs (plasmides, cosmides, phages, YAC). Clonage, construction et utilisation de banques d'ADN. Détection, caractérisation et identification des acides nucléiques : Marquages radioactifs et marquages froids. Hybridation moléculaire. Techniques de Southern et Northern, hybridation in situ. Amplification (PCR) et séquençage. Applications : expression de protéines recombinantes, analyse de l'activité et de la structure des gènes, polymorphisme, études cliniques.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général et Enseignement
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Maths prépa concours : techniques de calcul en mathématiques');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Maths prépa concours : techniques de calcul en mathématiques', '???', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Maths prépa concours : techniques de calcul en mathématiques');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '20', '0', '0', '3', '3', 'Français_', ' 
  * Permettre à des étudiants d’acquérir des connaissances utiles pour passer les concours d’accès aux écoles nationales vétérinaires (concours ENV- voie B), les concours d’ingénieurs agro (concours ENSA voie B) mais également certains concours administratifs.
 
', '
Les thèmes suivants seront abordés. Les notions minimales de cours seront données afin de privilégier les exemples.

* Fonctions numériques de la variable réelle / Intégrales / Equations différentielles
* Suites / Algèbre Linéaire /Probabilités

', '', '', '', 'Examen 67 \% ; TP 33 \%', 'Examen 67 \% ; TP 33 \%', '
', 'Biblio
', '', '
Parcours général renforcé
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Minéralogie');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Minéralogie', 'SOL3ST03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Minéralogie');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '18', '6', '24', '0', '0', '0', 'Français_', ' 
  * ???
 
', '
???
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement BGST
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Travaux pratiques photosynthèse');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Travaux pratiques photosynthèse', 'SOL3BO03 SSL3BO03', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Travaux pratiques photosynthèse');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 3');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '0', '8', '0', '1', '1', 'Français_', ' 
  * Acquisition des bases fondamentales de physiologie et biochimie végétales
 
', '
Travaux pratiques mettant en évidence les bases de la photosynthèse.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Général
');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = 'Français');
INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, 'Français', 'SOL4FR01 SSL4FR01', '');
SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='Français');
INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, 'Semestre 4');
INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '0', '12', '0', '0', '1', '1', 'Français_', ' 
  * Améliorer les performances orthographiques de l'étudiant(e) et l'aider à comprendre ses erreurs.
 
', '
Travail de la grammaire française et de l’orthographe notamment à l’aide du logiciel Voltaire disponible à l’Université.
', '', '', '', '', '', '
', 'Biblio
', '', '
Parcours Enseignement Pluri
');
