<?php
	
	//permet de genere des alert en tenant compte du style bootstrap
	class AlertTool{

		//alert warning jaune 
		public static function genereWarning($message){
			if(!empty($message)){
				return "<div class='alert'><button type='button' class='close' data-dismiss='alert'>&times;</button>".$message."</div>";
			}
		}

		//alert D'erreur Rouge
		public static function genereDanger($message){
			if(!empty($message)){
				return "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>&times;</button>".$message."</div>";
			}
		}

		//alert de succes vert
		public static function genereSuccess($message){
			if(!empty($message)){
				return "<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button>".$message."</div>";
			}
		}

		//alert informative bleu
		public static function genereInfo($message){
			if(!empty($message)){
				return "<div class='alert alert-info'><button type='button' class='close' data-dismiss='alert'>&times;</button>".$message."</div>";
			}
		}

	}
	
?>