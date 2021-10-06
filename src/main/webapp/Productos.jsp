<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
  background: #456;
  font-family: 'Open Sans', sans-serif;
}

.login {
  width: 400px;
  margin: 16px auto;
  font-size: 16px;
}

/* Reset top and bottom margins from certain elements */
.login-header,
.login p {
  margin-top: 0;
  margin-bottom: 0;
}

/* The triangle form is achieved by a CSS hack */
.login-triangle {
  width: 0;
  margin-right: auto;
  margin-left: auto;
  border: 12px solid transparent;
  border-bottom-color: #28d;
}

.login-header {
  background: #28d;
  padding: 20px;
  font-size: 1.4em;
  font-weight: normal;
  text-align: center;
  text-transform: uppercase;
  color: #fff;
}

.login-container {
  background: #ebebeb;
  padding: 12px;
}

/* Every row inside .login-container is defined with p tags */
.login p {
    padding: 12px;
    font-size: 9px;
}

.login input {
  box-sizing: border-box;
  display: block;
  width: 100%;
  border-width: 1px;
  border-style: solid;
  padding: 16px;
  outline: 0;
  font-family: inherit;
  font-size: 0.95em;
}

.login input[type="text"],
.login input[type="password"] {
  background: #fff;
  border-color: #bbb;
  color: #555;
}

/* Text fields' focus effect */
.login input[type="text"]:focus,
.login input[type="password"]:focus {
  border-color: #888;
}

.login input[type="submit"] {
  background: #28d;
  border-color: transparent;
  color: #fff;
  cursor: pointer;
}

.login input[type="submit"]:hover {
  background: #17c;
}

/* Buttons' focus effect */
.login input[type="submit"]:focus {
  border-color: #05a;
}
    </style>
	
<head>
<title>Registro Productos</title>
<meta charset="utf-8">
<style type="text/css">
body {
    background-color: #F1EBFC;
    text-align: center;
}
</style>
</head>


<script>
	function validateFields() {
		if (document.getElementById("codigo_producto").value.trim().length == 0) {
			alert("El codigo no puede ser vacio.");
			return false;
		} else if (document.getElementById("nombre_producto").value.trim().length == 0) {
			alert("El nombre no puede ser vacio.");
			return false;
		} else if (document.getElementById("nitproveedor").value.trim().length == 0) {
			alert("El NIT no puede ser vacia.");
			return false;
		} else if (document.getElementById("precio_compra").value.trim().length == 0) {
			alert("El precio de compra no puede ser vacio.");
			return false;
		}  else if (document.getElementById("ivacompra").value.trim().length == 0) {
			alert("El IVA de compra no puede ser vacio.");
			return false;
		}else if (document.getElementById("precio_venta").value.trim().length == 0) {
			alert("El Precio de venta no puede ser vacio.");
			return false;
		}
		else {
			return true;
		}
	}

	function sendData() {
		if (validateFields()==false) {
			return;
		} else {
			var codigo_producto = document.getElementById("codigo_producto").value.trim();
			var nombre_producto = document.getElementById("nombre_producto").value.trim();
			var nitproveedor = document.getElementById("nitproveedor").value.trim();
			var precio_compra = document.getElementById("precio_compra").value.trim();
			var ivacompra = document.getElementById("ivacompra").value.trim();
			var precio_venta = document.getElementById("precio_venta").value.trim();

			var http = new XMLHttpRequest();
			var url = 'http://localhost:8080/TiendaVirtualApp/registrarProducto';
			var params = "codigo_producto=" + codigo_producto + "&" + "nombre_producto=" + nombre_producto + "&"
					+ "nitproveedor=" + nitproveedor + "&" + "precio_compra=" + precio_compra
					+ "&" + "ivacompra=" + ivacompra+ "&" + "precio_venta=" + precio_venta;
			http.open('POST', url, true);
			alert("Producto Registrado");
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type','application/x-www-form-urlencoded');

			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
				}
			}
			http.send(params);
		}
	}
</script>


<body>
<div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Registrar Producto</h2>

  <form class="registry-container">
	  <p><input type="number" name="codigo" id="codigo_producto" placeholder="Codigo del Producto"></p>
    <p><input type="text" name="nombre" id="nombre_producto" placeholder="Nombre del Producto"></p>
    <p><input type="number" name="direccion" id="nitproveedor" placeholder="Nit del proveedor (sin digito de verificación)"></p>
	  <p><input type="number" name="preciocompra" id="precio_compra" placeholder="Precio de compra"></p>
	  <p><input type="number" name="iva" id="ivacompra" placeholder="IVA de compra"></p>
	  <p><input type="number" name="precioventa" id="precio_venta" placeholder="Precio de Venta"></p>
   <button onclick="sendData()">Registrar Producto</button></td>
  </form>
     <form class="registry-container" action="/TiendaVirtualApp/GestProductos.jsp" method="post">
    <p><input type="submit" name="back" id="back" value="Atrás"></p>
    <p style="font-size:xx-small ">Ciclo 3 - Misión TIC 2022 - Grupo 11</p>
  </form>
</div>
</body>
</html>
