<%-- 
    Document   : PedidosProveedor
    Created on : Jul 21, 2023, 12:42:40 PM
    Author     : Tonelito
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Pedidos Proveedor</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=PedidosProveedor" method="POST">
                        
                        <div class="form-group">
                            <label>ID Pedido Proveedor</label>
                            <input type="text" value="${pedidoproveedor.getIdPedidoProveedor()}" name="txtIDPedidoProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>ID Proveedor</label>
                            <input type="text" value="${pedidoproveedor.getIdProveedor()}" name="txtIDProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>ID Producto</label>
                            <input type="text" value="${pedidoproveedor.getIdProducto()}" name="txtIDProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="text" value="${pedidoproveedor.getCantidad()}" name="txtCantidad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" value="${pedidoproveedor.getFecha()}" name="txtFecha" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" value="${pedidoproveedor.getTotal()}" name="txtTotal" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-success">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>ID Pedido Proveedor</td>
                            <td>ID Proveedor</td>
                            <td>ID Producto</td>
                            <td>Cantidad</td>
                            <td>Fecha</td>
                            <td>Total</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pedidoproveedor" items="${pedidoproveedor}">
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
                    </tbody>
                </table>
            </div>            
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>

