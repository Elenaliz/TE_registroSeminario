<%-- 
    Document   : index
    Created on : 14 abr 2024, 20:11:00
    Author     : Mi-Pc
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.te_registroseminario.Seminario"%>
<%
    if(session.getAttribute("listasem") == null) {
      ArrayList<Seminario> listAux = new ArrayList<Seminario>();
      session.setAttribute("listasem", listAux);
    }
  ArrayList<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("listasem");
%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRINCIPAL</title>
        <style>
            h1 {
                text-align: center
            }
            .container{
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .btn {
                padding: 5px 10px;
                border: 1px solid black;
                border-radius: 5px;
                text-decoration: none;
                color: black;
            }
            table{
                margin-top: 1rem;
                border: 1px solid black;
                border-radius: 5px
            }
            table thead,tbody {
                text-align: center;
            }
            th, td{
                padding: 7px 30px
            }
            .card{
                border: 1px solid black;
                width: 400px;
                text-align: center;
                border-radius: 5px;
                margin: 1rem auto;
            }
        </style>
    </head>
    <div class="contenedor">
            <p>SEGUNDO PARCIAL TECNOLOGIAS EMERGENTES II-742<br>
                NOMBRE:ELENA LIZ TELLEZ SUNTURA<br>
                CI:10098985</p>
        </div>
        
        <h1>REGISTRO DIA DEL INTERNET</h1>

        <div class='container'>

            <div style="text-align: left">
                <a href="MainServlet?op=nuevo" class='btn'>Nuevo</a>
                <table>
                    <thead>
                        <tr>
                             <th>Id</th>
                             <th>Nombres</th>
                             <th>Apellidos</th>
                             <th>Seminario</th>
                             <th>Confirmado</th>
                             <th>Fecha inscripción</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <% 
                            if (lista != null) {
                            for(Seminario item: lista){
                        %>
                        <tr>
                            <td>${item.id}</td>
                        <td>${item.nombre}</td>
                        <td>${item.apellido}</td>
                        <td>${item.seminario}</td>
                            <td style="padding: 5px 10px">
                                <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                            </td>
                            <td style="padding: 5px 10px">
                                <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                                   onclick="return(confirm('Esta seguro de eliminar??'))"
                                   >
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% 
                            }}
                        %>

                    </tbody>
                </table>
            </div>


        </div>

    </body>
</html>
