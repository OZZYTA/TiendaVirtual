package com.tiendavirtual.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

public class Conexion {
	/*
	private String login = "root";
	private String pass = "admin";
	private String url = "jdbc:mysql://localhost/" + bd;
	*/
	
	private String bd = "Grupo11Cucuta";
	private String login = "admin";
	private String pass = "MisionTIC2022GRUPO11";
	private String url = "jdbc:mysql://misiontic2022grupo11.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + bd;
	
	public Connection getConecction() {
		Connection con=null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, login, pass);
			if (con != null) {
				System.out.println("Conexion a base de datos" + bd + " OK\n");
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return con;
	}

}