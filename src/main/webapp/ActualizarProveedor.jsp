<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actualizar Proveedor</title>
<script>
	function enviarDatos() {
		
			var NIT = document.getElementById("txtNIT").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var direccion = document.getElementById("txtDireccion").value.trim();
			var telefono = document.getElementById("txtTelefono").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var sitioweb = document.getElementById("txtSitioweb").value.trim();

			// ESTE ES EL OBJETO HTTP DE LA CLASE XMLHTTP REQUEST
			var mensajero = new XMLHttpRequest();

			var url = 'http://localhost:8080/TiendaVirtualApp/actualizarProveedor';
			var params = "NIT=" + NIT + "&" + "nombre=" + nombre + "&"
					+ "direccion=" + direccion + "&" + "telefono=" + telefono + "&"
					+ "email=" + email + "&" + "sitioweb=" + sitioweb;
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

			var NIT = document.getElementById("txtNIT1").value.trim();

			// ESTE ES EL OBJETO HTTP DE LA CLASE XMLHTTP REQUEST
			var mensajero = new XMLHttpRequest();

			var url = 'http://localhost:8080/TiendaVirtualApp/eliminarProveedor';
			var params = "NIT=" + NIT;
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
		if (document.getElementById("txtNIT1").value.length == 0) {
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
		<tr>
			<td>Sitio Web</td>
			<td><input type="text" id="txtSitioweb" name="sitioweb"></input></td>
		</tr>
	</table>
	
	<br>
	<button onclick='enviarDatos()'>Actualizar Proveedor</button>
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
			<td>NIT</td>
			<td><input type="text" id="txtNIT1" name="NIT"></input></td>
		</tr>

	</table> 
	<br>
	
	<button onclick='enviarDatos1()'>Eliminar Proveedor</button>
</body>
</html>