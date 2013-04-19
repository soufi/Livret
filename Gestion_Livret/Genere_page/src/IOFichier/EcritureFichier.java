package IOFichier;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Acces_BD.Requete;

public class EcritureFichier {

	/**
	 * Cette classe vise à simplifier l'écriture dans un fichier
	 * Elle est aussi utilisée pour écrire les pages web
	 */

	private File f;
	private FileWriter fw;
	private BufferedWriter output;

	public EcritureFichier(String fic){
		f=new File(fic);
		f.delete();
		try {
			f.createNewFile();
			fw = new FileWriter(fic, true);
			output = new BufferedWriter(fw);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void ecrire(String aEcrire){
		try {
			output.write(aEcrire);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void envoyer(){
		try {
			output.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void fermer(){
		try {
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void ecrireListes(int niveau) throws SQLException{
		//Pour ecrire la partie fixe au début (à changer)
		ecrire("<!doctype html>"
				+"\n<html lang=\"en\">"
				+"\n<head>"

+"\n<meta charset=\"utf-8\" />"
+"\n<title>Programme : MIAGE d'Orléans</title>"

+"\n<!--[if lt IE 9]><script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->"

+"\n<link rel=\"stylesheet\" href=\"style.css\" />"

+"\n<!-- scripts at bottom of page -->"

+"\n</head>"
+"\n<body class=\"demos \">"

+"\n	<section id=\"content\">"

		+"\n<h1>Programme de la formation MIAGE d'Orléans - Habilitation 2012/2017</h1>"

		+"\n<section id=\"copy\">"
		+"\n<p>"
		+"\nVoici le programme complet sur les 3 années, en Licence et Master MIAGE. Il est" 
		+"\npossible de filtrer l'ensemble des modules par année (L3, M1, M2) mais aussi" 
		+"\npar thématique. Un clic sur un module permet d'afficher son contenu détaillé."
		+"\n</p>"
		+"\n</section>"

		+"\n<section id=\"options\" class=\"clearfix\">"

    	+"\n	<div class=\"option-combo\">"
    	+"\n<h3>Sélection des modules par niveau de formation :</h3>"

			+"\n<ul class=\"filter option-set clearfix\" data-filter-group=\"niveau\">"
			+"\n<li><a href=\"#filter\" data-filter-value=\"\" class=\"selected\">Tous</a></li>"
				);

		String selecteur = "";
		Requete R = new Requete();

		ResultSet leResultat = R.executer("select distinct _ID_PROMO_ , _NOM_PROMO_ from livret_promotion");
		leResultat.last();
		//on récupère le numéro de la ligne
		int nombreLignes = leResultat.getRow();
		//on replace le curseur avant la première ligne
		leResultat.beforeFirst();

		ArrayList<String> id_promo = new ArrayList<String>() ;
		int i = 0;
		
		switch(niveau){
		case 1 : selecteur = "Licence.*";break;
		case 2 : selecteur = "m1.*";break;
		case 3 : selecteur = "m2_CCI.*";break;
		}
		
		while(leResultat.next()){
			if(leResultat.getString(2).matches(selecteur)) {
				id_promo.add(leResultat.getString(1));
				ecrire("\n<li><a href=\"#filter\" data-filter-value=\"."+leResultat.getString(2)
						+"\">"+leResultat.getString(2)+"</a></li>");
				++i;
			}
		}
		ecrire("</ul>\n</div>\n<div class=\"option-combo\">" +
				"\n<h3>Sélection des modules par thématique :</h3>" +
				"\n<ul class=\"filter option-set clearfix\" data-filter-group=\"domaine\">"+
				"\n<li><a href=\"#filter\" data-filter-value=\"\" class=\"selected\">Tout</a></li>"
				);

		ArrayList<String> ue = new ArrayList<String>();
		for(int j = 0;j<id_promo.size();++j){
			leResultat = R.executer("select distinct _LIBELLE_UE_ " +
					"from livret_matiere natural join livret_infos_ue " +
					"where _ID_PROMO_ = "+id_promo.get(j));
			while(leResultat.next()){
				if(!ue.contains(leResultat.getString(1)))
					ue.add(leResultat.getString(1));
			}
		}
		for( int k = 0;k<ue.size();++k)
			ecrire("\n<li><a class=\""+ue.get(k).replace(" ", "_")+"\" href=\"#filter\" " +
					"data-filter-value=\"."+ue.get(k).replace(" ", "_")+"\">"+ue.get(k)+"</a></li>");
		ecrire("</ul>\n</div>\n</section>");
	}

	public void ecrireModules(int niveau) throws SQLException, IOException{
		String selecteur = "";
		ArrayList<String> id_promo = new ArrayList<String>();
		ArrayList<String> nom_promo = new ArrayList<String>();
		ArrayList<String> id_mat = new ArrayList<String>();
		Requete R = new Requete();
		ResultSet ue;
		ResultSet res;
		int tot=0;
		ResultSet heures_cours;
		ResultSet ects;
		ResultSet leResultat =  R.executer("select distinct _ID_PROMO_ , _NOM_PROMO_ from livret_promotion");
		
		switch(niveau){
		case 1 : selecteur = "Licence.*";break;
		case 2 : selecteur = "m1.*";break;
		case 3 : selecteur = "m2_CCI.*";break;
		}
		
		while(leResultat.next()){
			if(leResultat.getString(2).matches(selecteur)) {
				id_promo.add(leResultat.getString(1));
				nom_promo.add(leResultat.getString(2));
			}
		}

		ecrire("\n<div id=\"container\" class=\"super-list clickable clearfix\">");

		for(int j = 0;j<id_promo.size();++j){

			ecrire("\n\n\n\n");

			res = R.executer("select distinct _LIBELLE_UE_ " +
					"from livret_matiere natural join livret_infos_ue " +
					"where _ID_PROMO_ = " + id_promo.get(j));
			ecrire(	"\n<div class=\"element feature " + nom_promo.get(j));
			while(res.next())
				ecrire(" "+res.getString(1).replace(" ", "_"));
			ecrire("\">");
			ecrire("\n<h3 class=\"symbol\">"+nom_promo.get(j).substring(0,2)+"</h3>");
			ecrire("\n<h2 class=\"weight\">"+nom_promo.get(j)+"</h2>\n</div>");

			leResultat =  R.executer("select distinct _ID_MAT_ " +
					"from livret_matiere where _ID_PROMO_ = \""+id_promo.get(j)+"\"");



			while(leResultat.next())
				id_mat.add(leResultat.getString(1)); //id_mat contient toutes les matieres de la promo en cours

			for(int k = 0;k< id_mat.size();++k){

				//<!--         <p class="number">5</p> -->
				//<h3 class="symbol">L3S5</h3>
				//<h2 class="weight">Licence 3 Semestre 5</h2>
				//</div>"

				//Ecriture de la premiere ligne d'un module
				ue = R.executer("select distinct _LIBELLE_UE_ " +
						"from livret_module natural join livret_infos_ue " +
						"where _ID_MAT_ = "+id_mat.get(k));

				ue.next();

				ecrire("\n<div class=\"element "+ue.getString(1).replace(" ", "_")+" "+
						nom_promo.get(j)+
						"\" data-symbol=\"Mg\" data-category=\""+ue.getString(1).replace(" ", "_")+"\">");



				ects = R.executer("select distinct _NB_ECTS_ " +
						"from livret_module" +
						" where _ID_MAT_ = "+id_mat.get(k));
				ects.next();
				ecrire("\n<p class=\"number\">"+ects.getString(1)+"ECTS</p>");

				//Recuperation du nombre d'heures de Cours/TD/TP/CTD
				heures_cours = R.executer("select _NBH_C_ , _NBH_TD_ , _NBH_TP_ , _NBH_CTD_ " +
						"from livret_module where _ID_MAT_ = " + id_mat.get(k));
				heures_cours.next();
				tot += heures_cours.getInt(1)+heures_cours.getInt(2)
						+heures_cours.getInt(3)+heures_cours.getInt(4);
				ecrire("\n<p class=\"weight\">"+ tot +"h</p>");
				tot = 0;

				//Ecriture du nom de la matiere
				res = R.executer("select _NOM_MAT_ from livret_matiere where _ID_MAT_ = " + id_mat.get(k));
				res.next();
				ecrire("\n<h2 class=\"name\">"+res.getString(1)+"</h2>");


				//Ecriture de la description detaillée
				res = R.executer("select _DESCRIPTION_ " +
						"from livret_module " +
						"where _ID_MOD_ = " + id_mat.get(k));
				res.next();
				ecrire("\n<div class=\"detail cache\">"+
						"\n<p>"+res.getString(1)+"</p>");

				res = R.executer("select distinct _NBH_C_ , _NBH_TD_ , _NBH_TP_ , _NBH_CTD_ " +
						"from livret_module " +
						"where _ID_MOD_ = " + id_mat.get(k));
				ecrire("\n<p><b>Volume horaire :</b> ");
				res.next();
				if(!res.getString(1).equals("") && !res.getString(1).equals("0"))
					ecrire(res.getString(1)+"h Cours ");
				if(!res.getString(2).equals("") && !res.getString(2).equals("0"))
					ecrire(res.getString(2)+"h TD ");
				if(!res.getString(3).equals("") && !res.getString(3).equals("0"))
					ecrire(res.getString(3)+"h TP ");
				if(!res.getString(4).equals("") && !res.getString(4).equals("0"))
					ecrire(res.getString(4)+"h CTD ");
				ecrire("</p>\n");

				ecrire("<p><b>Objectifs :</b>");
				res = R.executer("select distinct _OBJECTIF_ " +
						"from livret_module " +
						"where _ID_MOD_ = " + id_mat.get(k));
				res.next();
				ecrire(res.getString(1)+"</p>\n</div>\n</div>\n");
			}
			id_mat.clear();
		}
		ecrire("\n</div>");
	}

	public void ecrireFin(){
		ecrire("<script src=\"js/jquery-1.7.1.min.js\"></script>"+
				"<script src=\"jquery.isotope.min.js\"></script>"+
				"<script>"+
				"$(function() {"+

				"var $container = $('#container'),filters = {};"+

				"$container.isotope({"+
				"itemSelector : '.element',"+
				"masonry : {"+
				"columnWidth : 120"+
				"},"+
				"masonryHorizontal : {"+
				"rowHeight : 120"+
				"},"+
				"cellsByRow : {"+
				"columnWidth : 240,"+
				"rowHeight : 240"+
				"},"+
				"cellsByColumn : {"+
				"columnWidth : 240,"+
				"rowHeight : 240"+
				"},"+
				"getSortData : {"+
				"symbol : function($elem) {"+
				"return $elem.attr('data-symbol');"+
				"},"+
				"category : function($elem) {"+
				"return $elem.attr('data-category');"+
				"},"+
				"number : function($elem) {"+
				"return parseInt($elem.find('.number').text(), 10);"+
				"},"+
				"weight : function($elem) {"+
				"return parseFloat($elem.find('.weight').text()"+
				".replace(/[\\(\\)]/g, \'\'));"+
				"},"+
				"name : function($elem) {"+
				"return $elem.find('.name').text();"+
				"}"+
				"}"+
				"});"+

				"var $optionSets = $('#options .option-set'), $optionLinks = $optionSets.find('a');"+

			    	"$('.filter a').click(function(){"+
			    	"var $this = $(this);"+
			    	"if ($this.hasClass(\'selected\')) {"+
			    	"return false;"+
			    	"}"+
			    	"var $optionSet = $this.parents('.option-set');"+
			    	"$optionSet.find('.selected').removeClass('selected');"+
			    	"$this.addClass('selected');"+

						      "var group = $optionSet.attr('data-filter-group');"+
						      "filters[ group ] = $this.attr('data-filter-value');"+
						      "var isoFilters = [];"+
						      "for ( var prop in filters ) {"+
						      "isoFilters.push( filters[ prop ] )"+
						      "}"+
						      "var selector = isoFilters.join('');"+
						      "$container.isotope({ filter: selector });"+

						      "return false;"+
						      "});"+

				"var isHorizontal = false;"+
				"function changeLayoutMode($link, options) {"+
				"var wasHorizontal = isHorizontal;"+
				"isHorizontal = $link.hasClass('horizontal');"+

					"if (wasHorizontal !== isHorizontal) {"+
					"var style = isHorizontal ? {"+
					"height : '80%',"+
					"width : $container.width()"+
					"} : {"+
					"width : 'auto'"+
					"};"+
					"$container.filter(\':animated\').stop();"+
					"$container.addClass('no-transition').css(style);"+
					"setTimeout(function() {"+
					"$container.removeClass('no-transition').isotope("+
					"options);"+
					"}, 100)"+
					"} else {"+
					"$container.isotope(options);"+
					"}"+
					"}"+

				"$container.delegate('.element', 'click', function() {"+
				"$(this).toggleClass('large');"+
				"if ($(this).hasClass('large')) {"+
				"$(this).find('.detail').removeClass('cache');"+
				"} else {"+
				"$(this).find('.detail').addClass('cache');"+
				"}"+
				"$container.isotope('reLayout');"+
				"});"+

				"$('#toggle-sizes').find('a').click("+
				"function() {"+
				"$container.toggleClass('variable-sizes').isotope("+
				"'reLayout');"+
				"return false;"+
				"});"+

				"var $sortBy = $('#sort-by');"+
				"$('#shuffle a').click("+
				"function() {"+
				"$container.isotope('shuffle');"+
				"$sortBy.find('.selected').removeClass('selected');"+
				"$sortBy.find('[data-option-value=\"random\"]')"+
				".addClass('selected');"+
				"return false;"+
				"});});</script>"+


"<!-- 		<footer> -->"+
"<!-- 			Isotope by <a href=\"http://desandro.com\">David DeSandro</a> / <a -->"+
"<!-- 				href=\"http://metafizzy.co\">Metafizzy</a> -->"+

		"<!-- 		</footer> -->"+

			"</section>"+
			"<!-- #content -->"+


		"</body>"+
				"</html>);");
	}
}