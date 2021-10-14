<%@page import="java.sql.ResultSet"%>;
<%@page import="java.sql.PreparedStatement"%>;
<%@page import="java.sql.Connection"%>;
<%@page import="java.sql.DriverManager"%>;
<%@page import="com.tiendavirtual.DAO.Conexion"%>

<%
    if(request.getParameter("key")!=null) //get "key" variable from jquery &amp; ajax  part this line "data:&#39;key=&#39;+search" and check not null 
    {
        String key=request.getParameter("key"); //get "key" variable store in created new "key" variable
        String wild="%" +key+ "%"; //remove "%" for use preparedstatement in query name like, and "key" variable store in "wild" variable for further use
        
        Conexion conex = new Conexion();

        try
        {
             //create connection

            PreparedStatement pstmt=null; //create statement

            pstmt=conex.getConecction().prepareStatement("SELECT * FROM clientes WHERE id LIKE ? "); //sql select query
            pstmt.setString(1,wild); //above created "wild" variable set in this
            ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object "rs".
           
            while(rs.next())
            {
                %>;
                    <li class="list-group-item">;<%=rs.getString("nombre")%>;</li>;
                <%
            }
                conex.getConecction().close(); //close connection
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>;