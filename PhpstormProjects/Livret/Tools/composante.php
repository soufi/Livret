<?php 
include_once("connexion.php");
    
    //les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
    class Compo{

        //genere une ligne d'un tableau contenant les informations de l'instance
        public function genereLine(){
            $line = "<tr>";
            $line = $line."<input type=\"hidden\" value=\"".$this->_ID_COMPO_."\"/>";
            $line = $line."<td =\"idCompo\">".$this->_LIBELLE_COMPO_."</td>";
            $line = $line."</tr>";
            return $line;
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($tableauCompo){
            $table = "<table class=\"table table-hover\"> <div class=\"well well-small\"> <h2>Les Composantes</h2></div>";
            if(!empty($tableauCompo)){
                $table = $table."<tr>";
                //les titres des colonnes
                $table = $table."<th>Libelle</th>";
                $table = $table."</tr>";
                //generation des lignes du tableau
                foreach ($tableauCompo as $value) {
                    $table = $table.$value->genereLine();
                }
            //quand le tableau est vide on genere un warning
            }else
                $table = $table."<div class=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><strong>Aucune Composante trouvée !</strong></div>";
            $table = $table."</table>";
            return $table;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif(){
            $form = "<div id=\"myModal".$this->_ID_COMPO_."\" class=\"modal hide fade in\" style=\"display: none;\">";
            $form = $form."<div class=\"modal-header\">";
            $form = $form."<a href=\"#\" class=\"close\" data-dismiss=\"modal\">x</a> <h3>Modification Composante</h3>";
            $form = $form."</div>";
            $form = $form."<div class=\"modal-body\">";
            $form = $form."<form id=\"form-myModal".$this->_ID_COMPO_."\" method=\"post\" action=\"compoManager.php\"  class=\"form-horizontal\">";
            $form = $form."<div class=\"control-group\">";
            $form = $form."<label class=\"control-label\" for=\"libelleCompo\">Libelle Composante</label>";
            $form = $form."<div class=\"controls\">";
            $form = $form."<input type=\"text\" name=\"libelCompo\" id=\"libelleCompo\" class=\"input-large\" placeholder=\"Champ Obligatoire ...\" required value=\"".$this->_LIBELLE_COMPO_."\"/>";
            $form = $form."<input type=\"hidden\" value=\"".$this->_ID_COMPO_."\"/>";
            $form = $form."</div> </div> </div>";
            $form = $form."<div class=\"control-group modal-footer\">";
            $form = $form."<input type=\"submit\" class=\"btn btn-primary \" id=\"modal-form-submit".$this->_ID_COMPO_."\" value=\"Envoyer\"/>";
            $form = $form."<input type=\"button\" data-dismiss=\"modal\" class=\"btn\" value=\"Annuler\"/>";
            $form = $form."</div> </form>";
            $form = $form."</div>";
            return $form;
        }

        public function genereButton($nom=null){
            if(empty($nom))
                return '<a data-filter=".'.$this->_ID_COMPO_.'" href="#">'.$this->_LIBELLE_COMPO_.' </a>';
            else
                return '<a data-filter=".'.$this->_ID_COMPO_.'" href="#">'.$nom.' </a>';
        }
    }
	
	//cette class permet de fournir un outil de gestion de la base de données au niveau de la Composante
    class ComposanteTool{      
        
        //la variable $connect instance de PDO vers la bdd livret

        //les points d'interrogation dans les requetes seront remplacer par les valeur des parametre de la fonction PDO::bindValue
        //PDO::FETCH_CLASS: Retourne une instance de la classe désirée. Les colonnes sélectionnées sont liées aux attributs de la classe.
        
        //recupere en fonction de la valeur de l'id
        public static function getByID ($connect , $_id){
			$requete = "SELECT * FROM livret_compo WHERE _ID_COMPO_ = ?";
			
			if(empty($connect) || !is_numeric($_id)){
				throw new exception("ComposanteTool::getByID => parametre invalide !");
			}else{
			
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
				else 
					throw new exception ("ComposanteTool::getByID => impossible d'executer la requete !");	
			}
		}
		
		//retourne toutes les lignes de la table compo sous forme d'un tableau contenant un objet pour chaque ligne, les colonne de la table représente les attribut de cet objet
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_compo";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
			else 
				throw new exception ("ComposanteTool::getAllCompo => impossible d'executer la requete !");
		}
		
		//recuperation par libelle
		public static function getByLibelle($connect, $_libelle){
			$requete = "SELECT * FROM livret_compo WHERE _LIBELLE_COMPO_ = ?";
			if(empty($_libelle)){
				throw new exception ("ComposanteTool::getByLibelle => parametre invalide !");
			}else{
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
				}else 
					throw new exception ("ComposanteTool::getByLibelle => impossible d'executer la requete !");
			}
		}

        //Permet d'inserer une composante
        //retourne vrai si l'élément a été ajouté
        public static function insertCompo ($connect, $_libelle){
        	$requete = "INSERT INTO livret_compo (_LIBELLE_COMPO_) VALUES (?)";
            //si les paremetre sont invalide ont leve une exception
            if(empty($_libelle) || empty($connect))
                throw new exception ("ComposanteTool::insertCompo => parametre invalide !");
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
        			throw new exception("ComposanteTool::existLibelle => impossible d'executer la requete !");
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
        			throw new exception("ComposanteTool::existID => impossible d'executer la requete !");
        		}
        		
        	}else{
        		throw new exception("ComposanteTool::existID => parametre invalide !");
        	}
        }
    }
?>