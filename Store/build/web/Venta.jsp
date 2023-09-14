<%-- 
    Document   : Venta
    Created on : 21/07/2023, 02:43:15 PM
    Author     : Jonwk._.19
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>venta</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <form action="Controlador?menu=Venta" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label><h6>Datos Del Cliente :</h6></label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="txtCodigoCliente" value="${cliente.getIdCliente()}" placeholder="Codigo" class="form-control">
                                <button type="submit" name="accion" value="BuscarCliente" href="Controlador?menu=Venta&accion=BuscarCliente" class="btn btn-danger">Buscar</button>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" name="txtNombreCliente" value="${cliente.getNombreCliente()} ${cliente.getApellidoCliente()}" placeholder="Nombre"  class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label><h6>Fecha :</h6></label>
                            <div class="col-sm-8">
                                <input type="date" value="" name="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label><h6>Producto :</h6></label> 
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="txtCodigoProducto" value="${producto.getIdProducto()}" class="form-control" placeholder="Codigo">
                                <Button type="submit" name="accion" value="BuscarProducto" href="Controlador?menu=Venta&accion=BuscarProducto" class="btn btn-danger">Buscar</Button>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" name="txtNombreProducto" value="${producto.getNombreProducto()}" placeholder="Producto" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label><h6>Precio :</h6></label>
                            <div class="col-sm-8">
                                <input type="text" value="${producto.getPrecio()}" name="txtPrecio" class="form-control" placeholder="0.00">
                            </div>
                        </div>
                        <div class="form-group">
                            <label><h6>Cantidad :</h6></label>
                            <div class="col-sm-8">
                                <input type="number" min="1" max="100" name="txtCantidad" class="form-control">
                            </div>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <%
                    List<String> lista = new ArrayList<String>();
                    lista.add("Codigo");
                    lista.add("fecha");
                    lista.add("Producto");
                    lista.add("cantidad");
                    lista.add("Subtotal");
                    lista.add("accion");
                %>
                <custom:table titles="<%=lista%>">
                    <%--   <c:forEach var="ventas" items="Venta">
            <td>${ventas.getItem()}</td>
            <td>${venta.get}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
            <a class="btn btn-warning" href="">Editar</a>
            <a class="btn btn-danger" href="">Eliminar</a>
            </td>
        </c:forEach> --%>
                </custom:table>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    </body>
</html>