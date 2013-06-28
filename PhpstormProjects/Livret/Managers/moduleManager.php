<html lang="fr">
    <?php
        include_once("../Tools/connexion.php");
        include_once("../Tools/module.php");
        include_once("../Blocks/entete.html");
        include_once("../Tools/alerts.php");
        include_once("../Tools/ue.php");

/*--------------------------------------------------------------------  Gestion BDD Module  -------------------------------------------------------------------------*/

        //Gestion du Update de Module
        if(isset($_POST['formUpdSubmit'])){
            $libelle = $_POST['libelleModule'];
            $codeMatiere = $_POST['matiereAssoc'];
            $idModule = $_POST['idModule'];
            $semestre = $_POST['semestre'];
            $nbrCour = $_POST['nbrC'];
            $nbrTD = $_POST['nbrTD'];
            $nbrTP = $_POST['nbrTP'];
            $nbrCTD = $_POST['nbrCTD'];
            $ects = $_POST['ects'];
            $coef = $_POST['coef'];
            $langues = ""; //les langue seront séparer par "/"
            $iterateur = 0; //pour ne pas ajouter le "/" tout a la fin
            //recuperation du module sachant qu'on peut chosir plusieurs
            foreach ($_POST['langueModule[]'] as $selectedLanguages) {
                $iterateur++;
                if($iterateur != count($_POST['langueModule[]']))
                    $langues .= $selectedLanguages."/";
                else
                    $langues .= $selectedLanguages;
            }
            $intro = $_POST['introModule'];
            $objectif = $_POST['objectifModule'];
            $description = $_POST['descrModule'];
            $methodEval = $_POST['methodEval'];
            $modCC1 = $_POST['modCC1'];
            $modCC2 = $_POST['modCC2'];
            $calculNF1 = $_POST['calculNF1'];
            $calculNF2 = $_POST['calculNF2'];
            $prerequis = $_POST['prerequisModule'];
            $ressources = $_POST['ressourcesModule'];
            $biblio = $_POST['biblioModule'];
            $noteElim = $_POST['noteElimModule'];
            $oblig = $_POST['obligModule'];

            try{
                ModuleTool::updateModule($bdd->getConnexion(), $idModule, $codeMatiere, $libelle, $semestre, $nbrC, $nbrTD, $nbrTP, $nbrCTD, $ects, $coef, $langues, $intro, $objectif, $description, $methodEval, $modCC1, $modCC2, $calculNF1, $calculNF2, $prerequis, $ressources, $biblio, $noteElim, $oblig);
                echo AlertTool::genereInfo("Mise à jour de module effectué avec succès !");
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }

        //Gestion de la suppression de Module
        if (isset($_POST['formDeleteSubmit'])) {
            $idModule = $_POST['idModule'];
            try{
                ModuleTool::deleteModule($bdd->getConnexion(), $idModule);
                echo AlertTool::genereInfo("Suppression de module effectué avec succès !"); //mmessage de confirmation
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }

        //Gestion de l'ajout de Module
        if (isset($_POST['formAddSubmit'])) {
            $libelle = $_POST['libelleModuleAdd'];
            $codeMatiere = $_POST['matiereAssocAdd'];
            $semestre = $_POST['semestreAdd'];
            $nbrCour = $_POST['nbrCAdd'];
            $nbrTD = $_POST['nbrTDAdd'];
            $nbrTP = $_POST['nbrTPAdd'];
            $nbrCTD = $_POST['nbrCTDAdd'];
            $ects = $_POST['ectsAdd'];
            $coef = $_POST['coefAdd'];
            $langues = ""; //les langue seront séparer par "/"
            $iterateur = 0; //pour ne pas ajouter le "/" tout a la fin
            //recuperation du module sachant qu'on peut chosir plusieurs
            foreach ($_POST['langueModuleAdd[]'] as $selectedLanguages) {
                $iterateur++;
                if($iterateur != count($_POST['langueModuleAdd[]']))
                    $langues .= $selectedLanguages."/";
                else
                    $langues .= $selectedLanguages;
            }
            $intro = $_POST['introModuleAdd'];
            $objectif = $_POST['objectifModuleAdd'];
            $description = $_POST['descrModuleAdd'];
            $methodEval = $_POST['methodEvalAdd'];
            $modCC1 = $_POST['modCC1Add'];
            $modCC2 = $_POST['modCC2Add'];
            $calculNF1 = $_POST['calculNF1Add'];
            $calculNF2 = $_POST['calculNF2Add'];
            $prerequis = $_POST['prerequisModuleAdd'];
            $ressources = $_POST['ressourcesModuleAdd'];
            $biblio = $_POST['biblioModuleAdd'];
            $noteElim = $_POST['noteElimModuleAdd'];
            $oblig = $_POST['obligModuleAdd'];
            try{
                ModuleTool::insertModule($bdd->getConnexion(), $codeMatiere, $libelle, $semestre, $nbrC, $nbrTD, $nbrTP, $nbrCTD, $ects, $coef, $langues, $objectif, $description, $methodEval, $modCC1, $modCC2, $calculNF1, $calculNF2, $prerequis, $ressources, $biblio, $noteElim, $oblig);
                echo AlertTool::genereInfo("Ajout de module effectué avec succès !"); //message de confirmation
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
/*--------------------------------------------------------------------  Gestion BDD Responsable  -------------------------------------------------------------------------*/
        //mise a jour du responsable du module
    if(isset($_POST['formUpdRespSubmit'])){
        $idModule = $_POST['idModulePop'];
        $oldIdEns = $_POST['oldIdEnsPop'];
        $idEns = $_POST['idEnsPop'];
        try{
            ResponsableTool::updRespMod($bdd->getConnexion(), $idModule, $oldIdEns, $idModule, $idEns);
            echo AlertTool::genereInfo("Mise à jour de responsable effectuée avec succès !");
        }catch(Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

    //ajout de responsable du module
    if(isset($_POST['formAddRespSubmit'])){
        $idModule = $_POST['idModulePop'];
        $idEns = $_POST['idEnsPop'];
        try{
            ResponsableTool::insertRespMod($bdd->getConnexion(), $idModule, $idEns);
            echo AlertTool::genereInfo("Ajout de responsable effectué avec succès !");
        }catch(Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

    //suppression de responsable du module
    if(isset($_POST['formDeleteRespSubmit'])){
        $idModule = $_POST['idModulePop'];
        $oldIdEns = $_POST['oldIdEnsPop'];
        try {
            ResponsableTool::deleteRespMod($bdd->getConnexion(), $idModule, $oldIdEns);
            echo AlertTool::genereInfo("Suppression de responsable effectué avec succès !");
        } catch (Exception $e) {
            echo AlertTool::genereDanger($e->getMessage());
        }
    }
/*--------------------------------------------------------------------  Gestion BDD U.E  -------------------------------------------------------------------------*/

    //Gestion de modification d'unité d'enseignement du module
    if(isset($_POST['formUpdUESubmit'])){
        $idModule = $_POST['idModForUE'];
        $oldApogee = $_POST['oldApogee'];
        $apogee = $_POST['apogee'];
        try{
            UeTool::updateUE($bdd->getConnexion(), $oldApogee, $apogee, $idModule);
            echo AlertTool::genereInfo("Mis à jour de U.E de Module effectué avec succès !");
        }catch(Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

    //Gestion de suppression de UE de module
    if(isset($_POST['formDeleteUESubmit'])){
        $oldApogee = $_POST['oldApogee'];
        try {
            UeTool::deleteUE($bdd->getConnexion(), $oldApogee);
            echo AlertTool::genereInfo("Suppression de U.E de Module effectué avec succès !");
        } catch (Exception $e) {
            echo AlertTool::genereDanger($e->getMessage());
        }
    }
    //Gestion d'ajout de UE de module
    if(isset($_POST['formAddUESubmit'])){
        $idModule = $_POST['idModForUE'];
        $apogee = $_POST['apogee'];
        try {
            UeTool::insertUE($bdd->getConnexion(), $apogee, $idModule);
            echo AlertTool::genereInfo("Ajout de U.E de Module effectué avec succès !");
        } catch (Exception $e) {
            echo AlertTool::genereDanger($e->getMessage());
        }
    }
/*--------------------------------------------------------------------  Gestion BDD Promotion (Programme)  -------------------------------------------------------------------------*/
    //Gestion de mise a jour de promotion
    if(isset($_POST['formUpdProgSubmit'])){
        $idMod = $_POST['idModForProg'];
        $oldIdPromo = $_POST['oldIdPromo'];
        $idPromo = $_POST['idPromoProg'];
        try{
            ProgrammeTool::updateProgramme($bdd->getConnexion(),$idMod, $oldIdPromo, $idMod, $idPromo);
            echo AlertTool::genereInfo("Mis à jour de U.E de Module effectué avec succès !");
        } catch(Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

    if(isset($_POST['formDeleteProgSubmit'])){
        $idMod = $_POST['idModForProg'];
        $oldIdPromo = $_POST['oldIdPromo'];
        try{
            ProgrammeTool::deleteProgramme($bdd->getConnexion(), $idMod, $oldIdPromo);
            echo AlertTool::genereInfo("Suppression de U.E de Module effectué avec succès !");
        }catch (Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

    if(isset($_POST['formAddProgSubmit'])){
        $idMod = $_POST['idModForProg'];
        $idPromo = $_POST['idPromoProg'];
        try{
            ProgrammeTool::insertProgramme($bdd->getConnexion(), $idMod, $idPromo);
            echo AlertTool::genereInfo("Ajout de U.E de Module effectué avec succès !");
        }catch (Exception $e){
            echo AlertTool::genereDanger($e->getMessage());
        }
    }

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
    ?>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                        include_once("../Blocks/nav_gestion.html");
                    ?>
                    <ul class="nav nav-tabs bs-docs-sidenav nav-stacked">
                        <li class="nav-header">Menu Modules</li>
                        <li><a id="addModule" class="btn">Ajouter</a></li>
                    </ul>
                </div>
                <!--le tableau d'affichage de tous les modules avec Pagination -->
                <div class="span10">
                    <?php

                        $taillePage = 10;
                    //recup de tous les modules
                        try{
                            //recuperation de tous les modules
                            $allModules = ModuleTool::getAll($bdd->getConnexion());
                            if(isset($_GET['pm']))
                                $page = intval($_GET['pm']);
                            else
                                $page = 1;
                            //affichage du tableau de gestion de module
                            echo Module::genereTable($bdd->getConnexion(), $allModules, $page, $taillePage);
                        }catch(Exception $e){
                            echo AlertTool::genereDanger($e->getMessage());
                        }

                        $debutPage = (($page*$taillePage)-$taillePage)+1;
                        if((count($allModules)-(($page-1)*$taillePage)) > $taillePage)
                            $finPage = $debutPage + $taillePage;
                        else
                            $finPage = count($allModules);
                        // Les formulaires des Modules deja preparer qui'on affichera que s'il y'a un evenement -->
                        //generation des formulaires pour chaque instance de module
                        if(!empty($allModules)){
                            for ($i = $debutPage; $i < $finPage ; $i++) {
                                echo $allModules[$i]->genereFormModif($bdd->getConnexion());
                                //formulaire d'update de responsable
                                echo $allModules[$i]->genereFormUpdResp($bdd->getConnexion());
                                //formualire d'ajout de responsable
                                echo $allModules[$i]->genereFormAddResp($bdd->getConnexion());
                                //formulaire de modif de UE
                                echo Ue::genereFormUpdUEForMod($allModules[$i]);
                                //formulaire d'ajout de UE
                                echo Ue::genereFormAddUEForMod($allModules[$i]);
                                //formulaire de modif de Promotion (programme)
                                echo Programme::genereFormUpdProgForMod($bdd->getConnexion(), $allModules[$i]);
                                //formulaire d'ajout de promotion (programme)
                                echo Programme::genereFormAddProgForMod($bdd->getConnexion(), $allModules[$i]);
                            }
                        }

                        //formulaire cache de creation de matiere, on l'affichera une fois cliquer sur le bouton ajouter une matiere
                        echo Module::genereFormAdd($bdd->getConnexion());
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
            $("#addModule").click(function(){
                $("#formAddModule").modal();
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

            //GEstion d'afficahge des formulaire des UE, principe : on a un seul formulaire dans lequel on inserre les info apogee 
            //le code apogee qui sera ajouter dans le formulaire de modification sera passe en methode GET 
            if (!jQuery.isEmptyObject($.getUrlVar("ueform"))){
                var typeForm = $.getUrlVar("ueform");
                if(typeForm == "add" && !jQuery.isEmptyObject($.getUrlVar("mod"))){
                    var module = $.getUrlVar("mod");
                    var idForm = "#formAddUE"+module;
                    $(idForm).modal();
                }else{
                    if(typeForm == "upd" && !jQuery.isEmptyObject($.getUrlVar("mod")) && !jQuery.isEmptyObject($.getUrlVar("apogee"))){
                        var module = $.getUrlVar("mod");
                        var apogee = $.getUrlVar("apogee");
                        var idForm = "#formUpdUE"+module;
                        
                        $(idForm).find("#oldApogee").prop("value", apogee);
                        $(idForm).find("#apogee").prop("value", apogee);
                        $(idForm).modal();
                    } 
                }
            }

            //Gestion d'affichage des formulaires des Promotions concernant les modules,
            if (!jQuery.isEmptyObject($.getUrlVar("progform"))){
                var typeForm = $.getUrlVar("progform");
                if(typeForm == "add" && !jQuery.isEmptyObject($.getUrlVar("mod"))){
                    var module = $.getUrlVar("mod");
                    var idForm = "#formAddProg"+module;
                    $(idForm).modal();
                }else{
                    if(typeForm == "upd" && !jQuery.isEmptyObject("mod") && !jQuery.isEmptyObject($.getUrlVar("promo"))){
                        var module = $.getUrlVar("mod");
                        var promo = $.getUrlVar("promo");
                        var idForm = "#formUpdProg"+module;
                        var opt_select_promo = "#libellePromoProg option[value="+promo+"]";
                        $(idForm).find("#oldIdPromo").prop("value", promo);
                        $(idForm).find("#libellePromoProg option:selected").removeAttr("selected");
                        $(idForm).find(opt_select_promo).prop("selected", true);
                        $(idForm).modal();
                    }
                }
            }
        }); 
    </script>
    <?php
    include_once("../Blocks/footer.html");
    ?>
</html>