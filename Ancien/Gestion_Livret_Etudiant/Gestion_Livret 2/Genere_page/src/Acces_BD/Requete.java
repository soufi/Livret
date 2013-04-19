package Acces_BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Requete {
	
	/**
	 * Cette classe permet de faire des requêtes sur une base de données
	 */
	
	Connection laConnection;
	Statement transmission;


	public Requete() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

			laConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/livret","gss_user","Stag05!");

			transmission = laConnection.createStatement();
		}
		
		
		catch (Exception e) {
		}
	}
	
	public ResultSet executer(String sql){
		try {
			return transmission.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
