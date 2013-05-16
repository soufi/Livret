package IOFichiers;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashSet;

public class LectureFichier {
	/**
	 * Classe qui permet de faciliter la lecture d'un fichier
	 */
	
	public String fichier;
	private InputStream ips;
	private InputStreamReader ipsr;
	private BufferedReader br;


	public LectureFichier(String fichier) {
		this.fichier = fichier;
		try {
			ips = new FileInputStream(fichier);
			ipsr = new InputStreamReader(ips);
			br = new BufferedReader(ipsr);
		} 
		catch (FileNotFoundException e) {
			System.out.println("Fichier non trouve");
		}
	}
	
	public boolean estVide(){
		try {
			return br.ready();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public String lire(){
		try {
			return br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void fermer(){
		try {
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**Lit la totalite du fichier et cree un tableau de string contenant chacune un module (entre une balise \module et une balise \vfill)
	 * utilise une HashSet de String dans laquelle on strock les elements
	 * @return un tableau de String contenant dans chaque case un module
	 */
	public String[] lireModule(){
		boolean enEcriture = false; //indique lorsqu'on ecrit un module
		HashSet <String> lesModules = new HashSet <String>();
		StringBuffer module = new StringBuffer();
		String ligne = "";
		boolean finDocument = false;
		while((ligne=lire()) != null && !finDocument){
			//si on a terminer d'ecrire un module donc on a trouver avant \vfill
			if(!enEcriture) {
				if(ligne.contains("\\module")) {
					enEcriture = true;
					module.append(ligne+"\n"); 
				}
			//si c la fin du document on arrete l'operation
			}else if(ligne.contains("\\begin{document}")){
				finDocument = false;
			//si on est a l'interieur d'un module 
			}else{
				module.append(ligne+"\n");
				//la fin du module
				if(ligne.contains("\\vfill")) {
					enEcriture = false;
					//on ajoute le modules
					lesModules.add(module.toString());
					module.delete(0, module.length());
				}
			}
		}
		return lesModules.toArray(new String[lesModules.size()]);
	}
}
