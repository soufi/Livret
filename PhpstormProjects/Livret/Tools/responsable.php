<?php

include_once("enseignant.php");
include_once("filiere.php");
include_once("module.php");


/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	//permet de gérer les responsables de filieres
	//les attrbiuts de cette classes seront les colonnes de la table livret_responsable_filiere c-a-d : 
	//l'id de la filiere, l'id de l'enseignant

	class RespFiliere{

        //permet d'avoir la fiche de l'enseignant ou les informations a partir de l'id de l'enseignant
        //retourne un Enseignant (cf fichier enseignant.php)
        public function sheetOfEns ($connect){
            if(!empty($connect)){
                try{
                    //rappel les fonction retourne toujours un tableau d'objet
                    $enseignant = EnseignantTool::getByID($connect, $this->_ID_ENS_);
                    if(!empty($enseignant))
                        return $enseignant[0];
                    else
                        return NULL;
                }catch(Exception $e){
                    throw new Exception("RespFiliere::sheetOfEns => ".$e->getMessage());
                }
            }else
                throw new Exception("RespFiliere::sheetOfEns => parametre invalide");
        }

		//permet d'avoir l'objet filiere donc ces informations (comme au dessus) a partir de l'id de la filiere
		//retourne une Filiere (cf filiere.php)
		public function sheetOfFil ($connect){
			if(!empty($connect)){
				try{
					//rappel les fonction retourne toujours un tableau d'objet
					$filiere = FiliereTool::getByID($connect, $this->_ID_FILIERE_);
					if(!empty($filiere))
						return $filiere[0];
					else
						return NULL;
				}catch(Exception $e){
					throw new Exception("RespFiliere::sheetOfFil => ".$e->getMessage());
				}
			}else
				throw new Exception("RespFiliere::sheetOfFil => parametre invalide");
		}
	}

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//Meme chose qu'au dessus mais avec les modules
	class RespModule{

        //permet d'avoir la fiche de l'enseignant ou les informations a partir de l'id de l'enseignant
        //retourne un Enseignant (cf fichier enseignant.php)
        public function sheetOfEns ($connect){
            if(!empty($connect)){
                try{
                    //rappel les fonction retourne toujours un tableau d'objet
                    $enseignant = EnseignantTool::getByID($connect, $this->_ID_ENS_);
                    if(!empty($enseignant))
                        return $enseignant[0];
                    else
                        return NULL;
                }catch(Exception $e){
                    throw new Exception("RespModule::sheetOfEns => ".$e->getMessage());
                }
            }else
                throw new Exception("RespModule::sheetOfEns => parametre invalide");
        }

		//retourne un Module (cf module.php)
		public function sheetOfMod ($connect){
			if(!empty($connect)){
				try{
					//rappel les fonction retourne toujours un tableau d'objet
					$module = ModuleTool::getByID($connect, $this->_ID_MOD_);
					if(!empty($module))
						return $module[0];
					else
						return NULL;
				}catch(Exception $e){
					throw new Exception("RespFiliere::sheetOfMod => ".$e->getMessage());
				}
			}else
				throw new Exception("RespFiliere::sheetOfMod => parametre invalide");
		}
	}

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//gere les responsable de filiere et de module
	class ResponsableTool{

		/*--------------------------------RESPONSABLE FILIERE----------------------------------------------*/

		//permet d'avoir les responsables d'une filiere
		public static function getRespByFil($connect, $idFil){
			$requete = "SELECT * FROM livret_responsable_filiere WHERE _ID_FILIERE_ = ?";
			if(!empty($connect) && is_numeric($idFil)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFil, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "RespFiliere");
				}else
					throw new Exception("ResponsableTool::getRespByFil => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::getRespByFil => parametre invalide");
		}

		//permet d'avoir les filieres de l'enseignant passe en parametre
		public static function getFilByResp($connect, $idEns){
			$requete = "SELECT * FROM livret_responsable_filiere WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idEns, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "RespFiliere");
				}else
					throw new Exception("ResponsableTool::getFilByResp => impossible d'executer la requete");					
			}else
				throw new Exception("ResponsableTool::getFilByResp => parametre invalide");
		}

		//test si il existe une ligne avec l'enseignant et la filiere dans la table responsable filiere 
		public static function existRespFil($connect, $idFil, $idEns){
			$requete = "SELECT COUNT(*) FROM livret_responsable_filiere WHERE _ID_FILIERE_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idFil) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFil, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("ResponsableTool::existRespFil => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::existRespFil => parametres invalide !");
		}

		//permet d'inserer un responsable de filiere
		public static function insertRespFil($connect, $idFil, $idEns){
			$requete = "INSERT IGNORE INTO livret_responsable_filiere VALUES (?,?)";
			if(!empty($connect) && is_numeric($idFil) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFil, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("ResponsableTool::insertRespFil => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::insertRespFil => parametre invalide");
		}

		//permet de mettre a jour le responsable de filiere
		public static function updRespFil($connect, $oldIdFil, $oldIdEns, $newIdFil, $newIdEns){
			$requete = "UPDATE livret_responsable_filiere SET _ID_FILIERE_ = ? , _ID_ENS_ = ? WHERE _ID_FILIERE_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($oldIdFil) && is_numeric($oldIdEns) && is_numeric($newIdFil) && is_numeric($newIdEns)){
				if(self::existRespFil($connect, $oldIdFil, $oldIdEns)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $newIdFil, PDO::PARAM_INT);
					$stmt->bindParam(2, $newIdEns, PDO::PARAM_INT);
					$stmt->bindParam(3, $oldIdFil, PDO::PARAM_INT);
					$stmt->bindParam(4, $oldIdEns, PDO::PARAM_INT);
					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("ResponsableTool::updRespFil => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("ResponsableTool::updRespFil => parametre invalide");
		}

		//permet de supprimer le responsable de filiere
		public static function deleteRespFil($connect, $idFil, $idEns){
			$requete = "DELETE FROM livret_responsable_filiere WHERE _ID_FILIERE_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idFil) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idFil, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("ResponsableTool::deleteRespFil => impossible d'executer ");
			}else
				throw new Exception("ResponsableTool::deleteRespFil => parametre invalide");
		}

		/*--------------------------------RESPONSABLE MODULE----------------------------------------------*/

		//permet de recupere l'enseignant responsable du module 
		public static function getRespByMod ($connect, $idMod){
			$requete = "SELECT * FROM livret_responsable_module WHERE _ID_MOD_ = ?";
			if(!empty($connect) && is_numeric($idMod)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "RespModule");
				}else
					throw new Exception("ResponsableTool::getRespByMod => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::getRespByMod => parametre invalide"); 
		}

		//permet d'avoir les modules dont l'enseignant passe en parametre est le responsable
		public static function getModByResp($connect, $idEns){
			$requete = "SELECT * FROM livret_responsable_module WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idEns, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "RespModule");
				}else
					throw new Exception("ResponsableTool::getModByResp => impossible d'executer la requete");					
			}else
				throw new Exception("ResponsableTool::getModByResp => parametre invalide");
		}

		//test si il existe une ligne avec l'enseignant et la filiere dans la table responsable filiere 
		public static function existRespMod($connect, $idMod, $idEns){
			$requete = "SELECT COUNT(*) FROM livret_responsable_module WHERE _ID_MOD_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("ResponsableTool::existRespMod => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::existRespMod => parametres invalide !");
		}

		//permet d'inserer un responsable de  module
		public static function insertRespMod($connect, $idMod, $idEns){
			$requete = "INSERT IGNORE INTO livret_responsable_module VALUES (?,?)";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("ResponsableTool::insertRespMod => impossible d'executer la requete");
			}else
				throw new Exception("ResponsableTool::insertRespMod => parametre invalide");
		}

		//permet de mettre a jour le responsable de module
		public static function updRespMod($connect, $oldIdMod, $oldIdEns, $newIdMod, $newIdEns){
			$requete = "UPDATE livret_responsable_module SET _ID_MOD_ = ? , _ID_ENS_ = ? WHERE _ID_MOD_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($oldIdMod) && is_numeric($oldIdEns) && is_numeric($newIdMod) && is_numeric($newIdEns)){
				if(self::existRespMod($connect, $oldIdMod, $oldIdEns)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $newIdMod, PDO::PARAM_INT);
					$stmt->bindParam(2, $newIdEns, PDO::PARAM_INT);
					$stmt->bindParam(3, $oldIdMod, PDO::PARAM_INT);
					$stmt->bindParam(4, $oldIdEns, PDO::PARAM_INT);
					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("ResponsableTool::updRespMod => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("ResponsableTool::updRespMod => parametre invalide");
		}

		//permet de supprimer le responsable de module
		public static function deleteRespMod($connect, $idMod, $idEns){
			$requete = "DELETE FROM livret_responsable_module WHERE _ID_MOD_ = ? AND _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idMod) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idMod, PDO::PARAM_INT);
				$stmt->bindParam(2, $idEns, PDO::PARAM_INT);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("ResponsableTool::deleteRespMod => impossible d'executer ");
			}else
				throw new Exception("ResponsableTool::deleteRespMod => parametre invalide");
		}

	}
?>