<%-- 
    Document   : DetalleVenta
    Created on : 21/07/2023, 06:32:16 PM
    Author     : gchuquiej-2022273
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Detalles de venta</title>
    </head>
    <body>
                <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="">
                        <div class="form-group">
                            <label>idDetalleVenta</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>idVenta</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>idCliente</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>idProducto</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>cantidad</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="px-2 py-1 bg-indigo-600 text-white border">
                        <input type="submit" name="accion" value="Actualizar" class="px-2 py-1 bg-blue-600 text-white border border-blue-600">
                    </form>
                </div>
            </div> <br>

            <div class="col-sm-8">
                <table class="table table-hober">
                    <thead>
                        <tr>
                            <td>idDetalleVenta</td>
                            <td>idVenta</td>
                            <td>idCliente</td>
                            <td>idProducto</td>
                            <td>cantidad</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="DetalleVenta" items="${DetalleVentas}">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <a class="btn btn-warning" href="">Editar</a>
                            <a class="btn btn-danger" href="">Eliminar</a>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    </body>
</html>