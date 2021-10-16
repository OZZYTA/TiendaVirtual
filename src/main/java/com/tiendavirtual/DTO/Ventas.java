package com.tiendavirtual.DTO;

public class Ventas {

	public int codigo_venta;
	public String cedula_cliente;
	public double valor_venta;
	public double valor_iva;
	public double valor_total;
	public Ventas(int codigo_venta, String cedula_cliente, double valor_venta, double valor_iva, double valor_total) {
		super();
		this.codigo_venta = codigo_venta;
		this.cedula_cliente = cedula_cliente;
		this.valor_venta = valor_venta;
		this.valor_iva = valor_iva;
		this.valor_total = valor_total;
	}
	public String getCedula_cliente() {
		return cedula_cliente;
	}
	public void setCedula_cliente(String cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}
	public double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(double valor_venta) {
		this.valor_venta = valor_venta;
	}
	public double getValor_iva() {
		return valor_iva;
	}
	public void setValor_iva(double valor_iva) {
		this.valor_iva = valor_iva;
	}
	public double getValor_total() {
		return valor_total;
	}
	public void setValor_total(double valor_total) {
		this.valor_total = valor_total;
	}
	
	
}
