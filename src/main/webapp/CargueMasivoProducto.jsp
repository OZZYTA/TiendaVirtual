<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cargue Masivo de Producto</title>
<script>
async function CargarArchivo() {
  let formData = new FormData(); 
  formData.append("file", fileupload.files[0]);
  let response = await fetch('/TiendaVirtualApp/upload', {
    method: "POST", 
    body: formData
  }); 
  if (response.status == 200) {
    alert("File successfully uploaded.");
  }
}
</script>


</head>
<body>
<h1>Cargue Masivo de Producto</h1>
    <input id="fileupload" type="file" name="fileupload" /> 
    <button id="btnUpload" onclick="CargarArchivo()">Subir Archivo </button>
</body>
</html>