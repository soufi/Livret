package Principal;

import java.io.File;
import java.util.ArrayList;
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

	public static void main(String[] args) throws TransformerException {

		System.out.println("Veuillez entrer le chemin du dossier contenant " +
				"les fichiers de type Detail_Info_*.tex (e.g. : /home/dossier/).");
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
		String [] listefichiers = rep.list();
		boolean trouve = false;

		for(int i = 0;i < listefichiers.length; ++i) {
			if(listefichiers[i].matches("Detail_Info_.*.tex")){
				trouve = true;
				LectureFichier LF = new LectureFichier(doss+listefichiers[i]);
				String res[] = LF.lireModule();
				System.out.print(listefichiers[i].substring(0,listefichiers[i].length()-4)+".txt...");
				EcritureFichier EF = new EcritureFichier("XML/"+listefichiers[i].substring(0,+listefichiers[i].length()-4)+".xml");
				EF.ecrire("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
				EF.ecrire("<livret>\n\n");
				for(int j = 0;j < res.length; ++j) {
					EF.ecrire("\t\t<!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Module n°"+(j+1)+" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->\n\n");
					Pattern p = Pattern.compile("(.*) & (.*)");
					Matcher m = p.matcher(res[j]);
					res[j] = m.replaceAll("$1 &amp; $2");
					EF.ecrireFichierXML(res[j]);

				}
				EF.ecrire("</livret>");
				EF.fermer();
				TransformerFactory tFactory = TransformerFactory.newInstance();
				Transformer transformer = tFactory.newTransformer(new StreamSource("Gestion_Livret.xsl"));
				transformer.setParameter( "promo", listefichiers[i].substring(12).split(".tex")[0]);
				
				transformer.transform(new StreamSource("XML/"+listefichiers[i].substring(0,listefichiers[i].length()-4)+".xml"), 
						new StreamResult("SQL/"+listefichiers[i].substring(0,listefichiers[i].length()-4)+".txt"));
				System.out.println(" Créé");
			}
		}
		if(trouve){
			System.out.print("\n");
			ArrayList<String> ens_crees = new ArrayList<String>();
			Requete R = new Requete();		
			File rep2 = new File("./SQL/");
			String [] listefichiers2 = rep2.list();
			EcritureFichier EF = new EcritureFichier("nouveaux_enseignants.txt");
			for(int i = 0;i < listefichiers2.length; ++i) {
				System.out.print("Ecriture à partir du fichier "+listefichiers2[i]+"...");
				ens_crees = R.ecrireDonnees("SQL/"+listefichiers2[i]);
				System.out.println(" terminée.");
				for(int j=0;j<ens_crees.size();++j){
					EF.ecrire((String)ens_crees.get(j));
				}
			}
			EF.envoyer();
			EF.fermer();
		}
		else
			System.out.println("Aucun fichier de type Detail_Info_*.tex trouvé.");
	}
}