<%-- 
    Document   : PedidosProveedor
    Created on : Jul 21, 2023, 12:42:40 PM
    Author     : Tonelito
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Pedidos Proveedor</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=PedidoProveedor" method="POST">
                        <div class="form-group">
                            <label>ID Proveedor</label>
                            <input type="text" value="${pedidoProveedor.getIdProveedor()}" name="txtIDProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>ID Producto</label>
                            <input type="text" value="${pedidoProveedor.getIdProducto()}" name="txtIDProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="text" value="${pedidoProveedor.getCantidad()}" name="txtCantidad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="date" value="${pedidoProveedor.getFecha()}" name="txtFecha" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" value="${pedidoProveedor.getTotal()}" name="txtTotal" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-success" href="">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-info" href="">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
               <%
                    List<String> lista = new ArrayList<String>();
                    lista.add("ID PEDIDO PROVEEDOR");
                    lista.add("ID PROVEEDOR");
                    lista.add("ID PRODUCTO");
                    lista.add("CANTIDAD");
                    lista.add("FECHA");
                    lista.add("TOTAL");
                    lista.add("ACCIONES");
                %>
                <custom:table titles="<%=lista%>">
                        <c:forEach var="pedidoproveedor" items="${pedidoProveedores}">
                        <tr>
                            <td>${pedidoproveedor.getIdPedidoProveedor()}</td>
                            <td>${pedidoproveedor.getIdProveedor()}</td>
                            <td>${pedidoproveedor.getIdProducto()}</td>
                            <td>${pedidoproveedor.getCantidad()}</td>
                            <td>${pedidoproveedor.getFecha()}</td>
                            <td>${pedidoproveedor.getTotal()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=PedidoProveedor&accion=Editar&IdPedidoProveedor=${pedidoproveedor.getIdPedidoProveedor()}">Editar</a>
                                <a class="btn btn-danger" onclick='return confirm("you want to delete this register?")' href="Controlador?menu=PedidoProveedor&accion=Eliminar&IdPedidoProveedor=${pedidoproveedor.getIdPedidoProveedor()}">Eliminar</a>
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

