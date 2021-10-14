package com.tiendavirtual.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.DTO.Productos;

public class Ajax {
	
	
	public ArrayList<Productos> productosVentas() {		
		ArrayList<Productos> producto = new ArrayList<Productos>();
		Conexion conex = new Conexion();

		String sql = "SELECT nombre_producto FROM productos ORDER BY nombre_producto";

		try {
			Statement consulta = conex.getConecction().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Productos pro = new Productos(res.getLong("codigo_producto"), res.getString("nombre_producto"),
						res.getLong("nitproveedor"), res.getDouble("precio_compra"), res.getDouble("ivacompra"),
						res.getDouble("precio_venta"));
				producto.add(pro);
			}
			res.close();
			consulta.close();
			conex.getConecction().close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "NO!" + e);
		}
		return producto;
	}

}
