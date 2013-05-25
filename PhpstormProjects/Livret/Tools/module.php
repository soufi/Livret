<?php
include_once("connexion.php");
include_once("matiere.php");
	
	//les attributs de cette class seront mis automatiquement grace a PDO::FETCH_CLASS
	class Module{
		//genere un div avec les informations principal du module this 
		public function getDiv (){
			return '<div class="box span4 '.$this->_CODE_MAT_.'"> <h4 class="box-title">'.$this->_LIBELLE_MOD_.'</h2> <div class="box-text">"'.$this->_DESCRIPTION_.'</div> </div>';
		}
	}

//la variable $connect instance de PDO vers la bdd livret
//cette class permet d'avoir des outils qui permettrons la manipulation des matiere sur notre base données
	class ModuleTool{
		//permet d'avoir tous les champs d'une matiere avec l'id
		public static function getByID($connect, $_id) {
			$requete = "SELECT * FROM livret_module WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module"); //retourne un objet contenant les colonne comme attributs
				}else {
					throw new exception("ModuleTools::getByID => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByID => parametre invalide ! ");
			}
		}
		//meme chose avec libelle
		public static function getByLibelle($connect, $_libelle) {
			$requete = "SELECT * FROM livret_module WHERE _LIBELLE_MOD_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
				}else {
					throw new exception("ModuleTools::getByLibelle => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByLibelle => parametre invalide ! ");
			}
		}
		//meme chose avec le code de la matiere
		public static function getByCodeMat($connect, $_code_matiere){
			$requete = "SELECT * FROM livret_module WHERE _CODE_MAT_ = ?";
			if (!empty($connect) && !empty($_code_matiere)) {
			// set of parametres
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_STR);
				if($stmt->execute()){
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module"); 
				}else {
					throw new exception("ModuleTools::getByCodeMat => impossible d'executer la requete ! ");
				}
			}else {
				throw new exception("ModuleTools::getByCodeMat => parametre invalide ! ");
			}
		}
		
		//on recupere les modules par semestre et par promotion
		public static function getBySemestre($connect, $_semestre, $_id_promo) {
			$requete = "SELECT * FROM livret_module WHERE _SEMESTRE_ = ? NATURAL JOIN (SELECT _ID_MOD_ FROM livret_parcours WHERE _ID_PROMO_ = ?)";
			if(!empty($connect) && is_numeric($_semeestre) && is_numeric($_id_promo)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_semestre, PDO::PARAM_INT);
				$stmt->bindValue(2, $_id_promo, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
				else 
					throw new exception ("ModuleTools::getBySemestre => impossible d'executer la requete ! ");
			}else 
				throw new exception ("ModuleTools::getBySemestre => parametres invalides ! ");
		}
		
		//renvoi vrai si l'id existe, non sinon
		public static function existID($connect, $_id) {
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livret_module WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("ModuleTools::existID => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existID => parametres invalides ! ");
		}
		
		//renvoi vrai si l'id existe, non sinon
		public static function existLibelle($connect, $_libelle){
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livet_module WHERE _LIBELLE_MOD_ = ?";
			if (!empty($connect) && !empty($_libelle)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_libelle, PDO::PARAM_STR);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("ModuleTools::existLibelle => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existLibelle => parametres invalides ! ");
		}
		//verifie si une matiere existe deja 
		public static function existModule($connect, $_code_matiere, $_libelle, $_ects){
			$requete = "SELECT COUNT(DISTINCT _ID_MOD_) FROM livret_module WHERE _CODE_MAT_ = ? AND _LIBELLE_MAT_ = ? AND _ECTS_ = ?";
			if(!empty($connect) && !empty($_id_promo) && !empty($_libelle) && is_numeric($_ects)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_STR);
				$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(3, $_ects, PDO::PARAM_INT);
				if($stmt->execute()){
					$result = $stmt->fetch();
					return $result[0] != 0;
				}else 
					throw new exception("ModuleTools::existElement => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existElement => parametres invalides ! ");
		}
		
		
		//un module s'il n'existe pas déjà dans la base sachant que les clé primaire sont l'id de la matiere et leur ects 
		public static function insertModule($connect, $_code_matiere, $_libelle, $_semestre ,$_nbh_c, $_nbh_td, $_nbh_tp, $_nbh_ctd, $_ects, $_coef, $_langue, $_objectif, $_descript, $_method_eval, $_mod_cc_1, $_mod_cc_2, $_calcule_nf_1, $_calcule_nf_2, $_prerequis, $_ressources, $_biblio, $_note_elim, $_oblig) {
		
			$requete = "INSERT IGNORE INTO livret_module (_CODE_MAT_ , _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			if(!empty($connect) && is_numeric($_code_matiere) && !empty($_libelle) && is_numeric($_semestre) && is_numeric($_nbh_c) && is_numeric($_nbh_td) && is_numeric($_nbh_tp) && is_numeric($_nbh_ctd) && is_numeric($_ects) && is_numeric($_coef) && is_numeric($_note_elim)){
				try{
					if(MatiereTool::existID($connect, $_code_matiere)){
						//on a pas besoin de verifier si l'elment existe deja car les clés primaires sont fournis, et on utilise un insert ignore
						$stmt = $connect->prepare($requete);
						//configuration des parametres de la requete
						$stmt->bindValue(1, $_code_matiere, PDO::PARAM_INT);
						$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
						$stmt->bindValue(3, $_semestre, PDO::PARAM_INT);
						$stmt->bindValue(4, $_nbh_c, PDO::PARAM_INT);
						$stmt->bindValue(5, $_nbh_td, PDO::PARAM_INT);
						$stmt->bindValue(6, $_nbh_tp, PDO::PARAM_INT);
						$stmt->bindValue(7, $_nbh_ctd, PDO::PARAM_INT);
						$stmt->bindValue(8, $_ects, PDO::PARAM_INT);
						$stmt->bindValue(9, $_coef, PDO::PARAM_INT);
						$stmt->bindValue(10, $_langue, PDO::PARAM_STR);
						$stmt->bindValue(11, $_objectif, PDO::PARAM_STR);
						$stmt->bindValue(12, $_descript, PDO::PARAM_STR);
						$stmt->bindValue(13, $_method_eval, PDO::PARAM_STR);
						$stmt->bindValue(14, $_mod_cc_1, PDO::PARAM_STR);
						$stmt->bindValue(15, $_mod_cc_2, PDO::PARAM_STR);
						$stmt->bindValue(16, $_calcule_nf_1, PDO::PARAM_STR);
						$stmt->bindValue(17, $_calcule_nf_2, PDO::PARAM_STR);
						$stmt->bindValue(18, $_prerequis, PDO::PARAM_STR);
						$stmt->bindValue(19, $_ressources, PDO::PARAM_STR);
						$stmt->bindValue(20, $_biblio, PDO::PARAM_STR);
						$stmt->bindValue(21, $_note_elim, PDO::PARAM_INT);
						$stmt->bindValue(22, $_oblig, PDO::PARAM_STR);
						return $stmt->execute();
					}else 
						throw new exception("ModuleTools::insertModule => Erreur FOREIGN KEY ! ");
				}catch (exception $e) {
					throw new exception("ModuleTools::insertModule => ".$e->getMessage());
				}
			}else 
				throw new exception("ModuleTools::insertModule => parametres invalides ! "); 
		}
		
		//permet de mettre a jour le module
		public static function updateModule($connect, $_id_mod ,$_code_matiere, $_libelle, $_semestre ,$_nbh_c, $_nbh_td, $_nbh_tp, $_nbh_ctd, $_ects, $_coef, $_langue, $_objectif, $_descript, $_method_eval, $_mod_cc_1, $_mod_cc_2, $_calcule_nf_1, $_calcule_nf_2, $_prerequis, $_ressources, $_biblio, $_note_elim, $_oblig) {
			
			$requete = "UPDATE livret_module SET _CODE_MAT_ = ? , _LIBELLE_MOD_ = ? , _SEMESTRE_ = ? , _NBH_C = ? , _NBH_TD_ = ? , _NBH_TP_ = ? , _NBH_CTD_ = ? , _ECTS_ =  ? , _COEF_ = ? , _LANGUE_ = ? , _OBJECTIF_ = ? , _DESCRIPTION_ = ? , _METHODE_EVAL_ = ? , _MOD_CC_1_ = ? , _MOD_CC_2_ = ? , _CALCUL_NF_1_ = ? , _CALCUL_NF_2_ = ? , _PREREQUIS_ = ? , _LIEN_RESSOURCE_ = ? , _BIBLIOGRAPHIE_ = ? , _NOTE_ELIM_ = ? , _OBLIGATOIRE_ = ? WHERE _ID_MOD_ = ?";
			if (!empty($connect) && is_numeric($_id_mod) && is_numeric($_code_matiere) && !empty($_libelle) && is_numeric($_semestre) && is_numeric($_nbh_c) && is_numeric($_nbh_td) && 	is_numeric($_nbh_tp) && is_numeric($_nbh_ctd) && is_numeric($_ects) && is_numeric($_coef) && is_numeric($_note_elim)) {
				
				$stmt = $connect->prepare($requete);
				//configuration des parametres de la requete
				$stmt->bindValue(1, $_code_matiere, PDO::PARAM_INT);
				$stmt->bindValue(2, $_libelle, PDO::PARAM_STR);
				$stmt->bindValue(3, $_semestre, PDO::PARAM_INT);
				$stmt->bindValue(4, $_nbh_c, PDO::PARAM_INT);
				$stmt->bindValue(5, $_nbh_td, PDO::PARAM_INT);
				$stmt->bindValue(6, $_nbh_tp, PDO::PARAM_INT);
				$stmt->bindValue(7, $_nbh_ctd, PDO::PARAM_INT);
				$stmt->bindValue(8, $_ects, PDO::PARAM_INT);
				$stmt->bindValue(9, $_coef, PDO::PARAM_INT);
				$stmt->bindValue(10, $_langue, PDO::PARAM_STR);
				$stmt->bindValue(11, $_objectif, PDO::PARAM_STR);
				$stmt->bindValue(12, $_descript, PDO::PARAM_STR);
				$stmt->bindValue(13, $_method_eval, PDO::PARAM_STR);
				$stmt->bindValue(14, $_mod_cc_1, PDO::PARAM_STR);
				$stmt->bindValue(15, $_mod_cc_2, PDO::PARAM_STR);
				$stmt->bindValue(16, $_calcule_nf_1, PDO::PARAM_STR);
				$stmt->bindValue(17, $_calcule_nf_2, PDO::PARAM_STR);
				$stmt->bindValue(18, $_prerequis, PDO::PARAM_STR);
				$stmt->bindValue(19, $_ressources, PDO::PARAM_STR);
				$stmt->bindValue(20, $_biblio, PDO::PARAM_STR);
				$stmt->bindValue(21, $_note_elim, PDO::PARAM_INT);
				$stmt->bindValue(22, $_oblig, PDO::PARAM_STR);
				$stmt->bindValue(23, $_id_mod, PDO::PARAM_STR);
				return $stmt->execute();
				
			}else 
				throw new exception ("ModuleTools::updateModule => parametres invalide");
			
		}
		
		//permet d'avoir tous les modules
		public static function getAll($connect) {
			$requete = "SELECT * FROM livret_module ";
			$stmt = $connect->prepare($requete);
			if($stmt->execute())
				return $stmt->fetchAll(PDO::FETCH_CLASS, "Module");
			else 
				throw new exception ("ModuleTool::getAllModules => impossible d'executer la requete !");
		}
		
	}
?>