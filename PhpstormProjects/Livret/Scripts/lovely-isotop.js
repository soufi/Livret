var imported = document.creatElement('script');
imported.src = 'JQuery/jquery-1.9.1.js';
document.head.appendChild(imported);

//cette fonction permet de prendre en charge l'affichage des informations en fonction de leurs attributs
function isotopeHandler() {
	$(document).ready(function(){
		var $container = $('#allModules');
		$container.isotope({
			filter: 'IF',
			animationOptions: {
				duration: 750,
				easing: 'linear',
				queue: false,
			}
		});
		$('#allMatieres button').click(function(){
			var selector = $(this).attr('data-filter');
			$container.isotope({
				filter: selector,
				animationOptions: {
					duration: 750,
					easing: 'linear',
					queue: false,
				}
			});
			return false;
		});
	});
}



