<%-- 
    Document   : updateStudent
    Created on : 1 dic. 2022, 18:59:44
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar</title>
    </head>
    <body>
        <%
            int txtIdEstudiante = Integer.parseInt(request.getParameter("txtIdEstudiante"));
            int txtNota = Integer.parseInt(request.getParameter("txtNota"));
          
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
            Statement statement = connection.createStatement();

            String sql = "update students set NOTA = " + txtNota +
                         " where IdEstudiante = " + txtIdEstudiante;
            statement.executeUpdate(sql);
            
            if(txtNota>=70){
                String sqlAp = "update students set ESTADO = 'Aprobado' where IdEstudiante = " + txtIdEstudiante;
                statement.executeUpdate(sqlAp);
            } else if(txtNota>=65 && txtNota<70){
                String sqlAplz = "update students set ESTADO = 'Aplazado' where IdEstudiante = " + txtIdEstudiante;
                statement.executeUpdate(sqlAplz);
            } else{
                String sqlRep = "update students set ESTADO = 'Reprobado' where IdEstudiante = " + txtIdEstudiante;
                statement.executeUpdate(sqlRep);
            }
            
            out.println("<script type='text/javascript'>alert('Nota updated');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/students.jsp");
            rd.include(request, response);
        %>
        
        
    </body>
</html>