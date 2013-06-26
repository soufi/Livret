<?php 

include_once("connexion.php");
	
	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Matiere{

		//genere une ligne d'un tableau contenant les informations de l'instance
        public function genereLine(){
            $line = "<tr>";
            $line .= "<input type='hidden' value='".$this->_CODE_MAT_."'>";
            $line .= "<td> ".$this->_CODE_MAT_."</td>";
            $line .= "<td>".$this->_LIBELLE_MAT_."</td>";
            $line .= "</tr>";
            return $line;
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($tableauMatiere){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Matieres</h2></div>";
            if(!empty($tableauMatiere)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Code</th>";
                $table .= "<th>Libelle</th>";
                $table .= "</tr>";
                //generation des lignes du tableau
                foreach ($tableauMatiere as $value) {
                    $table .= $value->genereLine();
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucune Matière trouvée !"));
            $table .= "</table>";
            return $table;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif(){
            $form = "<div id='myModal".$this->_CODE_MAT_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Modification Matière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_CODE_MAT_."' method='post' action='matiereManager.php'  class='form-horizontal'>";
            //Code de la matiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='codeMatiere'>Code Matière</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='codeMatiere' id='codeMatiere' size='4' placeholder='taille inférieur à 5' required value='".$this->_CODE_MAT_."'/>";
            $form .= "</div> </div>";
            //Libelle
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleMatiere'>Libelle Matiere</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleMatiere' id='libelleMatiere' placeholder='Champ Obligatoire ...' required size='50' value='".$this->_LIBELLE_MAT_."'/>";
            $form .= "<input type='hidden' name='codeMatiereOld' value='".$this->_CODE_MAT_."'/>";
            $form .= "</div> </div>";
            //fin modal-bdy
            $form .= "</div>";
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
            $form = "<div id='formAddMatiere' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Ajouter une Matière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='matiereManager.php'  class='form-horizontal'>";
            //Code de la matiere
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='codeMatiere'>Code Matière</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='codeMatiereAdd' size='4' placeholder='champ Obligatoire ...' required />";
            $form .= "</div> </div>";
            //Libelle
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='libelleMatiere'>Libelle Matiere</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='libelleMatiereAdd' id='libelleMatiere' placeholder='Champ Obligatoire ...' required size='50'/>";
            $form .= "</div> </div>";
            //fin modal-bdy
            $form .= "</div>";
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary ' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<input type='button' data-dismiss='modal' class='btn' value='Annuler'/>";
            $form .= "</div> </form>";
            $form .= "</div>";
            return $form;
        }

	}

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


	//la variable $connect est l'instance de PDO vers la bdd livret
	
	class MatiereTool {
		
		//test si l'id exist deja ou non
		//retourne un boolean 
		public static function existID($connect, $_code) {
			$requete = "SELECT COUNT(_CODE_MAT_) FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_code, PDO::PARAM_STR); //taille de parametre code de la matiere doit etre inf a 3
				if($stmt->execute()){
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("MatiereTool::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTool::existID => parametres invalides ! ");
		}
		//meme chose avec libelle
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(_LIBELLE_MAT_) FROM livret_matiere WHERE _LIBELLE_MAT_ = ?";
			if(!empty($connect) && !empty($_libelle)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_libelle, PDO::PARAM_STR, 50);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("MatiereTool::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTool::existLibelle => parametres invalides ! ");
		}
		//retourne un objet contenant les colonne de la table matiere comme attribut
		public static function getByID($connect, $_code) {
			$requete = "SELECT * FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_code, PDO::PARAM_STR, 4);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Matiere");
				else 
					throw new exception("MatiereTool::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("MatiereTool::getByID => parametres invalides ! "."\n");
		}
		
		//meme chose avec le libelle
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT * FROM livret_matiere WHERE _LIBELLE_MAT_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare ($requete);
				$stmt->bindParam(1, $_libelle, PDO::PARAM_STR, 50);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Matiere");
				else 
					throw new exception("MatiereTool::getByLibelle => impossible d'executer la requete !");
			}else 
				throw new exception("MatiereTool::getByLibelle => parametres invalide !");
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
		public static function insertMatiere($connect, $_code ,$_libelle) {
			$requete = "INSERT INTO livret_matiere (_CODE_MAT_, _LIBELLE_MAT_) VALUES (?,?)";
			if (!empty($connect) && !empty($_libelle) && !empty($_code)){
				if(! MatiereTool::existLibelle($connect, $_libelle)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $_code, PDO::PARAM_STR, 4);
					$stmt->bindParam(2, $_libelle, PDO::PARAM_STR, 50);
					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("MatiereTool::insertMatiere => impossible d'executer la requete");
				}else 
					return TRUE;
			}else 
				throw new exception("MatiereTool::insertUE => parametre invalide ! ");
		}
		
		//Update des informations d'une matiere, changement du nom
		public static function updateMatiere ($connect, $_newCode, $_libelle, $_oldCode){
			$requete = "UPDATE livret_matiere SET _CODE_MAT_ = ? , _LIBELLE_MAT_ = ? WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_newCode) && !empty($_libelle) && !empty($_oldCode)) {
				if(! MatiereTool::existID($connect, $_newCode)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $_newCode, PDO::PARAM_STR, 4);
					$stmt->bindParam(2, $_libelle, PDO::PARAM_STR, 50);
					$stmt->bindParam(3, $_oldCode, PDO::PARAM_STR, 4);
					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("MatiereTool::updateMatiere => impossible d'executer la requete");
				}else 
					return FALSE;
			}else 
				throw new exception("MatiereTool::updateMatiere => parametre invalide !");
		}

		//supprimer une matiere
		public static function deleteMatiere($connect, $_code){
			$requete = "DELETE FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if(!empty($connect) && !empty($_code)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_code, PDO::PARAM_STR, 4);
				if($stmt->execute())
					return TRUE;
				else
					throw new Exception("MatiereTool::deleteMatiere => impossible d'exectuer la requete");
			}else
				throw new Exception("MatiereTool::deleteMatiere => parametre invalide !");
		}

		//libelle du code 
		public static function libelleOfCode ($connect, $_code){
			$requete = "SELECT _LIBELLE_MAT_ FROM livret_matiere WHERE _CODE_MAT_ = ?";
			if(!empty($connect) && !empty($_code)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $_code, PDO::PARAM_STR);
				if($stmt->execute()){
					$result = $stmt->fetch();
					if(!empty($result[0])) //on renvoi un resultat que s'il existe
						return $result[0];
				}else
					throw new Exception("MatiereTool::libelleOfCode => impossible d'executer la requete");
			}else
				throw new Exception("MatiereTool::libelleOfCode => parametre invalide !");
				
		}
	}
?>