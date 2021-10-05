package com.tiendavirtual.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.DTO.Productos;
import com.tiendavirtual.DTO.Proveedor;


public class ProductosDAO {
	
	public void insertProducto(Productos pro) {
		Conexion conex = new Conexion();
		try {
			Statement estatuto = conex.getConecction().createStatement();
			estatuto.executeUpdate("INSERT INTO productos(codigo_producto, nombre_producto, nitproveedor, precio_compra, ivacompra, precio_venta) VALUES ('" + (pro.getCodigo_producto()) + "', '" + pro.getNombre_producto()
					+ "', '" + pro.getNitproveedor() + "', '" + pro.getPrecio_compra() + "', '" + pro.getIvacompra()+ "', '"
					+ pro.getPrecio_venta() + "')");
			estatuto.close();
			conex.getConecction().close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	public ArrayList<Productos> consultarProductos(int codigo_producto) {
		ArrayList<Productos> producto = new ArrayList<Productos>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM productos ";
		String codigo= Integer.toString(codigo_producto);
		if (!codigo.trim().equals("null")) {
			sql = sql + "WHERE codigo_producto = '" + codigo_producto + "'";
		}

		try {
			Statement consulta = conex.getConecction().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Productos pro = new Productos(res.getInt("codigo_producto"), res.getString("nombre_producto"),
						res.getInt("nitproveedor"), res.getInt("precio_compra"), res.getInt("ivacompra"),
						res.getInt("precio_venta"));
				producto.add(pro);
			}
			res.close();
			consulta.close();
			conex.getConecction().close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar el producto\n" + e);
		}
		return producto;
	}


}
