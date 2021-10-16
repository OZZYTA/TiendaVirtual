<%@page import="java.sql.*"%>
<%@page import="com.tiendavirtual.DAO.Conexion"%>
<!doctype html>
<html>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
	background: #456;
	font-family: 'Open Sans', sans-serif;
}

.login {
	margin: auto;
	width: 50%;
	border: 1px solid blue;
	padding: 5px;
}

/* Reset top and bottom margins from certain elements */
.login-header, .login p {
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
	padding: 10px;
	font-size: 1em;
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
	padding: 6px;
	outline: 0;
	font-family: inherit;
	font-size: 1em;
}

.login input[type="text"], .login input[type="password"] {
	background: #fff;
	border-color: #bbb;
	color: #555;
}

/* Text fields' focus effect */
.login input[type="text"]:focus, .login input[type="password"]:focus {
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
<meta charset="utf-8">
<title>Venta de Productos</title>
<style type="text/css">
body {
	background-color: #F1EBFC;
	text-align: center;
}
</style>
</head>
<script>
function validateFields() {
	if (document.getElementById("cedula_cliente").value.trim().length == 0) {
		alert("El cedula_cliente no puede estar vacio.");
		return false;
	} else if (document.getElementById("producto1").value.trim().length == 0) {
		alert("El producto no puede estar vacio.");
		return false;
	} else if (document.getElementById("cantidad1").value.trim().length == 0) {
		alert("la cantidad no puede estar en blanco.");
		return false;
	}
	else {
		return true;
	}
}
</script>
<script>
function sendData() {
	if (validateFields()==false) {
		return;
	} else {
		var cedula_cliente = document.getElementById("cedula_cliente").value.trim();
		var valor_venta = document.getElementById("valor_venta").value.trim();
		var valor_iva = document.getElementById("valor_iva").value.trim();
		var valor_total = document.getElementById("valor_total").value.trim();

		var http = new XMLHttpRequest();
		var url = '/Grupo11Cucuta/ingresarVenta';
		var params = "cedula_cliente=" + cedula_cliente + "&" + "valor_venta=" + valor_venta + "&"
				+ "valor_iva=" + valor_iva + "&" + "valor_total=" + valor_total;
		http.open('POST', url, true);
		alert("Venta Registrada");
		//Send the proper header information along with the request
		http.setRequestHeader('Content-type','application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				//alert(http.responseText);
			}
		}
		http.send(params);
	}
}
</script>

<script>
//PRIMER PRODUCTO
function handleSelectChange(event) {

	var id = document.getElementById("cedula_cliente").value.trim();
	if (id.trim() == '') {
		id = "null";
	}
	var http = new XMLHttpRequest();
	var url = '/Grupo11Cucuta/consultarNombre';
	var params = "id=" + id;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');

	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {
			//alert(http.responseText);	
			document.getElementById("nombre").value=http.responseText;

		}
	}
	http.send(params);
	handleSelectChange1();
	
}

</script>
<script>
function handleSelectChange1() {

	var id = document.getElementById("cedula_cliente").value.trim();
	if (id.trim() == '') {
		id = "null";
	}
	var http = new XMLHttpRequest();
	var url = '/Grupo11Cucuta/consultarTelefono';
	var params = "id=" + id;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');

	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {
			//alert(http.responseText);	
			document.getElementById("telefono").value=http.responseText;

		}
	}
	http.send(params);
}

</script>
<script>
function ProductChange1(event) {

	var id = document.getElementById("producto1").value.trim();
	if (id.trim() == '') {
		id = "null";
	}
	var http = new XMLHttpRequest();
	var url = '/Grupo11Cucuta/consultarValorUnit';
	var params = "id=" + id;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');

	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {
			//alert(http.responseText);	
		    document.getElementById("valor_venta").value=http.responseText;

		}
	}
	http.send(params);
	ProductChange1y1();
	
}
</script>
<script>
function ProductChange1y1() {

	var id = document.getElementById("producto1").value.trim();
	if (id.trim() == '') {
		id = "null";
	}
	var http = new XMLHttpRequest();
	var url = '/Grupo11Cucuta/consultarIva';
	var params = "id=" + id;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');

	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {
			//alert(http.responseText);	
		    document.getElementById("valor_iva").value=http.responseText;

		}
	}
	http.send(params);
	
	
}
</script>
<script>
function setquanty(){
 // Do something 
 	var cantidad = document.getElementById("cantidad1").value.trim();
	var valor = document.getElementById("valor_venta").value.trim();	
	var iva = document.getElementById("valor_iva").value.trim();
	var total = (valor*cantidad)+(valor*cantidad*(iva/100));
	document.getElementById("valor_total").value=total;
	
}



</script>



<form>
	<div class="login">
		<h2 class="login-header"><img src="assets/logo.png"><br>Registro de Ventas</h2>

		Documento de Cliente:<select name="cedula_cliente" id="cedula_cliente"
			style="width: 250px" onchange="handleSelectChange(event)">
			<option value=""></option>
			<%
			try {
				String Query = "SELECT * FROM clientes ORDER BY cedula";
				Conexion conn = new Conexion();
				Statement stm = conn.getConecction().createStatement();
				ResultSet rs = stm.executeQuery(Query);
			
				while (rs.next()) {
			%>
			
			<option value="<%=rs.getInt("id")%>"><%=rs.getString("cedula")%></option>

			<%
			}
			} catch (Exception ex) {
			ex.printStackTrace();
			out.println("Error: " + ex.getMessage());
			}
			%>
		</select> <br>Nombre: <input type="text" id="nombre" autocomplete="on"
			size="10" readonly="readonly"> Teléfono: <input type="text"
			id="telefono" autocomplete="on" size="10" readonly="readonly">
	</div>
	<h2 class="login-header">Productos vendidos</h2>
	<h3>Producto:</h3>
	Nombre:<select class="form-control" id="producto1" style="width: 250px" onchange="ProductChange1(event)">
		<option value=""></option>
		<%
		try {
			String Query = "SELECT * FROM productos ORDER BY nombre_producto";
			Conexion conn = new Conexion();
			Statement stm = conn.getConecction().createStatement();
			ResultSet rs = stm.executeQuery(Query);
			while (rs.next()) {
		%>
		<option value="<%=rs.getInt("idproductos")%>"><%=rs.getString("nombre_producto")%></option>

		<%
		}
		} catch (Exception ex) {
		ex.printStackTrace();
		out.println("Error: " + ex.getMessage());
		}
		%>
	</select> Cantidad:<input name="cantidad1"  onchange="setquanty()" type="number" id="cantidad1"
		autocomplete="off" size="4" maxlength="3">Valor unitario:<input
		name="valor_venta" type="number" id="valor_venta" autocomplete="on"
		size="10" maxlength="10" readonly="readonly">Iva: <input
		name="valor_iva" type="number" id="valor_iva" autocomplete="on" size="4"
		maxlength="4" readonly="readonly">

	<h2>
		Total Factura: <input name="valor_total" type="text"
			id="valor_total" autocomplete="on" size="15">
	</h2>
	<form action="/Grupo11Cucuta/GestProveedor.jsp" method="post">
	 <button onclick="sendData()">Registrar Venta</button></td>
	</form>
	<div>
		<button onClick="window.print()">Imprimir</button>
	</div>
	<form action="/Grupo11Cucuta/index.jsp" method="post">
		<input type="submit" name="back" id="back" value="Atrás"> <br>
		<p style="font-size: xx-small">Ciclo 3 - Misión TIC 2022 - Grupo
			11 - Cúcuta</p>
	</form>
</form>

<body>
</body>
</html>
