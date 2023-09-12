<%-- 
    Document   : DetalleCompra
    Created on : 21/07/2023, 06:01:41 PM
    Author     : Edwar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Detalle Compra</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=DetalleCompra" method="POST">
                        <div class="form-group">
                            <label>Id Compra</label>
                            <input type="text" value="${detalleCompra.getIdCompra()}" name="txtIdCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Proveedor</label>
                            <input type="text" value="${detalleCompra.getIdProveedor()}" name="txtIdProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Producto</label>
                            <input type="text" value="${detalleCompra.getIdProducto()}" name="txtIdProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="text" value="${detalleCompra.getCantidad()}" name="txtCantidad" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info" href="">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success" href="">
                    </form>
                </div>
            </div>
             <%
                    List<String> lista = new ArrayList<String>();
                    lista.add("Id DetalleCompra");
                    lista.add("Id Compra");
                    lista.add("id Producto");
                    lista.add("Cantidad");
                    lista.add("ACCIONES");
                %>
                <custom:table titles="<%=lista%>">
                    <c:forEach var="detalleCompra" items="${detalleCompras}">
                        <tr>
                            <td>${detalleCompra.getIdDetalleCompra()}</td>
                            <td>${detalleCompra.getIdCompra()}</td>
                            <td>${detalleCompra.getIdProveedor()}</td>
                            <td>${detalleCompra.getIdProducto}</td>
                            <td>${detalleCompra.getCantidad}</td>
                                <a class="btn btn-warning" href="Controlador?menu=DetalleCompra&accion=Editar&IdDetalleCompra=${detalleCompra.getIdDetalleCompra()}">Editar</a>
                                <a class="btn btn-danger" href="">Eliminar</a>
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