<%-- 
    Document   : Producto
    Created on : 20/07/2023, 09:21:48 PM
    Author     : A_flo
--%>
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
        <title>Categoria</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Producto" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Nombre Producto</label>
                            <input type="text" value="${producto.getNombreProducto()}" name="txtNombreProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" value="${producto.getDescripcion()}" name="txtDescripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Precio</label>
                            <input type="text" value="${producto.getPrecio()}" name="txtPrecio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="imagenProducto">Imagen</label>
                            <input type="file" value="${producto.getImagen()}" id="imagenProducto" name="imagenProducto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Proveedor</label>
                            <input type="text" value="${producto.getIdProveedor()}" name="txtIdProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Categoria</label>
                            <input type="text" value="${producto.getIdCategoria()}" name="txtIdCategoria" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info" href="">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success" href="">
                    </form>  
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td><strong>ID</strong></td>
                            <td><strong>DPI</strong></td>
                            <td><strong>Names</strong></td>
                            <td><strong>Image</strong></td>
                            <td><strong>Phone</strong></td>
                            <td><strong>Status</strong></td>
                            <td><strong>User</strong></td>
                            <td><strong>Actions</strong></td>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="producto" items="${productos}">
                            <tr>
                                <td>${producto.getIdProducto()}</td>
                                <td>${producto.getNombreProducto()}</td>
                                <td>${producto.getDescripcion()}</td>
                                <td>${producto.getPrecio()}</td>
                                <td><img src="${producto.getImagen()}" width="50"></td>
                                <td>${producto.getIdProveedor()}</td>
                                <td>${producto.getIdCategoria()}</td>
                                
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&idProducto=${producto.getIdProducto()}">edit</a>
                                    <a class="btn btn-danger" onclick="return confirm('¿Quiere eliminar este registro?')" href="Controlador?menu=Producto&accion=Eliminar&idProducto=${producto.getIdProducto()}" >Eliminar</a>
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