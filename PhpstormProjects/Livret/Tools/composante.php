<?php 
include_once("connexion.php");
include_once("alerts.php");
    
    //les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
    class Compo{

        //genere une ligne d'un tableau contenant les informations de l'instance
        public function genereLine(){
            $line = "<tr>";
            $line .= "<input type='hidden' value='".$this->_ID_COMPO_."'/>";
            $line .= "<td>".$this->_LIBELLE_COMPO_."</td>";
            $line .= "</tr>";
            return $line;
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($tableauCompo){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Composantes</h2></div>";
            if(!empty($tableauCompo)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Libelle</th>";
                $table .= "</tr>";
                //generation des lignes du tableau
                foreach ($tableauCompo as $value) {
                    $table .= $value->genereLine();
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucune Composante trouvée !"));
            $table .= "</table>";
            return $table;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif(){
            $form = "<div id='myModal".$this->_ID_COMPO_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='#' class='close' data-dismiss='modal'>x</a> <h3>Modification Composante</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_COMPO_."' method='post' action='compoManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleCompo'>Libelle Composante</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleCompo' id='libelleCompo' placeholder='Champ Obligatoire ...' required value='".$this->_LIBELLE_COMPO_."'/>";
            $form .= "<input type='hidden' name='idCompo' value='".$this->_ID_COMPO_."'/>";
            $form .= "</div> </div> </div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<input type='button' data-dismiss='modal' class='btn' value='Annuler'/>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //genere un formulaire de creation de composante
        public static function genereFormAdd(){
            $form = "<div id='formAddComposante' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='#' class='close' data-dismiss='modal'>x</a> <h3>Ajouter une Composante</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='compoManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleCompoAdd'>Libelle Composante</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleCompoAdd' placeholder='Champ Obligatoire ...' required />";
            $form .= "</div> </div> </div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<input type='button' data-dismiss='modal' class='btn' value='Annuler'/>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

        //si $nom n'est pas fournit ou est vide, alors on utilise le libelle pour fournir le nom du bouton
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
        
        //recupere en fonction de la valeur de l'id la ligne correspondante sous forme d'objet Compo
        public static function getByID ($connect , $_id){
			$requete = "SELECT * FROM livret_compo WHERE _ID_COMPO_ = ?";
			if(empty($connect) || !is_numeric($_id)){
				throw new Exception("ComposanteTool::getByID => parametre invalide !");
			}else{
			
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
				else 
					throw new Exception ("ComposanteTool::getByID => impossible d'executer la requete !");	
			}
		}
		
		//retourne toutes les lignes de la table compo sous forme d'un tableau contenant un objet pour chaque ligne, les colonne de la table représente les attribut de cet objet
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_compo";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
			else 
				throw new Exception ("ComposanteTool::getAllCompo => impossible d'executer la requete !");
		}
		
		//recuperation par libelle
		public static function getByLibelle($connect, $_libelle){
			$requete = "SELECT * FROM livret_compo WHERE _LIBELLE_COMPO_ = ?";
			if(empty($_libelle)){
				throw new Exception ("ComposanteTool::getByLibelle => parametre invalide !");
			}else{
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Compo");
				}else 
					throw new Exception ("ComposanteTool::getByLibelle => impossible d'executer la requete !");
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
            	//si l'element n'existe pas deja on l'ajoute sinon on fait rien
                try{
                    if(!ComposanteTool::existLibelle($connect, $_libelle)){
                        $stmt = $connect->prepare($requete);
                        $stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
                        return $stmt->execute();
                    }else 
                        return TRUE;
                }catch(exception $e){
                    throw new Exception("ComposanteTool::insertCompo => ".$e->getMessage());
                }
            }
        }
        
        //renvoi un boolean permettant de savoir si le libelle exist ou non
        public static function existLibelle($connect, $_libelle){
        	$requete = "SELECT COUNT(_ID_COMPO_) FROM livret_compo WHERE _LIBELLE_COMPO_ = ?";
        	if(!empty($connect) && !empty($_libelle)){
        		$stmt = $connect->prepare($requete);
        		$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
        		if($stmt->execute()){
        			$result = $stmt->fetch();
        			return ($result[0] != 0);
        		}else 
        			throw new Exception("ComposanteTool::existLibelle => impossible d'executer la requete !");
        	}
        }
        
        //permet de verifier si l'id existe
        //retourne vrai dans ce cas la, non sinon
        public static function existID($connect, $_id){
       		$requete = "SELECT COUNT(_ID_COMPO_) FROM livret_compo WHERE _ID_COMPO_ = ?";
        	if (is_numeric($_id) && !empty($connect)) {
        		$stmt = $connect->prepare($requete);
        		$stmt->bindValue(1, $_id, PDO::PARAM_INT);
        		if ($stmt->execute()) {
        			$result = $stmt->fetch();
        			return ($result[0] != 0);
        		}else {
        			throw new Exception("ComposanteTool::existID => impossible d'executer la requete !");
        		}
        		
        	}else{
        		throw new Exception("ComposanteTool::existID => parametre invalide !");
        	}
        }

        //met a jour la ligne avec l'id passé en param, par le nouveau libelle 
        public static function updateCompo($connect, $_id, $_newLibelle){
            $requete = "UPDATE livret_compo SET _LIBELLE_COMPO_ = ? WHERE _ID_COMPO_ = ?";
            if(is_numeric($_id) && !empty($_newLibelle) && !empty($connect)){
                $stmt = $connect->prepare($requete);
                $stmt->bindValue(1, $_newLibelle , PDO::PARAM_STR);
                $stmt->bindValue(2, $_id, PDO::PARAM_INT);
                return $stmt->execute();
            }else
                throw new Exception("ComposanteTool::updateCompo => Parametre invalide !");
        }

        //permet de supprimer la ligne avec l'id correspondant 
        public static function deleteCompo ($connect, $_id){
            $requete = "DELETE FROM livret_compo WHERE _ID_COMPO_ = ?";
            if(!empty($connect) && is_numeric($_id)){
                $stmt = $connect->prepare($requete);
                $stmt->bindValue(1, $_id, PDO::PARAM_INT);
                return $stmt->execute();
            }else
                throw new Exception("ComposanteTool::deleteCompo => Parametre invalide !");
        }

        //retourne le libelle associé a l'id passe en param, null s'il n'existe pas
        public static function libelleOfID($connect, $_id){
            $requete = "SELECT _LIBELLE_COMPO_ FROM livret_compo WHERE _ID_COMPO_ = ?";
            if(!empty($connect) && is_numeric($_id)){
                $stmt = $connect->prepare($requete);
                $stmt->bindValue(1, $_id, PDO::PARAM_INT);
                if($stmt->execute()){
                    $result = $stmt->fetch();
                    if(!empty($result))
                        return $result[0];
                    else
                        return null;
                }else
                    throw new Exception("ComposanteTool::libelleOfID => impossible d'executer la requete");
            }else
                throw new Exception("ComposanteTool::libelleOfID => Parametre invalide !");
        }
    }
?>