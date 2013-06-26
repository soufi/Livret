<html lang="fr">
    <?php
        include_once("../Blocks/entete.html");
        include_once("../Tools/alerts.php");
        include_once("../Tools/filiere.php");
        include_once("../Tools/promotion.php");
        include_once("../Tools/connexion.php");

        //generation du fichier en selectionnant la promotion
        if(isset($_POST['slctPromoSubmit'])){
            $id = $_POST['promotion'];
            try{
                //recup de la promotion enveloppe dans un tableau
               $tabP = PromoTool::getByID($bdd->getConnexion(), $id);
                if(!empty($tabP)){
                    $promo = $tabP[0];
                    if($promo->genereTexDtlF($bdd->getConnexion()))
                        echo AlertTool::genereInfo("Le fichier de détails a été crée avec succé");
                    else
                        echo AlertTool::genereWarning("impossible de créer le fichier de Details");
                    if($promo->genereTexTabF($bdd->getConnexion()))
                        echo AlertTool::genereInfo("le fichier de Maquette de Semestre a été crée avec succé");
                    else
                        echo AlertTool::genereWarning("impossible de créer le fichier de maquette de semestre");
                }else
                    echo AlertTool::genereWarning("impossible de trouver la promotion");
            }catch(Exception $e){
                echo AlertTool::genereDanger($e->getMessage());
            }
        }
    ?>
    <body>
        <!-- HEADER de la Page -->
        <div class="container">
            <div class="row">
                <div class="page-header span6">
                    <h1>Téléchargements<br/>
                    </h1>
                </div>
            </div>
        </div>
        <!-- Menu de telechargement -->
        <div class='container-fluid'>
            <div class='row-fluid'>
                <ul class="nav nav-tabs">
                    <li> <a href="#filiere" data-toggle="tab">Filière</a></li>
                    <li class="active"><a href="#promo" data-toggle="tab">Promotion</a></li>
                </ul>
            </div>

            <div class='tab-content'>
                <div class="tabe-pane fade active in" id="promo">

                    <?php
                        $lesPromotions = PromoTool::getAll($bdd->getConnexion());
                        echo Promo::genereFormCheckboxs($lesPromotions);
                    ?>
                </div>
            </div>
        </div>
    </body>
    <?php
    include_once("../Blocks/footer.html");
    ?>
</html>