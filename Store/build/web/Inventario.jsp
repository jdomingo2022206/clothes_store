<%-- 
    Document   : Producto
    Created on : 20/07/2023, 09:21:48 PM
    Author     : A_flo
--%>
<jsp:useBean id="inventario" scope="request" class="modelo.Inventario"/>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Inventario</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Inventario" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${inventario.nombreInventario}" name="txtName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>id Establecimento</label>
                            <input type="text" value="${inventario.idEstablecimiento}" name="txtIdEstablecimiento" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Stock</label>
                            <input type="text" value="${inventario.stock}" name="txtStock" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>id Producto</label>
                            <input type="text" value="${inventario.idProducto}" name="txtIdProducto" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info" href="">
                        <input  type="submit" name="accion" value="Actualizar" class="btn btn-success" href="Controlador?menu=Inventario&accion=Actualizar">Actualizar</a>
                    </form>  
                </div>
            </div>
            <div class="col-sm-8">
                <%
                    List<String> lista = new ArrayList<String>();
                    lista.add("ID");
                    lista.add("NOMBRE");
                    lista.add("ESTABLECIMIENTO");
                    lista.add("PRODUCTO");
                    lista.add("STOCK");
                    lista.add("ACCIONES");
                %>
                <custom:table titles="<%=lista%>">
                    <%--<jsp:useBean id="lista" scope="request" class="java.util.List<modelo.Categoria>"/>--%>
                    <c:forEach var="inventario" items="${inventarios}">
                        <tr>
                            <td>${inventario.idInventario}</td>
                            <td>${inventario.nombreInventario}</td>
                            <td>${inventario.idEstablecimiento}</td>
                            <td>${inventario.stock}</td>
                            <td>${inventario.idProducto}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=Inventario&accion=Editar&codigoInventario=${inventario.idInventario}">Editar</a>
                                <a class="btn btn-danger" href="Controlador?menu=Inventario&accion=Eliminar&codigoInventario=${inventario.idInventario}">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </custom:table>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>