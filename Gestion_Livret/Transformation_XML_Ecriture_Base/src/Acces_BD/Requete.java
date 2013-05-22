package Acces_BD;

import java.io.BufferedReader;
import java.io.File;
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
	 * @throws Exception 
	 */
	public static String execRequests(String repository) throws Exception {
		if(!repository.isEmpty()){
			File rep = new File (repository);
			if(rep.isDirectory())
				//execution des requetes avec le script shell 
				return execShellScript ("exec_requete.sh", rep.getAbsolutePath());
			else
				throw new Exception("impossible d'executer les requetes dossier inexistant ! ");
		}else
			throw new Exception("impossible d'executer les requetes dossier inexistant ! ");
	}
	
	
	/**
	 * Permet d'executer un script shell à partir de son chemin
	 * @param file : le script a executer 
	 * @param param : le parametre du script
	 * @return String : contenant le retour de l'execution du script
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public static String execShellScript (String file , String param) throws IOException, InterruptedException{
		File script = new File (file);
		if(!script.exists())
			return "Script incorrect, veuillez verifier le chemin : "+ script.getAbsolutePath();
		String process_in = "";
		String process_errors = "";
		ProcessBuilder pb;
		//sans parametres
		if(param == null || param.length() == 0)
			pb = new ProcessBuilder("/bin/bash", "-c", script.getAbsolutePath());
		//avec parametres
		else{
			//création d'un processus externe avec les paramètre d'execution d'un processus shell
			pb = new ProcessBuilder("/bin/bash", "-c", script.getAbsolutePath()+" "+param);
		}
		//redirection d'erreur du processus lancé vers la sortie standard de notre programme
		pb.redirectErrorStream(true); 
		Process shell = pb.start();
		InputStream shell_in = shell.getInputStream();
		InputStream shell_error = shell.getErrorStream(); //redirection sortie erreur
		//on attend la fin de l'execution du processus lancé pour communiquer le resultats
		int shellExitStatus = shell.waitFor();
		//si on a une erreur (code de retour different de 0)
		if(shellExitStatus != 0){
			System.out.println("Exit status : " + shellExitStatus);
		}
		process_in = convertStreamToString(shell_in);
		process_errors = convertStreamToString(shell_error);
		if(!process_errors.isEmpty())
			process_in += "\nERRORS : "+process_errors;
	
		shell_in.close();
		shell_error.close();
		return "PROCESS :\n"+process_in;
	}
	
	
	/**
	 * Permet de convertir InputStream en String
	 * @param is
	 * @return String 
	 * @throws IOException
	 * @see http://www.dzone.com/snippets/convert-stream-string
	 */
	private static String convertStreamToString(InputStream is) throws IOException {
		if (is != null && is.available() != 0) {
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