<?php include_once("connexion.php");


	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Ue{

	}

	class UeTool{
		
		public static function getByIDModule($connect, $_id) {
			$requete = "SELECT * FROM livret_ue WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT, 4);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Ue");
				else 
					throw new exception("UeTools::getByIDModule => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTools::getByIDModule => parametres invalides ! ");
		}

		//meme chose avec code APOG
		public static function getByAPOG($connect, $_apogee) {
			$requete = "SELECT * FROM livret_ue WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_apogee, PDO::PARAM_STR, 15);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Ue");
				else 
					throw new exception("UeTools::getByAPOG => impossible d'executer la requete ! ");
			}else 
				throw new exception("UeTools::getByAPOG => parametres invalides ! ");
		}
		
		//insert une unité d'enseignement 
		public static function insertUE($connect, $_apogee, $_id_mod) {
			$requete = "INSERT INTO livret_ue (_APOGEE_, _ID_MOD_) VALUES (?, ?)";
			if (!empty($connect) && !empty($_apogee) && is_numeric($_id_mod)) {
				try {
					//si le module existe deja
					if (ModuleTools::existID($connect, $_id_mod)) {
						$stmt = $connect->prepare($requete);
						$stmt->bindValue(1, $apogee, PDO::PARAM_STR, 15);
						$stmt->bindValue(2, $_id_mod, PDO::PARAM_INT, 4);
						return $stmt->execute();
					}else 
						throw new exception ("UeTools::insertUE => impossible d'insérer _id_mod_ FOREIGN KEY ERREUR");
				}catch ($e) {
					throw new exception("UeTools::insertUE => ".$e->getMessage());
				}
			}else 
				throw new exception ("UeTools::insertUE => parametres invalides !");
		}
		
		//met a jour les valeur d'une UE
		public static function updateUE($connect, $_apogee_ancien, $_apogee_new, $_id_mod){
			$requete = "UPDATE livret_ue SET _APOGEE_ = ? , _ID_MOD_ = ? WHERE _APOGEE_ = ?";
			if(!empty($connect) && !empty($_apogee_ancien) && !empty($_apogee_new) && is_numeric($_id_mod)){
				try {
					//verifier si le module existe deja
					if(ModuleTools::existID($connect, $_id_mod)){
						$stmt = $connect->prepare($requete);
						$stmt->bindValue(1, $_apogee_new , PDO::PARAM_STR, 15);
						$stmt->bindValue(2, $_id_mod, PDO::PARAM_INT, 4);
						$stmt->bindValue(3, $_apogee_ancien, PDO::PARAM_STR, 15);
						return $stmt->execute();
					}else 
						throw new exception ("UeTools::updateUE => impossible d'insérer _id_mod_ FOREIGN KEY ERREUR");
				}catch ($e) {
					throw new exception ("UeTools::insertUE => ".$e->getMessage());
				}
			}else 
				throw new exception ("UeTools::updateUE => parametres invalides !");
		}
	}
?>