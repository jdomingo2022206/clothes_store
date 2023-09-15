<%-- 
    Document   : Establecimiento
    Created on : 20/07/2023, 09:21:53 PM
    Author     : Marco
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.tailwindcss.com"></script>

        <title>Establecimiento</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Establecimiento" method="POST">

                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${establecimiento.getNombreEstablecimiento()}" name="txtNombreEstablecimiento" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Dirección</label>
                            <input type="text" value="${establecimiento.getDireccion()}" name="txtDireccion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" value="${establecimiento.getTelefono()}" name="txtTelefono" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="px-2 py-1 bg-indigo-600 text-white border">
                        <input type="submit" name="accion" value="Actualizar" class="px-2 py-1 bg-blue-600 text-white border border-blue-600">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <% List<String> titulos = new ArrayList<String>();
                    titulos.add("Id Establecimiento");
                    titulos.add("Nombre Establecimiento");
                    titulos.add("Dirección");
                    titulos.add("Teléfono");
                %>
                <custom:table titles="<%= titulos%>">
                    <c:forEach var="establecimiento" items="${establecimientos}">
                        <tr>
                            <td>${establecimiento.getIdEstablecimiento()}</td>
                            <td>${establecimiento.getNombreEstablecimiento()}</td>
                            <td>${establecimiento.getDireccion()}</td>
                            <td>${establecimiento.getTelefono()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=Establecimiento&accion=Editar&idEstablecimiento=${establecimiento.getIdEstablecimiento()}">Editar</a>
                                <a class="btn btn-danger" onclick="return confirm('¿Quieres eliminar este registro?')" href="Controlador?menu=Establecimiento&accion=Eliminar&idEstablecimiento=${establecimiento.getIdEstablecimiento()}">Eliminar</a>
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