package com.tiendavirtual.DAO;

import java.sql.ResultSet;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
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
	
	
	public ArrayList<Productos> consultarProductos(long codigo_producto) {
		ArrayList<Productos> producto = new ArrayList<Productos>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM productos ";
		if (!(codigo_producto==0)) {
			sql = sql + "WHERE codigo_producto = '" + codigo_producto + "'";
		}

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
			JOptionPane.showMessageDialog(null, "no se pudo consultar el producto\n" + e);
		}
		return producto;
	}
	
	public void FileUpload (File archivo){
		try {
			FileReader fr=new FileReader(archivo);
			BufferedReader br= new BufferedReader(fr);
			String linea="";
			while((linea=br.readLine())!=null) {
				String[] tokens=linea.split(",");
				Productos P = new Productos(Long.parseLong(tokens[1]),tokens[2],Long.parseLong(tokens[3]),Double.parseDouble(tokens[4]),Double.parseDouble(tokens[5]),Double.parseDouble(tokens[6]));
				insertProducto(P);
			}
			br.close();
			fr.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Productos> listarProductos() {
		ArrayList<Productos> producto = new ArrayList<Productos>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM productos ORDER BY nombre_producto";

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
	
	public double ValorUnitario(int id) {
		double valorunitario=0;
		Conexion con = new Conexion();
		try {
			Statement consulta = con.getConecction().createStatement();
			ResultSet res = consulta.executeQuery("SELECT precio_compra FROM productos WHERE idproductos = '"+id+"'");
			res.next();
			valorunitario = res.getDouble("precio_compra");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return valorunitario;
	}
	
	public double ValorIva(int id) {
		double ivacompra=0;
		Conexion con = new Conexion();
		try {
			Statement consulta = con.getConecction().createStatement();
			ResultSet res = consulta.executeQuery("SELECT ivacompra FROM productos WHERE idproductos = '"+id+"'");
			res.next();
			ivacompra = res.getDouble("ivacompra");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ivacompra;
	}


}
