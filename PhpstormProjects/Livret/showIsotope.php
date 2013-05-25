<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
	<head> 
		<meta charset="utf-8">
		<meta name="title" content="Navigateur de Livret" />
		<meta name="description" content="Version Test du livret de module Universite d'orleans" />
		<meta name="keywords" content="livret, Orleans, informatique" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link rel="stylesheet" href="CSS/Bootstrap/css/bootstrap-responsive.css" type="text/css"/>
		<link rel="stylesheet" href="CSS/Bootstrap/css/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="CSS/Isotope/isotope.css" type="txt/css" />
		<script type="text/javascript" src="Scripts/JQuery/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="Scripts/JQuery/jquery.isotope.min.js"></script>
	</head>
	<body>
		<!-- Menu Principal -->
		<header>
			<div class="navbar navbar-inverse">
				<div class="navbar-inner">
					<div class="container">	
						<!-- Le Menu -->
						<a class="brand" href="">Home</a>
						<a class="brand" href="">Download</a>
						<a class="brand" href="">Manage </a>
						<a class="brand" href="">Navigate</a>
				 		<!-- La barre de recherche -->
						<div class="nav-collapse collapse">
							<form class="navbar-search pull-right">
								<input type="text" name="search-global" class="search-query" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
			</div>
		</header>

		<script type="text/javascript">
			$(document).ready(function(){
				var $container = $('#allModules');
				$container.isotope({
					filter: '.IF',
					animationOptions: {
						duration: 750,
						easing: 'linear',
						queue: false
					}
				});
				$('#allMatieres a').click(function(){
					var selector = $(this).attr('data-filter');
					$container.isotope({
						filter: selector ,
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
			include_once("./Tools/filterDiv.php");

			FilterTool::matieresDiv($bdd->getConnexion());
			echo '<div class="container-fluid">';
			FilterTool::modulesDiv($bdd->getConnexion());
			echo '</div>';
		 ?>
	</body>
</html>