<html lang="fr">
	<?php
		include_once("../Tools/connexion.php");
		include_once("../Tools/enseignant.php");
		include_once("../Blocks/entete.html");
		include_once("../Tools/alerts.php");

/*--------------------------  Gestion BDD Enseignant  ------------------------------*/

		//Gestion du Update d'Enseignant
		if(isset($_POST['formUpdSubmit'])){
			$nom = $_POST['nomEns'];
			$prenom = $_POST['prenomEns'];
			$id = $_POST['idEns'];
			$email = $_POST['emailEns'];
			$phone = $_POST['phoneEns'];
			$titre = $_POST['titreEns'];
			$photo = $_POST['photoEns'];
			try{
				EnseignantTool::updateEnseignant($bdd->getConnexion(), $id, $nom, $prenom, $email, $phone, $titre, $photo);
				echo AlertTool::genereSuccess("Mise à jour effectué avec succés !");
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de la suppression d'enseignant
		if (isset($_POST['formDeleteSubmit'])) {
			$id = $_POST['idEns'];
			try{
				EnseignantTool::deleteEnseignant($bdd->getConnexion(), $id);
				echo AlertTool::genereSuccess("Suppression effectué avec succés !"); //mmessage de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de l'ajout d'enseignant
		if (isset($_POST['formAddSubmit'])) {
			$nom = $_POST['nomEnsAdd'];
			$prenom = $_POST['prenomEnsAdd'];
			$email = $_POST['emailEnsAdd'];
			$phone = $_POST['phoneEnsAdd'];
			$titre = $_POST['titreEnsAdd'];
			$photo = $_POST['photoEnsAdd'];
			try{
				EnseignantTool::insertEnseignant($bdd->getConnexion(), $nom, $prenom, $email, $phone, $titre, $photo);
				echo AlertTool::genereSuccess("Ajout effectué avec succés !"); //message de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/* ------------------------------------------------------------------------------- */
	?>
	<body>
		<div class="container-fluid">
			<div class="span3">
				<?php
					include_once("../Blocks/nav_gestion.html");
				?>
				<div class="nav nav-pills">
					<input type="button" id="addEns" class="btn btn-inverse" value="Ajouter un Enseignant"/>
				</div>
			</div>
			<!--le tableau d'affichage de tous les enseignants-->
			<div class="span9">
				<?php
					//recup de tous les enseignants
					try{
						$allEns = EnseignantTool::getAll($bdd->getConnexion());
						echo Enseignant::genereTable($allEns);
					}catch(Exception $e){
						echo AlertTool::genereDanger($e->getMessage());
					}
				
					// Les formulaires des Enseignant deja preparer qu'on affichera que s'il y'a un evenement --> clique sur la ligne
					//generation des formulaires
					if(!empty($allEns)){
						foreach ($allEns as $value) {
							echo $value->genereFormModif();
						}
					}

					//formulaire cache de creation d'enseignant, on l'affichera une fois cliquer sur le bouton ajouter un enseignant
					echo Enseignant::genereFormAdd();
				?>
			</div>
		</div>
	</body>
	
	<!-- le script permettant d'afficher le formulaire apres clique sur la ligne du tableau -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".alert").alert();

			//affichage de formulaire au dblclick sur une ligne du tableau
			$("tr:has(td):not(:has(th))").dblclick(function(){
				var idModal = "#myModal".concat($(this).find("input:hidden").val());
				$(idModal).modal();
			});
			//ajout formulaire 
			$("#addEns").click(function(){
				$("#formAddEns").modal();
			});
		});
			
	</script>

</html>

