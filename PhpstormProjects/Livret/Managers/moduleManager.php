<html lang="fr">
    <?php
        include_once("../Tools/connexion.php");
        include_once("../Tools/module.php");
        include_once("../Blocks/entete.html");
        include_once("../Tools/alerts.php");

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
                ModuleTool::updateModule($bdd->getConnexion(), $idModule, $codeMatiere, $libelle, $semestre, $nbrC, $nbrTD, $nbrTP, $nbrCTD, $ects, $coef, $langues, $objectif, $description, $methodEval, $modCC1, $modCC2, $calculNF1, $calculNF2, $prerequis, $ressources, $biblio, $noteElim, $oblig);
                echo AlertTool::genereSuccess("Mise à jour effectué avec succés !");
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
        //Gestion de la suppression de Module
        if (isset($_POST['formDeleteSubmit'])) {
            $idModule = $_POST['idModule'];
            try{
                ModuleTool::deleteModule($bdd->getConnexion(), $idModule);
                echo AlertTool::genereSuccess("Suppression effectué avec succés !"); //mmessage de confirmation
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
        //Gestion de l'ajout de Module
        if (isset($_POST['formAddSubmit'])) {
            $libelle = $_POST['libelleModule'];
            $codeMatiere = $_POST['matiereAssoc'];
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
                ModuleTool::insertModule($bdd->getConnexion(), $codeMatiere, $libelle, $semestre, $nbrC, $nbrTD, $nbrTP, $nbrCTD, $ects, $coef, $langues, $objectif, $description, $methodEval, $modCC1, $modCC2, $calculNF1, $calculNF2, $prerequis, $ressources, $biblio, $noteElim, $oblig);
                echo AlertTool::genereSuccess("Ajout effectué avec succés !"); //message de confirmation
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
    ?>
    <body>
        <div class="container-fluid">
            <div class="span3">
                <?php
                    include_once("../Blocks/nav_gestion.html");
                ?>
                <div class="nav nav-pills">
                    <input type="button" id="addModule" class="btn btn-inverse" value="Ajouter un Module"/>
                </div>

            </div>
            <!--le tableau d'affichage de tous les modules-->
            <div class="span10">
                <?php
                //recup de tous les modules
                    try{
                        //recuperation de tous les modules
                        $allModules = ModuleTool::getAll($bdd->getConnexion());
                        if(isset($_GET['pm']))
                            $page = intval($_GET['pm']);
                        else
                            $page = 1;
                        //affichage du tableau de gestion de module
                        echo Module::genereTable($bdd->getConnexion(), $allModules, $page);
                    }catch(Exception $e){
                        echo AlertTool::genereDanger($e->getMessage());
                    }
                
                    // Les formulaires des Modules deja preparer qui'on affichera que s'il y'a un evenement -->
                    //generation des formulaires
                    if(!empty($allModules)){
                        foreach ($allModules as $value) {
                            echo $value->genereFormModif($bdd->getConnexion());
                        }
                    }

                    //formulaire cache de creation de matiere, on l'affichera une fois cliquer sur le bouton ajouter une matiere
                    echo Module::genereFormAdd($bdd->getConnexion());
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
        $("#addModule").click(function(){
            $("#formAddModule").modal();
        });
    </script>

</html>