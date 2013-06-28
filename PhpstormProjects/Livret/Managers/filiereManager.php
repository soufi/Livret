<html lang="fr">
	<?php
		include_once("../Tools/connexion.php");
		include_once("../Tools/filiere.php");
		include_once("../Blocks/entete.html");
		include_once("../Tools/alerts.php");
        include_once("../Tools/color.php");

/*-------------------------------------------------------------- Gestion de BDD Filiere ---------------------------------------------------------------- */
		//gestionnaire de mise a jour de filiere
		if(isset($_POST['formUpdSubmit'])){
			$_libelle = $_POST['libelleFiliere'];
			$_id = $_POST['idFiliere'];
			$_idCompo = $_POST['compoAssoc'];
            $color1 = hex2rgb($_POST['couleur1Fil']); //transfromation de la couleur de hex en rvb
            $color2 = hex2rgb($_POST['couleur2Fil']);
            $color3 = hex2rgb($_POST['couleur3Fil']);
			try {
				FiliereTool::updateFiliere($bdd->getConnexion(), $_id, $_libelle, $_idCompo, $color1, $color2, $color3);
				echo AlertTool::genereInfo("Mise à jour effectué avec succès !"); //message de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

		//gestionnaire de suppression de filiere 
		if(isset($_POST['formDeleteSubmit'])){
			$_id = $_POST['idFiliere'];
			try {
				FiliereTool::deleteFiliere($bdd->getConnexion(), $_id);
				echo AlertTool::genereInfo("Suppression effectué avec succès !"); //mmessage de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

		//gestionnaire d'ajout de filiere
		if(isset($_POST['formAddSubmit'])){
			$_libelle = $_POST['libelleFiliere'];
			$_idCompo = $_POST['compoAssoc'];
            $color1 = hex2rgb($_POST['couleur1Fil']); //transfromation de la couleur de hex en rvb
            $color2 = hex2rgb($_POST['couleur2Fil']);
            $color3 = hex2rgb($_POST['couleur3Fil']);
			try {
				FiliereTool::insertFiliere($bdd->getConnexion(), $_libelle, $_idCompo, $color1, $color2, $color3);
				echo AlertTool::genereInfo("Ajout effectué avec succès !"); //message de confirmation
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

/*-------------------------------------------------------------- Gestion de BDD responsable ---------------------------------------------------------------- */
	
	//mise a jour du responsable de la filiere
	if(isset($_POST['formUpdRespSubmit'])){
		$idFiliere = $_POST['idFilierePop'];
		$oldIdEns = $_POST['oldIdEnsPop'];
		$idEns = $_POST['idEnsPop'];
		try{
			ResponsableTool::updRespFil($bdd->getConnexion(), $idFiliere, $oldIdEns, $idFiliere, $idEns);
			echo AlertTool::genereInfo("Mise à jour du responsable de filière effectuée avec succès !");
		}catch(Exception $e){
			echo AlertTool::genereDanger($e->getMessage());
		}
	}

	//ajout de responsable de filiere
	if(isset($_POST['formAddRespSubmit'])){
		$idFiliere = $_POST['idFilierePop'];
		$idEns = $_POST['idEnsPop'];
		try{
			ResponsableTool::insertRespFil($bdd->getConnexion(), $idFiliere, $idEns);
			echo AlertTool::genereInfo("Ajout du responsable effectué avec succès !");
		}catch(Exception $e){
			echo AlertTool::genereDanger($e->getMessage());
		}
	}

	//suppression de responsable de filiere
	if(isset($_POST['formDeleteRespSubmit'])){
		$idFiliere = $_POST['idFilierePop'];
		$oldIdEns = $_POST['oldIdEnsPop'];
		try {
			ResponsableTool::deleteRespFil($bdd->getConnexion(), $idFiliere, $oldIdEns);
			echo AlertTool::genereInfo("Suppression du responsable effectué avec succès !");
		} catch (Exception $e) {
			echo AlertTool::genereDanger($e->getMessage());
		}
	}

/*---------------------------------------------------------------------------------------------------------------------------------------------------------- */
	?>
	<body>
		<div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                        include_once("../Blocks/nav_gestion.html");
                    ?>
                    <ul class="nav nav-tabs bs-docs-sidenav nav-stacked">
                        <li class="nav-header">Menu Filières</li>
                        <li><a id="addFiliere" class="btn">Ajouter</a></li>
                    </ul>
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
                            foreach ($allFiliere as $laFiliere) {
                                echo $laFiliere->genereFormModif($bdd->getConnexion());
                                //formulaire d'update de responsable
                                echo $laFiliere->genereFormUpdResp($bdd->getConnexion());
                                //formualire d'ajout de responsable
                                echo $laFiliere->genereFormAddResp($bdd->getConnexion());
                            }
                        }

                        //formulaire cache de creation de Filiere, on l'affichera une fois cliquer sur le bouton ajouter une filiere
                        echo Filiere::genereFormAdd($bdd->getConnexion());
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

			//parametrage du popover
			$("tr:has(td):not(:has(th))").popover({
				trigger: 'click',
				html: true,
				placement: 'right',
				container: 'body'
			});
			$("tr:has(td):not(:has(th))").dblclick(function(){
				var idModal = "#myModal".concat($(this).find("input:hidden").val());
				$(idModal).modal();
			});

			$("#addFiliere").click(function(){
				$("#formAddFiliere").modal();
			});

			//source : http://stackoverflow.com/questions/6001839/check-whether-a-url-variable-is-set-using-jquery
			//permet d'avoir les valeur d'une varible GET
			$.extend({
			  getUrlVars: function(){
			    var vars = [], hash;
			    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			    for(var i = 0; i < hashes.length; i++)
			    {
			      hash = hashes[i].split('=');
			      vars.push(hash[0]);
			      vars[hash[0]] = hash[1];
			    }
			    return vars;
			  },
			  getUrlVar: function(name){
			    return $.getUrlVars()[name];
			  }
			});
	 
			//if isset $_GET['pop']
			//la variable pop contient le nom du formulaire à afficher
			//on affiche les modal des filières
			if (!jQuery.isEmptyObject($.getUrlVar("pop"))){
				var nomForm = "#"+$.getUrlVar("pop");
				//on prend le debut du mot afin de tester s'il s'agit d'un form d'ajout ou de modification
				var valTest = nomForm.substring(0,8);
				//s'il s'agit d'un ajout
				if(valTest == "#formAdd"){
					$(nomForm).modal();
				}
				//dans le cas d'un form de modification
				else{
					if((valTest == "#formUpd") && !jQuery.isEmptyObject($.getUrlVar("ens"))){
						var idEns = $.getUrlVar("ens");
						var opt_select_ens = "#enseignant option[value="+idEns+"]";
						//affichage du modal contenant le formualaire d'update
						//set de l'ancien id de l'enseignant responsable pour permettre l'update
						$(nomForm).find("#oldIdEnsPop").prop("value",idEns);
						//select de l'element correspondant a la valeur actuelle du responsable
						$(nomForm).find("#enseignant option:selected").removeAttr("selected");
						$(nomForm).find(opt_select_ens).prop("selected", true);
						$(nomForm).modal(); //show modal
					}
				}
			}
		});
	</script>
    <?php
    include_once("../Blocks/footer.html");
    ?>
</html>