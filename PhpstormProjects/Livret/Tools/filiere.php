<?php 
include_once("connexion.php");
include_once("composante.php");
include_once("alerts.php");

	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Filiere{

		//Genere une ligne de tableau contenant les information de l'instance
        public function genereLine($connect){
        	if(!empty($connect)){
	            $line = "<tr>";
	            $line .= "<input type='hidden' value='".$this->_ID_FILIERE_."'/>";
	            $line .= "<td>".$this->_LIBELLE_FILIERE_."</td>";
	            $line .= "<td>".ComposanteTool::libelleOfID($connect, $this->_ID_COMPO_)."</td>";
	            $line .= "</tr>";
	            return $line;
	        }else
	        	throw new Exception("Filiere::genereLine => parametre invalide !");
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($connect, $tableauFiliere){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Filières</h2></div>";
            if(!empty($tableauFiliere) && !empty($connect)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Libelle</th>";
                $table .= "<th>Composante Associé</th>";
                $table .= "</tr>";
                //generation des lignes du tableau
                foreach ($tableauFiliere as $value) {
                    $table .= $value->genereLine($connect);
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucune Filière trouvée !"));
            $table .= "</table>";
            return $table;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif($connect){
            $form = "<div id='myModal".$this->_ID_FILIERE_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='filiereManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Filière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_FILIERE_."' method='post' action='filiereManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleFiliere'>Libelle Filière</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleFiliere' id='libelleFiliere' placeholder='Champ Obligatoire ...' required value='".$this->_LIBELLE_FILIERE_."'/>";
            $form .= "<input type='hidden' name='idFiliere' value='".$this->_ID_FILIERE_."'/>";
            $form .= "</div> </div> "; //fin control-group
            $form .= "<div class='control-group'>";
            //liste deroulante qui contiendra les choix existant dans la table livret_compo
            $form .= "<label class='control-label' for='compoAssoc'>Composante Associé</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='compoAssoc' id='compoAssoc' required>";
            //les Options
            $allCompo = ComposanteTool::getAll($connect);
            foreach ($allCompo as $value) {
            	if ($value->_ID_COMPO_ === $this->_ID_COMPO_) {
            		$form .= "<option value='".$value->_ID_COMPO_."' selected='selected'>".$value->_LIBELLE_COMPO_."</option>";
            	}else
            		$form .= "<option value='".$value->_ID_COMPO_."'>".$value->_LIBELLE_COMPO_."</option>";
            }
            $form .= "</select></div></div>";
            //une alert dans la cas ou il n'ya plus de composante
            if(empty($allCompo)){
            	$form .= (AlertTool::genereWarning("Aucune Composante trouvée !"));
            }
            $form .= "</div>"; //fin modal-body
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<span><a href='filiereManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";

            return $form;
        }

        //genere un frmulaire pour ajouter une Filiere
        public static function genereFormAdd($connect){
        	$form = "<div id='formAddFiliere' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='filiereManager.php' class='close' data-dismiss='modal'>x</a> <h3>Ajouter Filière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='filiereManager.php'  class='form-horizontal'>";
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleFiliere'>Libelle Filière</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleFiliere' id='libelleFiliere'  placeholder='Champ Obligatoire ...' required/>";
            $form .= "</div> </div> "; //fin control-group
            $form .= "<div class='control-group'>";
            //liste deroulante qui contiendra les choix existant dans la table livret_compo
            $form .= "<label class='control-label' for='compoAssoc'>Composante Associé</label>";
            $form .= "<div class='controls'>";
            $form .= "<select name='compoAssoc' id='compoAssoc' required>";
            //les Options
            $allCompo = ComposanteTool::getAll($connect);
            foreach ($allCompo as $value) {
            	$form .= "<option value='".$value->_ID_COMPO_."'>".$value->_LIBELLE_COMPO_."</option>";
            }
            $form .= "</select></div>";
            //une alert dans la cas ou il n'ya plus de composante
            if(empty($allCompo)){
            	$form .= (AlertTool::genereWarning("Aucune Composante trouvée !"));
            }
            $form .= "</div>"; //fin modal-body
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<span><a href='filiereManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }


	}

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


	//cette class gere les filiere au niveua de la bdd
	//les resultats des requetes de selection, sont presenter sous forme d'une objet filiere, avec le colonne comme attributs, et pour chaque ligne de resultats, presente sous forme d'une case du tableau de resultats final, tous ceci grace a la fonction PDO:fetchAll 
	class FiliereTool {
		
		//recupere les lignes ou la ligne correspondante a l'id en parametre
		public static function getByID ($connect, $_id){
			$requete = "SELECT * FROM livret_filiere WHERE _ID_FILIERE_ = ?";
			if(is_numeric($_id) && !empty($connect)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Filiere");
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
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Filiere");
				else
					throw new exception ("Filiere::getByLibelle => impossible d'exectuer la requete");
			}else
				throw new exception ("Filiere::getByLibelle => param invalide");
		}
		
		//recupere toutes les Filieres
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_filiere";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Filiere");
			else 
				throw new exception ("Filiere::getAllFiliere => impossible d'executer la requete !");
		}
		
		//permet d'inserer une Filiere
		public static function insertFiliere($connect, $_libelle, $_id_compo){
			$requete = "INSERT INTO livret_filiere (_LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (?, ?)";
			//verification de validite des parametres
			if (is_numeric($_id_compo) && !empty($_libelle) && !empty($connect)) {
				//verifier si l'id existe dans la table ou non
				try{
					if (! FiliereTool::existLibelle($connect, $_libelle)) {
						//si l'id de la composante existe deja on peut ajouter, sinon on ne peut pas on leve une exception
						if(ComposanteTool::existID($connect, $_id_compo)){
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
					$result = $stmt->fetch(); //recup de nombre de ligne correspondante a la recherche
					return ($result[0] != 0);
				}else 
					throw new exception ("Filiere::existID => impossible d'executer la requete !");
			}else 
				throw new exception ("Filiere::existID => parametre invalide !");
		}
		
		//met a jour une filiere 
		public static function updateFiliere($connect, $_id, $_newLibelle, $_idCompo){
			$requete = "UPDATE livret_filiere SET _LIBELLE_FILIERE_ = ? , _ID_COMPO_ = ? WHERE _ID_FILIERE_ = ?";
			if(is_numeric($_id) && is_numeric($_idCompo) && !empty($_newLibelle) && !empty($connect)){
				try {
					if(ComposanteTool::existID($connect, $_idCompo)){
						$stmt = $connect->prepare($requete);
						$stmt->bindValue(1, $_newLibelle, PDO::PARAM_STR);
						$stmt->bindValue(2, $_idCompo, PDO::PARAM_INT);
						$stmt->bindValue(3, $_id, PDO::PARAM_INT);
						return $stmt->execute();
					}else
						return FALSE;
				} catch (Exception $e) {
					throw new Exception("FiliereTool::updateFiliere => ".$e->getMessage());
				}
			}else
				throw new Exception ("FiliereTool::updateFiliere => Parametre invalide !");
		}

		//permet de supprimer une Filiere
		public static function deleteFiliere($connect, $_id){
			$requete = "DELETE FROM livret_filiere WHERE _ID_FILIERE_ = ?";
			if(is_numeric($_id) && !empty($connect)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				return $stmt->execute();
			}else
				throw new Exception("FiliereTool::deleteFiliere => Parametre invalide !");
		}
		
	}
?>