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
            //traitement du fichier ajoute
			$photo = $_FILES['photoEns'];

            //copy dans le dossier dans le serveur
            copy($photo["tmp_name"], "../CSS/Pictures/".$photo['name']);
            $path_serv = "../CSS/Pictures/".$photo['name']; //path du serveur pour la photo
			try{
				if(EnseignantTool::updateEnseignant($bdd->getConnexion(), $id, $nom, $prenom, $email, $phone, $titre, $path_serv))
				    echo AlertTool::genereInfo("Mise à jour effectué avec succès !");
                else
                    echo AlertTool::genereInfo("Mise à jour non effectué !");
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de la suppression d'enseignant
		if (isset($_POST['formDeleteSubmit'])) {
			$id = $_POST['idEns'];
			try{
				EnseignantTool::deleteEnseignant($bdd->getConnexion(), $id);
				echo AlertTool::genereInfo("Suppression effectué avec succès !"); //mmessage de confirmation
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
            //traitement du fichier ajoute
            $photo = $_FILES['photoEnsAdd'];
            //copy dans le dossier dans le serveur
            copy($photo["tmp_name"], "../Pictures/".$photo['name']);
            $path_serv = "../CSS/Pictures/".$photo['name']; //path du serveur pour la photo
			try{
				EnseignantTool::insertEnseignant($bdd->getConnexion(), $nom, $prenom, $email, $phone, $titre, $path_serv);
				echo AlertTool::genereSuccess("Ajout effectué avec succès !"); //message de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/* ------------------------------------------------------------------------------- */
	?>
	<body>
		<div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                        include_once("../Blocks/nav_gestion.html");
                    ?>
                    <ul class="nav nav-tabs bs-docs-sidenav nav-stacked">
                        <li class="nav-header">Menu Enseignants</li>
                        <li><a id="addEns" class="btn">Ajouter</a></li>
                    </ul>
                </div>
                <!--le tableau d'affichage de tous les enseignants-->
                <div class="span9">
                    <?php
                    $taillePage = 10;//nombre d'enseignants affiché par page
                    //recup de tous les enseignants
                    try{
                        $allEns = EnseignantTool::getAll($bdd->getConnexion());
                        if(isset($_GET['pm']))
                            $page = intval($_GET['pm']);
                        else
                            $page = 1;
                        echo Enseignant::genereTable($allEns, $page, $taillePage);
                    }catch(Exception $e){
                        echo AlertTool::genereDanger($e->getMessage());
                    }

                    // Les formulaires des Enseignant deja preparer qu'on affichera que s'il y'a un evenement --> clique sur la ligne
                    //generation des formulaires en fonction de l'intervale affiché
                    if(!empty($allEns)){
                        //calcule des frontières de l'intervale
                        $debutPage = (($page*$taillePage)-$taillePage)+1;
                        if((count($allEns)-(($page-1)*$taillePage)) > $taillePage)
                            $finPage = $debutPage + $taillePage;
                        else
                            $finPage = count($allEns);

                        for ($i = $debutPage; $i < $finPage ; $i++) {
                            echo $allEns[$i]->genereFormModif();
                        }
                    }

                    //formulaire cache de creation d'enseignant, on l'affichera une fois cliquer sur le bouton ajouter un enseignant
                    echo Enseignant::genereFormAdd();
                    ?>
                </div>
            </div>
		</div>
	</body>

    <script type="text/javascript" src="/Livret/CSS/Bootstrap/js/bootstrap.js"></script>
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

    <?php
    include_once("../Blocks/footer.html");
    ?>
</html>

