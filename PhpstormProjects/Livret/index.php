<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<?php
include ("Blocks/entete.html");
include_once("Tools/connexion.php");
include_once("Tools/filter.php");
?>
	<body>
        <div class = "container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <?php
                    try{
                        echo FilterTool::listFilterByPromo($bdd->getConnexion());
                    }catch(Exception $e){
                        echo AlertTool::genereDanger($e->getMessage());
                    }
                    ?>
                </div>

                <div class="span10">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <?php
                            try{
                                echo FilterTool::modDivContent($bdd->getConnexion());
                            }catch(Exception $e){
                                echo AlertTool::genereDanger($e->getMessage());
                            }
                            ?>
                        </div>
                    </div>

                </div>
            </div>
        </div>
	</body>
    <script type="text/javascript" src="/Livret/Scripts/JQuery/jquery.isotope.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var $container = $('#moduleContent');

            $('#promoNavFilter').find('a').click(function(){
                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });
                return false;
            });

            $('#matiereNavFilter').find('a').click(function(){
                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });
                return false;
            });



        });
    </script>
<?php
include("Blocks/footer.html");
?>
</html>