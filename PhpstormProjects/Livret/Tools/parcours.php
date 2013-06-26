<?php
	include_once("filiere.php");
	include_once("promotion.php");

	class Parcour{

		//recupere le Libelle de la filiere de l'instance
		public function getLibelleFiliere($connect){
			try{
				$laFiliere = FiliereTool::getByID($connect, $this->_ID_FILIERE_);
				if(!empty($laFiliere))
					return $laFiliere[0]->_LIBELLE_FILIERE_;
				else
					return NULL;
			}catch(Exception $e){
				throw new Exception("Parcour::getLibelleFiliere => ".$e->getMessage());
			}
		}

		//recup le libelle de la promo de l'instance
		public function getLibellePromo ($connect){
			try {
				$laPromo = PromoTool::getByID($connect, $this->_ID_PROMO_);
				if(!empty($laPromo))
					return $laPromo[0]->_LIBELLE_PROMO_;
				else
					return NULL;
			} catch (Exception $e) {
				throw new Exception("Parcour::getLibellePromo => ".$e->getMessage());
			}
		}

        //recup la promo qui correspond a ce parcour
        public function getPromo($connect){
            try{
                $laPromo = PromoTool::getByID($connect, $this->_ID_PROMO_);
                if(!empty($laPromo))
                    return $laPromo[0];
                else
                    return NULL;
            }catch(Exception $e){
                throw new Exception ("Parcour::Promo => ".$e->getMessage());
            }
        }

        public function getFiliere($connect){
            try{
                $laFiliere = FiliereTool::getByID($connect, $this->_ID_FILIERE_);
                if(!empty($laFiliere))
                    return $laFiliere[0];
                else
                    return NULL;
            }catch(Exception $e){
                throw new Exception("Parcour::getLibelleFiliere => ".$e->getMessage());
            }
        }
		
		public static function genereFormAdd($connect){
			$form = "<div id='formAddParcour' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Ajout de parcour </h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='promoManager.php' class='form-horizontal'>";
            //Libelle de la Promotion et son id cache
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libellePromo'>Libelle Promotion</label>";
            $form .= "<div class='controls'>";
            if(!empty($connect)){
            	try {
            		$lesPromo = PromoTool::getAll($connect);
            		if(!empty($lesPromo)){
            			$form .= "<select id='libellePromo' name='idPromo' required='required'>";
            			foreach ($lesPromo as $laPromo) {
            				$form .= "<option value='".$laPromo->_ID_PROMO_."'>".$laPromo->_LIBELLE_PROMO_."</option>";
            			}
            			$form .= "</select>";
            		}else{
            			$form .= AlertTool::genereWarning("Aucune promotion enregistree, pensez à ajouter des promotions");
            		}
            	} catch (Exception $e) {
            		$form .= AlertTool::genereWarning($e->getMessage());
            	}
            }else
            	$form .= AlertTool::genereDanger("Impossible de se connecter !");
            $form .= "</div></div>";
            //Filiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleFiliere'>Libelle Filière</label>";
            $form .= "<div class='controls'>";
            if(!empty($connect)){ //verification de la connexion
                //on recupere la liste des filiere
                try{
                    $lesFilieres = FiliereTool::getAll($connect);
                    if(!empty($lesFilieres)){
                        //apres verif on peut ajouter la selection
                        $form .= "<select id='libelleFiliere' name='idFiliere' required='required'>";
                        foreach ($lesFilieres as $laFiliere) {
                            $form .= "<option value='".$laFiliere->_ID_FILIERE_."'>".$laFiliere->_LIBELLE_FILIERE_."</option>";
                        }
                        $form .= "</select>";
                    }else{
                        $form .= AlertTool::genereWarning("Aucune filière enregistrée, pensez à ajouter des filières");
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
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
		}
		
	}

/*--------------------------------------------------------------------------------------------------------------------------------*/
	
	//permet de gere la table livret_parcours
	class ParcoursTool{

		//permet d'avoir toutes les promotions de la filiere en parametre
		public static function getByIDFiliere($connect, $idFiliere){
			$requete = "SELECT * FROM livret_parcours WHERE _ID_FILIERE_ = ?";
			if(!empty($connect) && is_numeric($idFiliere)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFiliere, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Parcour");
				else
					throw new Exception("ParcoursTool::getByIDFiliere => impossible d'executer la requete");	
			}else
				throw new Exception("ParcoursTool::getByIDFiliere => invalide parametre !");
		}

		//permet d'avoir toutes les Filieres de la promotion demandé
		public static function getByIDPromo ($connect, $idPromo){
			$requete = "SELECT * FROM livret_parcours WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idPromo, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Parcour");
				else
					throw new Exception("ParcoursTool::getByIDPromo => impossible d'executer la requete");
			}else
				throw new Exception("ParcoursTool::getByIDPromo => invalide parametre !");
		}

		//renvoi boolean permettant de savoir si le parcour existe deja ou non 
		public static function existParcour ($connect, $idFiliere , $idPromo){
			$requete = "SELECT COUNT(*) FROM livret_parcours WHERE _ID_FILIERE_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idFiliere) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFiliere, PDO::PARAM_INT);
				$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("ParcoursTool::existParcour => impossible d'executer la requete");
			}else
				throw new Exception("ParcoursTool::existParcour => invalide parametre !");
		}

		//permet de mettre a jour un parcour
		public static function updateParcour($connect, $oldIdFiliere, $oldIdPromo, $newIdFiliere, $newIdPromo){
			$requete = "UPDATE livret_parcours SET _ID_FILIERE_ = ? , _ID_PROMO_ = ? WHERE _ID_FILIERE_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($oldIdFiliere) && is_numeric($oldIdPromo) && is_numeric($newIdFiliere) && is_numeric($newIdPromo)){
				if(self::existParcour($connect, $oldIdFiliere, $oldIdPromo)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $oldIdFiliere, PDO::PARAM_INT);
					$stmt->bindParam(2, $oldIdPromo, PDO::PARAM_INT);
					$stmt->bindParam(3, $newIdFiliere, PDO::PARAM_INT);
					$stmt->bindParam(4, $newIdPromo, PDO::PARAM_INT);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("ParcoursTool::updateParcour => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("ParcoursTool::updateParcour => parametres invalide !");
				
		}
		//permet de supprimer un parcour
		public static function deleteParcour ($connect, $idFiliere, $idPromo){
			$requete = "DELETE FROM livret_parcours WHERE _ID_FILIERE_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idFiliere) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFiliere, PDO::PARAM_INT);
				$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
				if($stmt->execute()){
					return TRUE;
				}else
					throw new Exception("ParcoursTool::deleteParcour => impossible d'executer la requete");
			}else
				throw new Exception("ParcoursTool::deleteParcour => parametre invalide !");
		}

		//permet d'ajouter un parcour
		public static function insertParcour ($connect, $idFiliere, $idPromo){
			$requete = "INSERT IGNORE INTO livret_parcours (_ID_FILIERE_ , _ID_PROMO_) VALUES (? , ?)";
			if(!empty($connect) && is_numeric($idFiliere) && is_numeric($idPromo)){
				if(FiliereTool::existID($connect, $idFiliere) && PromoTool::existID($connect, $idPromo)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $idFiliere, PDO::PARAM_INT);
					$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("ParcoursTool::insertParcour => impossible d'executer la requete");
				}else
					throw new Exception("ParcoursTool::insertParcour => ERREUR FOREIGN KEY, element dont exist ");
			}else
				throw new Exception("ParcoursTool::insertParcour => parametre invalide !");
		}
	}
?>