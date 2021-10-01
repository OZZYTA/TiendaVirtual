package com.tiendavirtual.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

public class Conexion {
	private String bd = "tienda_virtual";
	private String login = "root";
	private String pass = "admin";
	private String url = "jdbc:mysql://localhost/" + bd;
	
	public Connection getConecction() {
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, login, pass);
			if (con != null) {
				System.out.println("Conexion a base de datos" + bd + " OK\n");
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return con;
	}

}
