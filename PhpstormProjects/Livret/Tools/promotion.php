<?php 
include_once("connexion.php");
include_once("color.php");
include_once("parcours.php");
include_once("filiere.php");
	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Promo{
		 //genere une ligne d'un tableau contenant les informations de l'instance
        public function genereLine($connect){
            //parametrage du popOver afin d'avoir les informations de la filiere au clique

            $line = "<tr rel='popover' data-content=\"";
            if(!empty($connect))
                $line .= $this->generePop($connect);
            else
                $line .= htmlspecialchars(AlertTool::genereDanger("Impossible de se connecter"));
            $line .= "\" data-original-title='Filières'>";
            $line .= "<input type='hidden' value='".$this->_ID_PROMO_."'/>"; //permet d'avoir l'accés au formulaire de l'instance
            $line .= "<td>".$this->_LIBELLE_PROMO_."</td>";
            $line .= "<td>".$this->_NB_ELEVES_PROMO_."</td>";
            $line .= "<td>".$this->_INTITULE_PROMO_."</td>";
            $line .= "<td>".$this->_PREAMBULE_."</td>";
            $line .= "<td>".$this->_EPILOGUE_."</td>";
            $line .= "</tr>";
            return $line;
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($connect, $tableauPromo){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Promotions</h2></div>";
            if(!empty($tableauPromo)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Libelle</th>";
                $table .= "<th>Nombre d'élèves</th>";
                $table .= "<th>Intitule</th>";
                $table .= "<th>Préambule</th>";
                $table .= "<th>Epilogue</th>";
                $table .= "</tr>";
                try{
                    //generation des lignes du tableau
                    foreach ($tableauPromo as $value) {
                        $table .= $value->genereLine($connect);
                    }
                }catch(Exception $e){
                    $table .= AlertTool::genereWarning($e->getMessage());
                }
                
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucune Promotion trouvée !"));
            $table .= "</table>";
            return $table;
        }

        //le pop contiendra les libelles des Filiere de l'instance
        //ce pop sera genere avec Jquery 
        //pour pouvoir générer un popOver de Bootstrap, il faut placer les informations à l'interieur des parenthèses
        public function generePop($connect){
            $pop = "<div class='row-fluid popFiliere'>";
            if(!empty($connect)){
                //recup des Filieres dont l'instance de la promotion est en relation
                $lesParcours = ParcoursTool::getByIDPromo($connect, $this->_ID_PROMO_); 
                //pour chaque filiere trouvee
                //rappel : un parcour est une ligne de la table parcour qui represente la relation entre la filiere et la promotion
                //et qui contient deux champs qui sont l'id de la filiere et l'id de la promotion
                if(!empty($lesParcours)){
                    //on passe le nom du modal de modification
                    foreach ($lesParcours as $leParcour) {
                        //le pop qui sera afficher devra avoir la forme suivante : formUpdFilPro[idPromo]
                        //celle si sera passe en method get avec la variable pop
                        $pop .= "<span class='row'><a href='promoManager.php?pop=formUpdFilPro".$leParcour->_ID_PROMO_."&fil=".$leParcour->_ID_FILIERE_."' class='btn btn-link'>".$leParcour->getLibelleFiliere($connect)."</a></span>";
                    }
                    $pop .= "<span class='row'><a class='btn btn-mini' href='promoManager.php?pop=formAddFilPro".$this->_ID_PROMO_."'>Ajouter</a></span>";
                //si les parcours sont vides 
                //on propose d'ajouter une filiere en relation avec la promotion
                }else{
                    $messageAvecAjout = "<span class='row'>Aucune filière trouvée</span>";
                    //cette fois ci la variable GET 'pop' prendra la valeur de l'id du formulaire d'ajout
                    //on ajoute la valeur de la promotion a laquelle on ajoutera la Filiere comme reference
                    $messageAvecAjout .= "<span class='row'> <a href='promoManager.php?pop=formAddFilPro".$this->_ID_PROMO_."' class='btn btn-mini'>Ajouter</a></span>";
                    $pop .= AlertTool::genereWarning($messageAvecAjout);
                }       
            }else
                $pop .= AlertTool::genereDanger("Impossible de se connecter");
            $pop .= "</div>";
            return htmlspecialchars($pop);
        }

        //permet de generer un formulaire de modification ou suppression des Filieres en relation avec cette instance de promotion
        public function formUpdFiliere($connect){
            $form = "<div id='formUpdFilPro".$this->_ID_PROMO_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='promoManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Filière ".$this->_LIBELLE_PROMO_."</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='promoManager.php' class='form-horizontal'>";
            //Libelle de la Promotion et son id cache
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libellePromo'>Libelle Promotion</label>";
            $form .= "<div class='controls'>";
            $form .= "<span id='libellePromo' class='input-xlarge uneditable-input'>".$this->_LIBELLE_PROMO_."</span>";
            //ID PROMO
            $form .= "<input type='hidden' name='idPromo' value='".$this->_ID_PROMO_."'/>";
            //ID FILIERE
            $form .= "<input type='hidden' id='oldIdFiliere' name='oldIdFiliere' value=''/>";
            $form .= "</div></div>";
            //Liste de Libelle de Filiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleFiliereUpd'>Libelle Filière</label>";
            $form .= "<div class='controls'>";
            if(!empty($connect)){ //verification de la connexion
                //on recupere la liste des filiere
                try{
                    $lesFilieres = FiliereTool::getAll($connect);
                    if(!empty($lesFilieres)){
                        //apres verif on peut ajouter la selection
                        $form .= "<select id='libelleFiliereUpd' name='idFiliere' required='required'>";
                        foreach ($lesFilieres as $laFiliere) {
                            $form .= "<option value='".$laFiliere->_ID_FILIERE_."'>".$laFiliere->_LIBELLE_FILIERE_."</option>";
                        }
                        $form .= "</select>";
                    }else{
                        $form .= AlertTool::genereWarning("Aucune filière enregistree, pensez à ajouter des filières");
                    }
                //en cas d'erreur diffuser sur formulaire
                }catch(Exception $e){
                    $form .= AlertTool::genereDanger($e->getMessage());
                }
            }else
                $form .= AlertTool::genereDanger("Impossible de se connecter !");
            $form .= "</div> </div>";
            $form .= "</div>"; //Fin modal body 
            //Les Boutons
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formPopUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger ' name='formPopDltSubmit' value='Supprimer'/>";
            $form .= "<span><a href='promoManager.php'  data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //permet de generer le formulaire d'ajout de Filiere associe a cette instance de promotion
        public function formAddFiliere($connect){
            $form = "<div id='formAddFilPro".$this->_ID_PROMO_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='promoManager.php' class='close' data-dismiss='modal'>x</a> <h3>Ajout Filière à ".$this->_LIBELLE_PROMO_."</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='promoManager.php' class='form-horizontal'>";
            //Libelle de la Promotion et son id cache
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libellePromo'>Libelle Promotion</label>";
            $form .= "<div class='controls'>";
            $form .= "<span id='libellePromo' class='input-xlarge uneditable-input'>".$this->_LIBELLE_PROMO_."</span>";
            $form .= "<input type='hidden' name='idPromo' value='".$this->_ID_PROMO_."'/>";
            $form .= "</div></div>";
            //Liste de Libelle de Filiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleFiliere'>Libelle Filière</label>";
            $form .= "<div class='controls'>";
            if(!empty($connect)){ //verification de la connexion
                //on recupere la liste des filiere
                try{
                    $lesFilieres = FiliereTool::getAll($connect);
                    if(!empty($lesFilieres)){
                        //apres verif on peut ajouter la selection
                        $form .= "<select id='libelleFiliereAdd' name='idFiliere' required='required'>";
                        foreach ($lesFilieres as $laFiliere) {
                            $form .= "<option value='".$laFiliere->_ID_FILIERE_."'>".$laFiliere->_LIBELLE_FILIERE_."</option>";
                        }
                        $form .= "</select>";
                    }else{
                        $form .= AlertTool::genereWarning("Aucune filière enregistree, pensez à ajouter des filières");
                    }
                //en cas d'erreur diffuser sur formulaire
                }catch(Exception $e){
                    $form .= AlertTool::genereDanger($e->getMessage());
                }
            }else
                $form .= AlertTool::genereDanger("Impossible de se connecter !");
            $form .= "</div> </div>";
            $form .= "</div>"; //Fin modal body 
            //Les Boutons
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formPopAddSubmit' value='Envoyer'/>";
            $form .= "<span><a href='promoManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif(){
            $form = "<div id='myModal".$this->_ID_PROMO_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='promoManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Promotion</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_PROMO_."' method='post' action='promoManager.php'  class='form-horizontal'>";
            // Partie Libelle de la promotion
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libellePromo'>Libelle Promotion</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libellePromo' id='libellePromo' placeholder='Champ Obligatoire ...' required value='".$this->_LIBELLE_PROMO_."'/>";
            $form .= "<input type='hidden' name='idPromo' value='".$this->_ID_PROMO_."'/>";
            $form .= "</div> </div>";
            // Partie Nbre Eleves 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrElevePromo'>Nombre d'Élèves</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' class='input' name='nbrElevePromo' id='nbrElevePromo' value='".$this->_NB_ELEVES_PROMO_."'/>";
            $form .= "</div> </div>";
            //Partie Intitule Promo
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='intitulePromo'>Intitulé</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='intitulePromo' id='intitulePromo' placeholder='Veuillez renseigner l'intitule' value='".$this->_INTITULE_PROMO_."'/>";
            $form .= "</div> </div>";
            //Partie Preambule
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='preambulePromo'>Preambule</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='textarea' name='preambulePromo' id='preambulePromo' placeholder='Preambule ...' value='".$this->_PREAMBULE_."'/>";
            $form .= "</div> </div>";
            //Partie Epilogue
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='epiloguePromo'>Epilogue</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='textarea' name='epiloguePromo' id='epiloguePromo' placeholder='Epilogue ...' value='".$this->_EPILOGUE_."'/>";
            $form .= "</div> </div>";
            //COULEUR 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur1Promo'>Couleur 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur1Promo' id='couleur1Promo' required value='".rgb2hex($this->_COULEUR1_)."'/>";
            $form .= "</div> </div>";
           	//COULEUR 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur2Promo'>Couleur 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur2Promo' id='couleur2Promo' required value='".rgb2hex($this->_COULEUR2_)."'/>";
            $form .= "</div> </div>";
            //COULEUR 3
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur3Promo'>Couleur 3</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur3Promo' id='couleur3Promo' required value='".rgb2hex($this->_COULEUR3_)."'/>";
            $form .= "</div> </div>";
            //CFG
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='cfgPromo'>CFG</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='cfgPromo' id='cfgPromo' required value='".rgb2hex($this->_COULEUR_FG_)."'/>";
            $form .= "</div> </div>";
            //CPG
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='cfgPromo'>CPG</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='cpgPromo' id='cpgPromo' required value='".rgb2hex($this->_COULEUR_BG_)."'/>";
            $form .= "</div> </div>";
  			// fin du modal-body
            $form .= "</div>"; 
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<span><a href='promoManager.php'  data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //genere un formulaire de creation de composante
        public static function genereFormAdd(){
            $form = "<div id='formAddPromo' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='promoManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Promotion</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='promoManager.php'  class='form-horizontal'>";
            // Partie Libelle de la promotion
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libellePromo'>Libelle Promotion</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleAddPromo' id='libellePromo' placeholder='Champ Obligatoire ...' required/>";
            $form .= "</div> </div>";
            // Partie Nbre Eleves 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nbrElevePromo'>Nombre d'Élèves</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' pattern='\\d*' name='nbrEleveAddPromo' id='nbrElevePromo' placeholder='Veuillez renseigner un nombre...'/>";
            $form .= "</div> </div>";
            //Partie Intitule Promo
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='intitulePromo'>Intitulé</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='intituleAddPromo' id='intitulePromo' placeholder='Veuillez renseigner l'intitule' />";
            $form .= "</div> </div>";
            //Partie Preambule
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='preambulePromo'>Preambule</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='textarea' name='preambuleAddPromo' id='preambulePromo' placeholder='Preambule ...' />";
            $form .= "</div> </div>";
            //Partie Epilogue
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='epiloguePromo'>Epilogue</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='textarea' name='epilogueAddPromo' id='epiloguePromo' placeholder='Epilogue ...' />";
            $form .= "</div> </div>";
            //COULEUR 1
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur1Promo'>Couleur 1</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur1AddPromo' id='couleur1Promo' required />";
            $form .= "</div> </div>";
           	//COULEUR 2
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur2Promo'>Couleur 2</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur2AddPromo' id='couleur2Promo' required />";
            $form .= "</div> </div>";
            //COULEUR 3
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='couleur3Promo'>Couleur 3</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='couleur3AddPromo' id='couleur3Promo' required />";
            $form .= "</div> </div>";
            //CFG
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='cfgPromo'>CFG</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='cfgAddPromo' id='cfgPromo' required />";
            $form .= "</div> </div>";
            //CPG
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='cfgPromo'>CPG</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='color' name='cpgAddPromo' id='cpgPromo' required />";
            $form .= "</div> </div>";
  			// fin du modal-body
            $form .= "</div>"; 
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<span><a href='promoManager.php'  data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }
	}


	//la variable $connect instance de PDO vers la bdd livret
	//gestion des promotions
	class PromoTool{
		
		//insert un element dans la table de promotion
		//return vrai si tout vas bien, non sinon.
		public static function insertPromo ($connect, $_libelle, $_nb_eleve, $_intitule, $_preambule, $_epilogue, $_color1, $_color2, $_color3, $_cfg, $_cpg){
			$requete = "INSERT INTO livret_promotion (_LIBELLE_PROMO_, _NB_ELEVES_PROMO_, _INTITULE_PROMO_, _PREAMBULE_, _EPILOGUE_, _COULEUR1_, _COULEUR2_, _COULEUR3_, _COULEUR_FG_, _COULEUR_BG_) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			if(!empty($connect) && !empty($_libelle) && !empty($_color1) && !empty($_color2) && !empty($_color3) && !empty($_cfg) && !empty($_cpg)){
				//verifier si le libelle exist deja
				if (! PromoTool::existLibelle($connect, $_libelle)) {
					//configuration des parametres d'ajout
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $_libelle, PDO::PARAM_STR);
					$stmt->bindParam(2, $_nb_eleve, PDO::PARAM_INT);
					$stmt->bindParam(3, $_intitule, PDO::PARAM_STR);
					$stmt->bindParam(4, $_preambule, PDO::PARAM_STR);
					$stmt->bindParam(5, $_epilogue, PDO::PARAM_STR);
					$stmt->bindParam(6, $_color1, PDO::PARAM_STR, 12);
					$stmt->bindParam(7, $_color2, PDO::PARAM_STR, 12);
					$stmt->bindParam(8, $_color3, PDO::PARAM_STR, 12);
					$stmt->bindParam(9, $_cfg, PDO::PARAM_STR, 12);
					$stmt->bindParam(10, $_cpg, PDO::PARAM_STR, 12);

					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("PromoTool::insertPromo => impossible d'executer la requete");
						
				}else
					return TRUE;
			}else
				throw new exception("PromoTools::insertPromo => parametres invalides !");
		}
		
		//retourne un tableau d'objet de type promo contenant les informations de la base de données de la table promotion pour les lignes avec l'id en parametre
		public static function getByID($connect, $_id) {
			$requete = "SELECT DISTINCT * FROM livret_promotion WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($_id)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Promo");	
				}else {
					throw new exception("PromoTools::getByID => impossible d'exécuter la requete !");
				}
			}else {
				throw new exception("PromoTools::getByID => parametres invalide !");
			}
		}
		
		//retourne la mme chose que la fonction getByID, meme principe.
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT DISTINCT * FROM livret_promotion WHERE _LIBELLE_PROMO_ = ?";
			if(!empty($connect) && !empty($_libelle)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Promo");
				}else {
					throw new exception("PromoTools::getByLibelle => impossible d'exécuter la requete !");
				}
			}else {
				throw new exception("PromoTools::getByLibelle => parametres invalide !");
			}
		}
		
		//retourne toutes les lignes des promotions
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_promotion";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Promo");
			else 
				throw new exception ("PromoTool::getAllPromo => impossible d'executer la requete !");
		}
		
		//return vrai si l'ID exist dans la table et non dans le cas contraire
		public static function existID($connect, $_id) {
			$requete = "SELECT COUNT(DISTINCT _ID_PROMO_) FROM livret_promotion WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($_id)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_id, PDO::PARAM_INT);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("PromoTools::existID => impossiblde d'executer la requete ! ");
			}else 
				throw new exception("PromoTools::existID => parametres invalides ! ");
		}
		
		//return vrai si le libelle exist dans la table et non dans le cas contraire 
		public static function existLibelle($connect, $_libelle) {
			$requete = "SELECT COUNT(DISTINCT _ID_PROMO_) FROM livret_promotion WHERE _LIBELLE_PROMO_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else {
					throw new exception("PromoTools::existLibelle => impossible d'executer la requete !");
				}
			}else {
				throw new exception("PromoTools::existLibelle => parametres invalide !");
			}
		}

		//met a jour les informations de la promotion 
		public static function updatePromo($connect, $_id, $_libelle, $_nbEleve, $_intitule, $_preambule, $_epilogue, $_color1, $_color2, $_color3, $_cpg, $_cfg){
			$requete = "UPDATE livret_promotion SET _LIBELLE_PROMO_ = ? , _NB_ELEVES_PROMO_ = ? , _INTITULE_PROMO_ = ? , _PREAMBULE_ = ? , _EPILOGUE_ = ? , _COULEUR1_ = ? , _COULEUR2_ = ? , _COULEUR3_ = ? , _COULEUR_FG_ = ? , _COULEUR_BG_ = ? WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($_id) && !empty($_libelle) && is_numeric($_nbEleve)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_libelle, PDO::PARAM_STR);
				$stmt->bindParam(2, $_nbEleve, PDO::PARAM_INT);
				$stmt->bindParam(3, $_intitule, PDO::PARAM_STR);
				$stmt->bindParam(4, $_preambule, PDO::PARAM_STR);
				$stmt->bindParam(5, $_epilogue, PDO::PARAM_STR);
				$stmt->bindParam(6, $_color1, PDO::PARAM_STR);
				$stmt->bindParam(7, $_color2, PDO::PARAM_STR);
				$stmt->bindParam(8, $_color3, PDO::PARAM_STR);
				$stmt->bindParam(9, $_cfg, PDO::PARAM_STR);
				$stmt->bindParam(10, $_cpg, PDO::PARAM_STR);
				$stmt->bindParam(11, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("PromoTool::updatePromo => impossible d'executer la requete !");
			}else
				throw new Exception("PromoTool::updatePromo => parametre invalide !");
				
		}

		//supprime une promotion avec son id
		public static function deletePromo($connect, $_id){
			$requete = "DELETE FROM livret_promotion WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($_id)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("PromoTool::deletePromo => impossible d'executer la requete !");
			}else
				throw new Exception("PromoTool::deletePromo => parametre invalide !");
		}
	}
?>