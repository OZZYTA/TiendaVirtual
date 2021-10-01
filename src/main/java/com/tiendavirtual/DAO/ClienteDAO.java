package com.tiendavirtual.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.DTO.Cliente;
import com.tiendavirtual.DTO.Proveedor;
import com.tiendavirtual.DTO.User;

public class ClienteDAO {

	public void insertCliente(Cliente cliente) {
		Conexion con= new Conexion();
		
		Statement stat;
		try {
			stat = con.getConecction().createStatement();
			stat.executeUpdate("INSERT INTO clientes(cedula, nombre, direccion, telefono, email) VALUES (" + "'" + cliente.getCedula() + "'" + ","
					+ "'" + cliente.getNombre() + "'" + ","
					+ "'" + cliente.getDireccion() + "'" + ","
					+ "'" + cliente.getTelefono() + "'" + ","
					+ "'" + cliente.getEmail() + "'" + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public User updateCliente(String cedula) {
	return null;
	}
	
	public void searchCliente() {
	
		
	}
	
	public ArrayList<Cliente> consultarClientes(String cedula) {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM clientes ";
		if (!cedula.trim().equals("null")) {
			sql = sql + "WHERE cedula = '" + cedula + "'";
		}

		try {
			Statement consulta = conex.getConecction().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Cliente cliente = new Cliente(res.getInt("cedula"), res.getString("nombre"),
						res.getString("direccion"), res.getInt("telefono"), res.getString("email"));
				clientes.add(cliente);
			}
			res.close();
			consulta.close();
			conex.getConecction().close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return clientes;
	}
	
	public ArrayList<Cliente> listarClientes(){
		ArrayList<Cliente> lstclientes = new ArrayList<Cliente>();
		Conexion con= new Conexion();
		try {
			PreparedStatement consulta= con.getConecction().prepareStatement("SELECT * FROM clientes");
			ResultSet res= consulta.executeQuery();
			Cliente registro= null;
			while (res.next()) {
				int ce= res.getInt(2);
				String no=res.getString(3);
				String di=res.getString(4);
				int te=res.getInt(5);
				String em=res.getString(6);
				registro= new Cliente(ce, no, di, te, em);
				lstclientes.add(registro);
			}
			res.close();
			consulta.close();
		}catch(Exception e) {
			System.out.println("NO HAY USUARIOS");
		}
		return lstclientes;	
	}
 
	public User deleteCliente(String cedula) {
		return null;		
	}
	
}
