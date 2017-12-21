package kr.co.vitamin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Test {
	static Connection connection = null;
	static Statement st = null;
	
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://35.187.220.189:3306/vitamin", "vitamin", "vita1234");
			st = connection.createStatement();
			
			asdfsdf();
			
			
			/*String sql;
			sql = "select * FROM table;";

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String sqlRecipeProcess = rs.getString("column명");
			}*/
		} catch (SQLException se1) {
			se1.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException se2) {
			}
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
	public static void asdfsdf() throws Exception {
		
		File file = new File("C:/Users/n4oah/Desktop/asdg.txt");
		FileInputStream fis = new FileInputStream(file);
		int i = 0;
		StringBuffer strBuffer = new StringBuffer();
		while((i = fis.read()) != -1) {
			strBuffer.append((char)i);
        }
        System.out.println(strBuffer.toString());
        
		st.close();
		connection.close();
	}
}