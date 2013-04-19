package IOFichiers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EcritureFichier {
/**
 * Cette classe vise à simplifier l'écriture dans un fichier
 * Elle est aussi utilisée pour écrire le fichier XML
 */
	private FileWriter fw;
	private BufferedWriter output;
	
	/**
	 * construit l'outils d'ecriture de la classe avec un nom de fichier et ecrase son contenu 
	 * @param fic : le fichier qui sera ecraser
	 */
	public EcritureFichier(String fic){
		try {
			fw = new FileWriter(fic, false);
			output = new BufferedWriter(fw);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Constructeur permettant d'ecrire sur la sortie standard 
	 */
	public EcritureFichier(){
		output = new BufferedWriter(new OutputStreamWriter(System.out));
	}
	
	/**
	 * Ecrit dans le flux de sortie le contenu du parametre aEcrire 
	 * @param aEcrire : le contenu a ecrire
	 */
	public void ecrire(String aEcrire){
		try {
			output.write(aEcrire);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Applique un push sur la flux de sortie
	 */
	public void envoyer(){
		try {
			output.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ferme le flux d'ecriture
	 */
	public void fermer(){
		try {
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Permet de verifier que la chaine extraite est en majuscules
	 * @param s : la chaine extraite
	 * @return
	 */
	public boolean verifierMajuscules(String s){
		return s.equals(s.toUpperCase());
	}

	/**
	 * Verifie que la deuxieme lettre d'une chaine est en minuscule, 
	 * ce qui permet de differencier les balises des attributs de <module>
	 * @param s
	 * @return
	 */
	public boolean enMinuscule(String s){
		return Character.isLowerCase(s.charAt(1));
	}

	/**
	 * Ecriture de la balise <module> et de ses attributs
	 * @param aExtraire
	 * @return
	 */
	public boolean ecrireModule(String aExtraire){
		if(aExtraire == null || aExtraire.length() == 0) // on fait rien si le String est 
			return false;
		ecrire("<module ");
		Pattern p = Pattern.compile("codeApogee=\\{(.*)\\}");
		Matcher m = p.matcher(aExtraire);
		m.find();
		ecrire("codeApogee=\""+m.group(1)+"\"");
		
		Pattern a = Pattern.compile("\n(.*)=\\{(.*)\\},");
		Matcher ma = a.matcher(aExtraire);
		String line;
		String contenu;
		while(ma.find()) {
			line = ma.group(1);
			contenu = ma.group(2);
			if(verifierMajuscules(line))
				ecrire(" "+line.toLowerCase()+"="+"\""+contenu+"\"");
		}
		//String module = f.getName().split(".txt")[0];
		//ecrire(" promo=\""+module+"\">\n");
		ecrire(">\n");
		return true;
	}

	/**
	 * Ecrit les balises "normales"
	 * @param aExtraire : le contenu de travail
	 */
	public void ecrireBalises(String aExtraire){
		Pattern p = Pattern.compile("(.*)=\\{(.*)\\}");
		Matcher m = p.matcher(aExtraire);
		while(m.find() && !m.group(1).equals("langue")){
			if(m.group(1).charAt(0) == '%'){
				ecrire("<"+m.group(1).substring(1)+">"+m.group(2)+"</"+m.group(1).substring(1)+">\n\n");
			}
			if(!verifierMajuscules(m.group(1)) && Character.isLetterOrDigit(m.group(1).charAt(0)))
				ecrire("<"+
						Character.toLowerCase(m.group(1).charAt(0))+m.group(1).substring(1)+ //Pour afficher la balise ouvrante correctement
						">"+m.group(2)+
						"</"+
						Character.toLowerCase(m.group(1).charAt(0))+m.group(1).substring(1)+ //Pour afficher la balise fermante correctement
						">\n\n");
		}
	}

	/**
	 * Ecrit les balises composees (comme langues et lesPrerequis)
	 * @param aExtraire
	 */
	public void ecrireBalisesComposees(String aExtraire){
		//Recupere toutes les lignes entre emailSecondResp et descriptionCourte (incluses) 
		Pattern pp = Pattern.compile("langue=\\{.*\\}, ?\n(.*\n)+descriptionCourte=\\{.*\\},");
		Matcher mm = pp.matcher(aExtraire);
		mm.find();
		String [] s = mm.group().split("\n"); //On découpe en plusieurs chaines, suivant les lignes
		//On traite toutes les lignes à l'exception de la premiere et de la derniere
		for(int i=0;i<s.length-1;++i){
			Pattern p = Pattern.compile("(.*)=\\{(.*)\\},"); //On decoupe chaque ligne afin de pouvoir recuperer
			Matcher m = p.matcher(s[i]);     //le nom de variable et la/les valeurs qu'elle contient
			m.find();
			String[] res;
			res=m.group(2).split(",");  //On separe les valeurs en plusieurs chaines

			//Condition particuliere pour la balise prerequis 
			if(m.group(1).equals("nbPrerequis")){
				ecrire("<lesPrerequis>\n");
				for(int j=0;j<res.length;++j)
					ecrire("  <prerequis>"+res[j]+"</prerequis>\n");
				ecrire("</lesPrerequis>\n\n");

			}
			else {
				ecrire("<"+m.group(1)+"s>\n");//On ecrit la balise generale ouvrante
				//(nom de l'attribut + s; exemple : "langue" devient "langues")
				for(int j=0;j<res.length;++j)//On ecrit les balises internes avec leurs valeurs
					ecrire("  <"+m.group(1)+">"+res[j]+"</"+m.group(1)+">\n");
				ecrire("</"+m.group(1)+"s>\n\n"); //On ecrit la balise generale fermante
			}
		}
	}

	/**
	 * Ecrit les dernieres balises
	 * @param aExtraire
	 */
	public void ecrireBalisesTexte(String aExtraire){
		Pattern pa = Pattern.compile("\\] ?\n\\{(.*\n)+\\\\vfill"); //Pour recupere la zone concernee
		Matcher ma = pa.matcher(aExtraire);
		ma.find();
		String [] aux = ma.group().split("\n");//On split avec le retour chariot
		String tab = "";
		int cpt = 0;
		int num = 0;
		int nbitemize = 0;
		for(int i = 1; i < aux.length; ++i) {
			if(aux[i].equals("{") || aux[i].matches("\\{(.*)")){ //Ici on regarde si l'on est dans une
				cpt++;											//"zone d'ecriture" c à d entre deux 
				switch(cpt){									//accolades, on commence par verifier 
				case 1 :										//qu'on a une accolade ouvrante
					ecrire("<descriptionCourte>");break;
				case 2 :
					ecrire("<descriptionLongue>\n");break;
				case 3 :
					ecrire("<textePrerequis>\n");
					aux[i] = aux[i].substring(1);
					break;
				case 4 :
					ecrire("<objectifs>\n");
					if(!aux[i].equals("{"))
						aux[i] = aux[i].substring(1);
					break;
				case 5 :
					ecrire("<ressources>");break;
				case 6 :
					ecrire("<biblio>");break;
				}
			}
			if(aux[i].equals("} ")){ //Puis on verifie l'accolade fermante
				switch(cpt){
				case 1 :
					ecrire("</descriptionCourte>\n\n");break;
				case 2 :
					ecrire("</descriptionLongue>\n\n");break;
				case 3 :
					ecrire("</textePrerequis>\n\n");break;
				case 4 :
					ecrire("</objectifs>\n\n");break;
				}
			}
			//Et enfin on écrit ce qu'elles doivent contenir en traitant les cas particuliers de format
			if(!aux[i].equals("{") && !aux[i].equals("} ") 
					&& !aux[i].matches("%.*") && !aux[i].matches(" +")){
				switch(cpt) {
				case 1 : 
					if(aux[i].matches("(.*)\\} ?"))
						ecrire(aux[i].substring(0,aux[i].length()-1)+"</descriptionCourte>\n\n");
					else 
						ecrire(aux[i]);
					break;
				case 2 : 
					if(aux[i].equals("}"))
						ecrire("</descriptionLongue>\n\n");
					else {
						if(aux[i].matches("(.*)\\\\begin\\{enumerate\\} ?")) {
							num++;
						}
						else {
							if(aux[i].matches("(.*)\\\\end\\{enumerate\\} ?")) {
								num = 0;
							}
							else {
								if(aux[i].matches("(.*)\\\\begin\\{itemize\\} ?")){
									nbitemize++;
									tab = tab.replace(String.valueOf(num),"");
									tab=tab.concat("\t");
								}
								else {
									if(aux[i].matches("(.*)\\\\end\\{itemize\\} ?")){
										System.out.println(tab);
										tab = tab.substring(0,tab.length()-1);
										nbitemize--;
									}
									else {
										if(nbitemize == 0 && num != 0){
											tab = tab.concat(String.valueOf(num)+".");
											ecrire(tab+aux[i].replace("\\item", "")+"\n");
											tab=tab.replace(String.valueOf(num)+".","");
											num++;

										}
										else {
											if(aux[i].matches("(.*)\\\\item(.*)")) {
												aux[i] = aux[i].replace("\\item", "-");
												ecrire(tab+aux[i]+"\n");
											}
											else 
												ecrire(tab+aux[i]+"\n");
										}
									}
								}
							}
						}
					}
					break;
				case 3 :
					if(aux[i].matches("(.*)\\\\begin\\{itemize\\} ?")){
						tab=tab.concat("\t");
					}
					else 
						if(aux[i].matches("(.*)\\\\end\\{itemize\\} ?"))
							tab = tab.substring(0,tab.length()-1);
						else 
							if(aux[i].matches("(.*)\\}"))
								ecrire(tab+aux[i].substring(0,aux[i].length()-1)+"\n</textePrerequis>\n\n");
							else 
								if(aux[i].matches("(.*)\\} "))
									ecrire(tab+aux[i].substring(0,aux[i].length()-2)+"\n</textePrerequis>\n\n");
								else 
									ecrire(tab+aux[i].replace("\\item", "-")+"\n");
					break;
				case 4 : 
					if(aux[i].equals("}"))
						ecrire("</objectifs>\n\n");
					else {
						if(aux[i].matches("(.*)\\\\begin\\{itemize\\}(.*)")){
							tab=tab.concat("\t");
							Pattern p = Pattern.compile(".*\\\\begin\\{itemize\\}(.*)");
							Matcher m = p.matcher(aux[i]);
							m.find();
							if(m.group(1).matches("(.*)\\\\ObjItem(.*)")) {
								aux[i] = m.group(1).replace("\\ObjItem", "-");
								ecrire(tab+aux[i]+"\n");
							}
						}
						else 
							if(aux[i].matches("(.*)\\\\end\\{itemize\\}(.*)")){
								tab = tab.substring(0,tab.length()-1);
							}
							else
								if(aux[i].matches("(.*)\\\\ObjItem(.*)")) {
									if(aux[i].matches(" \\\\ObjItem(.*)"))
										aux[i] = aux[i].replace(" \\ObjItem", "-");
									else
										aux[i] = aux[i].replace("\\ObjItem", "-");
									ecrire(tab+aux[i]+"\n");
								}
								else 
									ecrire(tab+aux[i]+"\n");
					}
					break;
				}

				if(aux[i].matches("\\{(.*)\\} ?")){
					switch(cpt) {
					case 5 :
						ecrire(aux[i].substring(1,aux[i].length()-2)+"</ressources>\n\n");break;
					case 6 : 
						ecrire(aux[i].substring(1,aux[i].length()-2)+"</biblio>\n\n");break;
					}
				}

			}
		}
	}

	/**
	 * Applique toute les extraction pour construire le fichier XML en entier et ecrit le tous sur flux de sortie
	 * @param aExtraire : le contenu sur le quel on travail
	 */
	public void ecrireFichierXML(String aExtraire){
		ecrireModule(aExtraire);
		ecrireBalises(aExtraire);
		ecrireBalisesComposees(aExtraire);
		ecrireBalisesTexte(aExtraire);
		ecrire("</module>\n\n");
		envoyer();
	}
	
	//recupération des resultats de différentes parties pour tester les résultats 
	/*public static void main (String [] args){
		LectureFichier lf = new LectureFichier("./testFolder/1module.tex");
		EcritureFichier ecr = new EcritureFichier("./testFolder/1M_ecrModule.txt");
		EcritureFichier ecr1 = new EcritureFichier("./testFolder/1M_ecrBalise.txt");
		EcritureFichier ecr2 = new EcritureFichier("./testFolder/1M_ecrBaliseComposee.txt");
		EcritureFichier ecr3 = new EcritureFichier("./testFolder/1M_ecrBaliseText.txt");
		EcritureFichier ecr4 = new EcritureFichier("./testFolder/1M_ecrFichierXML.txt");
		String[] rez = lf.lireModule();
		
		ecr.ecrireModule(rez[0]);
		ecr1.ecrireBalises(rez[0]);
		ecr2.ecrireBalisesComposees(rez[0]);
		ecr3.ecrireBalisesTexte(rez[0]);
		ecr4.ecrireFichierXML(rez[0]);
		
		ecr.fermer();
		ecr1.fermer();
		ecr2.fermer();
		ecr3.fermer();
		ecr4.fermer();
	}*/
}
