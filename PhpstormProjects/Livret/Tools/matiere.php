<?php 

include_once("connexion.php");
	
	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Matiere{
		//le button avec les parametres pour isotope afin de filtrer
		public function giveButton(){
			return '<li class="dropdown"> <a data-filter=".'.$this->_CODE_MAT_.'" href="#">'.$this->_LIBELLE_MAT_.' </a> </li>';	
		}
	}

	//la variable $connect est l'instance de PDO vers la bdd livret
	
	class MatiereTool {
		
		//test si l'id exist deja ou non
		//retourne un boolean 
		public static function existID($connect, $_code) {
			$requete = "SELECT COUNT(DISTINCT _ID_UE_) FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code, PDO::PARAM_STR, 3); //taille de parametre code de la matiere doit etre inf a 3
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("MatiereTools::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::existID => parametres invalides ! ");
		}
		//meme chose avec libelle
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _LIBELLE_MAT_) FROM livret_matiere WHERE _LIBELLE_MAT_ = ?";
			if(!empty($connect) && !empty($_libelle)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR, 50);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("MatiereTools::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::existLibelle => parametres invalides ! ");
		}
		//retourne un objet contenant les colonne de la table matiere comme attribut
		public static function getByID($connect, $_code) {
			$requete = "SELECT * FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code, PDO::PARAM_STR, 3);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Matiere");
				else 
					throw new exception("MatiereTools::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::getByID => parametres invalides ! "."\n");
		}
		
		//meme chose avec le libelle
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT * FROM livret_matiere WHERE _LIBELLE_MAT_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare ($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR, 3);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Matiere");
				else 
					throw new exception("MatiereTools::getByLibelle => impossible d'executer la requete !");
			}else 
				throw new exception("MatiereTools::getByLibelle => parametres invalide !");
		}
		
		//permet d'avoir toutes les lignes de la table matiere, sous forme d'objet module
		public static function getAll($connect){
			$requete = "SELECT * FROM livret_matiere";
			$stmt = $connect->prepare($requete);
			if($stmt->execute()){
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Matiere");
			}else 
				throw new exception ("MatiereTool::getAllMatiere => impossible d'executer la requete !");
		}
		
		//insert l'element s'il n'existe pas, renvoi true si l'element exist deja, sinon la valeur de retour du serveur apres execution
		public static function insertMatiere($connect, $_libelle) {
			$requete = "INSERT INTO livret_matiere (_LIBELLE_MAT_) VALUES (?)";
			if (!empty($connect) && !empty($_libelle)){
				if(! existLibelle($connect, $_libelle)){
					$stmt = $connect->prepare($requete);
					$stmt->bindValue(1, $_libelle, PDO::PARAM_STR, 50);
					return $stmt->execute();
				}else 
					return TRUE;
			}else 
				throw new exception("MatiereTools::insertUE => parametre invalide ! ");
		}
		
		//Update des informations d'une matiere, changement du nom
		public static function updateMatiere ($connect, $_codeNew, $_libelle, $_codeOld){
			$requete = "UPDATE livret_matiere SET _CODE_MAT_ = ? , _LIBELLE_MAT_ = ? WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code) && !empty($_libelle) && !empty($_codeAncien)) {
				if(! existID($connect, $_codeAncien)){
					$stmt = $connect->prepare($requete);
					$stmt->bindValue(1, $_code, PDO::PARAM_STR, 3);
					$stmt->bindValue(2, $_libelle, PDO::PARAM_STR, 50);
					$stmt->bindValue(3, $_codeAncien, PDO::PARAM_STR, 3);
					return $stmt->execute();
				}else 
					return FALSE;
			}else 
				throw new exception("MatiereTools::updateMatiere => parametre invalide !");
		}
	}
?>