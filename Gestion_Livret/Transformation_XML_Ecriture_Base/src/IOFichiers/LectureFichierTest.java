package IOFichiers;

import junit.framework.TestCase;

public class LectureFichierTest extends TestCase {
	
	private LectureFichier lfVide; //fichier vide de test
	private LectureFichier lf_1; // fichier avec un seul module
	private LectureFichier lf_10; // fichier avec 10 module
	
	//preparation des fichiers
	protected void setUp (){
		lf_1 = new LectureFichier ("./testFolder/1module.tex");
		lfVide = new LectureFichier("./testFolder/vide.tex");
		lf_10 = new LectureFichier ("./testFolder/10module.tex");
	}
	
	protected void tearDown(){
		lf_1.fermer();
		lfVide.fermer();
		lf_10.fermer();
	}
	
	
	//test de lecture 
	public void testLire(){
		setUp();
		assertEquals("\\module[codeApogee={UE 11}, ", lf_1.lire());
		assertEquals(null, lfVide.lire());
	}
	
	//test d'extraction de module
	public void testLireModule(){
		setUp();
		String [] rez_1m = lf_1.lireModule();
		assertEquals("Un seul Module",1, rez_1m.length);
		String [] rez_vide = lf_1.lireModule();
		assertEquals("Zero Module",0, rez_vide.length);
		String [] rez_10m = lf_10.lireModule();
		assertEquals("10 Module",10, rez_10m.length);
	}
	
	public static void main (String [] args){
		LectureFichierTest test = new LectureFichierTest();
		try {
			test.runTest();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
