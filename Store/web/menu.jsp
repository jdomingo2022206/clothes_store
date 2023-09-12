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
                <li data-url="Detalle venta" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-chart-pie"></i>
                    <span class="hide-on-click">Detalle venta</span>
                </li>
                <li data-url="Provedor" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-people-carry-box"></i>
                    <span class="hide-on-click">Provedor</span>
                </li>
                <li data-url="Productos" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <span class="hide-on-click">Productos</span>
                </li>
                <li data-url="Clientes" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-users-line"></i>
                    <span class="hide-on-click">Clientes</span>
                </li>
                <li data-url="Categoria" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-file-invoice"></i>
                    <span class="hide-on-click">Categoria</span>
                </li>
                <li data-url="Establecimiento" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-location-dot"></i>
                    <span class="hide-on-click">Establecimiento</span>
                </li>
                <li data-url="Compra" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-store"></i>
                    <span class="hide-on-click">Compra</span>
                </li>
                <li data-url="Productos" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="text-2xl fa-solid fa-cubes"></i>
                    <span class="hide-on-click">Productos</span>
                </li>
                <li data-url="Clientes" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-users-line"></i>
                    <span class="hide-on-click">Clientes</span>
                </li>
                <li data-url="Detalle Compra" class="flex gap-2 hover:bg-gray-50 px-2 py-1 rounded-md hover:font-semibold items-center hover:text-indigo-600">
                    <i class="fa-solid fa-file-invoice"></i>
                    <span class="hide-on-click">Detalle Compra</span>
                </li>
            </ul>

            <h3 id="teams" class="text-sm hide-on-click"><span>Your Teams</span>
                <i id="chevrown-down" class="text-xs fa-solid fa-chevron-down"></i>
                <i id="chevrown-up" class="text-xs fa-solid fa-chevron-up hidden"></i>
            </h3>

            <ul id="list" class="flex flex-col list-none hidden">
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">J</div>
                    <span class="hide-on-click">Jonathan Domingo</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">J</div>
                    <span class="hide-on-click">Joao Castillo</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">J</div>
                    <span class="hide-on-click">Juan Galicia</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">O</div>
                    <span class="hide-on-click">Oscar Flores</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">J</div>
                    <span class="hide-on-click">Josue Ambrocio</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">J</div>
                    <span class="hide-on-click">Jose Ceferino</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">R</div>
                    <span class="hide-on-click">Rodrigo Chanquin</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">Y</div>
                    <span class="hide-on-click">Yojhan Stanley</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">C</div>
                    <span class="hide-on-click">Cesar Escriba</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">G</div>
                    <span class="hide-on-click">Gerson Chuquiej</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">E</div>
                    <span class="hide-on-click">Edward Chamale</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">G</div>
                    <span class="hide-on-click">Gary Galindo</span>
                </div>
                <div class="flex gap-3 items-center px-2 py-1 hover:text-indigo-600">
                    <div class="text-sm border px-2 py-1 rounded-md">D</div>
                    <span class="hide-on-click">Diego Arriola</span>
                </div>
            </ul>
        </div>
       <div class="flex flex-col w-full h-full">
        <div class="flex justify-between border px-32 py-3">
            <div class="flex gap-3">
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Lorem.</div>
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Beatae.</div>
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Laboriosam.</div>
                <div class="text-xl hover:text-indigo-600 border px-2 py-1 items-center">Tenetur?</div>
            </div>
            <div class="flex items-center justify-center gap-3">
                <input class="border placeholder:text-indigo-600 px-2 py-1 outline-none" type="text" placeholder="buscar">
                <i class="text-2xl fa-solid fa-search"></i>
            </div>   
        </div>
        <div class="p-5 h-full">
            <iframe class="w-full h-full" src="index.jsp" frameborder="0"></iframe>
        </div>
       </div>

        <script>

            document.addEventListener("click", (e) => {
                const link = e.target.closest("[data-url]");
                if (!link) return;

                const url = link.dataset.url;
                // reload Iframe
                document.querySelector("iframe").src = `https"//localhost:8080/clothes_store/${url.split(" ").join("")}.jsp`
            })
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
