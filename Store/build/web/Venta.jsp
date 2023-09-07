<%-- 
    Document   : Venta
    Created on : 21/07/2023, 02:43:15 PM
    Author     : Jonwk._.19
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
                            <label>idVenta</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>idCliente</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" value="" name="" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>



            <div class="col-sm-8">
                <table class="table table-hober">
                    <thead>
                        <tr>
                            <td>idVenta</td>
                            <td>idCliente</td>
                            <td>Fecha</td>
                            <td>Total</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="Venta" items="${Venta}">
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
