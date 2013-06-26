SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, 'Biologie');
SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = 'Biologie');
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, 'Licence-biobio', @id_compo);
SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = 'Licence-biobio' AND _ID_COMPO_ = @id_compo);
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BMC-S6');
INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, 'L3-BMC-S6');
SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = 'L3-BMC-S6');
INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Immunologie expérimentale' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Immunologie expérimentale', '6', '14', '6', '16', '0', '4', '4', 'Français_', '', '* Ce module devrait permettre aux étudiants d’appréhender les outils immunologiques utilisés en analyses biochimiques et ceux permettant la caractérisation, la prévention et le traitement de diverses pathologies.', 'Description de modèles expérimentaux pour l’étude de maladies auto-immunes, infectieuses, ou liées au cancer. Stratégies pour le développement de nouvelles thérapies et vaccins préventifs. Utilisation de souris KO, transgéniques et chimériques. Techniques d’analyse de spécificités, fréquences, régulations et fonctions effectrices des cellules de l’immunité adaptative et innée (T et B, NK, dendritiques, neutrophiles, mastocytes...) Détection et caractérisation d’anticorps, monoclonaux et recombinants, et leur utilisation comme outils de recherche, de diagnostique et de thérapie. Méthodes d’identification de nouveaux gènes contrôlant l’immunité. TP : Techniques ELISA et Western Blot', '', '', '', '', '', 'Immunologie générale', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Immunologie expérimentale' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'François' AND _PRENOM_ENS_='Erard' AND _EMAIL_ENS_='francois.erard@cnrs-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'François', 'Erard', 'francois.erard@cnrs-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='François' AND _PRENOM_ENS_='Erard' AND _EMAIL_ENS_='francois.erard@cnrs-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Chimie Organique II' AND _ECTS_='5' AND _CODE_MAT_='CH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'CH', 'Chimie Organique II', '6', '18', '18', '12', '0', '5', '5', 'Français_', 'Commun avec Licence 2 Chimie (Semestre 4)', '* Pouvoir identifier, nommer différentes fonctions et composés chimiques. Connaître et comprendre des transformations chimiques. Approche de la stratégie de synthèse. Initiation à la synthèse multi-étapes. Interpréter un spectre RMN $^1$H.', 'Chimie des composés aromatiques : Aromaticité et SEAr, - Enolates : aldolisation, alkylation, synthèse malonique, halogénation, Claisen, Dieckmann, Knoevenagel, Elimination E1CB Réaction de Wittig/Wittig-Horner; Réactivité des amines (Gabriel, amination reductive, Hofmann) ; Introduction à la réaction de Diels-Alder ; Base de la RMN $^1$H', '', '', '', '', '', 'Introduction à la chimie organique et Chimie Organique I / En complément de l’UE SOL6 ST05', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Chimie Organique II' AND _ECTS_='5' AND _CODE_MAT_='CH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Franck' AND _PRENOM_ENS_='Suzenet' AND _EMAIL_ENS_='franck.suzenet@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Franck', 'Suzenet', 'franck.suzenet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Franck' AND _PRENOM_ENS_='Suzenet' AND _EMAIL_ENS_='franck.suzenet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6CH10', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Métabolisme normal et pathologique' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Métabolisme normal et pathologique', '6', '28', '8', '0', '0', '4', '4', 'Français_', 'Parcours BMC / BBV', '* Métabolisme humain avancé et son contrôle hormonal ; pathologies associées.', 'Rappels des principales voies du métabolisme glucidique et lipidique ; métabolisme des acides aminés (élimination de l’azote ; cycle de l’urée ; biosynthèse des acides aminés non indispensables). Intégration métabolique tissulaire ; métabolisme « en situation » : état post-prandial ; jeûne pathologique et non pathologique, métabolisme musculaire. Métabolisme des nucléotides (biosynthèse ; chimiothérapie anticancéreuse ; dégradation) ; métabolisme du cholestérol (trafic intratissulaire et athérosclérose) et de l’hème. Modes de contrôle hormonal et pathologies associées.', '', '', '', '', '', 'unités Biochimie métabolique et enzymologie des semestres 3 et 4.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Métabolisme normal et pathologique' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Eric' AND _PRENOM_ENS_='Hébert' AND _EMAIL_ENS_='eric.hebert@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Eric', 'Hébert', 'eric.hebert@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Eric' AND _PRENOM_ENS_='Hébert' AND _EMAIL_ENS_='eric.hebert@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH01', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Physiologie de la communication et de la reproduction' AND _ECTS_='7' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Physiologie de la communication et de la reproduction', '6', '48', '6', '18', '0', '7', '7', 'Français_', '', '* Connaissance des deux grands systèmes de communication de l’organisme (systèmes nerveux et endocrines) tant
au niveau anatomique que fonctionnel ainsi que de leurs dysfonctionnements (pathologies associées). Ce module s’intéresse
aussi à l’ensemble des phénomènes biologiques et physiologiques permettant la production du spermatozoïde et de l’ovule,
leur union, le développement fœtal jusqu’au nouveau-né chez les mammifères, l’accent étant particulièrement mis sur le
modèle humain.', '* Système nerveux. Mouvement somatique volontaire et involontaire (mouvement commandé, réflexes, posture).
Physiologie des 5 sens (vision, audition, olfaction, gustation, somesthésie). Physiologie de la douleur. L’organisation anatomo-
fonctionnelle du système nerveux central et périphérique (cerveau, cervelet, tronc cérébral, moelle épinière, nerfs rachidiens)
sera traitée au cours des différents thèmes abordés.
* Glandes endocrines : Notions générales sur les hormones, le système hypothalamo-hypophysaire (sauf GnRH/FSH-LH), la
thyroïde, le pancréas, les surrénales, les systèmes endocrines particuliers (rein, parathyroïdes, etc.). Approche des mécanismes
de transduction du signal en endocrinologie.
* Biologie de la reproduction : gamétogenèse masculine, féminine. Physiologie chez la femme, organisation fonctionnelle du tractus génital, endocrinologie de l’ovaire, relations hypothalamo- hypophyso-ovarienne, les cycles féminins. Physiologie chez l’homme : organisation du tractus génital mâle, endocrinologie du testicule et relations hormonales avec le système hypothalamo-hypophysaire. Mise en place comparée des gonades et du tractus génital chez divers mammifères et variation du cycle sexuel. Physiologie de la grossesse : Fécondation et gestation. Parturition et lactation. Physiologie fœtale et néo-natale. Nidation, placentation chez l’humain.
* Quelques aspects de Physiologie du développement : mécanismes physiologiques et moléculaires de l’organogénèse. Induction
/ compétence. Voies de signalisation impliquées dans le développement. Guidage axonal.', '', '', '', '', '', 'Connaissances sur la communication cellulaire (récepteurs, seconds messagers) et la physiologie générale (grandes fonctions). Bases d’embryologie et de division cellulaire fortement recommandées.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Physiologie de la communication et de la reproduction' AND _ECTS_='7' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Olivier' AND _PRENOM_ENS_='Richard' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Olivier', 'Richard', 'olivier.richard@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Olivier' AND _PRENOM_ENS_='Richard' AND _EMAIL_ENS_='olivier.richard@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Pierre' AND _PRENOM_ENS_='Gomez' AND _EMAIL_ENS_='jean-pierre.gomez@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Jean-Pierre', 'Gomez', 'jean-pierre.gomez@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jean-Pierre' AND _PRENOM_ENS_='Gomez' AND _EMAIL_ENS_='jean-pierre.gomez@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BO12', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage en chimie organique' AND _ECTS_='2' AND _CODE_MAT_='CH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'CH', 'Stage en chimie organique', '6', '0', '0', '0', '0', '2', '2', 'Français_', '', '', 'Stage pratique en chimie organique.', '', '', '', '', '', 'En complément de l’UE SOL6CH10.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage en chimie organique' AND _ECTS_='2' AND _CODE_MAT_='CH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Arnaud' AND _PRENOM_ENS_='Tatibouet' AND _EMAIL_ENS_='arnaud.tatibouet@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Arnaud', 'Tatibouet', 'arnaud.tatibouet@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Arnaud' AND _PRENOM_ENS_='Tatibouet' AND _EMAIL_ENS_='arnaud.tatibouet@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6CH02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Biotechnologie appliquée' AND _ECTS_='5' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Biotechnologie appliquée', '6', '20', '12', '16', '0', '5', '5', 'Français_', 'Parcours BMC / BBV', '* Les objectifs majeurs de cette unité sont 1) d’apporter les connaissances de base de biotechnologies impliquant les techniques de l’ADN recombinant 2) de savoir définir la procédure expérimentale de choix en fonction de chaque problématique 3) d’en développer les applications d’aujourd’hui et de demain.', '\textit{Production de molécules d’intérêt par génie génétique} : présentation des différents systèmes de production de protéines recombinantes en définissant leurs différents avantages et inconvénients : systèmes confinés procaryotes (bactéries : E. coli, Bacillus...) et eucaryotes (levures, cellules d’insecte, cellules de mammifère), systèmes ouverts (animaux et plantes transgéniques).
\textit{Comment construire des animaux transgéniques} : pour améliorer la race, comme bioréacteur, comme modèles animaux de pathologies humaines, pour la correction d’un déficit, l’étude de la régulation des gènes... Présentation des différentes possibilités comme la micro-injection, pour l’amélioration de la race, l’utilisation de cellules ES pour l’invalidation de gènes en vue de l’élaboration de modèles animaux, de valider un ADN médicament... 
\textit{Notion de thérapie génique} : utilisation de vecteur pour le transfert du gène : les vecteurs viraux.
\textit{Transgénèse végétale} : du système de transgénèse naturelle des agrobactéries à leur utilisation en biotechnologie végétale. Les agrobactéries, outils naturels d’ingénierie génétique : infection des végétaux par les bactéries du sol, les plasmides Ti, les mécanismes de transfert de l’ADN-T, les vecteurs binaires, les techniques de coculture et de coinoculation. 
\textit{Les méthodes de transgénèse alternatives} : électroporation, biolistique, vecteurs viraux, magnifection, etc. Avantages et limites. 
\textit{Applications de la transgénèse végétale} : transfert de gènes d’intérêt agronomique, gènes de résistance aux herbicides, gènes de résistance aux insectes ravageurs (maïs Bt, toxines de Bacillus thuringiensis) ; transfert de gènes pour l’amélioration des qualités nutritives, augmentation de la teneur en acides aminés indispensables, modulation de la teneur en lipides, augmentation de la teneur en composés édulcorants, synthèse de $\beta$-carotène (golden rice) ; la cellule végétale une usine de production de molécules d’intérêt thérapeutique, vaccins comestibles, immunothérapie passive avec des planticorps, synthèse de protéines humaines ; production pour l’industrie agroalimentaire et autres, etc... 
\textit{Les limites et problèmes actuels de la transgénèse végétale} : méthodes alternatives, intégration ciblée des gènes d’intérêt, transplastomique, suppression des gènes de sélection, etc...', '', '', '', '', '', 'Techniques en biologie moléculaire.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Biotechnologie appliquée' AND _ECTS_='5' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Maryvonne' AND _PRENOM_ENS_='Ardourel' AND _EMAIL_ENS_='maryvonne ardourel@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Maryvonne', 'Ardourel', 'maryvonne ardourel@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Maryvonne' AND _PRENOM_ENS_='Ardourel' AND _EMAIL_ENS_='maryvonne ardourel@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH02', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Biochimie moléculaire' AND _ECTS_='7' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Biochimie moléculaire', '6', '46', '14', '7', '0', '7', '7', 'Français_', '', '* Acquérir les bases nécessaires à la compréhension et à la réalisation des techniques de microanalyses et d’imagerie
des biomolécules utilisées en recherche fondamentale, médicale et biotechnologique.
* Approfondissement des connaissances en enzymologie. 
* Etudes des structures tridimensionnelles des macromolécules biologiques et de leurs implications fonctionnelles.', '* Imagerie moléculaire : Bases et concepts fondamentaux des techniques de microscopie et des nouvelles
technologies faisant appel aux biopuces (luminescence, fluorescence, microscopie de fluorescence, pinces optiques sources,
sondes) et analyses ultrastructurales par microscopie électronique à transmission et à balayage.
* Structure 3D : Acides nucléiques : ADN structures II et III : paramètres hélicoïdaux, familles de double hélice, techniques d’analyse du polymorphisme conformationnel. ARN : structures et implications biologiques, ribozyme, ARN de transfert. Protéines : structures II : hélices, feuillets, coudes et boucles, méthodes prédictives. Structures III : domaines structuraux, faisceaux d’hélices $\alpha$, les protéines $\beta$, hélices $\beta$, structures $\alpha$/$\beta$ et $\alpha$+$\beta$. Structures IV : symétries, oligomères, association, dissociation, hybridation, allostérie. Relations structure/fonction illustrées par quelques exemples récents. Ingénierie des protéines.
* Enzymologie structurale : Enzymes à plusieurs substrats. Régulation de l’activité enzymatique. Modification structurale des
enzymes et/ou de leurs substrats. Relations structure-activités.', '', '', '', '', '', 'Techniques d’analyses spectroscopiques des biomolécules, Enzymologie fondamentale, Biochimie générale.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Biochimie moléculaire' AND _ECTS_='7' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'F.Brulé' AND _PRENOM_ENS_='C.Pichon R.Daniellou' AND _EMAIL_ENS_='fabienne.brule-morabito@univ-orleans.fr chantal.pichon@univ-orleans.fr richard.daniellou@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'F.Brulé', 'C.Pichon R.Daniellou', 'fabienne.brule-morabito@univ-orleans.fr chantal.pichon@univ-orleans.fr richard.daniellou@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='F.Brulé' AND _PRENOM_ENS_='C.Pichon R.Daniellou' AND _EMAIL_ENS_='fabienne.brule-morabito@univ-orleans.fr chantal.pichon@univ-orleans.fr richard.daniellou@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH06', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'AG', 'Anglais 6', '6', '0', '24', '0', '0', '3', '3', 'Français_', 'Parcours BMC / BOPE / BGST / BBV / PLURI', '* Comprendre l’information exprimée dans des messages complexes sur le domaine des Sciences et Technologies et s’exprimer sur ce même domaine à l’oral avec un degré de spontanéité et de fluidité (niveau européen B2).', 'Travail de compréhension et d’expression à partir de documents authentiques longs et/ou complexes, portant sur des innovations technologiques, des découvertes ou avancées scientifiques.', '', '', '', '', '', 'Avoir suivi Anglais 5 ou environ 500 heures de formation équivalente.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Anglais 6' AND _ECTS_='3' AND _CODE_MAT_='AG');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='herve.perreau@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Hervé', 'Perreau', 'herve.perreau@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Hervé' AND _PRENOM_ENS_='Perreau' AND _EMAIL_ENS_='herve.perreau@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6AG36', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage laboratoire' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'PJ', 'Stage laboratoire', '6', '0', '0', '0', '0', '3', '3', 'Français_', 'Parcours BOPE / BMC / BBV', '* Initiation au travail de recherche en laboratoire.', 'Stage en laboratoire académique ou industriel dans le domaine du parcours envisagé. La durée est de 4 à 6 semaines (détails de l’organisation fourni durant le semestre 5, avec signature d‘une convention de stage.', '', '', '', '', 'E 66\% + TP 33\%', '', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Stage laboratoire' AND _ECTS_='3' AND _CODE_MAT_='PJ');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Géraldine' AND _PRENOM_ENS_='Roux' AND _EMAIL_ENS_='geraldine.roux@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Géraldine', 'Roux', 'geraldine.roux@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Géraldine' AND _PRENOM_ENS_='Roux' AND _EMAIL_ENS_='geraldine.roux@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Fabienne' AND _PRENOM_ENS_='Brulé' AND _EMAIL_ENS_='fabienne.brule@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Fabienne', 'Brulé', 'fabienne.brule@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Fabienne' AND _PRENOM_ENS_='Brulé' AND _EMAIL_ENS_='fabienne.brule@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6ST04', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Dynamique et différenciation cellulaire' AND _ECTS_='4' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Dynamique et différenciation cellulaire', '6', '22', '4', '10', '0', '4', '4', 'Français_', '', '* Ce module aborde certaines spécificités du fonctionnement cellulaire.', 'Notions de cycle cellulaire, de vieillissement cellulaire et de mort programmée. Trafic vésiculaire intracellulaire, renouvellement membranaire. Cytosquelette. Protéasomes. Matrice extracellulaire et mécanismes d’adhésion cellulaire. Différenciation et dédifférenciation, polarisation, adressage des composants membranaires. Techniques de biologie cellulaire : marquages cellulaires, les différentes microscopies. Culture cellulaire', '', '', '', '', '', 'Bases de biologie cellulaire.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Dynamique et différenciation cellulaire' AND _ECTS_='4' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Martine' AND _PRENOM_ENS_='Guérin' AND _EMAIL_ENS_='martine.guerin@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Martine', 'Guérin', 'martine.guerin@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Martine' AND _PRENOM_ENS_='Guérin' AND _EMAIL_ENS_='martine.guerin@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jacques' AND _PRENOM_ENS_='Pichon' AND _EMAIL_ENS_='jacques.pichon@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Jacques', 'Pichon', 'jacques.pichon@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Jacques' AND _PRENOM_ENS_='Pichon' AND _EMAIL_ENS_='jacques.pichon@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BO09', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Microbiologie appliquée' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Microbiologie appliquée', '6', '20', '0', '16', '0', '4', '4', 'Français_', 'Parcours BMC / BBV', '* Donner un aperçu des différentes utilisations potentielles des micro-organismes, de connaître les
démarches et de savoir effectuer des contrôles bactériologiques de l’eau et en agro-alimentaire', 'Interactions entre micro-organismes : Associations synergiques et antagonistes, commensalisme, mutualisme,
parasitisme. Microbiologie du sol et de l’eau : Les grands cycles (Carbone, Azote, Soufre) ; auto-épuration et biodégradation (ex : xénobiotiques, lixiviats, résidus industriels). Techniques d’analyse des eaux et du sol. Microbiologie médicale : Virus et bactéries pathogènes (habitat, épidémiologie, pouvoir pathogène, diagnostic, traitement). Microbiologie industrielle : Fermentations d’intérêts économiques.', '', '', '', '', '', '', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Microbiologie appliquée' AND _ECTS_='4' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Maryvonne' AND _PRENOM_ENS_='Ardourel' AND _EMAIL_ENS_='maryvonne.ardourel@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Maryvonne', 'Ardourel', 'maryvonne.ardourel@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Maryvonne' AND _PRENOM_ENS_='Ardourel' AND _EMAIL_ENS_='maryvonne.ardourel@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH03', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Epigénétique, pathologie et développement' AND _ECTS_='3' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Epigénétique, pathologie et développement', '6', '12', '0', '12', '0', '3', '3', 'Français_', '', '* Acquérir des connaissances de base sur les processus épigénétiques. Connaître l’importance de ces processus dans
la vie de la cellule et le développement d’un organisme.', 'Epigénétique : La relation génotype phénotype. Modèles de régulation épigénétique Epigénétique et maladies. Empreinte parentale. Inactivation de l’X, anomalies du développement. Effets épigénétiques de l’environnement et de la nutrition. TP : Etude de l’implication de mécanismes épigénétiques dans un modèle de leucémie chez la drosophile.', '', '', '', '', '', 'Ecologie générale ; Bases de la génétique formelle.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Epigénétique, pathologie et développement' AND _ECTS_='3' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Martine' AND _PRENOM_ENS_='Decoville' AND _EMAIL_ENS_='martine.decoville@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Martine', 'Decoville', 'martine.decoville@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Martine' AND _PRENOM_ENS_='Decoville' AND _EMAIL_ENS_='martine.decoville@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BO11', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Neurosciences et physiologie expérimentales' AND _ECTS_='4' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BO', 'Neurosciences et physiologie expérimentales', '6', '6', '6', '24', '0', '4', '4', 'Français_', '', '* Techniques de culture cellulaire animale. Techniques de chirurgie et d’expérimentation animale. Pharmacologie
comportementale du rongeur. Dosages de molécules naturelles chez l’animal.', 'Ce module est destiné à apporter à l’étudiant des compétences dans les différentes techniques expérimentales
appliquées à l’étude des fonctions physiologiques et cérébrales chez l’animal. Ce module principalement pratique abordera entre autres la culture de cellules nerveuses et leur utilisation, la technique d’immunohistochimie cérébrale ainsi que les méthodes d’exploration comportementale chez le rongeur. Des techniques de physiologie seront également abordées via par exemple l’étude pharmacologique de l’automatisme cardiaque et de la pression artérielle, ...', '', '', '', '', '', 'Connaissances de physiologie animale (niveau L2)', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Neurosciences et physiologie expérimentales' AND _ECTS_='4' AND _CODE_MAT_='BO');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Céline' AND _PRENOM_ENS_='Montecot-Dubourg' AND _EMAIL_ENS_='celine.montecot-dubourg@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Céline', 'Montecot-Dubourg', 'celine.montecot-dubourg@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Céline' AND _PRENOM_ENS_='Montecot-Dubourg' AND _EMAIL_ENS_='celine.montecot-dubourg@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Stéphane' AND _PRENOM_ENS_='Mortaud' AND _EMAIL_ENS_='stephane.mortaud@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'Stéphane', 'Mortaud', 'stephane.mortaud@univ-orleans.fr');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Stéphane' AND _PRENOM_ENS_='Mortaud' AND _EMAIL_ENS_='stephane.mortaud@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BO10', @id_mod);
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Virologie moléculaire' AND _ECTS_='3' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _INTRO_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, 'BH', 'Virologie moléculaire', '6', '24', '0', '0', '0', '3', '3', 'Français_', 'Parcours BBV / BMC', '* Acquérir des connaissances dans le domaine de la virologie;', 'Présentation du monde viral. Modes de réplication des virus. Interactions virus/cellule. Diagnostic et traitements
anti-viraux. Action anti-virale du système immunitaire et stratégies d’échappement du virus. Vaccins et vecteurs viraux.
Particularités des virus des végétaux. Exemples : VIH, Rougeole, Hépatites, Virus émergents, Virus de plantes, ...', '', '', '', '', '', 'Bases fondamentales de la biologie moléculaire, Immunologie générale.', '', 'Biblio', '', '1');
SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='Virologie moléculaire' AND _ECTS_='3' AND _CODE_MAT_='BH');
INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = 'Fabienne' AND _PRENOM_ENS_='Brulé' AND _EMAIL_ENS_='fabienne.brule-morabito@univ-orleans.fr');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, 'Fabienne', 'Brulé', 'fabienne.brule-morabito@univ-orleans.fr');
SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='Fabienne' AND _PRENOM_ENS_='Brulé' AND _EMAIL_ENS_='fabienne.brule-morabito@univ-orleans.fr');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens1);
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'', '', '');
SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '' AND _PRENOM_ENS_='' AND _EMAIL_ENS_='');
INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_mod, @id_ens2);
INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('SOL6BH05', @id_mod);
