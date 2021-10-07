package com.tiendavirtual.DTO;

import java.math.BigInteger;

public class Productos {

		private int idproductos;
		private Long codigo_producto;
		private String nombre_producto;
		private Long nitproveedor;
		private double precio_compra;
		private double ivacompra;
		private double precio_venta;
		public Productos(Long codigo_producto, String nombre_producto, Long nitproveedor, double precio_compra,
				double ivacompra, double precio_venta) {
			super();
			this.codigo_producto = codigo_producto;
			this.nombre_producto = nombre_producto;
			this.nitproveedor = nitproveedor;
			this.precio_compra = precio_compra;
			this.ivacompra = ivacompra;
			this.precio_venta = precio_venta;
		}
		public int getIdproductos() {
			return idproductos;
		}
		public void setIdproductos(int idproductos) {
			this.idproductos = idproductos;
		}
		public Long getCodigo_producto() {
			return codigo_producto;
		}
		public void setCodigo_producto(Long codigo_producto) {
			this.codigo_producto = codigo_producto;
		}
		public String getNombre_producto() {
			return nombre_producto;
		}
		public void setNombre_producto(String nombre_producto) {
			this.nombre_producto = nombre_producto;
		}
		public Long getNitproveedor() {
			return nitproveedor;
		}
		public void setNitproveedor(Long nitproveedor) {
			this.nitproveedor = nitproveedor;
		}
		public double getPrecio_compra() {
			return precio_compra;
		}
		public void setPrecio_compra(double precio_compra) {
			this.precio_compra = precio_compra;
		}
		public double getIvacompra() {
			return ivacompra;
		}
		public void setIvacompra(double ivacompra) {
			this.ivacompra = ivacompra;
		}
		public double getPrecio_venta() {
			return precio_venta;
		}
		public void setPrecio_venta(double precio_venta) {
			this.precio_venta = precio_venta;
		}
		
		

		
}
