<?php
	class UeTools {
		
		//test si l'id exist deja ou non 
		public static function existID($connect, $_id) {
			$requete = "SELECT COUNT(DISTINCT _ID_UE_) FROM livret_ue WHERE _ID_UE_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("UeTools::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTools::existID => parametres invalides ! ");
		}
		//meme chose avec libelle
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _LIBELLE_UE_) FROM livret_ue WHERE _LIBELLE_UE_ = ?";
			if(!empty($connect) && !empty($_libelle)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("UeTools::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTools::existLibelle => parametres invalides ! ");
		}
		
		public static function getByID($connect, $_id) {
			$requete = "SELECT * FROM livret_ue WHERE _ID_UE_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "ue");
				else 
					throw new exception("UeTools::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTools::getByID => parametres invalides ! ");
		}
		
		//insert l'element s'il n'existe pas, renvoi true si l'element exist deja, sinon la valeur de retour du serveur apres execution
		public static function insertUE($connect, $_libelle) {
			$requete = "INSERT INTO livret_ue (_LIBELLE_UE_) VALUES (?)";
			if (!empty($connect) && !empty($_libelle)){
				if(! existLibelle($connect, $_libelle)){
					$stmt = $connect->prepare($requete);
					$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
					return $stmt->execute();
				}else 
					return TRUE;
			}else 
				throw new exception("UeTools::insertUE => parametre invalide ! ");
		}
	}
?>