<?php
	include_once("promotion.php");
	include_once("module.php");

    //contient deux attributs : ID de promotion, ID de module
    //symbolisant la relation entre le module et la promotion
	class Programme{

        //permet de généré un tableau de Module a partir des ids de chaque module du programme
        //si des ids ne sont pas trouvé dans la base, ils sont ignoré
        //$tableauProg est un tableau de Programmes
        public static function sheetsOfModules(PDO $connect, $tableauProg){
            if(!empty($tableauProg)){
                try{
                    $result = array();
                    foreach ($tableauProg as $prog){
                        //extraction de l'objet module a partir de son id
                        $leModule = ModuleTool::getByID($connect, $prog->_ID_MOD_);
                        if(!empty($leModule)){ //on prend que les modules existant
                            $result[] = $leModule[0];
                        }
                    }
                    return $result;
                }catch(Exception $e){
                    throw new Exception ("Programme::sheetsOfModules => ".$e->getMessage());
                }
            }else
                return NULL;
        }

        //permet de généré à partir du tableau de programme (c-a-d la relation entre module et promotion) toutes les fiches des
        //promotions existante dans le tableau
        public static function sheetsOfPromo (PDO $connect, $tableauProg){
            if(!empty($tableauProg)){
                try{
                    $result = array();
                    foreach ($tableauProg as $prog){
                        //extraction de l'objet module a partir de son id
                        $laPromo = PromoTool::getByID($connect, $prog->_ID_PROMO_);
                        //la fonction getByID retourne un tableau de resultat donc un tableau de promo
                        if(!empty($laPromo)){ //on prend que les modules existant
                            $result[] = $laPromo[0];
                        }
                    }
                    return $result;
                }catch(Exception $e){
                    throw new Exception ("Programme::sheetsOfPromo => ".$e->getMessage());
                }
            }else
                return NULL;
        }

		//regroupe les information du promotion correspondante au module dans un div
		//cette fonction est utilisé dans le tableau de Module dans la colonne de promotion
		public static function pack_it ($connect, $leModule){
            $pack = '';
			//recupér la page actuel du module
			if(isset($_GET['pm'])){
				$thePage = intval($_GET['pm']);
			}else
				$thePage = 1;
			try {
				$arrayProg = ProgrammeTool::getByIDMod($connect, $leModule->_ID_MOD_);
				if(!empty($arrayProg)){
					foreach ($arrayProg as $prog) {
						$pack .= "<span class='row-fluid'><a href='moduleManager.php?pm=".$thePage."&progform=upd&mod=".$leModule->_ID_MOD_."&promo=".$prog->_ID_PROMO_."'>".$prog->getLibellePromo($connect)."</a></span>";
					}
					$pack .= "<span class='row-fluid'><a href='moduleManager.php?pm=".$thePage."&progform=add&mod=".$leModule->_ID_MOD_."'><i class='icon-plus'></i></a></span>";
				}else{
					$pack .= "<span class='label label-info'>Aucun</span>";
					$pack .= "<span class='row'><a href='moduleManager.php?pm=".$thePage."&progform=add&mod=".$leModule->_ID_MOD_."'><i class='icon-plus'></i></a></span>";
				}
			} catch (Exception $e) {
				$pack .= AlertTool::genereDanger("Programme::pack_it => ".$e->getMessage());
			}
			return $pack;
		}


		//recupere le Libelle du module de l'instance
		public function getLibelleMod($connect){
			try{
				$leModule = ModuleTool::getByID($connect, $this->_ID_MOD_);
				if(!empty($leModule))
					return $leModule[0]->_LIBELLE_MOD_;
				else
					return NULL;
			}catch(Exception $e){
				throw new Exception("Programme::getLibelleMod => ".$e->getMessage());
			}
		}

        //recupere une instance de Module a partir de l'id
        public function getMod($connect){
            try{
                $leModule = ModuleTool::getByID($connect, $this->_ID_MOD_);
                if(!empty($leModule))
                    return $leModule[0];
                else
                    return NULL;
            }catch (Exception $e){
                throw new Exception ("Programme::getMod => ".$e->getMessage());
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
				throw new Exception("Programme::getLibellePromo => ".$e->getMessage());
			}
		}


        //genere un formulaire de modification de UE pour le module passé en parametre
        //nous generons un seul formulaire par module, si on a plusieurs Code Apogee par Module, nous changeons les variables avec JQuery
        public static function genereFormUpdProgForMod($connect ,$leModule){
            if(!empty($leModule)){
                $form = "<div id='formUpdProg".$leModule->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
                $form .= "<div class='modal-header'>";
                $form .= "<a class='close' data-dismiss='modal'>x</a> <h3>Gestion de Promotion </h3>";
                $form .= "</div>";
                //Libelle de la promotion avec un input cache contenant l'id du module
                $form .= "<div class='modal-body'>";
                $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
                $form .= "<div class='control-group'>";
                $form .= "<label class='control-label' for='libelleMod'>Libelle Module</label>";
                $form .= "<div class='controls'>";
                $form .= "<span id='libelleMod' class='input-xlarge uneditable-input'>".$leModule->_LIBELLE_MOD_."</span>";
                $form .= "<input type='hidden' name='idModForProg' value='".$leModule->_ID_MOD_."'/>";
                $form .= "<input type='hidden' name='oldIdPromo' id='oldIdPromo'/>";
                $form .= "</div></div>";

                //Libelle de la Promotion et son id cache
                $form .= "<div class='control-group'>";
                $form .= "<label class='control-label' for='libellePromoProg'>Libelle Promotion</label>";
                $form .= "<div class='controls'>";
                if(!empty($connect)){
                    try {
                        $lesPromo = PromoTool::getAll($connect);
                        if(!empty($lesPromo)){
                            $form .= "<select id='libellePromoProg' name='idPromoProg' required='required'>";
                            foreach ($lesPromo as $laPromo){
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
                //fin modal-body
                $form .= "</div>";
                $form .= "<div class='control-group modal-footer'>";
                $form .= "<input type='submit' class='btn btn-primary' name='formUpdProgSubmit' value='Envoyer'/>";
                $form .= "<input type='submit' class='btn btn-danger' name='formDeleteProgSubmit' value='Supprimer'/>";
                $form .= "<span><a data-dismiss='modal' class='btn'>Annuler</a></span>";
                $form .= "</div> </form>";
                $form .= "</div>";
                return $form;
            }else
                throw new Exception("Programme::genereFormUpdProgForMod => parametre invalide");
        }


        //formulaire d'ajout d'information au module passe en parametre
        public static function genereFormAddProgForMod($connect, $leModule){
            if(!empty($leModule)){
                $form = "<div id='formAddProg".$leModule->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
                $form .= "<div class='modal-header'>";
                $form .= "<a href='moduleManager.php' class='close' data-dismiss='modal'>x</a> <h3>Ajout de Promotion</h3>";
                $form .= "</div>";
                //Libelle de la promotion avec un input cache contenant l'id du module
                $form .= "<div class='modal-body'>";
                $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
                $form .= "<div class='control-group'>";
                $form .= "<label class='control-label' for='libelleMod'>Libelle Module</label>";
                $form .= "<div class='controls'>";
                $form .= "<span id='libelleMod' class='input-xlarge uneditable-input'>".$leModule->_LIBELLE_MOD_."</span>";
                $form .= "<input type='hidden' name='idModForProg' value='".$leModule->_ID_MOD_."'/>";

                $form .= "</div></div>";
                //Libelle de la Promotion et son id cache
                $form .= "<div class='control-group'>";
                $form .= "<label class='control-label' for='libellePromoProg'>Libelle Promotion</label>";
                $form .= "<div class='controls'>";
                if(!empty($connect)){
                    try {
                        $lesPromo = PromoTool::getAll($connect);
                        if(!empty($lesPromo)){
                            $form .= "<select id='libellePromoProg' name='idPromoProg' required='required'>";
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
                //fin modal-body
                $form .= "</div>";
                $form .= "<div class='control-group modal-footer'>";
                $form .= "<input type='submit' class='btn btn-primary' name='formAddProgSubmit' value='Envoyer'/>";
                $form .= "<span><a data-dismiss='modal' class='btn'>Annuler</a></span>";
                $form .= "</div> </form>";
                $form .= "</div>";
                return $form;
            }else
                throw new Exception("Programme::genereFormAddProgForMod => parametre invalide");
        }

	}

/*------------------------------------------------------------------------------------------------------------------------*/

	//permet de gere la table livret_programme qui contient le programme de la promotion, c-a-d ces modules
	class ProgrammeTool{

		//permet d'avoir toutes les promotions du module en parametre
		public static function getByIDMod($connect, $idMod){
			$requete = "SELECT * FROM livret_programme WHERE _ID_MOD_ = ?";
			if(!empty($connect) && is_numeric($idMod)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Programme");
				else
					throw new Exception("ProgrammeTool::getByIDMod => impossible d'executer la requete");	
			}else
				throw new Exception("ProgrammeTool::getByIDMod => invalide parametre !");
		}

		//permet d'avoir tous les modules de la promotion demandé
		public static function getByIDPromo ($connect, $idPromo){
			$requete = "SELECT * FROM livret_programme WHERE _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idPromo, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Programme");
				else
					throw new Exception("ProgrammeTool::getByIDPromo => impossible d'executer la requete");
			}else
				throw new Exception("ProgrammeTool::getByIDPromo => invalide parametre !");
		}

		//renvoi boolean permettant de savoir si la relation entre module et promo en parametre, existe deja ou non 
		public static function existProgramme ($connect, $idMod , $idPromo){
			$requete = "SELECT COUNT(*) FROM livret_programme WHERE _ID_MOD_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("ProgrammeTool::existProgramme => impossible d'executer la requete");
			}else
				throw new Exception("ProgrammeTool::existProgramme => invalide parametre !");
		}

		//permet de mettre a jour un programme
		public static function updateProgramme($connect, $oldIdMod, $oldIdPromo, $newIdMod, $newIdPromo){
			$requete = "UPDATE livret_programme SET _ID_MOD_ = ? , _ID_PROMO_ = ? WHERE _ID_MOD_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($oldIdMod) && is_numeric($oldIdPromo) && is_numeric($newIdMod) && is_numeric($newIdPromo)){
				if(self::existProgramme($connect, $oldIdMod, $oldIdPromo)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $newIdMod, PDO::PARAM_INT);
					$stmt->bindParam(2, $newIdPromo, PDO::PARAM_INT);
					$stmt->bindParam(3, $oldIdMod, PDO::PARAM_INT);
					$stmt->bindParam(4, $oldIdPromo, PDO::PARAM_INT);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("ProgrammeTool::updateProgramme => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("ProgrammeTool::updateProgramme => parametres invalide !");
		}

		//permet de supprimer un programme
		public static function deleteProgramme ($connect, $idMod, $idPromo){
			$requete = "DELETE FROM livret_programme WHERE _ID_MOD_ = ? AND _ID_PROMO_ = ?";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idPromo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
				if($stmt->execute()){
					return TRUE;
				}else
					throw new Exception("ProgrammeTool::deleteProgramme => impossible d'executer la requete");
			}else
				throw new Exception("ProgrammeTool::deleteProgramme => parametre invalide !");
		}

		//permet d'ajouter un programme
		public static function insertProgramme ($connect, $idMod, $idPromo){
			$requete = "INSERT IGNORE INTO livret_programme (_ID_MOD_ , _ID_PROMO_) VALUES (? , ?)";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idPromo)){
				if(ModuleTool::existID($connect, $idMod) && PromoTool::existID($connect, $idPromo)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
					$stmt->bindParam(2, $idPromo, PDO::PARAM_INT);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("ProgrammeTool::insertProgramme => impossible d'executer la requete");
				}else
					throw new Exception("ProgrammeTool::insertProgramme => ERREUR FOREIGN KEY, element dont exist ");
			}else
				throw new Exception("ProgrammeTool::insertProgramme => parametre invalide !");
		}
	}
?>