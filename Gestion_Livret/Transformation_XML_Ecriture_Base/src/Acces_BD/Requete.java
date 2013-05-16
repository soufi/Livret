package Acces_BD;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
/**
 * Cette classe permet de faire des requêtes sur une base de données
 *Elle est aussi utilisée pour lire les requêtes créées par le XSL  et les insérer sur la base
 */
public class Requete {
	

	/**
	 * permet d'executer les requetes SQL contenu dans les fichiers .sql cree dans le dossier SQL/ avec l'execution d'un script shell
	 * @param repository : le repertoir contenant les fichiers sql avec les requetes
	 * @throws InterruptedException 
	 * @throws IOException 
	 */
	public static String execRequests(String repository) throws IOException, InterruptedException {
		//creatExec(); //creation du script shell
		if(repository != null){
			if(!repository.matches("(.*)/"))
				repository += "/";
			File rep = new File (repository);
			if(rep.exists() && rep.isDirectory()){
				//extraction de tous les fichier du dossier
				String [] files = rep.list();
				StringBuffer allFiles = new StringBuffer();
				File f;
				for (int i = 0 ; i < files.length ; i++){
					if(files[i].matches("Detail_..*_..*_..*.sql")){
						f = new File (files[i]);
						allFiles.append(f.getAbsolutePath()+" ");
					}
				}
				//execution des requetes avec le script shell 
				return execShellScript ("exec_requete.sh", allFiles);
			}
		}
		return "Dossier "+repository+" Inexistant";
	}
	
	/**
	 * Permet de Créer le fichier shell permettant d'executer les requetes d'un ou plusieurs fichier .sql
	 * @throws IOException 
	 */
	public static void creatExec() throws IOException{
		FileWriter fw = new FileWriter ("exec_requete.sh", false);
		BufferedWriter scriptBuf = new BufferedWriter(fw);
		
		//contenu du script
		scriptBuf.write("#/bin/sh");
		scriptBuf.newLine();
		scriptBuf.append("for i in $@");
		scriptBuf.newLine();
		scriptBuf.append("do");
		scriptBuf.newLine();
		scriptBuf.append("	echo \"Traitement du fichier : \".$i");
		scriptBuf.newLine();
		scriptBuf.append("	mysql -h localhost --user=root livret --password=root < $i");
		scriptBuf.newLine();
		scriptBuf.append("done");
		scriptBuf.newLine();
		
		scriptBuf.close();
		fw.close();
		//rendre le script executable, ajout de permission pour tous les utilisater afin de faciliter l'accés après
		File file = new File ("exec_requete.sh");
		file.setExecutable(true, false);

	}
	
	/**
	 * Permet d'executer un script shell à partir de son chemin
	 * @param file : le script a executer 
	 * @param param : le parametre du script
	 * @return String : contenant le retour de l'execution du script
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public static String execShellScript (String file , StringBuffer param) throws IOException, InterruptedException{
		File script = new File (file);
		if(!script.exists())
			return "Script incorrect, veuillez verifier le chemin : "+ script.getAbsolutePath();
		String response = "";
		String errors = "";
		ProcessBuilder pb;
		if(param == null || param.length() <= 0)
			return "Pas de Paramètres, impossible de lancer le processus .";
		else{
			//création d'un processus externe avec les paramètre d'execution d'un processus shell
			pb = new ProcessBuilder("bash", "-c", script.getAbsolutePath(), param.toString());
		}
		//redirection d'erreur du processus lancé vers la sortie standard de notre programme
		pb.redirectErrorStream(true); 
		Process shell = pb.start();
		InputStream shell_in = shell.getInputStream(); //redirection sortie standard
		InputStream shell_error = shell.getErrorStream(); //redirection sortie erreur
		//on attend la fin de l'execution du processus lancé pour communiquer le resultats
		int shellExitStatus = shell.waitFor();
		//si on a une erreur (code de retour different de 0)
		if(shellExitStatus != 0){
			System.out.println("Exit status : " + shellExitStatus);
			return null;
		}
		response = convertStreamToString(shell_in);
		errors = convertStreamToString(shell_error);
		if(!errors.isEmpty())
			response += "\nERR : "+errors;
	
		shell_in.close();
		return response;
	}
	
	
	/**
	 * Permet de convertir InputStream en String
	 * @param is
	 * @return String 
	 * @throws IOException
	 * @see http://www.dzone.com/snippets/convert-stream-string
	 */
	private static String convertStreamToString(InputStream is) throws IOException {
		if (is != null) {
			Writer writer = new StringWriter();
			char[] buffer = new char[1024];
			try {
				Reader reader = new BufferedReader(new InputStreamReader(is,"UTF-8"));
				int n;
				while ((n = reader.read(buffer)) != -1) {
					writer.write(buffer, 0, n);
				}
			} finally {		
				is.close();
			}
			return writer.toString();
		}else {
			return "";
		}
	}
}