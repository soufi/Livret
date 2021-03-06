<?php
include_once("matiere.php");
include_once("responsable.php");
include_once("alerts.php");
include_once("ue.php");
include_once("programme.php");

	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Module{

        //un tableau contenant des langues pour la liste déroulante de langue
        static $lesLangues = Array("Allemand","Arabe","Anglais","Bulgare","Catalan","Coréen","Croite","Danois","Espagnol","Français","Grec","Irlandais","Italien","Japonais","Latin","Néerlandais","Norvégien","Polonais","Portugais","Roumain","Russe","Serbe","Suédois","Tchèque","Turc","Ukrainien","Vietnamien");  

        //genere la partie du module comme dans les modeles de fichier latex renseigné
        //ecrit le contenu de le handler : pointeur vers un fichier
        public function genereLatex($connect, $handler){
            $latex = "\n\module[codeApogee={";
            $ue = UeTool::getByIDModule($connect, $this->_ID_MOD_);
            foreach($ue as $value){
                $latex .= $value->_APOGEE_." ";
            }
            $latex .= "},\ntitre={".$this->_LIBELLE_MOD_."},\n";
            $latex .= "COURS={".$this->_NBH_C_."},\n";
            $latex .= "TD={".$this->_NBH_TD_."},\n";
            $latex .= "TP={".$this->_NBH_TP_."},\n";
            $latex .= "CTD={".$this->_NBH_CTD_."},\n";
            $latex .= "TOTAL={".(intval($this->_NBH_C_)+intval($this->_NBH_TD_)+intval($this->_NBH_TP_)+intval($this->_NBH_CTD_))."},\n";
            $latex .= "SEMESTRE={Semestre ".intval($this->_SEMESTRE)."},\n";
            $latex .= "COEFF={".intval($this->_COEF_)."},\n";
            $latex .= "ECTS={".intval($this->_ECTS_)."},\n";
            $latex .= "MethodeEval={".$this->_METHODE_EVAL_."},\n";
            $latex .= "ModalitesCCSemestreUn={".$this->_MOD_CC_1_."},\n";
            $latex .= "ModalitesCCSemestreDeux={".$this->_MOD_CC_2."},\n";
            $latex .= "CalculNFSessionUne={".$this->_CALCUL_NF_1_."},\n";
            $latex .= "CalculNFSessionDeux={".$this->_CALCUL_NF_2."},\n";
            $latex .= "NoteEliminatoire={".$this->_NOTE_ELIM_."},\n";
            //recuperation des id des enseignants responsable de ce module
            $enseignants = ResponsableTool::getRespByMod($connect, $this->_ID_MOD_);
            //construction d'un tableau pour pouvoir faire la comparaison alphabetique et ordonner les responsable
            if(!empty($enseignants)){
                //si on a un seul enseignant
                if(count($enseignants) == 1){
                    $ens = $enseignants[0]->sheetOfEns($connect);
                    $latex .= "nomPremierResp={".$ens->_NOM_ENS_." ".$ens->_PRENOM_ENS_."}, \n";
                    $latex .= "emailPremierResp={".$ens->_EMAIL_ENS_."},\n";
                    $latex .= "nomSecondResp={},\n";
                    $latex .= "emailSecondResp={},\n";
                //dans le cas de plusieurs resp. on en prend les deux premier et les compare par ordre alphabetique
                }elseif(count($enseignants) > 1){
                    $ens1 = $enseignants[0]->sheetOfEns($connect);
                    $ens2 = $enseignants[1]->sheetOfEns($connect);
                    if(strnatcmp($ens1->_NOM_ENS_,$ens2->_NOM_ENS) < 0){
                        $latex .= "nomPremierResp={".$ens1->_NOM_ENS_." ".$ens1->_PRENOM_ENS_."},\n";
                        $latex .= "emailPremierResp={".$ens1->_EMAIL_ENS_."},\n";
                        $latex .= "nomSecondResp={".$ens2->_NOM_ENS_." ".$ens2->_PRENOM_ENS_."},\n";
                        $latex .= "emailSecondResp={".$ens2->_EMAIL_ENS_."},\n";
                    }else{
                        $latex .= "nomPremierResp={".$ens2->_NOM_ENS_." ".$ens2->_PRENOM_ENS_."},\n";
                        $latex .= "emailPremierResp={".$ens2->_EMAIL_ENS_."},\n";
                        $latex .= "nomSecondResp={".$ens1->_NOM_ENS_." ".$ens1->_PRENOM_ENS_."},\n";
                        $latex .= "emailSecondResp={".$ens1->_EMAIL_ENS_."},\n";
                    }
                }
            //si on a pas de resp.
            }else{
                $latex .= "nomPremierResp={},\n";
                $latex .= "emailPremierResp={},\n";
                $latex .= "nomSecondResp={},\n";
                $latex .= "emailSecondResp={},\n";
            }

            $latex .= "langue={".$this->_LANGUE_."},\n";
            $latex .= "%INTRO ou description courte\n";
            $latex .= "{".self::cheackFormat($this->_INTRO_)."},\n";
            $latex .= "%Description Longue\n";
            $latex .= "{".self::cheackFormat($this->_DESCRIPTION_)."},\n";
            $latex .= "%Prerequis\n";
            $latex .= "{".self::cheackFormat($this->_PREREQUIS_)."},\n";
            $latex .= "%Objectif\n";
            $latex .= "{".self::cheackFormat($this->_OBJECTIF_)."},\n";
            $latex .= "%Ressources\n";
            $latex .= "{".self::cheackFormat($this->_LIEN_RESSOURCES_)."},\n";
            $latex .= "%Biblio\n";
            $latex .= "{".self::cheackFormat($this->_BIBLIOGRAPHIE_)."},\n";
            $latex .= "\n\\vfill\n\n";
            //ECRITURE DANS FICHIER
            if(!fwrite($handler, utf8_encode($latex)))
                throw new Exception ("Module::genereLatex => Erreur Ecriture");
        }


        //permet de mettre le str en format Latex avec des itemize ou enumerate
        //enumerate : si on a un chiffre et '-' en debut de ligne
        //itemizer : si on a '*' suivis d'un espace en début de ligne
        //ObjItm
        //description : si on a un mot suivis de : en debut de ligne
        private static function cheackFormat($str){
            $result = '';
            $patternEnum = '/\\s*(\\d{1,2}-{1}\\s*[^\\d-]*)/'; //detecte le type enumeration qui est caracterisé par des ligne qui commence par un chiffre suivis de '-'
            $patternItemize = '/(\\s*)(\\*)(\\s+)(\\w+)/'; //detecte le type itemize qui caracterise par une * suivis d'un espace
            $patternDescr = '/[\\n\\r^](\\w+)[\\w ]*:{1}\\s*(\\w+)/'; //detecte le type description suivis de crochets contenant un attribut [...] suivis de ':'

            //Enumeration
            if(preg_match($patternEnum, $str)){
                $pattern = '/\d{1,2}-{1}/'; //le delimiter est le chiffre suivis de '-'
                $blocs = preg_split($pattern,$str); //sous-bloc de str contenant les différente partie avant apres chaque énumération
                if(!empty($blocs)){
                    $result .= "\begin{enumerate}\n";
                    $result .= $blocs[0];
                    for($i = 1 ; $i < count($blocs); $i++)
                        $result .= "\item".$blocs[$i];
                    $result .= "\n\\end{enumerate}";
                }else
                    throw new Exception ("Module::cheackFormat => erreur parsage enum");
            //Itemize
            }elseif(preg_match($patternItemize, $str)){
                $pattern = '/\\*/';
                $blocs = preg_split($pattern, $str);
                if(!empty($blocs)){
                    $result .= "\begin{itemize}\n";
                    $result .= $blocs[0];
                    if(count($blocs) === 2){
                        $result .= "\ObjItem".$blocs[1];
                    }else{
                        for($i = 1 ; $i < count($blocs) ; $i++)
                            $result .= "\\item".$blocs[$i];
                    }
                    $result .= "\n\\end{itemize}";
                }else
                    throw new Exception ("Module::cheackFormat => erreur parsage itemize");
            //Description
            }elseif(preg_match($patternDescr, $str)){
                $pattern = '/[\\n\\r^](.+):{1}\\s*/';
                //afin de pouvoir recuperer les valeurs qu'on va mettre dans les items de la description entre les crochets (l'entete)
                //on utilisera la fonction preg_match_all et on va regrouper le bloc qui nous interesse, c'est a dire celui qui est
                //situé entre le debut d'une ligne ou le retour chariot, et le charactere ':'
                //puisqu'on specifie un groupe dans le pattern la fonction preg_match retournera deux type de resultats
                //un pour tous le pattern et l'autre avec juste la portion selectionner a chaque fois dans tous l'ensemble du string !!
                //la case 1 du tableau correspond au groupe selectionné
                preg_match_all($pattern, $str, $entetes);
                if(!empty($entetes[1]) && count($entetes[1]) >= 1){
                    //on extrait la deuxième case du tableau qui correspond au groupe !
                    $groupes = $entetes[1];
                    $result .= "\begin{description}\n";
                    //on devise le texte par rapport au delimiter(s) qui correspond(ent) au groupe selectionné précédemment (c.f avant)
                    //ce groupe qui peut etre une phrase et donc contenir des espaces
                    $blocs = preg_split("/\\w[\\w ]*:{1}/",$str);
                    $result .= $blocs[0];
                    for($i = 1 ; $i < count($blocs) ; $i++){
                        //le tableau de blocs est decale d'une case par rapport au tableau de groupes
                        $result .= "\itemize[".$groupes[$i-1]."]".$blocs[$i];
                    }
                    $result .= "\n\\end{description}";
                }else
                    throw new Exception ("Module::cheackFormat => erreur parsage description");
            }

            if(empty($result))
                $result .= $str;
            //on echappe les caractere spéciaux
            return $result;
        }

        //permet d'extraire les differents semestres des modules en parametre
        public static function detectSemestre(array $tableauModule){
            if(!empty($tableauModule)){
                $result = array();
                foreach ($tableauModule as $module){
                    $leSmstr = $module->_SEMESTRE_;
                    if(!empty($leSmstr) && is_numeric($leSmstr) && !in_array($leSmstr, $result)){
                        $result[] = $leSmstr;
                    }
                }
                return $result;
            }else
                return NULL;
        }

        //genere une ligne d'un tableau contenant les informations de l'instance
        public function genereLine($connect){
            $line = "<tr rel='popover' data-content=\"";
            $line .= $this->generePop($connect);
            $line .= "\" data-original-title='Responsable(s)'>";
            $line .= "<input type='hidden' value='".$this->_ID_MOD_."'/>";
            $line .= "<td> ".$this->_LIBELLE_MOD_."</td>";
            //on affiche le probleme au cas ou une exception est levee
            try {
                $line .= "<td>".MatiereTool::libelleOfCode($connect, $this->_CODE_MAT_)."</td>";
            } catch (Exception $e) {
                $line .= "<td>".AlertTool::genereDanger($e->getMessage())."</td>";
            }
            $line .= "<td>".$this->_SEMESTRE_."</td>";
            $line .= "<td>".$this->_NBH_C_."</td>";
            $line .= "<td>".$this->_NBH_TD_."</td>";
            $line .= "<td>".$this->_NBH_TP_."</td>";
            $line .= "<td>".$this->_NBH_CTD_."</td>";
            $line .= "<td>".$this->_ECTS_."</td>";
            $line .= "<td>".$this->_COEF_."</td>";
            try {
                $line .= "<td>".Ue::pack_it($connect,$this)."</td>";
            } catch (Exception $e) {
                $line .= "<td>".AlertTool::genereDanger($e->getMessage())."</td>";
            }

            try {
                $line .= "<td>".Programme::pack_it($connect,$this)."</td>";
            } catch (Exception $e) {
                $line .= "<td>".AlertTool::genereDanger($e->getMessage())."</td>";
            }
            
        	$line .= "</tr>";
	        return $line;
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($connect, $tableauModule, $page, $taillePage){
        	$table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Modules</h2></div>"; 
            if(!empty($tableauModule)){
            //-----------------------------
                //les titres des colonnes
                $table .= "<tr>";
                $table .= "<th>Libelle</th>";
                $table .= "<th>Matière</th>";
                $table .= "<th>Semestre</th>";
                $table .= "<th>Cours</th>";
                $table .= "<th>TD</th>";
                $table .= "<th>TP</th>";
                $table .= "<th>Cours-TD</th>";
                $table .= "<th>ECTS</th>";
                $table .= "<th>Coef</th>";
                $table .= "<th>U.E</th>";
                $table .= "<th>Promo</th>";
                $table .= "</tr>";
            //-------------------------------
                //generation des lignes du tableau
                //prise en compte de pagination
                $nbrModules = count($tableauModule); //le nombre de modules
                $nbrPage = $nbrModules / $taillePage;
                //on ajoute une page dans le cas ou le nombre n'est pas divisible par la taille de la page
                if(($nbrPage % $taillePage) != 0) {  $nbrPage++; }
                //si le nbr de la page est superieur aux bords 
                if($page > $nbrPage || $page < 1)
                    $page = $nbrPage;
                $debutPage = (($page*$taillePage)-$taillePage)+1;
                //si ce qui reste des modules est sup a la taille de la page on calcule la fin sinon on s'arrete à la fin du tableau
                if(($nbrModules-(($page-1)*$taillePage)) > $taillePage)
                    $finPage = $debutPage + $taillePage;
                else
                    $finPage = $nbrModules;
                //chargement des lignes de la page
                for ($i = $debutPage ; $i < $finPage ; $i++) { 
                    $table .= $tableauModule[$i]->genereLine($connect);
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucun Module trouvé !"));

            $table .= "</table>";
            if(!empty($nbrPage)){
                $table .= "<div class='pagination  pagination-centered'> <ul>";
                for ($i=1; $i <= $nbrPage; $i++) { 
                    if($i === $page)
                        $table .= "<li class='active'><a href='#'>".$i."</a></li>";
                    else
                        $table .= "<li><a href='moduleManager.php?pm=".$i."'>".$i."</a></li>";
                }
                $table .= "</ul> </div>";
            }
            return $table;
        }

        //le contenu du pop qui sera généré au clique sur une ligne <tr> du tableau de Module
        //on affichera les responsable de cette instance de module
        public function generePop($connect){
            //on recupere la page
            if(isset($_GET['pm']))
                $thePage = intval($_GET['pm']);
            else
                $thePage = 1;
            $pop = "<div class='container-fluid popRespMod'>";
            if(!empty($connect)){
                //recuperation des responsables de cette instance de module
                //on recupere un tableau contenant les objets de type RespModule (cf. responsable.php)
                //l'objet RespModule contient l'id du module, l'id du responsable qui est un enseignant (cf. enseignant.php)
                try{
                    $lesResponsables = ResponsableTool::getRespByMod($connect, $this->_ID_MOD_);
                    //parcour des différents responsable
                    if(!empty($lesResponsables)){
                        foreach ($lesResponsables as $leResp){
                            //récupération des information  sur le responsable
                            $enseignant = $leResp->sheetOfEns($connect);
                            $pop .= "<span class='row'><a href='moduleManager.php?pm=".$thePage."&pop=formUpdRespMod".$this->_ID_MOD_."&ens=".$leResp->_ID_ENS_."'>".$enseignant->_NOM_ENS_." ".$enseignant->_PRENOM_ENS_."</a></span>";
                        }
                    }
                    //bouton d'ajout de responsable
                    $pop .= "<span class='row'><a class='btn btn-mini' href='moduleManager.php?pm=".$thePage."&pop=formAddRespMod".$this->_ID_MOD_."'><i class='icon-plus'></i></a></span>";
                } catch (Exception $e) {
                    $pop .= AlertTool::genereDanger($e->getMessage());
                }
            }else
                $pop .= AlertTool::genereDanger("Module::generePop => parametre invalide");
            $pop .= "</div>";
            return htmlspecialchars($pop);
        }

        //ce formulaire est généré par le lien du pop qui permet de le selectionner et l'afficher en modal 
        //genere le formulaire qui permet de mettre a jour les responsable de cette instance de module
        public function genereFormUpdResp($connect){
            $form = "<div id='formUpdRespMod".$this->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Modification Responsable Module</h3>";
            $form .= "</div>";
            //Libelle de la filiere avec un input cache contenant l'id de la filiere
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_MOD_."' method='post' action='moduleManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleModulePop'>Libelle Module</label>";
            $form .= "<div class='controls'>";
            $form .= "<span id='libelleModulePop' class='input-xlarge uneditable-input'>".$this->_LIBELLE_MOD_."</span>";
            $form .= "<input type='hidden' name='idModulePop' value='".$this->_ID_MOD_."'/>";
            $form .= "<input type='hidden' name='oldIdEnsPop' id='oldIdEnsPop'>";
            $form .= "</div></div>";
            //liste d'enseignant
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='enseignant'>Enseignant</label>";
            $form .= "<div class='controls'>";
            //recup de tous les enseignants 
            try{
                $lesEnseignants = EnseignantTool::getAll($connect);
                if(!empty($lesEnseignants)){
                    $form .= "<select name='idEnsPop' id='enseignant' required='required'>";
                    foreach ($lesEnseignants as $enseignant) {
                        $form .= "<option value='".$enseignant->_ID_ENS_."'>".$enseignant->_NOM_ENS_." ".$enseignant->_PRENOM_ENS_."</option>";
                    }
                    $form .= "</select>";
                }else
                    $form .= AlertTool::genereWarning("Pensez à ajouter des enseignants !");
            }catch(Exception $e){
                $form .= AlertTool::genereDanger($e->getMessage());
            }
            $form .= "</div> </div>";
            //fin modal-body
            $form .= "</div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formUpdRespSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteRespSubmit' value='Supprimer'/>";
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //permet de generer un formulaire d'ajout de responsable de cette instance de module
        public function genereFormAddResp($connect){
            $form = "<div id='formAddRespMod".$this->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Ajout Responsable Module</h3>";
            $form .= "</div>";
            //Libelle de la filiere avec un input cache contenant l'id de la filiere
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleModulePop'>Libelle Module</label>";
            $form .= "<div class='controls'>";
            $form .= "<span id='libelleModulePop' class='input-xlarge uneditable-input'>".$this->_LIBELLE_MOD_."</span>";
            $form .= "<input type='hidden' name='idModPop' value='".$this->_ID_MOD_."'/>";
            $form .= "</div></div>";
            //liste d'enseignant
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='enseignant'>Enseignant</label>";
            $form .= "<div class='controls'>";
            //recup de tous les enseignants 
            try{
                $lesEnseignants = EnseignantTool::getAll($connect);
                if(!empty($lesEnseignants)){
                    $form .= "<select name='idEnsPop' id='enseignant' required='required'>";
                    foreach ($lesEnseignants as $enseignant) {
                        $form .= "<option value='".$enseignant->_ID_ENS_."'>".$enseignant->_NOM_ENS_." ".$enseignant->_PRENOM_ENS_."</option>";
                    }
                    $form .= "</select>";
                }else
                    $form .= AlertTool::genereWarning("Pensez à ajouter des enseignants !");
            }catch(Exception $e){
                $form .= AlertTool::genereDanger($e->getMessage());
            }
            $form .= "</div> </div>";
            //fin modal-body
            $form .= "</div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formAddRespSubmit' value='Envoyer'/>";
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //genere un formulaire qui modifie un Module
        public function genereFormModif($connect){
            $form = "<div id='myModal".$this->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Modification Module</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_MOD_."' method='post' action='moduleManager.php'  class='form-horizontal'>";
            //Code de la matiere : liste deroulante a partir du contenu de la table livret_matiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='matiereAssoc'>Matière</label>";
            $form .= "<div class='controls'>";
			$form .= "<select name='matiereAssoc' id='matiereAssoc' required>";
            if(!empty($connect)){
                try {
                    $allModule = MatiereTool::getAll($connect);
                    //si on a des modules 
                    if(!empty($allModule)){
                        //on ajoute chaque module a la liste de selection
                        foreach ($allModule as $value) {
                            //on selectionne l'element qui appartient a l'instantce affiché
                            if($value->_CODE_MAT_ === $this->_CODE_MAT_)
                                $form .= "<option select='selected' value='".$value->_CODE_MAT_."'>".$value->_LIBELLE_MAT_."</option>";
                            else
                                $form .= "<option value='".$value->_CODE_MAT_."'>".$value->_LIBELLE_MAT_."</option>";
                        }
                    }else
                        $form .= AlertTool::genereWarning("Aucune matière trouvée");
                } catch (Exception $e) {
                    $form .= AlertTool::genereDanger($e->getMessage());
                }	
            }else
                $form .= AlertTool::genereDanger("Impossible de récuperer les Matières");
           	$form .= "</select>";
            $form .= "</div> </div>";
            //Libelle
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleModule'>Libelle Module</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleModule' id='libelleModule' placeholder='Champ Obligatoire ...' required size='50' value='".$this->_LIBELLE_MOD_."'/>";
            $form .= "<input type='hidden' name='idModule' value='".$this->_ID_MOD_."'/>";
            $form .= "</div> </div>";
            //Semestre
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='semestre'>Semestre</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='semestre' id='semestre' required>";
            for ($i=1 ; $i <= 6; $i++) { 
            	if($i === $this->_SEMESTRE_)
            		$form .= "<option select='selected' value='".$i."'>".$i."</option>";
            	else
            		$form .= "<option value='".$i."'>".$i."</option>";
            }
            $form .= "</select>";
            $form .= "</div> </div>";
            //nbr de cours
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrC'>Nombre Cours</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrC' id='nbrC' required value='".$this->_NBH_C_."'/>";
            $form .= "</div> </div>";
            //nbr TD
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrTD'>Nombre TD</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrTD' id='nbrTD' required value='".$this->_NBH_TD_."'/>";
            $form .= "</div> </div>";
            //nbr TP
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrTP'>Nombre TP</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrTP' id='nbrTP' required value='".$this->_NBH_TP_."'/>";
            $form .= "</div> </div>";
            //nbr CTD
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrCTD'>Nombre CTD</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrCTD' id='nbrCTD' required value='".$this->_NBH_CTD_."'/>";
            $form .= "</div> </div>";
            //nbr ECTS
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='ects'>ECTS</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='ects' id='ects' required value='".$this->_ECTS_."'/>";
            $form .= "</div> </div>";
            //COEF
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='coef'>Coefficient</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='coef' id='coef' required value='".$this->_COEF_."'/>";
            $form .= "</div> </div>";
            //LANGUE
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='langueModule'>Langue</label>";
            $form .= "<div class='controls'>";
            $form .= "<select multiple='multiple' name='langueModule[]' id='langueModule' required>";
            //Recuperation du contenu de la base
            $languages = explode('/', $this->_LANGUE_);
            //on supprime le caractère _ s'il existe
            foreach ($languages as $key => $value) {
                $languages[$key] = strtr($value, "_", "");
            }
            //on selectionne les langues deja selectionné
            $bool = FALSE;
            foreach (self::$lesLangues as $langList) {
                foreach ($languages as $langBase) {
                    $bool = $bool || ($langList === $langBase);
                }
                if($bool)
                    $form .= "<option select='selected' value='".$langList."'>".$langList."</option>";
                else
                    $form .= "<option value='".$langList."'>".$langList."</option>";
                $bool = False; //réinitialise
            }
            $form .= "</select>";
            $form .= "</div> </div>";
            //INTRO
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='introModule'>Introduction</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='introModule' id='introModule' >".$this->_INTRO_."</textarea>";
            $form .= "</div> </div>";
            //Objectif
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='objectifModule'>Objectif</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='objectifModule' id='objectifModule' >".$this->_OBJECTIF_."</textarea>";
            $form .= "</div> </div>";
            //Description
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='descrModule'>Description</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='descrModule' id='descrModule'>".$this->_DESCRIPTION_."</textarea>";
            $form .= "</div> </div>";
            //Methode evaluation
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='methodEval'>Méthode Évaluation</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='methodEval' id='methodEval' required value='".$this->_METHODE_EVAL_."'/>";
            $form .= "</div> </div>";
            //control continue session 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='modCC1'>Modalité C.C Session 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='modCC1' id='modCC1' value='".$this->_MOD_CC_1_."'/>";
            $form .= "</div> </div>";
            // control continue session 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='modCC2'>Modalité C.C Session 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='modCC2' id='modCC2' value='".$this->_MOD_CC_2_."'/>";
            $form .= "</div> </div>";
            //calcul note final 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='calculNF1'>Calcule Note Finale Session 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='calculNF1' id='calculNF1' value='".$this->_CALCUL_NF_1_."'/>";
            $form .= "</div> </div>";
            //calcul note final 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='calculNF2'>Calcule Note Finale Session 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='calculNF2' id='calculNF2' value='".$this->_CALCUL_NF_2_."'/>";
            $form .= "</div> </div>";
            //Prerequis
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prerequisModule'>Prérequis</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='prerequisModule' id='prerequisModule'>".$this->_PREREQUIS_."</textarea>";
            $form .= "</div> </div>";
            //RESSOURCES
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='ressourceModule'>Ressources</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='ressourcesModule' id='ressourcesModule'>".$this->_LIEN_RESSOURCE_."</textarea>";
            $form .= "</div> </div>";
            //Biblio
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='biblioModule'>Bibliographie</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='biblioModule' id='biblioModule' >".$this->_BIBLIOGRAPHIE_."</textarea>";
            $form .= "</div> </div>";
            //Note Eliminatoire
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='noteElimModule'>Note éliminatoire</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='noteElimModule' id='noteElimModule' required value='".$this->_NOTE_ELIM_."'/>";
            $form .= "</div> </div>";
            //OBLIGATOIRE
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='obligModule'>Obligatoire</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='obligModule' id='obligModule' required>";
            if($this->_OBLIGATOIRE_ === 0){
                $form .= "<option value='0' select='selected'>Non</option>";
                $form .= "<option value='1'>Oui</option>";
            }
            else{
                $form .= "<option value='1' select='selected'>Oui</option>";
                $form .= "<option value='0'>Non</option>";
            }
            $form .= "</select>";    
            $form .= "</div> </div>";
            //fin modal-body
            $form .= "</div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //genere un formulaire de creation de module
        public static function genereFormAdd($connect){
            $form = "<div id='formAddModule' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Ajouter un Module</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
            //Code de la matiere : liste deroulante a partir du contenu de la table livret_matiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='matiereAssoc'>Matière</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='matiereAssocAdd' id='matiereAssoc' required>";
            if(!empty($connect)){
                try {
                    $allModule = MatiereTool::getAll($connect);
                    //si on a des modules 
                    if(!empty($allModule)){
                        //on ajoute chaque module a la liste de selection
                        foreach ($allModule as $value) {
                            $form .= "<option value='".$value->_CODE_MAT_."'>".$value->_LIBELLE_MAT_."</option>";
                        }
                    }else
                        $form .= AlertTool::genereWarning("Aucune matière dans trouvée !");
                } catch (Exception $e) {
                    $form .= AlertTool::generDanger($e->getMessage());
                }
            }else
                $form .= AlertTool::genereDanger("Impossible de récuperer les Matières");
            $form .= "</select>";
            $form .= "</div> </div>";
            //Libelle
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleModule'>Libelle Module</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleModuleAdd' id='libelleModule' placeholder='Champ Obligatoire ...' required size='50'/>";
            $form .= "</div> </div>";
            //Semestre
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='semestre'>Semestre</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='semestreAdd' id='semestre' required>";
            for ($i=1 ; $i <= 6; $i++) { 
                $form .= "<option value='".$i."'>".$i."</option>";
            }
            $form .= "</select>";
            $form .= "</div> </div>";
            //nbr de cours
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrC'>Nombre Cours</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrCAdd' id='nbrC' required />";
            $form .= "</div> </div>";
            //nbr TD
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrTD'>Nombre TD</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrTDAdd' id='nbrTD' required />";
            $form .= "</div> </div>";
            //nbr TP
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrTP'>Nombre TP</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='\\d*' pattern='\\d*' name='nbrTPAdd' id='nbrTP' required />";
            $form .= "</div> </div>";
            //nbr CTD
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrCTD'>Nombre CTD</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrCTDAdd' id='nbrCTD' required />";
            $form .= "</div> </div>";
            //nbr ECTS
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='ects'>ECTS</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='ectsAdd' id='ects' required />";
            $form .= "</div> </div>";
            //COEFF
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='coef'>Coefficient</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='coefAdd' id='coef' required />";
            $form .= "</div> </div>";
            //LANGUE
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='langueModule'>Langue</label>";
            $form .= "<div class='controls'>";
            $form .= "<select multiple='multiple' name='langueModuleAdd[]' required>";
            foreach (self::$lesLangues as $value) {
                $form .= "<option value='".$value."'>".$value."</option>";
            }
            $form .= "</select>";
            $form .= "</div> </div>";
            //INTRO
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='introModule'>Introduction</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='introModuleAdd' id='introModule' ></textarea>";
            $form .= "</div> </div>";
            //Objectif
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='objectifModule'>Objectif</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='objectifModuleAdd' id='objectifModule' ></textarea>";
            $form .= "</div> </div>";
            //Description
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='descrModule'>Description</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='descrModuleAdd' id='descrModule'></textarea>";
            $form .= "</div> </div>";
            //Methode evaluation
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='methodEval'>Méthode Évaluation</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='methodEvalAdd' id='methodEval' />";
            $form .= "</div> </div>";
            //control continue session 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='modCC1'>Modalité C.C Session 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='modCC1Add' id='modCC1' />";
            $form .= "</div> </div>";
            // control continue session 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='modCC2'>Modalité C.C Session 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='modCC2Add' id='modCC2' />";
            $form .= "</div> </div>";
            //calcul note final 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='calculNF1'>Calcule Note Finale Session 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='calculNF1Add' id='calculNF1' />";
            $form .= "</div> </div>";
            //calcul note final 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='calculNF2'>Calcule Note Finale Session 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='calculNF2Add' id='calculNF2' />";
            $form .= "</div> </div>";
            //Prerequis
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prerequisModule'>Prérequis</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='prerequisModuleAdd' id='prerequisModule'></textarea>";
            $form .= "</div> </div>";
            //RESSOURCES
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='ressourceModule'>Ressources</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='ressourcesModuleAdd' id='ressourcesModule'></textarea>";
            $form .= "</div> </div>";
            //Biblio
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='biblioModule'>Bibliographie</label>";
            $form .= "<div class='controls'>";
            $form .= "<textarea name='biblioModuleAdd' id='biblioModule' ></textarea>";
            $form .= "</div> </div>";
            //Note Eliminatoire
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='noteElimModule'>Note éliminatoire</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='noteElimModuleAdd' id='noteElimModule' required />";
            $form .= "</div> </div>";
            //OBLIGATOIRE
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prerequisModule'>Obligatoire</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='obligModuleAdd' required>";
            $form .= "<option value='1'>Oui</option>";
            $form .= "<option value='0'>Non</option>";
            $form .= "</select>";    
            $form .= "</div> </div>";
            //fin modal-body
            $form .= "</div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

		//genere un div avec les informations principal du module this
        //le div contient les informations de ces différentes proprieté : matiere, promotion, semestre ...
        //ceci nous permet de filtrer et d'afficher grace a l'isotope
		public function getIsotopeContent (PDO $connect){
            //recuperation de toutes les promotions en relation avec ce module
            try{
                $programmes = ProgrammeTool::getByIDMod($connect, $this->_ID_MOD_);
                //ajout de l'etiquette de la matiere
                $boxe =  '<div class="well well-small box span4 matiereFilter'.$this->_CODE_MAT_;
                //ajout des différentes étiquettes de promotions disponible
                foreach($programmes as $leProg){
                    $boxe .= ' promoFilter'.$leProg->_ID_PROMO_;
                }
                //ajout de l'étiquette de semestre
                if(is_numeric($this->_SEMESTRE_))
                    $boxe .= ' semestre'.$this->_SEMESTRE_;
                //on ferme le chevron de la balise div
                $boxe .= '">';
                //Le titre du box affiché
                if(!empty($this->_LIBELLE_MOD_))
                    $boxe .= '<h4 class="box-title">'.$this->_LIBELLE_MOD_.'</h4>';
                else
                    $boxe .= '<h4 class="box-title">Aucun Libelle</h4>';
                //Le corp du box qui sera affiché
                if(!empty($this->_DESCRIPTION_))
                    $boxe .= '<div class="box-text">'.$this->_DESCRIPTION_.'</div>';
                else
                    $boxe .= '<div class="box-text"> Aucune Description Disponible </div>';

                $boxe .= '</div>';
                return $boxe;
            }catch(Exception $e){
                throw new Exception ("Module::getIsotopeContent => ".$e->getMessage());
            }
		}
	}

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

//la variable $connect instance de PDO vers la bdd livret
//cette class permet d'avoir des outils qui permettrons la manipulation des matiere sur notre base données
	class ModuleTool{
		//permet d'avoir tous les champs d'une matiere avec l'id
		public static function getByID($connect, $_id) {
			$requete = "SELECT * FROM livret_module WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module"); //retourne un objet contenant les colonne comme attributs
				}else {
					throw new exception("ModuleTools::getByID => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByID => parametre invalide ! ");
			}
		}
		//meme chose avec libelle
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT * FROM livret_module WHERE _LIBELLE_MOD_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
				}else {
					throw new exception("ModuleTools::getByLibelle => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByLibelle => parametre invalide ! ");
			}
		}
		//meme chose avec le code de la matiere
		public static function getByCodeMat($connect, $_code_matiere){
			$requete = "SELECT * FROM livret_module WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code_matiere)) {
			// set of parametres
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module"); 
				}else {
					throw new exception("ModuleTools::getByCodeMat => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByCodeMat => parametre invalide ! ");
			}
		}
		
		//on recupere les modules par semestre et par promotion
		public static function getBySemestre($connect, $_semestre, $_id_promo) {
			$requete = "SELECT * FROM livret_module WHERE _SEMESTRE_ = ? NATURAL JOIN (SELECT _ID_MOD_ FROM livret_parcours WHERE _ID_PROMO_ = ?)";
			if(!empty($connect) && is_numeric($_semestre) && is_numeric($_id_promo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_semestre, PDO::PARAM_INT);
				$stmt->bindValue(2, $_id_promo, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
				else 
					throw new exception ("ModuleTools::getBySemestre => impossible d'executer la requete ! ");
			}else 
				throw new exception ("ModuleTools::getBySemestre => parametres invalides ! ");
		}
		
		//renvoi vrai si l'id existe, non sinon
		public static function existID($connect, $_id) {
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livret_module WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("ModuleTools::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existID => parametres invalides ! ");
		}
		
		//renvoi vrai si l'id existe, non sinon
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livet_module WHERE _LIBELLE_MOD_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("ModuleTools::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existLibelle => parametres invalides ! ");
		}
		//verifie si une matiere existe deja 
		public static function existModule($connect, $_code_matiere, $_libelle, $_ects){
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livret_module WHERE _CODE_MAT_ = ? AND _LIBELLE_MAT_ = ? AND _ECTS_ = ?";
			if(!empty($connect) && !empty($_id_promo) && !empty($_libelle) && is_numeric($_ects)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_STR);
				$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(3, $_ects, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("ModuleTools::existElement => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existElement => parametres invalides ! ");
		}
		
		
		//un module s'il n'existe pas déjà dans la base sachant que les clé primaire sont l'id de la matiere et leur ects 
		public static function insertModule($connect, $_code_matiere, $_libelle, $_semestre ,$_nbh_c, $_nbh_td, $_nbh_tp, $_nbh_ctd, $_ects, $_coef, $_langue, $_intro, $_objectif, $_descript, $_method_eval, $_mod_cc_1, $_mod_cc_2, $_calcule_nf_1, $_calcule_nf_2, $_prerequis, $_ressources, $_biblio, $_note_elim, $_oblig) {
		
			$requete = "INSERT IGNORE INTO livret_module (_CODE_MAT_ , _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			if(!empty($connect) && is_numeric($_code_matiere) && !empty($_libelle) && is_numeric($_semestre) && is_numeric($_nbh_c) && is_numeric($_nbh_td) && is_numeric($_nbh_tp) && is_numeric($_nbh_ctd) && is_numeric($_ects) && is_numeric($_coef) && is_numeric($_note_elim)){
				try{
					if(MatiereTool::existID($connect, $_code_matiere)){
						//on a pas besoin de verifier si l'elment existe deja car les clés primaires sont fournis, et on utilise un insert ignore
						$stmt = $connect->prepare($requete);
						//configuration des parametres de la requete
						$stmt->bindValue(1, $_code_matiere, PDO::PARAM_INT);
						$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
						$stmt->bindValue(3, $_semestre, PDO::PARAM_INT);
						$stmt->bindValue(4, $_nbh_c, PDO::PARAM_INT);
						$stmt->bindValue(5, $_nbh_td, PDO::PARAM_INT);
						$stmt->bindValue(6, $_nbh_tp, PDO::PARAM_INT);
						$stmt->bindValue(7, $_nbh_ctd, PDO::PARAM_INT);
						$stmt->bindValue(8, $_ects, PDO::PARAM_INT);
						$stmt->bindValue(9, $_coef, PDO::PARAM_INT);
						$stmt->bindValue(10, $_langue, PDO::PARAM_STR);
                        $stmt->bindValue(11, $_intro, PDO::PARAM_STR);
						$stmt->bindValue(12, $_objectif, PDO::PARAM_STR);
						$stmt->bindValue(13, $_descript, PDO::PARAM_STR);
						$stmt->bindValue(14, $_method_eval, PDO::PARAM_STR);
						$stmt->bindValue(15, $_mod_cc_1, PDO::PARAM_STR);
						$stmt->bindValue(16, $_mod_cc_2, PDO::PARAM_STR);
						$stmt->bindValue(17, $_calcule_nf_1, PDO::PARAM_STR);
						$stmt->bindValue(18, $_calcule_nf_2, PDO::PARAM_STR);
						$stmt->bindValue(19, $_prerequis, PDO::PARAM_STR);
						$stmt->bindValue(20, $_ressources, PDO::PARAM_STR);
						$stmt->bindValue(21, $_biblio, PDO::PARAM_STR);
						$stmt->bindValue(22, $_note_elim, PDO::PARAM_INT);
						$stmt->bindValue(23, $_oblig, PDO::PARAM_STR);
						if($stmt->execute())
                            return TRUE;
                        else
                            throw new Exception("ModuleTool::insertModule => impossiblde d'exectuer la requete");
					}else 
						throw new exception("ModuleTool::insertModule => Erreur FOREIGN KEY ! ");
				}catch (exception $e) {
					throw new exception("ModuleTool::insertModule => ".$e->getMessage());
				}
			}else 
				throw new exception("ModuleTool::insertModule => parametres invalides ! ");
		}
		
		//permet de mettre a jour le module
		public static function updateModule($connect, $_id_mod ,$_code_matiere, $_libelle, $_semestre ,$_nbh_c, $_nbh_td, $_nbh_tp, $_nbh_ctd, $_ects, $_coef, $_langue, $_intro, $_objectif, $_descript, $_method_eval, $_mod_cc_1, $_mod_cc_2, $_calcule_nf_1, $_calcule_nf_2, $_prerequis, $_ressources, $_biblio, $_note_elim, $_oblig) {
			
			$requete = "UPDATE livret_module SET _CODE_MAT_ = ? , _LIBELLE_MOD_ = ? , _SEMESTRE_ = ? , _NBH_C = ? , _NBH_TD_ = ? , _NBH_TP_ = ? , _NBH_CTD_ = ? , _ECTS_ =  ? , _COEF_ = ? , _LANGUE_ = ? , _OBJECTIF_ = ? , _DESCRIPTION_ = ? , _METHODE_EVAL_ = ? , _MOD_CC_1_ = ? , _MOD_CC_2_ = ? , _CALCUL_NF_1_ = ? , _CALCUL_NF_2_ = ? , _PREREQUIS_ = ? , _LIEN_RESSOURCE_ = ? , _BIBLIOGRAPHIE_ = ? , _NOTE_ELIM_ = ? , _OBLIGATOIRE_ = ? WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id_mod) && is_numeric($_code_matiere) && !empty($_libelle) && is_numeric($_semestre) && is_numeric($_nbh_c) && is_numeric($_nbh_td) && 	is_numeric($_nbh_tp) && is_numeric($_nbh_ctd) && is_numeric($_ects) && is_numeric($_coef) && is_numeric($_note_elim)) {
				
				$stmt = $connect->prepare($requete);
				//configuration des parametres de la requete
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_INT);
				$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(3, $_semestre, PDO::PARAM_INT);
				$stmt->bindValue(4, $_nbh_c, PDO::PARAM_INT);
				$stmt->bindValue(5, $_nbh_td, PDO::PARAM_INT);
				$stmt->bindValue(6, $_nbh_tp, PDO::PARAM_INT);
				$stmt->bindValue(7, $_nbh_ctd, PDO::PARAM_INT);
				$stmt->bindValue(8, $_ects, PDO::PARAM_INT);
				$stmt->bindValue(9, $_coef, PDO::PARAM_INT);
				$stmt->bindValue(10, $_langue, PDO::PARAM_STR);
                $stmt->bindValue(11, $_intro, PDO::PARAM_STR);
				$stmt->bindValue(12, $_objectif, PDO::PARAM_STR);
				$stmt->bindValue(13, $_descript, PDO::PARAM_STR);
				$stmt->bindValue(14, $_method_eval, PDO::PARAM_STR);
				$stmt->bindValue(15, $_mod_cc_1, PDO::PARAM_STR);
				$stmt->bindValue(16, $_mod_cc_2, PDO::PARAM_STR);
				$stmt->bindValue(17, $_calcule_nf_1, PDO::PARAM_STR);
				$stmt->bindValue(18, $_calcule_nf_2, PDO::PARAM_STR);
				$stmt->bindValue(19, $_prerequis, PDO::PARAM_STR);
				$stmt->bindValue(20, $_ressources, PDO::PARAM_STR);
				$stmt->bindValue(21, $_biblio, PDO::PARAM_STR);
				$stmt->bindValue(22, $_note_elim, PDO::PARAM_INT);
				$stmt->bindValue(23, $_oblig, PDO::PARAM_STR);
				$stmt->bindValue(24, $_id_mod, PDO::PARAM_STR);
				if($stmt->execute())
                    return TRUE;
				else
                    throw new Exception ("ModuleTool::updateModule => impossible d'exectuer la requete");
			}else 
				throw new exception ("ModuleTool::updateModule => parametres invalide");
			
		}
		
		//permet d'avoir tous les modules
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_module ORDER BY _SEMESTRE_ ASC";
			if(!empty($connect)){
				$stmt = $connect->prepare($requete);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
				else 
					throw new Exception ("ModuleTool::getAll => impossible d'executer la requete !");
			}else
				throw new Exception("ModuleTool::getAll => parametre invalide");
		}

		//permet de supprimer un Module
		public static function deleteModule($connect, $_id_mod){
			$requete = "DELETE FROM livret_module WHERE _ID_MOD_ = ?";
			if(!empty($connect) && is_numeric($_id_mod)){
				$stmt = $connect->prepare($requete);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("ModuleTool::deleteModule => impossible d'executer la requte !");
			}else
				throw new Exception("ModuleTool::deleteModule => impossible d'executer la requete !");
				
		}
		
	}
?>