<%-- 
    Document   : menu
    Created on : 1/09/2023, 02:12:32 PM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-screen flex">
        <div id="sidebar" class="flex px-2 py-3 gap-3 flex-col w-[250px] h-full border rounded-md">
            <div id="sidebar-btn" class="flex px-2">
                <i class="text-2xl text-indigo-600 fa-solid fa-table-columns"></i>
                <!-- <img class="border" src="img/ClothesStore1.png" alt=""> -->
            </div>

            <ul id="list-entities" class="flex flex-col gap-2 list-none">
                <li data-url="Provedor" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-people-carry-box"></i>
                    <a target='myTarget' href="Controlador?menu=Proveedor&accion=Listar" class="hide-on-click">Proveedor</a>
                </li>
                <li data-url="Productos" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <a target='myTarget' href="Controlador?menu=Producto&accion=Listar" class="hide-on-click">Productos</a>
                </li>
                <li data-url="Clientes" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-users-line"></i>
                    <a target='myTarget' href="Controlador?menu=Cliente&accion=Listar" class="hide-on-click">Clientes</a>
                </li>
                <li data-url="Categoria" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-file-invoice"></i>
                    <a target='myTarget' href="Controlador?menu=Categoria&accion=Listar" class="hide-on-click">Categoria</a>
                </li>
                <li data-url="Establecimiento" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-location-dot"></i>
                    <a target='myTarget' href="Controlador?menu=Establecimiento&accion=Listar" class="hide-on-click">Establecimiento</a>
                </li>
                <li data-url="Compra" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-store"></i>
                    <a target='myTarget' href="Controlador?menu=Compra&accion=Listar" class="hide-on-click">Compra</a>
                </li>
                <li class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <a target='myTarget' href="Controlador?menu=Venta&accion=Listar" class="hide-on-click">Venta</a>
                </li>
                <li class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <a target='myTarget' href="Controlador?menu=PedidoProveedor&accion=Listar" class="hide-on-click">Pedido Proveedor</a>
                </li>
                <li data-url="Productos" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <a target='myTarget' href="Controlador?menu=PedidoCliente&accion=Listar" class="hide-on-click">Pedido Cliente</a>
                </li>
                <li data-url="Clientes" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-users-line"></i>
                    <a target='myTarget' href="Controlador?menu=Inventario&accion=Listar" class="hide-on-click">Inventario</a>
                </li>
                <li data-url="Detalle Compra" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-file-invoice"></i>
                    <a target='myTarget' href="Controlador?menu=DetalleCompra&accion=Listar" class="hide-on-click">Detalle Compra</a>
                </li>
            </ul>

            <h3 id="teams" class="text-sm hide-on-click"><span>Your Teams</span>
                <i id="chevrown-down" class="text-xs fa-solid fa-chevron-down"></i>
                <i id="chevrown-up" class="text-xs fa-solid fa-chevron-up hidden"></i>
            </h3>

            <ul id="list" class="flex flex-col list-none hidden">
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <!--<div class="text-sm border px-2 py-1 rounded-md">J</div> -->
                    <img class="hide-on-click" src="img/Jonathan.png" style="width: 50px">
                    <a class="hide-on-click">Jonathan Domingo</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Joao.png" style="width: 50px"/>
                    <a class="hide-on-click">Joao Castillo</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Galicia.png" style="width: 50px"/>
                    <a class="hide-on-click">Juan Galicia</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Flores.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Oscar Flores</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Ambrocio.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Josue Ambrocio</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Ceferino.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Jose Ceferino</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Chanquin.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Rodrigo Chanquin</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Yojhan.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Yojhan Stanley</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Escriba.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Cesar Escriba</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Chuquiej.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Gerson Chuquiej</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Chamale.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Edward Chamale</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Gary.jpg" style="width: 50px"/>
                    <a class="hide-on-click">Gary Galindo</a>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <img class="hide-on-click" src="img/Arriola.png" style="width: 50px"/>
                    <a class="hide-on-click">Diego Arriola</a>
                </div>
            </ul>
        </div>
       <div class="flex flex-col w-full h-full">
        <div class="flex justify-between border px-32 py-3">
            <div class="flex gap-3">
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">
                    <a target='myTarget' href="Controlador?menu=Principal">Home</a>
                </div>
                <%-- 
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Beatae.</div>
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Laboriosam.</div>
                --%>
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">
                    <a onclick="return confirm('¿Quieres cerrar sesión y salir?')" href="Controlador?menu=Salir">Salir</a>
                </div>
            </div>
            <div class="flex items-center justify-center gap-3">
                <%-- 
                <input class="border placeholder:text-indigo-600 px-2 py-1 outline-none" type="text" placeholder="buscar">
                <i class="text-2xl fa-solid fa-search"></i>
                --%>
                <img src="img/Kinal.png" style="width: 50px"/>
            </div>   
        </div>
        <div class="p-5 h-full">
            <iframe name='myTarget' class="w-full h-full" src="Principal.jsp" frameborder="0"></iframe>
        </div>
       </div>

        <script>
            // console.log(list)
            // list.addEventListener("mouseenter", (e) => {
            //     console.log("AHHH")
            //     const liElement = e.target.closest("div");
            //     console.log(liElement)
            //     if (!liElement) return;
            //     console.log(liElement.firstElementChild)
            //     liElement.firstElementChild.classList.add("border-indigo-600")
            // })
            
            // list.addEventListener("mouseleave", (e) => {
            //     const liElement = e.target.closest("div");
            //     if (!liElement) return;
            //     liElement.firstElementChild.classList.remove("border-indigo-600")
            // })
            
            const list = document.getElementById("list");
            const sidebar = document.getElementById("sidebar");
            const btnSidebar = document.getElementById("sidebar-btn")
            const entitiesContainer = document.getElementById("list-entities");
            const teamsContainer = document.getElementById("teams");
            const chevronDown = document.getElementById("chevrown-down")
            const chevronUp = document.getElementById("chevrown-up")

            const showTeams = () => {
                list.classList.remove("hidden");
                chevronUp.classList.remove("hidden");
                chevronDown.classList.add("hidden");
                isShowingTeams = true;
            }
            
            const hideTeams = () => {
                list.classList.add("hidden")
                chevronUp.classList.add("hidden");
                chevronDown.classList.remove("hidden");
                isShowingTeams = false;
            }
            
            let isShowingTeams = false;
            teamsContainer.addEventListener("click", (e) => {
                if (!isShowingTeams) showTeams();
                else hideTeams()
            })
            console.log(entitiesContainer)
            console.log(sidebar)

            let isShowingSidebar = true;
            btnSidebar.addEventListener("click", () => {
                console.log(isShowingSidebar)
                if (isShowingSidebar) hideSideBar();
                else showSidebar();
            })
            
            const hideSideBar = () => {
                isShowingSidebar = false;
                const listOfElementsToHide = [...document.querySelectorAll(".hide-on-click")];
                console.log(listOfElementsToHide)
                listOfElementsToHide.forEach((element) => {
                    element.classList.add("hidden")
                })

                sidebar.classList.add("w-fit")
                entitiesContainer.classList.add("items-center")
            }

            const showSidebar = () => {
                isShowingSidebar = true;
                const listOfElementsToHide = [...document.querySelectorAll(".hide-on-click")];
                console.log(listOfElementsToHide)
                listOfElementsToHide.forEach((element) => {
                    element.classList.remove("hidden")
                })

                sidebar.classList.remove("w-fit")
                entitiesContainer.classList.remove("items-center")
            }
            </script>
    </body>
</html>
