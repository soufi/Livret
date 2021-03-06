<html lang="fr">
	<?php
		include_once("../Tools/composante.php");
		include_once("../Blocks/entete.html");
		include_once("../Tools/alerts.php");

/*--------------------------------------------  Gestion BDD Composante  ------------------------------------------------*/

		//Gestion du Update de Composante
		if(isset($_POST['formUpdSubmit'])){
			$libelle = $_POST['libelleCompo'];
			$id = $_POST['idCompo'];
			try{
				ComposanteTool::updateCompo($bdd->getConnexion(), $id, $libelle);
				echo AlertTool::genereInfo("Mise à jour effectué avec succès !");
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de la suppression de composante
		if (isset($_POST['formDeleteSubmit'])) {
			$id = $_POST['idCompo'];
			try{
				ComposanteTool::deleteCompo($bdd->getConnexion(), $id);
				echo AlertTool::genereInfo("Suppression effectué avec succès !"); //mmessage de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de l'ajout de composante
		if (isset($_POST['formAddSubmit'])) {
			$libelle = $_POST['libelleCompoAdd'];
			try{
				ComposanteTool::insertCompo($bdd->getConnexion(), $libelle);
				echo AlertTool::genereInfo("Ajout effectué avec succès !"); //message de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/* ----------------------------------------------------------------------------------------------------------------- */
	?>
	<body>
		<div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                        include_once("../Blocks/nav_gestion.html");
                    ?>
                    <ul class="nav nav-tabs bs-docs-sidenav nav-stacked">
                        <li class="nav-header">Menu Composantes</li>
                        <li><a id="addCompo" class="btn">Ajouter</a></li>
                    </ul>

                </div>
                <!--le tableau d'affichage de toutes les composantes-->
                <div class="span9">
                    <?php
                    //recup de toute les composantes
                        try{
                            $allCompo = ComposanteTool::getAll($bdd->getConnexion());
                            echo (Compo::genereTable($allCompo));
                        }catch(exception $e){
                            echo AlertTool::genereDanger($e->getMessage());
                        }

                        // Les formulaires des Composantes deja preparer qui'on affichera que s'il y'a un evenement -->
                        //generation des formulaires
                        if(!empty($allCompo)){
                            foreach ($allCompo as $laCompo) {
                                echo $laCompo->genereFormModif();
                            }
                        }

                        //formulaire cache de creation de composante, on l'affichera une fois cliquer sur le bouton ajouter une compoante
                        echo Compo::genereFormAdd();
                    ?>
                </div>
            </div>
		</div>
	</body>

    <script type="text/javascript" src="/Livret/CSS/Bootstrap/js/bootstrap.js"></script>
	<!-- le script permettant d'afficher le formulaire apres clique sur la ligne du tableau -->
	<script type="text/javascript">
		$(document).ready(function(){
			//mise en route d'alert
			$(".alert").alert();

			//affichage de formulaire au clique sur ligne du tableau
			$("tr:has(td):not(:has(th))").dblclick(function(){
				var idModal = "#myModal".concat($(this).find("input:hidden").val());
				$(idModal).modal();
			});
			
			//affichage de formulaire au clique sur bouton
			$("#addCompo").click(function(){
				$("#formAddComposante").modal();
			});
		});
			
	</script>

    <?php
    include_once("../Blocks/footer.html");
    ?>

</html>

