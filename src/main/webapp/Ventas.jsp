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
  font-size: 0.5em;
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
<meta charset="utf-8">
<title>Venta de Productos</title>
	<style type="text/css">
body {
    background-color: #F1EBFC;
    text-align: center;
}
</style>

<script src="js/jquery-1.12.4-jquery.min.js"; type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"; type="text/javascript"></script>
<script type="text/javascript">
docReady(function(){
	$(documento).on('keyup', function() {
		var search=document.getElementById("documento").value.trim()
		if(search !="" && search!=null)
			{
			$j.ajax({
				type='POST',
				url: 'recordcliente.jsp',
				data: 'key='+search,
				success: function(data){
					document.getElementById("nombre").value = data;
			}
			});
		}
		else
		{
			document.getElementById("nombre").value = "";
		}
	});
	$(document).on("click","li",function(){
		document.getElementById("nombre").value = $(this).text();
	});
});
</script>

</head>
	<form>
<div class="login">
	<h1 class="login-header"> Registro de Ventas</h1>
		
		Documento de Cliente:<select name="documento" id="documento" style="width: 250px"> 
                            <!--<option value="">Selecciona un perfil</option> -->
                            <% 
                                try
                                {
                                    String Query = "SELECT * FROM clientes ORDER BY cedula";
                                    Conexion conn = new Conexion();                                    
                                    Statement stm = conn.getConecction().createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while(rs.next()){  
                                        %>
                                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("cedula")%></option>

                                        <%
                                    }
                                }
                                catch(Exception ex)
                                {
                                    ex.printStackTrace();
                                    out.println("Error: "+ex.getMessage());
                                }
                            %>  
                        </select> 
		
		
		<br>Nombre: <input name="documento" id="documento" style="width: 670px"> 
                            <!--<option value="">Selecciona un perfil</option> -->
                            <% 
                            String query = (String)request.getParameter("documento");

                                try
                                {
                                    String Query = "SELECT id, nombre FROM clientes WHERE id="+query;
                                    Conexion conn = new Conexion();                                    
                                    Statement stm = conn.getConecction().createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while(rs.next()){  
                                        %>
                                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("cedula")%></option>

                                        <%
                                    }
                                }
                                catch(Exception ex)
                                {
                                    ex.printStackTrace();
                                    out.println("Error: "+ex.getMessage());
                                }
                            %>  
                        </select> 
		                           
		Teléfono: <input type="text" id="telefono" autocomplete="on" size="10" readonly="readonly"></div>
	<h2 class="login-header">Productos vendidos</h2>
	  <h3>Producto 1:</h3>Nombre:<select class="form-control" style="width: 250px"> 
                            <!--<option value="-1">Selecciona un perfil</option> -->
                            <% 
                                try
                                {
                                    String Query = "SELECT * FROM productos ORDER BY nombre_producto";
                                    Conexion conn = new Conexion();                                    
                                    Statement stm = conn.getConecction().createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while(rs.next()){  
                                        %>
                                            <option value="<%=rs.getInt("codigo_producto")%>"><%=rs.getString("nombre_producto")%></option>

                                        <%
                                    }
                                }
                                catch(Exception ex)
                                {
                                    ex.printStackTrace();
                                    out.println("Error: "+ex.getMessage());
                                }
                            %>  
                        </select> 
                        
                        Cantidad:<input name="cantidad1" type="number" id="cantidad1" autocomplete="off" size="4" maxlength="3">Valor unitario:<input name="valor_unit1" type="number" id="valor_unit1" autocomplete="on" size="10" maxlength="10" readonly="readonly">Iva: <input name="iva1" type="number" id="iva1" autocomplete="on" size="4" maxlength="4" readonly="readonly">Valor total:<input name="total1" type="number" id="total1" autocomplete="on" size="10" readonly="readonly">
		<h3>Producto 2:</h3>Nombre:<select class="form-control" style="width: 250px"> 
                            <!--<option value="-1">Selecciona un perfil</option> -->
                            <% 
                                try
                                {
                                    String Query = "SELECT * FROM productos ORDER BY nombre_producto";
                                    Conexion conn = new Conexion();                                    
                                    Statement stm = conn.getConecction().createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while(rs.next()){  
                                        %>
                                            <option value="<%=rs.getInt("codigo_producto")%>"><%=rs.getString("nombre_producto")%></option>

                                        <%
                                    }
                                }
                                catch(Exception ex)
                                {
                                    ex.printStackTrace();
                                    out.println("Error: "+ex.getMessage());
                                }
                            %>  
                        </select> 
		
		Cantidad:<input name="cantidad2" type="number" id="cantidad2" size="3" maxlength="3">Valor unitario:<input name="valor_unit2" type="number" id="valor_unit2" autocomplete="on" size="10" maxlength="10" readonly="readonly">Iva: <input name="iva2" type="number" id="iva2" autocomplete="on" size="4" maxlength="4" readonly="readonly">Valor total:<input name="total2" type="number" id="total2" autocomplete="on" size="10" readonly="readonly">
		<h3>Producto 3:</h3>
		Nombre:<select class="form-control" style="width: 250px"> 
                            <!--<option value="-1">Selecciona un perfil</option> -->
                            <% 
                                try
                                {
                                    String Query = "SELECT * FROM productos ORDER BY nombre_producto";
                                    Conexion conn = new Conexion();                                    
                                    Statement stm = conn.getConecction().createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while(rs.next()){  
                                        %>
                                            <option value="<%=rs.getInt("codigo_producto")%>"><%=rs.getString("nombre_producto")%></option>

                                        <%
                                    }
                                }
                                catch(Exception ex)
                                {
                                    ex.printStackTrace();
                                    out.println("Error: "+ex.getMessage());
                                }
                            %>  
                        </select> 
		
		
		Cantidad:<input name="cantidad3" type="number" id="cantidad3" size="3" maxlength="3">Valor unitario:<input name="valor_unit3" type="number" id="valor_unit3" autocomplete="on" size="10" maxlength="10" readonly="readonly">Iva: <input name="iva3" type="number" id="iva3" autocomplete="on" size="4" maxlength="4" readonly="readonly">Valor total:<input name="total3" type="number" id="total3" autocomplete="on" size="10" readonly="readonly">
<h2>Total Factura: <input name="totalfactura" type="text" id="totalfactura" autocomplete="on" size="15"></h2>
	<form action="/Grupo11Cucuta/GestProveedor.jsp" method="post">
    <input type="submit" name="registar" id="registrar" value="Registrar">
  </form><div><button onClick="window.print()">Imprimir
</button></div>
<form action="/Grupo11Cucuta/GestProveedor.jsp" method="post">
    <input type="submit" name="back" id="back" value="Atrás">
    <br><p style="font-size:xx-small ">Ciclo 3 - Misión TIC 2022 - Grupo 11 - Cúcuta</p>
</form>
	</form>

<body>
</body>
</html>
