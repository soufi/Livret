import java.io.IOException;
import java.sql.SQLException;

import IOFichier.EcritureFichier;


public class Menu {

	public static void main(String[] args) throws SQLException, IOException {
		EcritureFichier EF = new EcritureFichier("test.html");
		//Valeur selon regroupement de promotions
		EF.ecrireListes(1);
		EF.ecrireModules(1);
		EF.ecrireFin();
		EF.envoyer();
	}
}