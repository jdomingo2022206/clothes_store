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
                 
        <title>Proveedor</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Proveedor" method="POST">
                        
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${proveedor.getNombreProveedor()}" name="txtNombreProveedor" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Dirección</label>
                            <input type="text" value="${proveedor.getDireccion()}" name="txtDireccion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" value="${proveedor.getTelefono()}" name="txtTelefono" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="overflow-hidden overflow-y-scroll">
                <%List titulos= new ArrayList<String>();
                titulos.add("Id Proveedor");
                titulos.add("Nombre Proveeedor");
                titulos.add("Direccion");
                titulos.add("Teléfono");
                titulos.add("Acciones");
                titulos.add("Acciones 2");
                %>
                <custom:table titles="<%=titulos%>">
                    
                        <c:forEach var="proveedor" items="${proveedores}">
                        <tr>
                            <td>${proveedor.getIdProveedor()}</td>
                            <td>${proveedor.getNombreProveedor()}</td>
                            <td>${proveedor.getDireccion()}</td>
                            <td>${proveedor.getTelefono()}</td>
                            <td onclick="goToUrl(this)" class="btn btn-warning" data-url="Controlador?menu=Proveedor&accion=Editar&idProveedor=${proveedor.getIdProveedor()}" > Editar </td>
                            <td>
                                <a class="btn btn-danger" onclick="return confirm('¿Quiere eliminar este registro?')"href="Controlador?menu=Proveedor&accion=Eliminar&idProveedor=${proveedor.getIdProveedor()}">Eliminar</a>
                            </td>
                        </tr>
                        </c:forEach>
                </custom:table>

            </div>            
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script>
            const goToUrl = (e) => {
                console.log("CLICKED")
                window.location.href = e.dataset.url
            }
        </script>
    </body>
</html>
