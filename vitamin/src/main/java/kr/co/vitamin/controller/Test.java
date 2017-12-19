package kr.co.vitamin.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Test {
	public static void main(String[] args) {
		
		
		Connection connection = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://35.187.220.189:3306/vitamin", "vitamin", "vita1234");
			st = connection.createStatement();

			String url = "http://server/path/xml";
			
			String[] fieldNames ={"id", "title", "userName", "recommendId", "recommendName", "recommendDate", "url"};
			
			
			/*String sql;
			sql = "select * FROM table;";

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String sqlRecipeProcess = rs.getString("column명");
			}*/

//			rs.close();
			st.close();
			connection.close();
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
	public void asdfsdf() {
		
	}
}