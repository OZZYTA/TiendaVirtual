package com.tiendavirtual.DAO;

import java.sql.SQLException;
import java.sql.Statement;

import com.tiendavirtual.DTO.User;
import com.tiendavirtual.DTO.Ventas;

public class VentasDAO {

	
	public void insertVenta(Ventas venta) {
		Conexion con= new Conexion();
		
		Statement stat;
		try {
			stat = con.getConecction().createStatement();
			stat.executeUpdate("INSERT INTO ventas(cedula_cliente, valor_venta, valor_iva, valor_total) VALUES (" + "'" + venta.getCedula_cliente() + "'" + ","
					+ "'" + venta.getValor_venta() + "'" + ","
					+ "'" + venta.getValor_iva() + "'" + ","
					+ "'" + venta.getValor_total() + "'"+ ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
