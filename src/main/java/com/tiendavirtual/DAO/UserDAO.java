package com.tiendavirtual.DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.swing.JOptionPane;

import com.tiendavirtual.DTO.Proveedor;
import com.tiendavirtual.DTO.User;

public class UserDAO {

	public void insertUser(User user) {
		Conexion con = new Conexion();

		Statement stat;
		try {
			stat = con.getConecction().createStatement();
			stat.executeUpdate("INSERT INTO usuarios(cedula, email, nombre, password, username) VALUES (" + "'"
					+ user.getCedula() + "'" + "," + "'" + user.getEmail() + "'" + "," + "'" + user.getNombre() + "'"
					+ "," + "'" + user.getPassword() + "'" + "," + "'" + user.getUsername() + "'" + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void actualizarUsuario(User user) {

		Conexion con = new Conexion();
		Statement stmt;
		try {
			stmt = con.getConecction().createStatement();
			stmt.executeUpdate(" UPDATE usuarios SET nombre = " + "'" + user.getNombre() + "'" + ","
					+ " email = " + "'" + user.getEmail() + "'" + "," + " username =" + "'" + user.getUsername() + "'"
					+ "," + " password = " + "'" + user.getPassword() + "'" + " WHERE cedula = " + "'"
					+ user.getCedula() + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	
		

	public void searchUser() {

	}

public void eliminarUsuario(String cedula) {
		
		Conexion con = new Conexion();

		Statement stmt;
		try {
			stmt = con.getConecction().createStatement();
			stmt.executeUpdate("DELETE FROM usuarios WHERE cedula = "+"'"+cedula+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<User> listarUser() {
		ArrayList<User> lstusers = new ArrayList<User>();
		Conexion con = new Conexion();
		try {
			PreparedStatement consulta = con.getConecction().prepareStatement("SELECT * FROM usuarios");
			ResultSet res = consulta.executeQuery();
			User registro = null;
			while (res.next()) {
				int ce = res.getInt(2);
				String no = res.getString(3);
				String em = res.getString(4);
				String us = res.getString(5);
				String pa = res.getString(6);
				registro = new User(ce, no, em, us, pa);
				lstusers.add(registro);
			}
			res.close();
			consulta.close();
		} catch (Exception e) {
			System.out.println("NO HAY USUARIOS");
		}
		return lstusers;
	}

	// Consultar Usuarios
	public ArrayList<User> consultarUsuarios(String cedula) {
		ArrayList<User> usuarios = new ArrayList<User>();
		Conexion conex = new Conexion();

		String sql = "SELECT cedula, nombre, email, username, password FROM usuario ";
		if (!cedula.trim().equals("null")) {
			sql = sql + "WHERE cedula = '" + cedula + "'";
		}

		try {
			Statement consulta = conex.getConecction().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				User user = new User(res.getInt("cedula"), res.getString("nombre"), res.getString("email"),
						res.getString("username"), res.getString("password"));
				usuarios.add(user);
			}
			res.close();
			consulta.close();
			conex.getConecction().close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return usuarios;
	}

	public User checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
		Conexion con = new Conexion();
		User result = null;

		try {
			Statement stmt = con.getConecction().createStatement();
			String sql = "SELECT * FROM usuarios WHERE username = '" + username + "' AND password='" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				int ce = rs.getInt("cedula");
				String no = rs.getString("nombre");
				String em = rs.getString("email");
				String us = rs.getString("username");
				String pa = rs.getString("password");
				result = new User(ce, no, em, us, pa);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.print("Usuario o clave incorrecto.");
		}
		return result;
	}
}