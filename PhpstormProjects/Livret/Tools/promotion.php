<?php 
include_once("connexion.php");

	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Promo{

	}


//la variable $connect instance de PDO vers la bdd livret
//gestion des promotions
	class PromoTool{
		
		//insert un element dans la table de promotion
		//return vrai si tout vas bien, non sinon.
		public static function insertPromo ($connect, $_libelle, $_nb_eleve, $_intitule, $_preambule, $_epilogue, $_color1, $_color2, $_color3, $_cfg, $_cpg){
			$requete = "INSERT INTO livret_promotion (_LIBELLE_PROMO_, _NB_ELEVES_PROMO_, _INTITULE_PROMO_, _PREAMBULE_, _EPILOGUE_, _COULEUR1_, _COULEUR2_, _COULEUR3_, _CFG_, _CPG_) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			if(!empty($connect) && !empty($_libelle) && !empty($_color1) && !empty($_color2) && !empty($_color3) && !empty($_cfg) && !empty($_cpg)){
				//verifier si le libelle exist deja
				if (! existLibelle($connect, $_libelle)) {
					//configuration des parametres d'ajout
					$stmt = $connect->prepare($requete);
					$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
					$stmt->bindValue(2, $_nb_eleve, PDO::PARAM_INT);
					$stmt->bindValue(3, $_intitule, PDO::PARAM_STR);
					$stmt->bindValue(4, $_preambule, PDO::PARAM_STR);
					$stmt->bindValue(5, $_epilogue, PDO::PARAM_STR);
					$stmt->bindValue(6, $_color1, PDO::PARAM_STR, 12);
					$stmt->bindValue(7, $_color2, PDO::PARAM_STR, 12);
					$stmt->bindValue(8, $_color3, PDO::PARAM_STR, 12);
					$stmt->bindValue(9, $_cfg, PDO::PARAM_STR, 12);
					$stmt->bindValue(10, $_cpg, PDO::PARAM_STR, 12);
					return $stmt->execute();
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
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
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
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
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
		public static function getAllPromo($connect) {
			$requete = "SELECT DISTINCT * FROM livret_promotion";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Promo");
			else 
				throw new exception ("PromoTool::getAllPromo => impossible d'executer la requete !");
		}
		
		//retourne toutes les lignes des promotions etiquetté avec par leurs Filiere
		public static function getAllPromoLabeled ($connect){
			$requete = "SELECT DISTINCT * FROM livret_promotion";
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
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
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
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
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
		
	}
?>