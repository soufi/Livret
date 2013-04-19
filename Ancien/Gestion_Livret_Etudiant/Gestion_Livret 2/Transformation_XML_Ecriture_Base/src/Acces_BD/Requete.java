package Acces_BD;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.MysqlDataTruncation;

import IOFichiers.LectureFichier;

public class Requete {
	/**
	 * Cette classe permet de faire des requêtes sur une base de données
	 *Elle est aussi utilisée pour lire les requêtes créées par le XSL  et les insérer sur la base
	 */
	Connection laConnection;
	Statement transmission;
	ResultSet leResultat;

	public Requete() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

			laConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/livret","gss_user","Stag05!");

			transmission = laConnection.createStatement();
		}


		catch (Exception e) {
		}
	}

	//Execute les requetes d'insertion
	public void executerInsert(String sql){
		try {
			transmission.executeUpdate(sql);
		} catch (MysqlDataTruncation e) {
			System.out.println("\nUne donnée ne respecte pas la limite du nombre de caractères imposée par la base.");
			System.out.println("Voici la requete qui a posé problème : "+sql);
		} catch (SQLException e) {
			/*System.out.println("\nLa transformation en requete SQL a renvoyé une erreur, " +
					"veuillez vérifier qe le fichier Detail_Info_*.tex respecte bien " +
					"le format de données de la base. ");
			System.out.println("Voici la requete qui a posé problème : "+sql);*/
			//System.out.println(sql);
			e.printStackTrace();
			//System.out.print(" ");
		}
	}

	//Execute les requetes de séléction
	public ResultSet executerSelect(String sql){
		try {
			return transmission.executeQuery(sql);
		} catch (MysqlDataTruncation e) {
			System.out.println("\nUne donnée ne respecte pas la limite du nombre de caractères imposée par la base.");
		} catch (SQLException e) {
			System.out.println("\nLa transformation en requete SQL a renvoyé une erreur, " +
					"veuillez vérifier qe le fichier Detail_Info_*.tex respecte bien " +
					"le format de données de la base. ");
		}
		return null;
	}

	//Permet de lire les requetes créées avec le fichier XSL
	public String lireRequete(LectureFichier LF){
		String res="";
		do{
			res +=LF.lire();
		}
		while(!res.matches("(.*)\\);$"));

		return res;
	}

	//Fonction qui écrit les données du XML dans la base
	public ArrayList<String> ecrireDonnees(String fichier) {
		ArrayList<String> ens_crees = new ArrayList<String>();
		ResultSet R;
		LectureFichier LF = new LectureFichier(fichier);
		String [] ens;
		String email_ens;
		File f = new File(fichier);

		if(f.length() > 0){
			String ligne = lireRequete(LF);

			try {
				//R = executerSelect("select _ID_PROMO_ from com_module where _NOM_PROMO_ = "+module);
				//R.next();
				while(ligne!=null){
					//On éxécute les trois premieres requetes
					executerInsert(ligne);
					executerInsert(lireRequete(LF));
					String req = lireRequete(LF);
					while(req.matches("insert into livret_pre_requis (.*)")){
						executerInsert(req);
						req = lireRequete(LF);
					}
					//executerInsert(lireRequete(LF));
					executerInsert(req);

					ens = LF.lire().split(" "); //On recupere le nom et le prenom de l'enseignant
					for(int i = 2;i<ens.length;++i)
						ens[1]+=" "+ens[i];

					email_ens = LF.lire(); //On recupere son adresse e-mail

					//On vérifie que le responsable n'est pas déjà dans la base en faisant une requete de séléction 
					//sur son nom et son prénom fournis dans le fichier
					req = "select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = \'"+ens[1]+"\' " +
							"and _PRENOM_ENS_ = \'"+ens[0]+"\';"; 
					R = executerSelect(req);

					if(!R.next()){ //Si la requete de séléction est vide (c à d si l'enseignant n'existe pas dans la table)

						//On insére l'enseignant dans la base
						req = "insert into livret_enseignant (_ID_ENS_, _NOM_ENS_,_PRENOM_ENS_,_EMAIL_ENS_)"+
								" values (NULL,\'"
								+ens[1]+"\',\'"+ens[0]+"\',\'"+email_ens+"\');";
						executerInsert(req);

						ens_crees.add(ens[0]+" "+ens[1]); //On enregistre l'enseignant cree
					}


					//Insertion dans la table responsable_module pour le premier responsable
					req = "insert into livret_responsable_module (_ID_MOD_ , _ID_ENS_) " +
							"values( (select MAX(_ID_MOD_) from livret_module) ," +
							"(select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = \'" +
							ens[1].toUpperCase()+"\' AND _PRENOM_ENS_ = \'"+
							ens[0]+"\'));";
					executerInsert(req);

					ligne = LF.lire();

					//S'il y a un deuxieme responsable
					if(ligne!=null)
						if(!ligne.matches("insert (.*)")){
							ens = ligne.split(" ");
							for(int i = 2;i<ens.length;++i)
								ens[1]+=" "+ens[i];

							req = "select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = \'"+ens[1]+"\' " +
									"and _PRENOM_ENS_ = \'"+ens[0]+"\';"; 
							R = executerSelect(req);
							email_ens = LF.lire();
							//Si ce responsable n'est pas déjà dans la base
							if(!R.next()){
								//On insére l'enseignant dans la base
								req = "insert into livret_enseignant (_ID_ENS_,_NOM_ENS_,_PRENOM_ENS_,_EMAIL_ENS_)"
										+" values (NULL,\'"
										+ens[1]+"\',\'"+ens[0]+"\',\'"+LF.lire()+"\');";
								executerInsert(req);

								ens_crees.add(ens[0]+" "+ens[1]); //On enregistre l'enseignant creer
							}

							//On insére le deuxieme responsable dans la base
							req = "insert into livret_responsable_module (_ID_MOD_ , _ID_ENS_ ) " +
									"values( (select MAX(_ID_MOD_) from livret_module) ," +
									"(select _ID_ENS_ from livret_enseignant where _NOM_ENS_ = \'" +
									ens[1].toUpperCase()+"\' AND _PRENOM_ENS_ = \'"+
									ens[0]+"\'));";
							executerInsert(req);
							ligne = LF.lire();
						}
				}
			} catch (MysqlDataTruncation e) {
				System.out.println("Une donnée ne respecte pas la limite du nombre de caractères imposée par la base.");
			} catch (SQLException e) {
				/*System.out.println("La transformation en requete SQL a renvoyé une erreur, " +
						"veuillez vérifier qe le fichier Detail_Info_*.tex en cours de traitement respecte bien " +
						"le format de données de la base. ");*/
				e.printStackTrace();
			}
		}
		return ens_crees;
	}
}