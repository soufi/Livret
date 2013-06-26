<?php 
include_once("module.php");
include_once("alerts.php");

	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Ue{

		//emballe le tableau de UE dans un div, en ajoutant des liens vers la page de module afin que
		//chaque UE puisse nous donner l'id du form pour modifier l'unité d'enseignement
		public static function pack_it ($connect, $leModule){
            $pack = '';
			try {
				$arrayUe = UeTool::getByIDModule($connect, $leModule->_ID_MOD_);
				if(!empty($arrayUe)){
					foreach ($arrayUe as $ue) {
						$pack .= "<span class='row-fluid'> <a href='moduleManager.php?ueform=upd&mod=".$ue->_ID_MOD_."&apogee=".$ue->_APOGEE_."'>".$ue->_APOGEE_."</a></span>";
					}
					$pack .= "<span class='row-fluid'><a href='moduleManager.php?ueform=add&mod=".$leModule->_ID_MOD_."'><i class='icon-plus'></i></a></span>";
				}else{
					$pack .= "<span class='label label-info'>Aucun</span>";
					$pack .= "<span class='row'><a href='moduleManager.php?ueform=add&mod=".$leModule->_ID_MOD_."'><i class='icon-plus'></i></a></span>";
				}
                	
			} catch (Exception $e) {
				$pack .= AlertTool::genereDanger("Ue::pack_it => ".$e->getMessage());
			}
			return $pack;
		}

		//genere un formulaire de modification de UE pour le module passé en parametre
		//nous generons un seul formulaire par module, si on a plusieurs Code Apogee par Module, nous changeons les variables avec JQuery
		public static function genereFormUpdUEForMod($leModule){
			if(!empty($leModule)){
				$form = "<div id='formUpdUE".$leModule->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
	            $form .= "<div class='modal-header'>";
	            $form .= "<a class='close' data-dismiss='modal'>x</a> <h3>Gestion de UE de ".$leModule->_LIBELLE_MOD_."</h3>";
	            $form .= "</div>";
	            //Libelle de la filiere avec un input cache contenant l'id de la filiere
	            $form .= "<div class='modal-body'>";
	            $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
	            $form .= "<div class='control-group'>";
	            $form .= "<label class='control-label' for='libelleMod'>Libelle Module</label>";
	            $form .= "<div class='controls'>";
	            $form .= "<span id='libelleMod' class='input-xlarge uneditable-input'>".$leModule->_LIBELLE_MOD_."</span>";
	            $form .= "<input type='hidden' name='idModForUE' value='".$leModule->_ID_MOD_."'/>";
	            $form .= "<input type='hidden' name='oldApogee' id='oldApogee'/>";
	            $form .= "</div></div>";
	            //Code Apogee de UE
	            $form .= "<div class='control-group'>";
	            $form .= "<label class='control-label' for='apogee'>APOGEE</label>";
	            $form .= "<div class='controls'>";
	            $form .= "<input type='text' name='apogee' id='apogee' placeholder='Champ Obligatoire ...' required='required'/>";
	            $form .= "</div></div>";
	            //fin modal-body
	            $form .= "</div>";
	            $form .= "<div class='control-group modal-footer'>";
           		$form .= "<input type='submit' class='btn btn-primary' id='btnUpdUE' name='formUpdUESubmit' value='Envoyer'/>";
           		$form .= "<input type='submit' class='btn btn-danger' id='btnDelUE' name='formDeleteUESubmit' value='Supprimer'/>";
            	$form .= "<span><a data-dismiss='modal' class='btn'>Annuler</a></span>";
            	$form .= "</div> </form>";
            	$form .= "</div>";
            	return $form;
			}else
				throw new Exception("Ue::genereFormUpdUEForMod => parametre invalide");
		}

		//formulaire d'ajout d'information au module passe en parametre
		public static function genereFormAddUEForMod($leModule){
			if(!empty($leModule)){
				$form = "<div id='formAddUE".$leModule->_ID_MOD_."' class='modal hide fade in' style='display: none;'>";
	            $form .= "<div class='modal-header'>";
	            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Ajout de UE ".$leModule->_ID_MOD_."</h3>";
	            $form .= "</div>";
	            //Libelle du Module avec un input cache contenant l'id du module
	            $form .= "<div class='modal-body'>";
	            $form .= "<form method='post' action='moduleManager.php'  class='form-horizontal'>";
	            $form .= "<div class='control-group'>";
	            $form .= "<label class='control-label' for='libelleMod'>Libelle Module</label>";
	            $form .= "<div class='controls'>";
	            $form .= "<span id='libelleMod' class='input-xlarge uneditable-input'>".$leModule->_LIBELLE_MOD_."</span>";
	            $form .= "<input type='hidden' name='idModForUE' value='".$leModule->_ID_MOD_."'/>";
	            $form .= "</div></div>";
	            //Code Apogee de UE
	            $form .= "<div class='control-group'>";
	            $form .= "<label class='control-label' for='apogee'>APOGEE</label>";
	            $form .= "<div class='controls'>";
	            $form .= "<input type='text' name='apogee' id='apogee' placeholder='Champ Obligatoire ...' required='required'/>";
	            $form .= "</div></div>";
	            //fin modal-body
	            $form .= "</div>";
	            $form .= "<div class='control-group modal-footer'>";
	       		$form .= "<input type='submit' class='btn btn-primary' id='btnAddUE' name='formAddUESubmit' value='Envoyer'/>";
	        	$form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
	        	$form .= "</div> </form>";
	        	$form .= "</div>";
	        	return $form;
			}else
				throw new Exception("Ue::genereFormAddUEForMod => parametre invalide");        		        	
		}
	}

	class UeTool{
		
		//permet d'avoir les UE en fonction de l'id du module 
		public static function getByIDModule($connect, $_id) {
			$requete = "SELECT * FROM livret_ue WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_id, PDO::PARAM_INT, 4);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Ue");
				else 
					throw new Exception("UeTool::getByIDModule => impossible d'executer la requete ! ");
			}else 
				throw new Exception("UeTool::getByIDModule => parametres invalides ! ");
		}

		//meme chose avec code APOG
		public static function getByAPOG($connect, $_apogee) {
			$requete = "SELECT * FROM livret_ue WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_apogee, PDO::PARAM_STR, 15);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Ue");
				else 
					throw new exception("UeTool::getByAPOG => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTool::getByAPOG => parametres invalides ! ");
		}
		
		//insert une unité d'enseignement 
		public static function insertUE($connect, $_apogee, $_id_mod) {
			$requete = "INSERT INTO livret_ue (_APOGEE_ , _ID_MOD_) VALUES (?, ?)";
			if (!empty($connect) && !empty($_apogee) && is_numeric($_id_mod)) {
				try {
					//si le module existe deja
					if (ModuleTool::existID($connect, $_id_mod)) {
						$stmt = $connect->prepare($requete);
						$stmt->bindParam(1, $_apogee, PDO::PARAM_STR, 15);
						$stmt->bindParam(2, $_id_mod, PDO::PARAM_INT, 4);
						if($stmt->execute())
							return TRUE;
						else
							throw new Exception("UeTool::insertUE => impossible d'executer la requete");
					}else 
						throw new exception ("UeTool::insertUE => impossible d'insérer _id_mod_ FOREIGN KEY ERREUR");
				}catch (Exception $e) {
					throw new exception("UeTool::insertUE => ".$e->getMessage());
				}
			}else 
				throw new exception ("UeTool::insertUE => parametres invalides !");
		}
		
		//met a jour les valeur d'une UE
		public static function updateUE($connect, $_apogee_ancien, $_apogee_new, $_id_mod){
			$requete = "UPDATE livret_ue SET _APOGEE_ = ? , _ID_MOD_ = ? WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee_ancien) && !empty($_apogee_new) && is_numeric($_id_mod)){
				try {
					//verifier si le module existe deja
					if(ModuleTool::existID($connect, $_id_mod)){
						$stmt = $connect->prepare($requete);
						$stmt->bindParam(1, $_apogee_new , PDO::PARAM_STR);
						$stmt->bindParam(2, $_id_mod, PDO::PARAM_INT);
						$stmt->bindParam(3, $_apogee_ancien, PDO::PARAM_STR);
						if($stmt->execute())
							return TRUE;
						else
							throw new Exception("UeTool::updateUE => impossiblde d'executer la requete");
					}else 
						throw new Exception ("UeTool::updateUE => impossible d'insérer _id_mod_ FOREIGN KEY ERREUR");
				}catch (Exception $e) {
					throw new exception ("UeTool::updateUE => ".$e->getMessage());
				}
			}else 
				throw new exception ("UeTool::updateUE => parametres invalides !");
		}

		//permet de savoir si le code apogee exist dans la table
		public static function existApogee($connect, $_apogee){
			$requete = "SELECT COUNT(_APOGEE_) FROM livret_ue WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_apogee, PDO::PARAM_STR);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("UeTool::existApogee => impossible d'executer la requete");
			}else
				throw new Exception("UeTool::existApogee => parametre invalide");
		}

		//suppression de UE 
		public static function deleteUE ($connect, $_apogee){
			$requete = "DELETE FROM livret_ue WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee)){
				try {
					if(self::existApogee($connect, $_apogee)){
						$stmt = $connect->prepare($requete);
						$stmt->bindParam(1, $_apogee, PDO::PARAM_STR);
						if($stmt->execute()){
							return TRUE;
						}else
							throw new Exception ("UeTool::deleteUE => impossible d'executer la requete");
					}else
						return FALSE;
				} catch (Exception $e) {
					throw new Exception("UeTool::deleteUE => ".$e->getMessage());
				}
			}else
				throw new Exception("UeTool::deleteUE => parametre invalide");
		}
	}
?>