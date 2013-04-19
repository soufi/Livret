package Principal;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import Acces_BD.Requete;
import IOFichiers.EcritureFichier;
import IOFichiers.LectureFichier;

public class Menu {
	
	/**
	 * Extrait les information contenu dans les fichier Tex contenu dans le dossier demande par le programme, les noms des fichiers doivent etre de la forme :
	 * 		Detail_Composition_Filiere_Promo.tex
	 * Apres l'extraction on transforme ces fichiers en XML, et avec un fichier XSL definit, on transforme le XML de chaque fichier TEX en fichier TXT contenant des requete SQL
	 * Et on execute les requetes
	 * @param args
	 * @throws TransformerException
	 */
	public static void main(String[] args) throws TransformerException {

		System.out.println("Veuillez entrer le chemin du dossier contenant \n" +
				"les fichiers de type Detail_Composition_Filiere_Promo.tex (e.g. : /home/dossier/).");
		File rep = null;
		String doss;
		Scanner sc = new Scanner(System.in);
		doss = sc.nextLine();
		if(!doss.matches("(.*)/"))
			doss += "/";
		rep = new File(doss);
		//Vérification de l'existence du répertoire passé
		while(!rep.exists()){
			System.out.println("Dossier innexistant. Veuillez entrer un autre chemin.");
			sc = new Scanner(System.in);
			doss = sc.nextLine();
			if(!doss.matches("(.*)/"))
				doss += "/";
			rep = new File(doss);
		}
		//chargement de tous les fichier du dossier 
		String [] listefichiers = rep.list();
		//application de la transformation au fichiers TEX
		boolean trouve = transform(doss, listefichiers);
		
		//si les fichiers sont bien trouve et transforme alors on execute les requetes
		if(trouve){
			System.out.println("Execution des Requetes contenu dans le repertoir SQL/ ... \n");
			try {
				System.out.println("=> "+Requete.execRequests("SQL/"));
			} catch (IOException e) {
				System.err.println(e.getMessage());
			} catch (InterruptedException e) {
				System.err.println(e.getMessage());
			}
		}
		else
			System.out.println("Aucun fichier de type Detail_Info_*.tex trouvé.");
	}
	
	
	/**
	 * Permet de transformer les fichiers Tex contenu dans listefichiers en fichier XML et ensuite appliquer la transformation grace au 
	 * fichier XSL definit dans le dossier du projet
	 * @param doss
	 * @param listefichiers
	 * @return
	 * @throws TransformerException
	 */
	private static boolean transform (String doss ,String [] listefichiers) throws TransformerException{
		String[] spl = null; // pour l'extraction de la composition, filiere et promotion
		String compo = "";
		String filiere = "";
		String promo = "";
		boolean trouve = false;
		for(int i = 0; i < listefichiers.length; i++) {
			// fichier de la forme :  Detail_compo_filiere_promo.tex
			if(listefichiers[i].matches("Detail_..*._..*_..*.tex")){ 
				LectureFichier LF = new LectureFichier(doss+listefichiers[i]);
				//extraire la composition, filiere et promo
				spl = listefichiers[i].split("_");
				compo = spl[1];
				filiere = spl[2];
				promo = spl[3];
				//extraire tous les modules du fichier tex
				String res[] = LF.lireModule();
				System.out.print(listefichiers[i].substring(0,listefichiers[i].length()-4)+".txt...");
				//Initialisation de l'outils d'ecriture de la transformation en XML 
				EcritureFichier EF = new EcritureFichier("XML/"+listefichiers[i].substring(0,+listefichiers[i].length()-4)+".xml");
				EF.ecrire("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
				EF.ecrire("<livret>\n\n");
				for(int j = 0;j < res.length; ++j) {
					EF.ecrire("\t\t<!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Module n°"+(j+1)+" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->\n\n");
					// changement de tous les & qui n'entre pas dans une chaine de caractere par des &amp;
					Pattern p = Pattern.compile(" & ");
					Matcher m = p.matcher(res[j]);
					res[j] = m.replaceAll(" &amp; ");
					//creation du fichier XML
					EF.ecrireFichierXML(res[j]);
				}
				EF.ecrire("</livret>");
				EF.fermer();
				
				TransformerFactory tFactory = TransformerFactory.newInstance();
				//chargement du fichier XSL
				Transformer transformer = tFactory.newTransformer(new StreamSource("transf_requete.xsl"));
				//on ajoute les valeurs des parametres contenant la composition, la filiere et la promo 
				transformer.setParameter("compo", compo);
				transformer.setParameter("filiere", filiere);
				transformer.setParameter( "promo", promo);
				
				
				//CREATION de fichier de requete du fichier traite grace au fichier au fichier XSL
				transformer.transform(new StreamSource("XML/"+listefichiers[i].substring(0,listefichiers[i].length()-4)+".xml"), 
						new StreamResult("SQL/"+listefichiers[i].substring(0,listefichiers[i].length()-4)+".sql"));
				System.out.println(" Créé.");
				trouve = true;
			}
		}
		return trouve;
	}
}