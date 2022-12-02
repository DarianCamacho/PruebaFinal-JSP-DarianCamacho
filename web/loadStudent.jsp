<%-- 
    Document   : loadStudent
    Created on : 1 dic. 2022, 18:59:17
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Update Notes</title>
    </head>
    <body>
        <%
            int IdEstudiante = Integer.parseInt(request.getParameter("IdEstudiante"));
            Connection con = null;
            ResultSet resultset = null;



           try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from students where IdEstudiante=" + IdEstudiante);
                resultset.next();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-header">
                    Actualizar Nota del Estudiante
                </div>
                <div class="card-body">
                    <form action="updateStudent.jsp">
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("IdEstudiante")%>' type="text" class="form-control" name="txtIdEstudiante" placeholder="Id" readonly>
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("NOTA")%>' type="number" class="form-control" name="txtNota" placeholder="nota">
                            <label>Nueva nota</label>
                        </div>



                       <div class="form-floating mb-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                        </div>



                       <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Update student</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Estas seguro de realizar este cambio <%=resultset.getString("NOMBRE")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>           
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>