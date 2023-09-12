<%-- 
    Document   : PrincipalFondo
    Created on : 11/09/2023, 07:38:22 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Principal.css">
        
        <title>Slider</title>
    </head>
    <body>
        <div class="container"> 
            <div class="slider">

                <div class="box1 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Clothes Store</h1>
                        <p>
                            A tu estilo a tu elección.
                        </p>
                    </div>

                    <div class="illustration"><div class="inner"></div></div>
                </div>
                                
                
                <div class="box2 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Información</h1>
                        <p>
                            Esto incluye las clases "Usuario" y "Login" para la autenticación de usuarios, 
                            "Proveedores" para el registro de proveedores, "Categoria Producto" para la 
                            categorización de productos, "Cliente" para el registro de clientes, "Producto" 
                            para detalles de productos y stock, "Compra" y "Venta" para registrar transacciones 
                            comerciales, "Detalle Compra" y "Detalle Venta" para seguimiento detallado de 
                            productos en transacciones, "Pedido Cliente" y "Pedido Proveedor" para gestionar 
                            pedidos, "Establecimiento" para múltiples ubicaciones y "Inventario" para el control 
                            en tiempo real del stock. 
                        </p>
                    </div>

                    <div class="illustration"><div class="inner"></div></div>
                </div>
                                
                <div class="box3 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Visión</h1>
                        <p>
                            Ser una empresa lider y reconocida en la venta de ropa,
                            llevar nuestros modelos de trabajo al maximo de lugares 
                            posibles para disfrutar de la moda y el mejor diseño para
                            innovar, liderar y mejoras.
                        </p>
                    </div>

                    <div class="illustration"><div class="inner"></div></div>
                </div>
                                
                <div class="box4 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Objetivo del Proyecto</h1>
                        <p>
                            Desarrollar un sistema de gestión de inventario y ventas que permita a un negocio 
                            llevar un registro de sus productos, ventas, compras, clientes, proveedores y más.
                        </p>
                    </div>

                    <div class="illustration"><div class="inner"></div></div>
                </div>
                                
                <div class="box5 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Contacto</h1>
                        <p>
                            Tel. +502 5554-5621
                        </p>
                    </div>

                    <div class="illustration"><div class="inner"></div></div>
                </div>
                                
            </div>

            <svg xmlns="http://www.w3.org/2000/svg" class="prev" width="56.898" height="91" viewBox="0 0 56.898 91"><path d="M45.5,0,91,56.9,48.452,24.068,0,56.9Z" transform="translate(0 91) rotate(-90)" fill="#fff"/></svg>
            <svg xmlns="http://www.w3.org/2000/svg" class="next" width="56.898" height="91" viewBox="0 0 56.898 91"><path d="M45.5,0,91,56.9,48.452,24.068,0,56.9Z" transform="translate(56.898) rotate(90)" fill="#fff"/></svg>
            <div class="trail">
                    <div class="box1 active">1</div>
                    <div class="box2">2</div>
                    <div class="box3">3</div>
                    <div class="box4">4</div>
                    <div class="box5">5</div>
            </div>
        </div>   
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CSSRulePlugin3.min.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.2/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.2/CSSRulePlugin.min.js"></script>
        <script src="Principal.js"></script>
    </body>
</html>
