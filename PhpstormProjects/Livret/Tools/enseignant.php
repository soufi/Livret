<?php
	class Enseignant{

		//Genere une ligne de tableau contenant les information de l'instance
        public function genereLine(){
            $line = "<tr>";
            $line .= "<input type='hidden' value='".$this->_ID_ENS_."'/>";
            $line .= "<td>".$this->_NOM_ENS_."</td>";
            $line .= "<td>".$this->_PRENOM_ENS_."</td>";
            $line .= "<td>".$this->_EMAIL_ENS_."</td>";
            $line .= "<td>".$this->_PHONE_."</td>";
            $line .= "</tr>";
            return $line;
        }

        //genere un tableau contenant les informations de l'instance
        //a partir d'un tableau contenant tous les enseignants
        public static function genereTable($tableauEns, $page, $taillePage){
            $table = "<table class='table table-hover'> <div class='well well-small'> <h2>Les Enseignants</h2></div>";
            if(!empty($tableauEns)){
                $table .= "<tr>";
                //les titres des colonnes
                $table .= "<th>Nom</th>";
                $table .= "<th>Prénom</th>";
                $table .= "<th>E-mail</th>";
                $table .= "<th>Téléphone</th>";
                $table .= "</tr>";
                //----------
                //generation des lignes du tableau
                //prise en compte de pagination
                $nbrEns = count($tableauEns); //le nombre des Enseignants
                $nbrPage = $nbrEns / $taillePage;
                //on ajoute une page dans le cas ou le nombre n'est pas divisible par la taille de la page
                if(($nbrPage % $taillePage) != 0) {  $nbrPage++; }
                //si le nbr de la page est superieur aux bords
                if($page > $nbrPage || $page < 1)
                    $page = $nbrPage;
                $debutPage = (($page*$taillePage)-$taillePage)+1; //formule pour calculer le début de page
                //si ce qui reste des modules est sup a la taille de la page on calcule la fin sinon on s'arrete à la fin du tableau
                if(($nbrEns-(($page-1)*$taillePage)) > $taillePage)
                    $finPage = $debutPage + $taillePage;
                else
                    $finPage = $nbrEns;
                //chargement des lignes de la page
                for ($i = $debutPage ; $i < $finPage ; $i++) {
                    $table .= $tableauEns[$i]->genereLine();
                }
            //quand le tableau est vide on genere un warning
            }else
                $table .= AlertTool::genereWarning("Aucun enseignant trouvé !");
            $table .= "</table>";
            //menu de pagination
            if(!empty($nbrPage)){
                $table .= "<div class='pagination  pagination-centered'> <ul>";
                for ($i=1; $i <= $nbrPage; $i++) {
                    if($i === $page)
                        $table .= "<li class='active'><a href='#'>".$i."</a></li>";
                    else
                        $table .= "<li><a href='ensManager.php?pm=".$i."'>".$i."</a></li>";
                }
                $table .= "</ul> </div>";
            }
            return $table;
        }

        //genere un formulaire qui modifie un enseignant
        public function genereFormModif(){
            $form = "<div id='myModal".$this->_ID_ENS_."' class='modal hide fade in' style='display: none;'>";
            //Header Modal
            $form .= "<div class='modal-header'>";
            $form .= "<a href='' class='close' data-dismiss='modal'>x</a> <h3>Modification d'Enseignant</h3>";
            $form .= "</div>";
            //fin du Header du Modal
            $form .= "<div class='modal-body'>";

            //photo avatar
            $form .= "<div class='control-group'>";
            $form .= "<div style='width:50px ; height:50px ; margin:auto; margin-bottom:30px;'>";
            if(!empty($this->_PHOTO_) && file_exists($this->_PHOTO_))
                $form .= "<img src='".$this->_PHOTO_."' class='img-polaroid'/>";
            else
                $form .= "<img src='/Livret/CSS/Pictures/avatar.png' class='img-polaroid'>";
            $form .= "</div></div>";

            $form .= "<form id='form-myModal".$this->_ID_ENS_."' method='post' enctype='multipart/form-data' action='ensManager.php' class='form-horizontal'>";
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
            $form .= "<input type='tel' pattern='\\d*' name='phoneEns' id='phoneEns' placeholder='06' value='".$this->_PHONE_."'/>";
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
            $form .= "<span><a href='' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";

            return $form;
        }

        //genere un frmulaire pour ajouter un enseignant
        public static function genereFormAdd(){
        	$form = "<div id='formAddEns' class='modal hide fade in' style='display: none;'>";
            $form .= "<div class='modal-header'>";
            $form .= "<a href='ensManager.php' class='close' data-dismiss='modal'>x</a>";
            $form .= " <h3>Ajouter un enseignant</h3>";
            $form .= "</div>";
            $form .= "<div class='modal-body'>";

            //Debut du formulaire
            $form .= "<form method='post' action='ensManager.php' enctype='multipart/form-data' class='form-horizontal'>";

            //photo avatar
            $form .= "<div class='modal-control'>";
            $form .= "<div style='width:50px ; height:50px ; margin:auto; margin-bottom:30px;'>";
            $form .= "<img src='/Livret/CSS/Pictures/avatar.png' class='img-polaroid'>";
            $form .= "</div></div>";

            //Nom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='nomEns'>Nom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='nomEnsAdd' id='nomEns' placeholder='Champ Obligatoire ...' required />";
            $form .= "<input type='hidden' name='idEns'/>";
            $form .= "</div> </div> "; //fin control-group
            //Prenom 
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='prenomEns'>Prénom</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='prenomEnsAdd' id='prenomEns' placeholder='Champ Obligatoire ...' required />";
            $form .= "</div> </div> "; //fin control-group
            //E-mail
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='emailEns'>E-mail</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='email' name='emailEnsAdd' id='emailEns' placeholder='nom.prenom@univ-orleans.fr' required />";
            $form .= "</div> </div> "; //fin control-group
            //Phone
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='phoneEns'>Tél</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='tel' pattern='\\d*' name='phoneEnsAdd' id='phoneEns' placeholder='06'/>";
            $form .= "</div> </div> "; //fin control-group
            //Titre
            $form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='titreEns'>Titre</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='text' name='titreEnsAdd' id='titreEns' placeholder='professeur, maitre de conf...' />";
            $form .= "</div> </div> "; //fin control-group
            //Photo
			$form .= "<div class='control-group'>";
            $form .= "<label class='control-label' for='photoEnsAdd'>Photo</label>";
            $form .= "<div class='controls'>";
            $form .= "<input type='file' name='photoEnsAdd' id='photoEns'/>";
            $form .= "</div> </div> "; //fin control-group

            $form .= "</div>"; //fin modal-body
            $form .= "<div class='control-group modal-footer'>";
            $form .= "<input type='submit' class='btn btn-primary' name='formAddSubmit' value='Envoyer'/>";
            $form .= "<span><a href='ensManager.php' data-dismiss='modal' class='btn'>Annuler</a></span>";
            $form .= "</div> </form>";
            $form .= "</div>";

            return $form;
        }
	}

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	//permettant de gérer les enseignant dans la base de donnée
	class EnseignantTool{

		//permet de récupérer un enseignant à partir de son id
		//retourne un tableau d'objet
		public static function getByID(PDO $connect, $idEns){
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
		//retourne un tableau d'objet
		public static function getByEmail (PDO $connect, $eMail){
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
		//retourne un boolean
		public static function existID(PDO $connect, $idEns){
			$requete = "SELECT COUNT(_ID_ENS_) FROM livret_enseignant WHERE _ID_ENS_ = ?";
			if(!empty($connect) && is_numeric($idEns)){
				$stmt = $connect->prepare($requete);
				$stmt->bindParam(1, $idEns, PDO::PARAM_INT);
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
		public static function existEmail (PDO $connect, $email){
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
		public static function insertEnseignant(PDO $connect, $nom, $prenom, $email, $phone, $titre, $photo){
			$requete = "INSERT IGNORE INTO livret_enseignant (_NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_, _PHONE_, _TITRE_, _PHOTO_) VALUES (?,?,?,?,?,?)";
			if(!empty($connect) && !empty($nom) && !empty($prenom) && !empty($email)){
				if(! EnseignantTool::existEmail($connect, $email)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $nom, PDO::PARAM_STR);
					$stmt->bindParam(2, $prenom, PDO::PARAM_STR);
					$stmt->bindParam(3, $email, PDO::PARAM_STR);
					$stmt->bindParam(4, $phone, PDO::PARAM_INT);
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
		public static function updateEnseignant(PDO $connect, $id, $nom, $prenom, $email, $phone, $titre, $photo){
			$requete = "UPDATE livret_enseignant SET _NOM_ENS_ = ? , _PRENOM_ENS_ = ? , _EMAIL_ENS_ = ? , _PHONE_ = ? , _TITRE_ = ? , _PHOTO_ = ? WHERE _ID_ENS_ = ?";
			if(!empty($connect) && !empty($nom) && !empty($prenom) && !empty($email) && is_numeric($id)){
				if(EnseignantTool::existID($connect, $id)){
					$stmt = $connect->prepare($requete);
					$stmt->bindParam(1, $nom, PDO::PARAM_STR);
					$stmt->bindParam(2, $prenom, PDO::PARAM_STR);
					$stmt->bindParam(3, $email, PDO::PARAM_STR);
					$stmt->bindParam(4, $phone, PDO::PARAM_INT);
					$stmt->bindParam(5, $titre, PDO::PARAM_STR);
					$stmt->bindParam(6, $photo, PDO::PARAM_STR);
					$stmt->bindParam(7, $id, PDO::PARAM_INT);
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
		public static function deleteEnseignant(PDO $connect, $id){
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

		//permet d'avoir tous les enseignants 
		public static function getAll(PDO $connect){
			$requete = "SELECT * FROM livret_enseignant ORDER BY _NOM_ENS_ ASC";
			if(!empty($connect)){
				$stmt = $connect->prepare($requete);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Enseignant");
				else
					throw new Exception("EnseignantTool::getAll => impossible d'executer la requete");
			}else
				throw new Exception("EnseignantTool::getAll => parametre invalide");
		}

	}


?>