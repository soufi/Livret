<?php

include_once("connexion.php");
include_once("matiere.php");
include_once("module.php");
	
	//permet des généré des boutton avec les elements des tables de composition
	class FilterTool{
		
		/*
		//génère des boutons en fonction des éléments dans la table de composition
		public static function composanteDiv($connect) {
			$allCompo = ComposanteTool::getAll($connect);
			echo '<div id="compoIsoFilter" class="row-fluid">';
			foreach ($allCompo as $value) {
				echo '<input type="button" id_compo="'.$value->_ID_COMPO_.'" class="btn btn-primary" name="'.$value->_LIBELLE_COMPO_.'" value="'.$value->_LIBELLE_COMPO_.'" />';
			}
			echo'</div>';
		}
		
		//génère des boutons en fonction des élèment dans la table de filiere
		public static function filiereDiv($connect) {
			$allFiliere = FiliereTool::getAll($connect);
			echo '<div id="filiereIsoFilter" class="row-fluid">';
			foreach ($allFiliere as $value) {
				echo '<input type="button" id_compo="'.$value->_ID_COMPO_'" class="btn btn-info" name="'.$value->_LIBELLE_FILIERE_.'" value="'.$value->_LIBELLE_FILIERE_.'" />';
			}
			echo '</div>';
		}*/
		
		//genere des boutons inclut dans un div avec l'etiquette de la matiere en fonction des élements dans la table matiere
		public static function matieresDiv($connect){
			$allMatiere = MatiereTool::getAll($connect);
			echo '<ul class="nav nav-pills" id="allMatieres">';
			foreach ($allMatiere as $value) {
				echo $value->giveButton();
			}
			echo '</ul>';
		}
		
		//genere des boutons inclut dans un div avec l'etiquettte de chaque module
		public static function modulesDiv($connect){
			$allModule = ModuleTool::getAll($connect);
			echo '<div class="row-fluid" id="allModules">';
			foreach ($allModule as $value) {
				echo $value->getDiv();
			}
			echo '</div>';
		}
	}

?>