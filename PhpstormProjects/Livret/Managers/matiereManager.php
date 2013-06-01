<html lang="fr">
    <?php
        include_once("../Tools/matiere.php");
        include_once("../Blocks/entete.html");
        include_once("../Tools/alerts.php");

/*--------------------------  Gestion BDD Matiere  ------------------------------*/

        //Gestion du Update de Matiere
        if(isset($_POST['formUpdSubmit'])){
            $libelle = $_POST['libelleMatiere'];
            $newCode = $_POST['codeMatiere'];
            $oldCode = $_POST['codeMatiereOld'];
            try{
                MatiereTool::updateMatiere($bdd->getConnexion(), $newCode, $libelle, $oldCode);
                echo AlertTool::genereSuccess("Mise à jour effectué avec succés !");
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
        //Gestion de la suppression de Matiere
        if (isset($_POST['formDeleteSubmit'])) {
            $code = $_POST['codeMatiere'];
            try{
                MatiereTool::deleteMatiere($bdd->getConnexion(), $code);
                echo AlertTool::genereSuccess("Suppression effectué avec succés !"); //mmessage de confirmation
            }catch(exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
        //Gestion de l'ajout de Matiere
        if (isset($_POST['formAddSubmit'])) {
            $libelle = $_POST['libelleMatiereAdd'];
            $code = $_POST['codeMatiereAdd'];
            try{
                MatiereTool::insertMatiere($bdd->getConnexion(), $code ,$libelle);
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
                    <input type="button" id="addMatiere" class="btn btn-inverse" value="Ajouter une Matière"/>
                </div>

            </div>
            <!--le tableau d'affichage de toutes les matieres-->
            <div class="span9">
                <?php
                //recup de toute les matieres
                    try{
                        //recup de toutes les matieres 
                        $allMatiere = MatiereTool::getAll($bdd->getConnexion());
                        //tableau de gestion
                        echo (Matiere::genereTable($allMatiere));
                    }catch(Exception $e){
                        echo $e->getMessage();
                    }
                
                    // Les formulaires des Matiere deja preparer qui'on affichera que s'il y'a un evenement -->
                    //generation des formulaires
                    if(!empty($allMatiere)){
                        foreach ($allMatiere as $laMatiere) {
                            echo $laMatiere->genereFormModif();
                        }
                    }

                    //formulaire cache de creation de matiere, on l'affichera une fois cliquer sur le bouton ajouter une matiere
                    echo Matiere::genereFormAdd();
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
        $("#addMatiere").click(function(){
            $("#formAddMatiere").modal();
        });
    </script>

</html>