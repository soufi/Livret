<?php

include_once("matiere.php");
include_once("module.php");
include_once("composante.php");
include_once("filiere.php");
	
	//permet des généré des boutton avec les elements des tables permettant de classifier les modules
	class FilterTool{

        //une liste de promo pour filtrer les modules
        public static function listFilterByPromo(PDO $connect){
            try{
                //recup de toutes les promo
                $allPromo = PromoTool::getAll($connect);
                $list = '<ul class="nav nav-tabs bs-docs-sidenav nav-stacked" id="promoNavFilter">';
                if(!empty($allPromo)){
                   foreach($allPromo as $promo){
                       $list .= '<li> <a data-filter=".promoFilter'.$promo->_ID_PROMO_.'" href="#">'.$promo->_LIBELLE_PROMO_.'</a> </li>';
                   }
                }else
                    throw new Exception("Aucune promotion trouvée");
                $list .= '</ul>';
                return $list;
            }catch(Exception $e){
                throw new Exception("FilterTool::listFilterByPromo => ".$e->getMessage());
            }
        }
		
		//genere des boutons inclut dans un div avec l'etiquette de la matiere en fonction des élements dans la table matiere
		public static function listFilterByMatiere(PDO $connect){
			$allMatiere = MatiereTool::getAll($connect);
			$div = '<ul class="nav nav-tabs bs-docs-sidenav nav-stacked" id="matiereNavFilter">';
			foreach ($allMatiere as $matiere) {
				$div .= '<li> <a data-filter=".matiereFilter'.$matiere->_CODE_MAT_.'" href="#">'.$matiere->_LIBELLE_MAT_.'</a> </li>';
			}
			$div .= '</ul>';
            return $div;
		}

        //genere le contenu qu'on va afficher
		public static function modDivContent(PDO $connect){
            try{
                $allModule = ModuleTool::getAll($connect);
                $divContent =  '<div class="row-fluid" id="moduleContent">';
                foreach ($allModule as $module) {
                    $divContent .= $module->getIsotopeContent($connect);
                }
                $divContent .= '</div>';
                return $divContent;
            }catch(Exception $e){
                throw new Exception("filterTool::modDivContent => ".$e->getMessage());
            }

		}
	}

?>