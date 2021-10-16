package com.tiendavirtual.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.tiendavirtual.DAO.*;
import com.tiendavirtual.DTO.Cliente;
import com.tiendavirtual.DTO.Proveedor;
import com.tiendavirtual.DTO.User;

public class ProveedorDAO {

	public void insertProveedor(Proveedor prov) {
		Conexion conex = new Conexion();
		try {
			Statement estatuto = conex.getConecction().createStatement();
			estatuto.executeUpdate("INSERT INTO proveedores(NIT, nombre, direccion, telefono, email, sitioweb) VALUES ('" + prov.getNIT() + "', '" + prov.getNombre()
					+ "', '" + prov.getDireccion() + "', '" + prov.getTelefono() + "', '" + prov.getEmail() + "', '"
					+ prov.getSitioweb() + "')");
			estatuto.close();
			conex.getConecction().close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void actualizarProveedor(Proveedor pro) {

		Conexion con = new Conexion();
		Statement stmt;
		try {
			stmt = con.getConecction().createStatement();
			stmt.executeUpdate(" UPDATE proveedores SET nombre = " + "'" + pro.getNombre() + "'" + ","
					+ " direccion = " + "'" + pro.getDireccion() + "'" + "," + " telefono =" + "'" + pro.getTelefono() + "'"
					+ "," + " email = " + "'" + pro.getEmail() + "'" + "," + " sitioweb =" + "'" + pro.getSitioweb() + "'" + " WHERE NIT = " + "'"
					+ pro.getNIT() + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	

public void eliminarProveedor(String NIT) {
		
		Conexion con = new Conexion();

		Statement stmt;
		try {
			stmt = con.getConecction().createStatement();
			stmt.executeUpdate("DELETE FROM proveedores WHERE NIT = "+"'"+NIT+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public ArrayList<Proveedor> consultarProveedores(String nit) {
		ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM proveedores ";
		if (!nit.trim().equals("null")) {
			sql = sql + "WHERE NIT = '" + nit + "'";
		}

		try {
			Statement consulta = conex.getConecction().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Proveedor prov = new Proveedor(res.getString("NIT"), res.getString("nombre"),
						res.getString("direccion"), res.getString("telefono"), res.getString("email"),
						res.getString("sitioweb"));
				proveedores.add(prov);
			}
			res.close();
			consulta.close();
			conex.getConecction().close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return proveedores;
	}
	
	
	public ArrayList<Proveedor> listarProveedor(){
		ArrayList<Proveedor> lstproveedor = new ArrayList<Proveedor>();
		Conexion con= new Conexion();
		try {
			PreparedStatement consulta= con.getConecction().prepareStatement("SELECT * FROM proveedor");
			ResultSet res= consulta.executeQuery();
			Proveedor registro= null;
			while (res.next()) {
				String NIT= res.getString(2);
				String no=res.getString(3);
				String di=res.getString(4);
				String te=res.getString(5);
				String em=res.getString(6);
				String si=res.getString(7);
				registro= new Proveedor(NIT, no, di, te, em, si);
				lstproveedor.add(registro);
			}
			res.close();
			consulta.close();
		}catch(Exception e) {
			System.out.println("NO HAY USUARIOS");
		}
		return lstproveedor;	
	}
 

}
