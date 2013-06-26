<html lang="fr">
	<?php
		include_once("../Tools/promotion.php");
		include_once("../Tools/parcours.php");
		include_once("../Blocks/entete.html");
		include_once("../Tools/alerts.php");
		include_once("../Tools/color.php");

/*---------------------------------------------------  Gestion BDD Promotion  -------------------------------------------------*/

		//Gestion du Update de Promotion
		if(isset($_POST['formUpdSubmit'])){
			$libelle = $_POST['libellePromo'];
			$id = $_POST['idPromo'];
			$nbrEleve = $_POST['nbrElevePromo'];
			$intitule = $_POST['intitulePromo'];
			$preambule = $_POST['preambulePromo'];
			$epilogue = $_POST['epiloguePromo'];
			$color1 = hex2rgb($_POST['couleur1Promo']); //transfromation de la couleur de hex en rvb
			$color2 = hex2rgb($_POST['couleur2Promo']);
			$color3 = hex2rgb($_POST['couleur3Promo']);
			$cfg = hex2rgb($_POST['cfgPromo']);
			$cpg = hex2rgb($_POST['cpgPromo']);

			try{
				PromoTool::updatePromo($bdd->getConnexion(), $id, $libelle, $nbrEleve, $intitule, $preambule, $epilogue, $color1, $color2, $color3, $cfg, $cpg);
				echo AlertTool::genereSuccess("Mise à jour effectué avec succés !"); //message de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de la suppression de Promotion
		if (isset($_POST['formDeleteSubmit'])) {
			$id = $_POST['idPromo'];
			try{
				PromoTool::deletePromo($bdd->getConnexion(), $id);
				echo AlertTool::genereSuccess("Suppression effectué avec succés !"); //mmessage de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion de l'ajout de Promotion
		if (isset($_POST['formAddSubmit'])) {
			$libelle = $_POST['libelleAddPromo'];
			$nbrEleve = intval($_POST['nbrEleveAddPromo']);
			$intitule = $_POST['intituleAddPromo'];
			$preambule = $_POST['preambuleAddPromo'];
			$epilogue = $_POST['epilogueAddPromo'];
			$color1 = hex2rgb($_POST['couleur1AddPromo']); //transfromation de la couleur de hex en rvb
			$color2 = hex2rgb($_POST['couleur2AddPromo']);
			$color3 = hex2rgb($_POST['couleur3AddPromo']);
			$cfg = hex2rgb($_POST['cfgAddPromo']);
			$cpg = hex2rgb($_POST['cpgAddPromo']);
			try{
				PromoTool::insertPromo($bdd->getConnexion(), $libelle, $nbrEleve, $intitule, $preambule, $epilogue, $color1, $color2, $color3, $cfg, $cpg);
				echo AlertTool::genereSuccess("Ajout effectué avec succés !"); //message de confirmation
			}catch(exception $e){
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/* -----------------------------------------------------  Gestion BDD Parcour  ------------------------------------------------ */
		//Gestion Update Filiere de Promotion (Parcour)
		if(isset($_POST['formPopUpdSubmit'])){
			$idPromo = $_POST['idPromo'];
			$oldIdFiliere = $_POST['oldIdFiliere'];
			$newIdFiliere = $_POST['idFiliere'];
			try {
				ParcoursTool::updateParcour($bdd->getConnexion(), $oldIdFiliere, $idPromo, $newIdFiliere, $idPromo);
				echo AlertTool::genereSuccess("Mise à jour effectuée avec succé !");
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
		//Gestion ajout filiere de promotion (parcour)
		if(isset($_POST['formPopAddSubmit'])){
			$idPromo = $_POST['idPromo'];
			$idFiliere = $_POST['idFiliere'];
			try {
				ParcoursTool::insertParcour($bdd->getConnexion(), $idFiliere, $idPromo);
				echo AlertTool::genereSuccess("Ajout effectué avec succé !");
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}

		//gestion de suppression de parcour 
		if(isset($_POST['formPopDltSubmit'])){
			$idPromo = $_POST['idPromo'];
			$idFiliere = $_POST['idFiliere'];
			try {
				ParcoursTool::deleteParcour($bdd->getConnexion(), $idFiliere, $idPromo);
				echo AlertTool::genereSuccess("Suppresion effectuée avec succé !");
			} catch (Exception $e) {
				echo AlertTool::genereDanger($e->getMessage());
			}
		}
/*-------------------------------------------------------------------------------------------------------------------------------*/
	?>
	<body>
		<div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                        include_once("../Blocks/nav_gestion.html");
                    ?>
                    <ul class="nav nav-tabs bs-docs-sidenav nav-stacked">
                        <li class="nav-header">Menu Promo & Parcour</li>
                        <li><a id="addPromo" class="btn">Ajouter une Promo</a></li>
                        <li><a id="addParcour" class="btn">Ajouter un Parcours</a></li>
                    </ul>
                </div>
                <!--le tableau d'affichage de toutes les promotion-->
                <div class="span9">
                    <?php
                    $taillePage = 10;
                    //recup de toute les promotion
                    try{
                        $allPromo = PromoTool::getAll($bdd->getConnexion());
                        if(isset($_GET['pm']))
                            $page = intval($_GET['pm']);
                        else
                            $page = 1;
                        echo (Promo::genereTable($bdd->getConnexion(), $allPromo, $page, $taillePage));
                    }catch(exception $e){
                        echo $e->getMessage();
                    }


                    // Les formulaires des Promotions deja preparer qui'on affichera que s'il y'a un evenement de clique sur une ligne de la table
                    //formulaire de modification de la promotion
                    //formulaire de modification et d'ajout d'une filiere de la promotion
                    if(!empty($allPromo)){
                        //calcule des frontières de l'intervale
                        $debutPage = (($page*$taillePage)-$taillePage)+1;
                        if((count($allPromo)-(($page-1)*$taillePage)) > $taillePage)
                            $finPage = $debutPage + $taillePage;
                        else
                            $finPage = count($allPromo);

                        for ($i = $debutPage; $i < $finPage ; $i++){
                            echo $allPromo[$i]->genereFormModif();
                            //formulaire cache d'update de parcour
                            echo $allPromo[$i]->formUpdFiliere($bdd->getConnexion());
                            //formulaire d'ajout de parcour
                            echo $allPromo[$i]->formAddFiliere($bdd->getConnexion());
                        }
                    }

                    //formulaire cache de creation de Promotion, on l'affichera une fois cliquer sur le bouton ajouter une promotion
                    echo Promo::genereFormAdd();

                    //formulaire cache de creation de parcour, on l'affichera une fois cliquer sur le bouton ajouter un parcour
                    echo Parcour::genereFormAdd($bdd->getConnexion());
                    ?>
                </div>
            </div>
		</div>
	</body>

    <script type="text/javascript" src="/Livret/CSS/Bootstrap/js/bootstrap.js"></script>
	<!-- le script permettant d'afficher les formulaires en fonction de l'interaction avec le tableau (click, dblclick) ou les boutons -->
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
			//double click affiche le modal de modification de promotion
			$("tr:has(td):not(:has(th))").dblclick(function(){
				var idModal = "#myModal".concat($(this).find("input:hidden").val());
				$(idModal).modal();
			});
			//formulaire d'ajout de promotion
			$("#addPromo").click(function(){
				$("#formAddPromo").modal();
			});

			//fomulaire d'ajout de parcour
			$("#addParcour").click(function(){
				$("#formAddParcour").modal();
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
				var valTest = nomForm.substring(0,8);
				//s'il s'agit d'un ajout
				if(valTest == "#formAdd"){
					$(nomForm).modal();
				}
				//dans le cas d'un form de modification
				else{
					if((valTest == "#formUpd") && !jQuery.isEmptyObject($.getUrlVar("fil"))){
						var filiere = $.getUrlVar('fil');
						var opt_select = "select option[value="+filiere+"]";
						//affichage du modal contenant le formualaire d'update
						//set de l'ancienne valeur de filiere pour permettre l'update
						$(nomForm).find("#oldIdFiliere").prop("value",filiere);
						//select de l'element correspondant a la valeur actuelle de la filiere de la promotion 
						$(nomForm).find("#libelleFiliereUpd option:selected").removeAttr("selected");
						$(nomForm).find(opt_select).prop("selected", true);
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
