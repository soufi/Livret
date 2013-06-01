<html lang="fr">
	<?php
		include_once("../Tools/filiere.php");
		include_once("../Blocks/entete.html");
		include_once("../Tools/alerts.php");

/*--------------------------- Gestion de BDD Filiere -------------------------------- */
		//gestionnaire de mise a jour de filiere
		if(isset($_POST['formUpdSubmit'])){
			$_libelle = $_POST['libelleFiliere'];
			$_id = $_POST['idFiliere'];
			$_idCompo = $_POST['compoAssoc'];
			try {
				FiliereTool::updateFiliere($bdd->getConnexion(), $_id, $_libelle, $_idCompo);
				echo AlertTool::genereSuccess("Mise à jour effectué avec succés !"); //message de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

		//gestionnaire de suppression de filiere 
		if(isset($_POST['formDeleteSubmit'])){
			$_id = $_POST['idFiliere'];
			try {
				FiliereTool::deleteFiliere($bdd->getConnexion(), $_id);
				echo AlertTool::genereSuccess("Suppression effectué avec succés !"); //mmessage de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

		//gestionnaire d'ajout de filiere
		if(isset($_POST['formAddSubmit'])){
			$_libelle = $_POST['libelleFiliere'];
			$_idCompo = $_POST['compoAssoc'];
			try {
				FiliereTool::insertFiliere($bdd->getConnexion(), $_libelle, $_idCompo);
				echo AlertTool::genereSuccess("Ajout effectué avec succés !"); //message de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/*----------------------------------------------------------------------------------- */
	?>
	<body>
		<div class="container-fluid">
			<div class="span3">
				<?php
					include_once("../Blocks/nav_gestion.html");
				?>
				<div class="nav nav-pills">
					<input type="button" id="addFiliere" class="btn btn-inverse" value="Ajouter une Filière"/>
				</div>

			</div>
			<!--le tableau d'affichage de toutes les filieres-->
			<div class="span9">
				<?php
				//recup de toute les filieres
					try{
						$allFiliere = FiliereTool::getAll($bdd->getConnexion());
						echo Filiere::genereTable($bdd->getConnexion(), $allFiliere);
					}catch(exception $e){
						echo AlertTools::genereDanger($e->getMessage());
					}
				
					// Les formulaires des Filieres deja preparer qui'on affichera que s'il y'a un evenement -->
					//generation des formulaires
					if(!empty($allFiliere)){
						foreach ($allFiliere as $value) {
							echo $value->genereFormModif($bdd->getConnexion());
						}
					}

					//formulaire cache de creation de Filiere, on l'affichera une fois cliquer sur le bouton ajouter une filiere
					echo Filiere::genereFormAdd($bdd->getConnexion());
				?>
			</div>
		</div>
	</body>
	
	<!-- le script permettant d'afficher le formulaire apres clique sur la ligne du tableau -->
	<script type="text/javascript">
		$("tr:has(td):not(:has(th))").click(function(){
			var idModal = "#myModal".concat($(this).find("input:hidden").val());
			$(idModal).modal();
		});
		$("#addFiliere").click(function(){
			$("#formAddFiliere").modal();
		});
	</script>

</html>