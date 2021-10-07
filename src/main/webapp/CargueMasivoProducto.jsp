<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<title>Gestión de Productos</title>
<meta charset="utf-8">
<style type="text/css">
body {
    background-color: #F1EBFC;
    text-align: center;
}
</style>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cargue Masivo de Producto</title>
<meta charset="utf-8">
<style type="text/css">
body {
    background-color: #F1EBFC;
    text-align: center;
}
</style>

<script>
async function CargarArchivo() {
  let formData = new FormData(); 
  formData.append("file", fileupload.files[0]);
  let response = await fetch('/TiendaVirtualApp/upload', {
    method: "POST", 
    body: formData
  }); 
  if (response.status == 200) {
    alert("Archivo cargado correctamente.");
  }
}
</script>


</head>
<body>
<div class="login">
 
  
	<h2 class="login-header"><img src="assets/logo.png"><br>Cargue Masivo de Productos</h2>
	<table>
		<tr>
    <input id="fileupload" type="file" name="fileupload" /> 
    <button id="btnUpload" onclick="CargarArchivo()">Subir Archivo </button>
 <form action="/TiendaVirtualApp/GestProductos.jsp" method="post">
    <input type="submit" name="back" id="back" value="Atrás">
    <br><p style="font-size:xx-small ">Ciclo 3 - Misión TIC 2022 - Grupo 11 - Cúcuta</p>
  </form>
</body>
</html>