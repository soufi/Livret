<?php
	
	class Enseignant{

		//Genere une ligne de tableau contenant les information de l'instance
        public function genereLine($connect){
        	if(!empty($connect)){
	            $line = "<tr>";
	            $line .= "<input type='hidden' value='".$this->_ID_ENS_."'/>";
	            $line .= "<td>".$this->_NOM_ENS_."</td>";
	            $line .= "<td>".$this->_PRENOM_ENS_."</td>";
	            $line .= "<td>".$this->_EMAIL_ENS_."</td>";
	            $line .= "<td>".$this->_PHONE_."</td>";
	            $line .= "</tr>";
	            return $line;
	        }else
	        	throw new Exception("Filiere::genereLine => parametre invalide !");
        }

        //genere un tableau contenant les informations de l'instance
        public static function genereTable($connect, $tableauEns){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Enseignants</h2></div>";
            if(!empty($tableauEns) && !empty($connect)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Nom</th>";
                $table .= "<th>Prénom</th>";
                $table .= "<th>E-mail</th>";
                $table .= "<th>Téléphone</th>";
                $table .= "</tr>";
                //generation des lignes du tableau
                foreach ($tableauEns as $value) {
                    $table .= $value->genereLine($connect);
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= (AlertTool::genereWarning("Aucun enseignant trouvé !"));
            $table .= "</table>";
            return $table;
        }

        //genere un formulaire qui modifie une composante
        public function genereFormModif($connect){
            $form = "<div id='myModal".$this->_ID_ENS_."' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='ensManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Filière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form id='form-myModal".$this->_ID_ENS_."' method='post' action='ensManager.php'  class='form-horizontal'>";
            //Nom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nomEns'>Nom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='nomEns' id='nomEns' placeholder='Champ Obligatoire ...' required value='".$this->_NOM_ENS_."'/>";
            $form .= "<input type='hidden' name='idEns' value='".$this->_ID_ENS_."'/>";
            $form .= "</div> </div> "; //fin control-group
            //Prenom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prenomEns'>Prénom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='prenomEns' id='prenomEns' placeholder='Champ Obligatoire ...' required value='".$this->_PRENOM_ENS_."'/>";
            $form .= "</div> </div> "; //fin control-group
            //E-mail
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='emailEns'>E-mail</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='email' name='emailEns' id='emailEns' placeholder='nom.prenom@univ-orleans.fr' required value='".$this->_EMAIL_ENS_."'/>";
            $form .= "</div> </div> "; //fin control-group
            //Phone
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='phoneEns'>Tél</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='tel' name='phoneEns' id='phoneEns' placeholder='06' value='".$this->_PHONE_."'/>";
            $form .= "</div> </div> "; //fin control-group
            //Titre
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='titreEns'>Titre</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='titreEns' id='titreEns' placeholder='professeur, maitre de conf...' value='".$this->_TITRE_."'/>";
            $form .= "</div> </div> "; //fin control-group
            //Photo
			$form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='photoEns'>Photo</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='file' name='photoEns' id='photoEns' value='".$this->_PHOTO_."'/>";
            $form .= "</div> </div> "; //fin control-group

            $form .= "</div>"; //fin modal-body
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<span><a href='ensManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";

            return $form;
        }

        //genere un frmulaire pour ajouter une Filiere
        public static function genereFormAdd($connect){
        	$form = "<div id='formAddEns' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='ensManager.php' class='close' data-dismiss='modal'>x</a> <h3>Modification Filière</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";
            $form .= "<form method='post' action='ensManager.php'  class='form-horizontal'>";
            //Nom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nomEns'>Nom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='nomEns' id='nomEns' placeholder='Champ Obligatoire ...' required />";
            $form .= "<input type='hidden' name='idEns'/>";
            $form .= "</div> </div> "; //fin control-group
            //Prenom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prenomEns'>Prénom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='prenomEns' id='prenomEns' placeholder='Champ Obligatoire ...' required />";
            $form .= "</div> </div> "; //fin control-group
            //E-mail
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='emailEns'>E-mail</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='email' name='emailEns' id='emailEns' placeholder='nom.prenom@univ-orleans.fr' required />";
            $form .= "</div> </div> "; //fin control-group
            //Phone
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='phoneEns'>Tél</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='tel' name='phoneEns' id='phoneEns' placeholder='06'/>";
            $form .= "</div> </div> "; //fin control-group
            //Titre
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='titreEns'>Titre</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='titreEns' id='titreEns' placeholder='professeur, maitre de conf...' />";
            $form .= "</div> </div> "; //fin control-group
            //Photo
			$form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='photoEns'>Photo</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='file' name='photoEns' id='photoEns'/>";
            $form .= "</div> </div> "; //fin control-group

            $form .= "</div>"; //fin modal-body
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formUpdSubmit' value='Envoyer'/>";
            $form .= "<input type='submit' class='btn btn-danger' name='formDeleteSubmit' value='Supprimer'/>";
            $form .= "<span><a href='ensManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";

            return $form;
        }
	}

	//permettant de gérer les enseignant dans la base de donnée
	class EnseignantTool{

		//permet de récupérer un enseignant à partir de son id
		public static function getByID($connect, $idEns){
			$requete = "SELECT * FROM livret_enseignant WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idEns, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Enseignant");
				else
					throw new Exception("EnseignantTool::getByID => impossible d'executer la requete");
			}else
				throw new Exception("EnseignantTool::getByID => parametres invalides !");
		}

		//permet de récupérer un enseignant à partir de son eMail 
		public static function getByEmail ($connect, $eMail){
			$requete = "SELECT * FROM livret_enseignant WHERE _EMAIL_ENS_ = ?";
			if(!empty($connect) && !empty($eMail)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $eMail, PDO::PARAM_STR);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Enseignant");
				else
					throw new Exception("EnseignantTool::getByEmail => impossible d'executer la requete");
			}else
				throw new Exception("EnseignantTool::getByEmail => parametres invalides !");
		}

		//permet de savoir si l'id exist ou non dans la table
		public static function existID($connect, $idEns){
			$requete = "SELECT COUNT(_ID_ENS_) FROM livret_enseignant WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->binParam(1, $idEns, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}
				else
					throw new Exception("EnseignantTool::existID => impossible d'executer la requete");
			}else
				throw new Exception("EnseignantTool::existID => parametre invalide");
		}

		//permet de savoir si un email existe dans la table d'enseignant
		public static function existEmail ($connect, $email){
			$requete = "SELECT COUNT(_EMAIL_ENS_) FROM livret_enseignant WHERE _EMAIL_ENS_ = ?";
			if(!empty($connect) && !empty($email)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $email, PDO::PARAM_STR);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else
					throw new Exception("EnseignantTool::existEmail => impossible d'executer la requete");
			}else
				throw new Exception("EnseignantTool::existEmail => parametre invalide");
		}

		//permet d'inserrer un enseignant dans la base
		public static function insertEnseignant($connect, $nom, $prenom, $email, $phone, $titre, $photo){
			$requete = "INSERT INTO livret_enseignant (_NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_, _PHONE_, _TITRE_, _PHOTO_) VALUES (?,?,?,?,?,?)";
			if(!empty($connect) && !empty($nom) && !empty($prenom) && !empty($email)){
				if(! EnseignantTool::existEmail($connect, $email)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $nom, PDO::PARAM_STR);
					$stmt->binParam(2, $prenom, PDO::PARAM_STR);
					$stmt->bindParam(3, $email, PDO::PARAM_STR);
					$stmt->binParam(4, $phone, PDO::PARAM_INT);
					$stmt->bindParam(5, $titre, PDO::PARAM_STR);
					$stmt->bindParam(6, $photo, PDO::PARAM_STR);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("EnseignantTool::insertEnseignant => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("EnseignantTool::insertEnseignant => parametre invalide");
		}

		//permet de mettre a jour 
		public static function updateEnseignant($connect, $id, $nom, $prenom, $email, $phone, $titre, $photo){
			$requete = "UPDATE livret_enseignant SET _NOM_ENS_ = ? , _PRENOM_ENS_ = ? , _EMAIL_ENS_ = ? , _PHONE_ = ? , _TITRE_ = ? , _PHONE_ = ? WHERE _ID_ENS_ = ?";
			if(!empty($connect) && !empty($nom) && !empty($prenom) && !empty($email) && is_numeric($id)){
				if(EnseignantTool::existID($connect, $id)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $nom, PDO::PARAM_STR);
					$stmt->binParam(2, $prenom, PDO::PARAM_STR);
					$stmt->bindParam(3, $email, PDO::PARAM_STR);
					$stmt->binParam(4, $phone, PDO::PARAM_INT);
					$stmt->bindParam(5, $titre, PDO::PARAM_STR);
					$stmt->bindParam(6, $photo, PDO::PARAM_STR);
					$stmt->binParam(7, $id, PDO::PARAM_INT);
					if($stmt->execute()){
						return TRUE;
					}else
						throw new Exception("EnseignantTool::updateEnseignant => impossible d'executer la requete");
				}else
					return FALSE;
			}else
				throw new Exception("EnseignantTool::updateEnseignant => parametre invalide");
		}

		//permet de supprimer un enseignant
		public static function deleteEnseignant($connect, $id){
			$requete = "DELETE FROM livret_enseignant WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($id)){
				if(EnseignantTool::existID($connect, $id)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $id, PDO::PARAM_INT);
					if($stmt->execute())
						return TRUE;
					else
						throw new Exception("EnseignantTool::deleteEnseignant => impossible d'exectuer la requete");
				}else
					return FALSE;	
			}else 
				throw new Exception("EnseignantTool::deleteEnseignant => parametre invalide");
		}

	}


?>