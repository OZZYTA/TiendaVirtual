
<%@page import="java.sql.*"%>
<%@page import="com.tiendavirtual.DAO.Conexion"%>

<label>Perfil</label>
                        <select class="form-control" style="width: 250px"> 
                            <!--<option value="-1">Selecciona un perfil</option> -->
                            <% 
                                try
                                {
                                    String Query = "SELECT * FROM productos";
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