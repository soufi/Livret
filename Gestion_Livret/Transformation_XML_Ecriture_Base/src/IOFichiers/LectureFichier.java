package IOFichiers;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

	//Lit la totalite du fichier et cree un tableau de string contenant chacune un module
	//(entre une balise \module et une balise \vfill)
	//utilisation d'un tableau de StringBuffer pour le stockage de données car la concaténation est plus rapide
	public String[] lireModule(){
		boolean enEcriture = false;
		StringBuffer[] texte=new StringBuffer[50];
		for(int i=0;i<texte.length;++i)
			texte[i]= new StringBuffer();
		String ligne = "";
		Pattern pm = Pattern.compile("\\\\module");
		Pattern pv = Pattern.compile("\\\\vfill");
		Matcher m;
		int cpt=0;
		while((ligne=lire()) != null){
			if(!enEcriture) {
				m = pm.matcher(ligne);
				if(m.find()) {
					enEcriture = true;
					texte[cpt].append(ligne+"\n"); 
				}
			}
			else{
				texte[cpt].append(ligne+"\n");
				m=pv.matcher(ligne);
				if(m.find()) {
					enEcriture = false;
					cpt++;
				}
			}
		}
		String[] res=new String[cpt];
		for(int i=0;i < cpt;++i){
			res[i]=texte[i].toString();
		}
		
		//fermer();
		
		return res;
	}
	
}
