<%-- 
    Document   : PedidoCliente
    Created on : 21/07/2023, 07:07:19 PM
    Author     : 50257
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Pedido Cliente</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Producto" method="POST">

                        <div class="form-group">
                            <label>Id Cliente</label>
                            <input type="text" value="${pedidoCliente.getIdCliente()}" name="txtIdCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Producto</label>
                            <input type="text" value="${pedidoCliente.getIdProducto()}" name="txtIdProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="text" value="${pedidoCliente.getCantidad()}" name="txtCantidad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" value="${pedidoCliente.getFecha()}" name="txtFecha" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" value="${pedidoCliente.getTotal()}" name="txtTotal" class="form-control">
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
                            <td>Codigo</td>
                            <td>Id Cliente</td>
                            <td>Id Producto</td>
                            <td>Cantidad</td>
                            <td>Fecha</td>
                            <td>Total</td>
                            <td>Acciones</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pedidoCliente" items="${pedidoCliente}">
                        <tr>
                            <td>${pedidoCliente.getIdPedidoCliente()}</td>
                            <td>${pedidoCliente.getIdCliente()}</td>
                            <td>${pedidoCliente.getIdProducto()}</td>
                            <td>${pedidoCliente.getCantidad()}</td>
                            <td>${pedidoCliente.getFecha()}</td>
                            <td>${pedidoCliente.getTotal()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=PedidoCliente&accion=Editar&codigoPedidoCliente=${pedidoCliente.getIdPedidoCliente}">Editar</a>
                                <a class="btn btn-danger" href="">Eliminar</a>
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

