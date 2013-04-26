<?php
	require_once("connexion.php");
	
	//cette class permet de fournir un outil de gestion de la base de données au niveau de la Composante
    class Composante{      
        
        //les points d'interrogation dans les requetes seront remplacer par les valeur des parametre de fonction invoqué, et cela grâce à la fonction PDO:bindValue
        //PDO::FETCH_CLASS: Retourne une instance de la classe désirée. Les colonnes sélectionnées sont liées aux attributs de la classe.
        
        //recupere en fonction de la valeur de l'id
        public static function getByID ($connect , $_id){
			$requete = "SELECT * FROM livret_compo WHERE _ID_COMPO_ = ?";
			if(empty($_id) || !is_numeric($_id)){
				throw new exception("Composante::getByID => parametre invalide !");
			}else{
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "compo");
				else 
					throw new exception ("Composante::getByID => impossible d'executer la requete !");
			}
		}
		
		//recuperation par libelle
		public static function getByLibelle($connect, $_libelle){
			$requete = "SELECT * FROM livret_compo WHERE _LIBELLE_COMPO_ = ?";
			if(empty($_libelle)){
				throw new exception ("Composante::getByLibelle => parametre invalide !");
			}else{
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "compo");
				}else 
					throw new exception ("Composante::getByLibelle => impossible d'executer la requete !");
			}
		}

        //Permet d'inserer une composante
        //retourne vrai si l'élément a été ajouté
        public static function insertCompo ($connect, $_libelle){
        	$requete = "INSERT INTO livret_compo (_LIBELLE_COMPO_) VALUES (?)";
            //si les paremetre sont invalide ont leve une exception
            if(empty($_libelle) || empty($connect))
                throw new exception ("Composante::insertCompo => parametre invalide !");
            else{
            	$result = getByLibelle($connect, $_libelle);
            	//si l'element n'existe pas deja on l'ajoute sinon on fait rien
            	if(!existLibelle($connect, $_libelle)){
	                $stmt = $connect->prepare($requete);
	                $stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
	                return $stmt->execute();
	            }else {
	            	return TRUE;
	            }
            }
        }
        
        public static function existLibelle($connect, $_libelle){
        	$requete = "SELECT COUNT(DISTINCT _ID_COMPO) FROM livret_compo WHERE _LIBELLE_COMPO_ = ?";
        	if(!empty($connect) && !empty($_libelle)){
        		$stmt = $connect->prepare($query);
        		$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
        		if($stmt->execute()){
        			$result = $stmt->fetch();
        			return ($result[0] != 0);
        		}else 
        			throw new exception("Composante::existLibelle => impossible d'executer la requete !");
        	}
        }
        
        //permet de verifier si l'id existe
        //retourne vrai dans ce cas la, non sinon
        public static function existID($connect, $_id){
       		$requete = "SELECT COUNT(DISTINCT _ID_COMPO_) FROM livret_compo WHERE _ID_COMPO_ = ?";
        	if (is_numeric($_id) && !empty($connect)) {
        		$stmt = $connect->prepare($query);
        		$stmt->bindValue(1, $_id, PDO::PARAM_INT);
        		if ($stmt->execute()) {
        			$result = $stmt->fetch();
        			return ($result[0] != 0);
        		}else {
        			throw new exception("Composante::existID => impossible d'executer la requete !");
        		}
        		
        	}else{
        		throw new exception("Composante::existID => parametre invalide !");
        	}
        }
    }
?>