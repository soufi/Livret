Livret
======

Stage


IMPORTANT : il ne faut pas incluer le fichier "bootstrap.js" en meme temps que le fichier de "jquery_isotope.js"  cela crée des conflits et l'isotope ne marche point. 



Le Dossier Gestion_Livret est une application java, résultats de modification de l'ancienne version contenu dans le dossier Ancien, le dossier Gestio_Livret contient deux sous applications :
	- Transformation_XML_Ecriture_Base : l'application d'alimentation modifié 
	- Genere_Page  : l'application de generation de page html, cette partie n'a pas été touché, des méthodes ont été ajouté à la place au niveau de l'interface web (le dossier phpStromProject).
	
	
=============================================================================================================================================================================
	
	
PhpstormProjects :
		- Blocks : contient les différents blocks html, la partie head et footer et les barre de navigations (partie commune au pages)
		- CSS : contient les fichiers de mise en page, Bootstrap Twitter, et Isotope et les images du site
		- Download : contient les pages de gestion de génération de Latex, pour la génération latex voir le dossier Tools
		- Generated : le dossier dans le quel les fichier latex sont généré
		- index.php : contient l'affichage isotope en fonction des promotions => voir le fichier filter.php dans le dossier Tools, ce dernier fichier permet la gestion et la génération des filtres et contenu d'isotope
		- Managers : contient toutes les pages de gestion des différents types de données (module, composante, filière …etc).
		- Scripts : contient les scripts javascript. Pour le script de bootstrap (bootstrap.js) voir le dossier CSS/Bootstrap/js
		- Tools : contient les fichiers de gestion de base de donnée pour chaque type de donnée qui correspond à une table dans la base, d'autres fichiers d'outils, comme le fichier alert.php ou color.php permettent d'offrir des fonction outils spécifique à une utilisation : exemple color.php contient des fonctions de conversion entre le format hex et RVB. voir les fichiers en question pour plus de détails.
		