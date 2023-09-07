<%-- 
    Document   : Categoria
    Created on : 21/07/2023, 04:49:38 PM
    Author     : Garcia
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Categoria</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Categoria" method="POST">
                        <div class="form-group">
                            <label>Nombre Categoria</label>
                            <input type="text" value="" name="txtNombreCategoria" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" value="" name="txtDescripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha Creacion</label>
                            <input type="text" value="" name="txtFechaCreacion" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info" href="">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success" href="">
                    </form>  
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hober">
                    <thead>
                        <tr>
                            <td>Codigo Categoria</td>
                            <td>Nombre</td>
                            <td>Descripcion</td>
                            <td>Fecha De Creacion</td>
                            <td>Acciones</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                List<String> lista = new ArrayList<String>();
                                lista.add("ID CATEGORIA");
                                lista.add("NOMBRE CATEGORIA");
                                lista.add("DESCRIPCION");
                                lista.add("FECHA CREACION");
                        %>
                    <custom:table titles="<%=lista%>">
                        <%--<jsp:useBean id="lista" scope="request" class="java.util.List<modelo.Categoria>"/>--%>
                        <c:forEach var="categoria" items="${categorias}">
                            <tr>
                                <td>${categoria.getIdCategoria()}</td>
                                <td>${categoria.getNombreCategoria()}</td>
                                <td>${categoria.getDescripcion()}</td>
                                <td>${categoria.getFechaCreacion()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Categoria&accion=Editar&codigoCategoria=${categoria.getIdCategoria()}">Editar</a>
                                    <a class="btn btn-danger" href="">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </custom:table>
                        
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
