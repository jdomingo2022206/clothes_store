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
        <link href="Principal.css" rel="stylesheet" type="text/css"/>
        
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

                    <div class="illustration"><img src="https://www.clara.es/medio/2023/02/16/test-estilos-de-vestir-cual-es-el-tuyo_e3260780_230216124648_1280x720.jpg"></div>
                </div>
                                
                
                <div class="box2 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Información</h1>
                        <p>
                            En nuestro programa contamos con diversas entidades útiles para los procesos de administración
                            y compra, entre las cuales se encuentran "Usuario", "Login", "Proveedores", "Categoria Producto",
                            "Cliente", "Producto", "Compra", "Venta", "Detalle Compra", "Detalle Venta", "Pedido Cliente" y
                            "Pedido Proveedor", "Establecimiento" e "Inventario".
                        </p>
                    </div>

                    <div class="illustration"><img src="https://i0.wp.com/networknuts.net/wp-content/uploads/2019/11/zahir-accounting-software-have-more-than-60.000-users.png"></div>
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

                    <div class="illustration"><img src="https://img.caminofinancial.com/wp-content/uploads/2019/10/09173133/iStock-1134458349.jpg"></div>
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

                    <div class="illustration"><img src="https://info.pinturasdoal.com/hubfs/Fotos%20Blogs%20Febrero%202022/Featured-C%C3%B3mo%20hacer%20correctamente%20un%20inventario.jpg"></div>
                </div>
                                
                <div class="box5 box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>Contacto</h1>
                        <p>
                            Tel. +502 4248-9365
                        </p>
                    </div>

                    <div class="illustration"><img src="https://i.blogs.es/584741/llamadas-sin-contestacion-1/1366_2000.jpeg"></div>
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
