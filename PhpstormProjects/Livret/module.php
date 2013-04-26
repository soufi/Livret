<?php
	class ModuleTools{
		
		public static function getByID($connect, $_id) {
			$requete = "SELECT * FROM livret_module WHERE _ID_MAT_ = ?";
			if (!empty($connect) && is_numeric($_id)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "module");
				else 
					throw new exception("ModuleTools::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::getByID => parametres invalides ! ");
		}
		
		public static function getByIDnECTS($connect, $_id, $_ects) {
			$requete = "SELECT * FROM livre_module WHERE _ID_MAT = ? AND _NB_ECTS_ = ?";
			if(!empty($connect) && is_numeric($_id) && is_numeric($_ects)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				$stmt->bindValue(2, $_ects, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "module");
				else 
					throw new exception("ModuleTools::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::getByID => parametres invalides ! ");
		}
		
		public static function getByECTS($connect, $_ects) {
			$requete = "SELECT * FROM livret_module WHERE _NB_ECTS_ = ?";
			if (!empty($connect) && is_numeric($_ects)) {
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_ects, PDO::PARAM_INT);
				if($stmt->execute())
					return $stmt->fetchAll(PDO::FETCH_CLASS, "module");
				else 
					throw new exception("ModuleTools::getByID => impossible d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::getByID => parametres invalides ! ");
		}
		
		public static function existElement($connect, $_id, $_ects){
			$requete = "SELECT COUNT(*) FROM livret_promotion WHERE _ID_MAT_ = ? AND _NB_ECTS_ = ?";
			if(!empty($connect) && is_numeric($_id) && is_numeric($_ects)){
				$stmt = $connect->prepare($requete);
				$stmt->bindValue(1, $_id, PDO::PARAM_INT);
				$stmt->bindValue(1, $_ects, PDO::PARAM_INT);
				if ($stmt->execute()) {
					$result = $stmt->fetch();
					return ($result[0] != 0);
				}else 
					throw new exception("ModuleTools::existElement => impossiblde d'executer la requete ! ");
			}else 
				throw new exception("ModuleTools::existElement => parametres invalides ! ");
		}
		
		//un module s'il n'existe pas déjà dans la base sachant que les clé primaire sont l'id de la matiere et leur ects 
		public static function insertModule($connect, $_id_mat, $_nbh_c, $_nbh_td, $_nbh_tp, $_nbh_ctd, $_ects, $_coef, $_langue, $_objectif, $_descript, $_method_eval, $_mod_cc_1, $_mod_cc_2, $_calcule_nf_1, $_calcule_nf_2, $_prerequis, $_ressources, $_biblio, $_note_elim, $_oblig) {
			$requete = "INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			if(!empty($connect) && is_numeric($_id_mat) && is_numeric($_nbh_c) && is_numeric($_nbh_td) && is_numeric($_nbh_tp) && is_numeric($_nbh_ctd) && is_numeric($_ects) && is_numeric($_coef) && is_numeric($_note_elim)){
				try{
					if(MatiereTools::existID($connect, $_id_mat)){
						//on a pas besoin de verifier si l'elment existe deja car les clés primaires sont fournis, et on utilise un insert ignore
						$stmt = $connect->prepare($requete);
						$stmt->bindValue(1, $_id_mat, PDO::PARAM_INT);
						$stmt->bindValue(2, $_nbh_c, PDO::PARAM_INT);
						$stmt->bindValue(3, $_nbh_td, PDO::PARAM_INT);
						$stmt->bindValue(4, $_nbh_tp, PDO::PARAM_INT);
						$stmt->bindValue(5, $_nbh_ctd, PDO::PARAM_INT);
						$stmt->bindValue(6, $_ects, PDO::PARAM_INT);
						$stmt->bindValue(7, $_coef, PDO::PARAM_INT);
						$stmt->bindValue(8, $_langue, PDO::PARAM_STR);
						$stmt->bindValue(9, $_objectif, PDO::PARAM_STR);
						$stmt->bindValue(10, $_descript, PDO::PARAM_STR);
						$stmt->bindValue(11, $_method_eval, PDO::PARAM_STR);
						$stmt->bindValue(12, $_mod_cc_1, PDO::PARAM_STR);
						$stmt->bindValue(13, $_mod_cc_2, PDO::PARAM_STR);
						$stmt->bindValue(14, $_calcule_nf_1, PDO::PARAM_STR);
						$stmt->bindValue(15, $_calcule_nf_2, PDO::PARAM_STR);
						$stmt->bindValue(16, $_prerequis, PDO::PARAM_STR);
						$stmt->bindValue(17, $_ressources, PDO::PARAM_STR);
						$stmt->bindValue(18, $_biblio, PDO::PARAM_STR);
						$stmt->bindValue(19, $_note_elim, PDO::PARAM_INT);
						$stmt->bindValue(20, $_oblig, PDO::PARAM_STR);
						return $stmt->execute();
					}else 
						throw new exception("ModuleTools::insertModule => Erreur FOREIGN KEY ! ");
				}catch (exception $e) {
					throw new exception("ModuleTools::insertModule => ".$e->getMessage());
				}
			}else 
				throw new exception("ModuleTools::insertModule => parametres invalides ! "); 
		}
	}
?>