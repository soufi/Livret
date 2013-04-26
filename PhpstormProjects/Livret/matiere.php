<?php
	require_once("promotion.php");
	require_once("ue.php");
//cette class permet d'avoir des outils qui permettrons la manipulation des matiere sur notre base données
	class MatiereTools{
		//permet d'avoir tous les champs d'une matiere avec l'id
		public static function getByID($connect, $_id) {
			$requete = "SELECT * FROM livret_matiere WHERE _ID_MAT_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "matiere");
				}else {
					throw new exception("MatiereTools::getByID => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("MatiereTools::getByID => parametre invalide ! ");
			}
		}
		//meme chose avec libelle
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT * FROM livret_matiere WHERE _LIBELLE_MAT_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "matiere");
				}else {
					throw new exception("MatiereTools::getByLibelle => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("MatiereTools::getByLibelle => parametre invalide ! ");
			}
		}
		//meme chose avec id de promotion
		public static function getByIDPromo($connect, $_id_promo){
			$requete = "SELECT * FROM livret_matiere WHERE _ID_PROMO_ = ?";
			if (!empty($connect) && is_numeric($_id_promo)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id_promo, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "matiere");
				}else {
					throw new exception("MatiereTools::getByIDPromo => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("MatiereTools::getByIDPromo => parametre invalide ! ");
			}
		}
		//meme chose avec code APOG
		public static function getByAPOG($connect, $_code_apog) {
			$requete = "SELECT * FROM livret_matiere WHERE _CODE_APOG_MAT_ = ?";
			if(!empty($connect) && !empty($_code_apog)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code_apog, PDO::PARAM_STR);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "matiere");
				else 
					throw new exception("MatiereTools::getByAPOG => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::getByAPOG => parametres invalides ! ");
		}
		//meme chose avec id UE
		public static function getByIDUE($connect, $_id_ue) {
			$requete = "SELECT * FROM livret_matiere WHERE _ID_UE_ = ?";
			if(!empty($connect) && is_numeric($_id_ue)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id_ue, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "matiere");
				else 
					throw new exception ("MatiereTools::getByIDUE => impossible d'executer la requete ! ");
			}else 
				throw new exception ("MatiereTools::getByIDUE => parametres invalides ! ");
		}
		//renvoi vrai si l'id existe, non sinon
		public static function existID($connect, $_id) {
			$requete = "SELECT COUNT(DISTINCT _ID_MAT_) FROM livret_matiere WHERE _ID_MAT_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("MatiereTools::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::existID => parametres invalides ! ");
		}
		//renvoi vrai si l'id existe, non sinon
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _ID_MAT_) FROM livet_matiere WHERE _LIBELLE_MAT_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("MatiereTools::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::existLibelle => parametres invalides ! ");
		}
		//verifie si une matiere existe deja 
		public static function existElement($connect, $_id_promo, $_libelle, $_apog, $_id_ue){
			$requete = "SELECT COUNT(DISTINCT _ID_MAT_) FROM livret_matiere WHERE _ID_PROMO_ = ? AND _LIBELLE_MAT_ = ? AND _CODE_APOG_MAT_ = ? AND _ID_UE_ = ?";
			if(!empty($connect) && is_numeric($_id_promo) && !empty($_libelle) && !empty($_apog) && is_numeric($_id_ue)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id_promo, PDO::PARAM_INT);
				$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(3, $_apog, PDO::PARAM_STR);
				$stmt->bindValue(4, $_id_ue, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("MatiereTools::existElement => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTools::existElement => parametres invalides ! ");
		}
		
		//insert un element s'il n'existe pas 
		public static function insertMatiere($connect, $_id_promo, $_libelle, $_apog, $_id_ue) {
			$requete = "INSERT INTO livret_matiere (_ID_PROMO_ , _LIBELLE_MAT_ , _CODE_APOG_MAT_ , _ID_UE_) VALUES (?, ?, ?, ?)";
			if (!empty($connect) && is_numeric($_id_promo) && !empty($_libelle) && !empty($_apog) && is_numeric($_id_ue)) {
				try {
					if (! existElement($connect, $_id_promo, $_libelle, $_apog, $_id_ue)) {
						if(UeTools::existID($connect, $_id_ue) && PromoTools::existID($connect,$_id_promo)){
							$stmt = $connect->prepare($requete);
							$stmt->bindValue(1, $_id_promo, PDO::PARAM_INT);
							$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
							$stmt->bindValue(3, $_apog, PDO::PARAM_STR);
							$stmt->bindValue(4, $_id_ue, PDO::PARAM_INT);
							return $stmt->execute();
						}else 
							throw new exception("MatiereTools::insertMatiere => Erreur FOREIGN KEY ! ");
					}
						
				}catch (exception $e) {
					throw new exception ("MatiereTools::insertMatiere => ".$e->getMessage());
				}
			}else 
				throw new exception("MatiereTools::insertMatiere => parametres invalides ! ");
		}
		
		
		
	}
?>