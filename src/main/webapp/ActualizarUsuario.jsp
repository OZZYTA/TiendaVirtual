<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
  background: #456;
  font-family: 'Open Sans', sans-serif;
}

.login {
  margin: auto;
  width: 70%;
  border: 3px solid blue;
  padding: 10px;
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
<meta charset="UTF-8">
<title>Actualizar Usuario</title>
<style type="text/css">
body {
    background-color: #F1EBFC;
    text-align: center;
}
</style>
<script>
	function enviarDatos() {
		
			var cedula = document.getElementById("txtCedula").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var usuario = document.getElementById("txtUsername").value.trim();
			var password = document.getElementById("txtPassword").value.trim();

			// ESTE ES EL OBJETO HTTP DE LA CLASE XMLHTTP REQUEST
			var mensajero = new XMLHttpRequest();

			var url = '/Grupo11Cucuta/actualizarUsuario';
			var params = "cedula=" + cedula + "&" + "nombre=" + nombre + "&"
					+ "email=" + email + "&" + "username=" + usuario + "&"
					+ "password=" + password;
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

			var url = '/Grupo11Cucuta/eliminarUsuario';
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
<table width="auto" class="login">
  <tbody>
   <tr>
      <td colspan="2" bgcolor="#2288DD"><p class="login-header">&nbsp;</p>
      <p class="login-header"><img src="assets/logo.png"></p></td>
    </tr>
    <tr>
      <td valign="top"><h2 class="login-header">  Actualización de Usuarios</h2>
        <p>Cedula
          <input type="text" id="txtCedula" name="txtCedula">
          </input>
          Nombre
          <input type="text" id="txtNombre" name="nombre">
          </input>
          Email
          <input type="text" id="txtEmail" name="email">
          </input>
          Usuario
          <input type="text" id="txtUsername" name="username">
          </input>
          Password
          <input type="password" id="txtPassword" name="password">
          </input>
        </p>
      <p>
        <button onclick='enviarDatos()'>Actualizar Usuario</button>
      </p></td>
      <td valign="top">
        <h2 class="login-header">Eliminar Usuario</h2>
        <p>Cedula
  <input type="text" id="txtCedula1" name="cedula">
        </p>
      <p>
        <button onclick='enviarDatos1()'>Eliminar Usuario</button>
      </p></td>
    </tr>
    <tr valign="middle">
      <td colspan="2"><p>
       <br><form action="/Grupo11Cucuta/GestUsuarios.jsp" method="post">
    <input type="submit" name="back" id="back" value="Atrás">
    <br><p style="font-size:xx-small ">Ciclo 3 - Misión TIC 2022 - Grupo 11 - Cúcuta</p></td>
    </tr>
  </tbody>
</table>
</body>
</html>