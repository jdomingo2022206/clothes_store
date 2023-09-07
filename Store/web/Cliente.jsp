<%-- 
    Document   : Cliente
    Created on : 21/07/2023, 08:19:40 PM
    Author     : Usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">        
        <title>Cliente</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-lg-4">
                <div class="card-body">
                    <form action="" method="POST">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${cliente.getNombreCliente()}" name="txtNombreCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" value="${cliente.getApellidoCliente()}" name="txtApellidoCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Direccion</label>
                            <input type="text" value="${cliente.getDireccion()}" name="txtDireccion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                            <input type="text" value="${cliente.getTelefono()}" name="txtTelefono" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>NOMBRES</td>
                            <td>APELLIDOS</td>
                            <td>DIRECCION</td>
                            <td>TELEFONO</td>
                            <td>ACCIONES</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cliente" items="${cliente}">
                        <tr>
                            <td>${cliente.getIdCliente()}</td>
                            <td>${cliente.getNombreCliente()}</td>
                            <td>${cliente.getApellidoCliente()}</td>
                            <td>${cliente.getDireccion()}</td>
                            <td>${cliente.getTelefono()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=Cliente&accion=Editar&idCliente=${cliente.getIdCliente()}">Editar</a>
                                <a class="btn btn-danger" onclick="return confirm('¿Quieres eliminar este registro?')" href="Controlador?menu=Cliente&accion=Eliminar&idCliente=${cliente.getIdCliente()}">Eliminar</a>
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
