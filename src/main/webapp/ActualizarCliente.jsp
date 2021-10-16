<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actualizar Cliente</title>
<script>
	function enviarDatos() {

		var cedula = document.getElementById("txtCedula").value.trim();
		var nombre = document.getElementById("txtNombre").value.trim();
		var direccion = document.getElementById("txtDireccion").value.trim();
		var telefono = document.getElementById("txtTelefono").value.trim();
		var email = document.getElementById("txtEmail").value.trim();

		// ESTE ES EL OBJETO HTTP DE LA CLASE XMLHTTP REQUEST
		var mensajero = new XMLHttpRequest();

		var url = 'http://localhost:8080/TiendaVirtualApp/actualizarCliente';
		var params = "cedula=" + cedula + "&" + "nombre=" + nombre + "&"
				+ "direccion=" + direccion + "&" + "telefono=" + telefono + "&"
				+ "email=" + email;
		mensajero.open('POST', url, true);

		//Send the proper header information along with the request
		mensajero.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
		mensajero.onreadystatechange = function() {//Call a function when the state changes.
			if (mensajero.readyState == 4 && mensajero.status == 200) {
				alert(mensajero.responseText);
			}
		}
		mensajero.send(params);

		return;
	}
</script>
<script>
	function enviarDatos1() {
		if (validarDatos()) {

			var cedula = document.getElementById("txtCedula1").value.trim();

			// ESTE ES EL OBJETO HTTP DE LA CLASE XMLHTTP REQUEST
			var mensajero = new XMLHttpRequest();

			var url = 'http://localhost:8080/TiendaVirtualApp/eliminarCliente';
			var params = "cedula=" + cedula;
			mensajero.open('POST', url, true);

			//Send the proper header information along with the request
			mensajero.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			mensajero.onreadystatechange = function() {//Call a function when the state changes.
				if (mensajero.readyState == 4 && mensajero.status == 200) {
					alert(mensajero.responseText);
				}
			}
			mensajero.send(params);

		} else {
			alert("Algo anda mal")

		}

		return;
	}
	function validarDatos() {
		if (document.getElementById("txtCedula1").value.length == 0) {
			alert("El campo cedula esta vacio!")
			return false;

		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>Cedula</td>
			<td><input type="text" id="txtCedula" name="cedula"></input></td>
		</tr>
		<tr>
			<td>Nombre</td>
			<td><input type="text" id="txtNombre" name="nombre"></input></td>
		</tr>
		<tr>
			<td>Direccion</td>
			<td><input type="text" id="txtDireccion" name="direccion"></input></td>
		</tr>
		<tr>
			<td>Telefono</td>
			<td><input type="text" id="txtTelefono" name="telefono"></input></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" id="txtEmail" name="email"></input></td>
		</tr>
	</table>

	<br>
	<button onclick='enviarDatos()'>Actualizar Cliente</button>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table border="1">
		<tr>
			<td>Cedula</td>
			<td><input type="text" id="txtCedula1" name="cedula"></input></td>
		</tr>

	</table>
	<br>

	<button onclick='enviarDatos1()'>Eliminar Cliente</button>
</body>
</html>