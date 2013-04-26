<?php
	require_once("composante.php");
	//les resultats des requetes de selection, sont presenter sous forme d'une objet filiere, avec le colonne comme attributs, et pour chaque ligne de resultats, presente sous forme d'une case du tableau de resultats final, tous ceci grace a la fonction PDO:fetchAll 
	class Filiere {
		
		//recupere les lignes ou la ligne correspondante a l'id en parametre
		public static function getByID ($connect, $_id){
			$requete = "SELECT * FROM livret_filiere WHERE _ID_FILIERE_ = ?";
			if(is_numeric($_id) && !empty($connect)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "filiere");
				else 
					throw new exception("Filiere::getByID => impossible d'exectuer la requete !");
			}else 
				throw new exception ("Filiere::getByID => parametre invalide");
		}
		
		//retourne les lignes ou la ligne correspondante au libelle en parametre
		public static function getByLibelle($connect, $_libelle){
			$requete = "SELECT * FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ?";
			if (is_numeric($_id) && !empty($connect)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "filiere");
				else
					throw new exception ("Filiere::getByLibelle => impossible d'exectuer la requete");
			}else
				throw new exception ("Filiere::getByLibelle => param invalide");
		}
		
		//permet d'inserer une Filiere dans la base de donnees
		public static function insertFiliere($connect, $_libelle, $_id_compo){
			$requete = "INSERT INTO livret_filiere (_LIBELLE_FILIERE_, _ID_COMPO_) VALUES (?, ?)";
			//verification de validite des parametres
			if (is_numeric($_id_compo) && !empty($_libelle) && !empty($connect)) {
				//verifier si l'id existe dans la table ou non
				try{
					if (! existLibelle($connect, $_libelle)) {
						//si l'id de la composante existe deja on peut ajouter, sinon on ne peut pas on leve une exception
						if(Composante::existID($connect, $_id_compo)){
							$stmt = $connect->prepare($requete);
							$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
							$stmt->bindValue(2, $_id_compo, PDO::PARAM_INT);
							return $stmt->execute();
						}else {
							throw new exception("Filiere::insertFiliere => ID de composante inexistant !");
						}
					}else {
						return TRUE;	
					}
				}catch (exception $e) {
					throw new exception("Filiere::insertFiliere => ". $e->getMessage());
				}
			}else 
				throw new exception("Filiere::insertFiliere => parametre invalide !");
		}
		
		//verifie si le libelle exist ou non 
		//retourne vrai dans ce cas, non sinon
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _ID_FILIERE_) FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ? ";
			if (!empty($connect) && !empty($_libelle)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception ("Filiere::existLibelle => impossible d'executer la requete !");
			}else 
				throw new exception("Filiere::existLibelle => parametre invalide !");
		}
		//permet de tester si une filiere existe deja dans la base de donnée
		public static function existElement($connect, $_libelle, $_id_compo) {
			$requete = "SELECT COUNT(DISTINCT _ID_FILIERE_) FROM livret_filiere WHERE _LIBELLE_FILIERE_ = ? AND _ID_COMP_ = ?";
			if (!empty($connect) && !empty($_libelle) && is_numeric($_id_compo)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(2, $_id_compo, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("Filiere::existElement => impossible d'executer la requete ! ");
			}else 
				throw new exception ("Filiere::existElement => parametres invalides ! ");
		}
		
		//retourne vrai si l'id existe dans la table livret_filiere, non sinon
		public static function existID($connect, $_id){
			$requete = "SELECT COUNT(DISTINCT _ID_FILIERE_) FROM livret_filiere WHERE _ID_FILIERE_ = ?";
			if (is_numeric($_id) && !empty($connect)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					$result[0] = $stmt->fetch(); //recup de nombre de ligne correspondante a la recherche
					return ($result[0] != 0);
				}else 
					throw new exception ("Filiere::existID => impossible d'executer la requete !");
			}else 
				throw new exception ("Filiere::existID => parametre invalide !");
		}
		
		
	}
?>