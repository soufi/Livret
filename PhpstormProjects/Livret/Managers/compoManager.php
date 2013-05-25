<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
	<?php
		include_once("/Livret/Tools/composante.php");
		include_once("/Livret/Blocks/entete.html");
	?>
	<body>
		<div class="container-fluid">
			<div class="span3">
				<?php
					include_once("/Livret/Blocks/nav_gestion.html");
				?>
			</div>
			<div class="span9">
				<?php
					$allCompo = ComposanteTool::getAll($bdd->getConnexion());
					echo (Compo::genereTable($allCompo));
				
					// Les formulaires des Composition deja preparer qui'on affichera que s'il y'a un evenement -->
					//generation des formulaires
					if(!empty($allCompo)){
						foreach ($allCompo as $value) {
							echo $value->genereFormModif();
						}
					}
				?>


			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		$("tr:has(td):not(:has(th))").click(function(){
			var idModal = "#myModal".concat($(this).find("input:hidden").val());
			$(idModal).modal();
		});

	</script>
</html>

