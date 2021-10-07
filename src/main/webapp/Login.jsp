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
<title>Iniciar Sesión</title>
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
		if (document.getElementById("username").value.trim().length == 0) {
			alert("El Nombre de usuario no puede ser vacio.");
			return false;
		} else if (document.getElementById("password").value.trim().length == 0) {
			alert("La contraseña no puede estar en blanco.");
			return false;
		} else {
			return true;
		}
	}

	function sendData() {
		if (!validateFields()) {
			return;
		} else {
			var username = document.getElementById("username").value.trim();
			var password = document.getElementById("password").value.trim();

			var http = new XMLHttpRequest();
			var url = 'http://localhost:8080/TiendaVirtualApp/login';
			var params = "username=" + username + "&" + "password=" + password;
			http.open('POST', url, true);

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
  
  <h2 class="login-header"><img src="assets/logo.png"><br>Iniciar Sesión</h2>

  <form class="login-container">
    <p><input type="text" name="username" id="username" placeholder="Usuario"></p>
    <p><input type="password" name="password" id="password" placeholder="Contraseña"></p>
    <p><td><button onclick="sendData()">Iniciar Sesión</button></td>
     <p style="font-size:xx-small ">Ciclo 3 - Misión TIC 2022 - Grupo 11 - Cúcuta</p>
  </form>
  
</div>
</body>
</html>
