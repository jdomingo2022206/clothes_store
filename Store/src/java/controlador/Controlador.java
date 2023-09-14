/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Categoria;
import modelo.Establecimiento;
import modeloDAO.CategoriaDAO;
import modeloDAO.EstablecimientoDAO;
import modeloDAO.ProveedorDAO;
import javax.servlet.http.Part;
import modelo.Cliente;
import modelo.Compra;
import modelo.DetalleCompra;
import modelo.Inventario;
import modelo.PedidoCliente;
import modelo.PedidoProveedor;
import modelo.Producto;
import modelo.Proveedor;
import modelo.Venta;
import modeloDAO.ClienteDAO;
import modeloDAO.CompraDAO;
import modeloDAO.DetalleCompraDAO;
import modeloDAO.IventarioDAO;
import modeloDAO.PedidoClienteDAO;
import modeloDAO.PedidoProveedorDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.VentaDAO;

/**
 *
 * @author Jonwk._.19
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String saveImage(String nameImage, Part imagePart) throws IOException {
        // Obtén la ruta real a la carpeta "img" en tu proyecto
        String realPath = getServletContext().getRealPath("/img");

        // Verifica si la carpeta "img" existe, y si no, créala
        File imgFolder = new File(realPath);
        if (!imgFolder.exists()) {
            imgFolder.mkdir();
        }

        String pathImage = "img/" + nameImage;
        try (InputStream inputStream = imagePart.getInputStream();
                OutputStream outputStream = new FileOutputStream(realPath + File.separator + nameImage)) {
            int read;
            byte[] bytes = new byte[1024];

            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        }

        return pathImage;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Categoria categoria = new Categoria();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        int codCategoria = 0;

        Cliente cliente = new Cliente();
        ClienteDAO clienteDAO = new ClienteDAO();
        int codCliente = 0;

        Establecimiento establecimiento = new Establecimiento();
        EstablecimientoDAO establecimientoDAO = new EstablecimientoDAO();

        IventarioDAO inventarioDAO = new IventarioDAO();
        Inventario inventario = new Inventario();

        int codEstableci = 0;

        Proveedor proveedor = new Proveedor();
        ProveedorDAO proveedorDAO = new ProveedorDAO();
        int codProveedor = 0;

        Producto producto = new Producto();
        ProductoDAO productoDAO = new ProductoDAO();
        int codProducto = 0;

        Compra compra = new Compra();
        CompraDAO compraDAO = new CompraDAO();
        int codCompra = 0;

        DetalleCompra detalleCompra = new DetalleCompra();
        DetalleCompraDAO detalleCompraDAO = new DetalleCompraDAO();
        int codDetalleCompra = 0;

        PedidoCliente pedidoCliente = new PedidoCliente();
        PedidoClienteDAO pedidoClienteDAO = new PedidoClienteDAO();
        int codPedidoCliente = 0;

        PedidoProveedor pedidoProveedor = new PedidoProveedor();
        PedidoProveedorDAO pedidoProveedorDAO = new PedidoProveedorDAO();
        int codPedidoProveedor = 0;

        Venta venta = new Venta();
        VentaDAO ventaDAO = new VentaDAO();
        List<Venta> listaVenta = new ArrayList<>();

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Menu")) {
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } else if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        } else if (menu.equals("Proveedor")) {

            switch (accion) {
                case "Listar":
                    List listaProveedor = proveedorDAO.listar();
                    request.setAttribute("proveedores", listaProveedor);
                    break;

                case "Agregar":
                    String nombrePro = request.getParameter("txtNombreProveedor");
                    String direccion = request.getParameter("txtDireccion");
                    String telefono = request.getParameter("txtTelefono");
                    proveedor.setNombreProveedor(nombrePro);
                    proveedor.setDireccion(direccion);
                    proveedor.setTelefono(telefono);
                    proveedorDAO.agregar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=listar").forward(request, response);
                    break;

                case "Eliminar":
                    codProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                    proveedorDAO.eliminar(codProveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=listar").forward(request, response);
                    break;

                case "Editar":
                    codProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                    Proveedor p = proveedorDAO.listarCodigoProveedor(codProveedor);
                    request.setAttribute("proveedor", p);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=listar").forward(request, response);
                    break;

                case "Actualizar":
                    nombrePro = request.getParameter("txtNombreProveedor"); //tenia mismo nombre ya instanciado 
                    direccion = request.getParameter("txtDireccion"); //tenia mismo nombre ya instanciado 
                    telefono = request.getParameter("txtTelefono"); //tenia mismo nombre ya instanciado 
                    proveedor.setNombreProveedor(nombrePro);
                    proveedor.setDireccion(direccion);
                    proveedor.setTelefono(telefono);
                    proveedor.setIdProveedor(codProveedor);
                    proveedorDAO.actualizar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);

        } else if (menu.equals("Categoria")) {

            switch (accion) {
                case "Listar":
                    List listaCategoria = categoriaDAO.listar();
                    System.out.println(listaCategoria);
                    request.setAttribute("categorias", listaCategoria);
                    break;

                case "Agregar":
                    String nombreCategoria = request.getParameter("txtNombreCategoria");
                    String descripcion = request.getParameter("txtDescripcion");
                    String fechaCreacion = request.getParameter("txtFechaCreacion");
                    categoria.setNombreCategoria(nombreCategoria);
                    categoria.setDescripcion(descripcion);
                    categoria.setFechaCreacion(fechaCreacion);
                    categoriaDAO.agregar(categoria);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=listar").forward(request, response);
                    break;

                case "Eliminar":
                    int categoriaId = Integer.parseInt(request.getParameter("idCategoria"));
                    categoriaDAO.eliminar(categoriaId);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=listar").forward(request, response);
                    break;

                case "Editar":
                    codCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                    Categoria cat = categoriaDAO.listarCodigoCategoria(codCategoria);
                    request.setAttribute("categoria", cat);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=listar").forward(request, response);
                    break;

                case "Actualizar":
                    String categoriaNombre = request.getParameter("txtNombreCategoria");
                    String descrip = request.getParameter("txtDescripcion");
                    String creacionFecha = request.getParameter("txtFechaCreacion");
                    categoria.setNombreCategoria(categoriaNombre);
                    categoria.setDescripcion(descrip);
                    categoria.setFechaCreacion(creacionFecha);
                    categoria.setIdCategoria(codCategoria);
                    categoriaDAO.actualizar(categoria);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("Categoria.jsp").forward(request, response);

        } else if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List listaCliente = clienteDAO.listar();
                    request.setAttribute("clientes", listaCliente);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombreCliente");
                    String apellido = request.getParameter("txtApellidoCliente");
                    String direccion = request.getParameter("txtDireccion");
                    String telefono = request.getParameter("txtTelefono");
                    cliente.setNombreCliente(nombre);
                    cliente.setApellidoCliente(apellido);
                    cliente.setDireccion(direccion);
                    cliente.setTelefono(telefono);
                    clienteDAO.agregar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("idCliente"));
                    Cliente c = clienteDAO.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombree = request.getParameter("txtNombreCliente");
                    String apellidoo = request.getParameter("txtApellidoCliente");
                    String direccioon = request.getParameter("txtDireccion");
                    String telefonoo = request.getParameter("txtTelefono");
                    cliente.setNombreCliente(nombree);
                    cliente.setApellidoCliente(apellidoo);
                    cliente.setDireccion(direccioon);
                    cliente.setTelefono(telefonoo);
                    cliente.setIdCliente(codCliente);
                    clienteDAO.actualizar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("idCliente")); //cambio la variable
                    clienteDAO.eliminar(codCliente); // cambio la variable
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        } else if (menu.equals("Establecimiento")) {
            switch (accion) {
                case "Listar":
                    List listaEstablecimiento = establecimientoDAO.listar();
                    request.setAttribute("establecimiento", listaEstablecimiento);
                    break;
                case "Agregar":
                    String nomEstablecimiento = request.getParameter("txtNombreEstablecimiento");
                    String direcEs = request.getParameter("txtDireccion");
                    String tel = request.getParameter("txtTelefono");
                    establecimiento.setNombreEstablecimiento(nomEstablecimiento);
                    establecimiento.setDireccion(direcEs);
                    establecimiento.setTelefono(tel);
                    establecimientoDAO.agregar(establecimiento);

                    request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    codEstableci = Integer.parseInt(request.getParameter("idEstablecimiento"));
                    Establecimiento es = establecimientoDAO.listaCodigoEstablecimiento(codEstableci);
                    request.setAttribute("establecimiento", es);
                    request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);
                    break;
                case "Actualizar": //no utiliza las mismas variables
                    codEstableci = Integer.parseInt(request.getParameter("txtIdEstablecimiento")); //cambio varibale y variable no casteada
                    nomEstablecimiento = request.getParameter("txtNombreEstablecimiento"); //cambio varibale 
                    direcEs = request.getParameter("txtDireccion"); //cambio varibale 
                    tel = request.getParameter("txtTelefono"); //cambio varibale 

                    establecimiento.setNombreEstablecimiento(nomEstablecimiento); //cambio varibale 
                    establecimiento.setDireccion(direcEs); //cambio varibale 
                    establecimiento.setTelefono(tel); //cambio varibale 
                    establecimiento.setIdEstablecimiento(codEstableci);
                    establecimientoDAO.actualizar(establecimiento);
                    request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);
                    break;
                case "Eliminar":
                    codEstableci = Integer.parseInt(request.getParameter("idEstablecimiento"));
                    establecimientoDAO.eliminar(codEstableci);
                    request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);
                    break;
            }
        } else if (menu.equals("Producto")) {
            switch (accion) {

                case "Listar":
                    List listaProducto = productoDAO.listar();
                    System.out.println("size " + listaProducto.size());
                    request.setAttribute("productos", listaProducto);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombreProducto");
                    String descripcion = request.getParameter("txtDescripcion");
                    String precio = request.getParameter("txtPrecio");
                    String imagen = request.getParameter("txtImagen");
                    String idProveedor = request.getParameter("txtIdProveedor");
                    String idCategoria = request.getParameter("txtIdCategoría");

                    Part imagePart = request.getPart("imagenProducto");
                    String nameImage = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                    if (nameImage != null && !nameImage.isEmpty()) {
                        String rutaImagen = saveImage(nameImage, imagePart);
                        producto.setNombreProducto(nombre);
                        producto.setDescripcion(descripcion);
                        producto.setPrecio(Double.parseDouble(precio));
                        producto.setImagen(rutaImagen);
                        producto.setIdProveedor(Integer.parseInt(idProveedor));
                        producto.setIdCategoria(Integer.parseInt(idCategoria));
                        productoDAO.agregar(producto);
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
                    }

                    break;
                case "Eliminar":
                    int productoId = Integer.parseInt(request.getParameter("idProducto"));
                    productoDAO.eliminar(productoId);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    codProducto = Integer.parseInt(request.getParameter("idProducto"));
                    Producto p = productoDAO.listarCodigoProducto(codProducto);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombreProducto = request.getParameter("txtNombreProducto");
                    String descripProducto = request.getParameter("txtDescripcion");
                    String precioProducto = request.getParameter("txtPrecio");
                    String proveedorId = request.getParameter("txtIdProveedor");
                    String categoriaId = request.getParameter("txtIdCategoría");
                    producto.setNombreProducto(nombreProducto);
                    producto.setDescripcion(descripProducto);
                    producto.setPrecio(Double.parseDouble(precioProducto));
                    producto.setIdProveedor(Integer.parseInt(proveedorId));
                    producto.setIdCategoria(Integer.parseInt(categoriaId));
                    producto.setIdProducto(codProducto);
                    productoDAO.actualizar(producto);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);

        } else if (menu.equals("Compra")) {

            switch (accion) {
                case "Listar":
                    List listaCompra = compraDAO.listar();
                    System.out.println(listaCompra);
                    request.setAttribute("compras", listaCompra);
                    break;

                case "Agregar":
                    int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor")); //variables no casteadas
//                    Date fecha = request.getParameter("txtfecha"); // comentado por motivos de definicon
                    Double total = Double.parseDouble(request.getParameter("txtTotal")); //variable no casteada
                    compra.setIdProveedor(idProveedor);
//                    compra.setFecha(fecha); // comentado por definicion
                    compra.setTotal(total);
                    compraDAO.agregar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=listar").forward(request, response);
                    break;

                case "Eliminar":
                    codCompra = Integer.parseInt(request.getParameter("codCompra"));
                    proveedorDAO.eliminar(codCompra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=listar").forward(request, response);
                    break;

                case "Editar":
                    codCompra = Integer.parseInt(request.getParameter("codCompra"));
                    compra = compraDAO.listarCodigoCompra(codCompra); // el nombre del metodo estaba mal
                    request.setAttribute("Compra", compra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=listar").forward(request, response);
                    break;

                case "Actualizar":
                    idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor")); //variable ya estaba definida y no esta casteada
//                    fecha = request.getParameter("txtFecha"); //variable ya estaba definida y comentada por definicion
                    total = Double.parseDouble(request.getParameter("txtTotal")); //variable ya estaba definida y no esta casteada
                    compra.setIdProveedor(idProveedor);
//                    compra.setFecha(fecha); // comentada por definicion
                    compra.setTotal(total);
                    compra.setIdCompra(codCompra);
                    compraDAO.actualizar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("Compra.jsp").forward(request, response);

        } else if (menu.equals("DetalleCompra")) {
            switch ("accion") {
                case "Listar":
                    List listaDetalleCompra = detalleCompraDAO.listar();
                    request.setAttribute("detalleCompras", listaDetalleCompra);
                    break;
                case "Agregar":
                    int idCompra = Integer.parseInt(request.getParameter("txtIdCompra"));
                    int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                    int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                    int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    detalleCompra.setIdCompra(idCompra);
                    detalleCompra.setIdProveedor(idProveedor);
                    detalleCompra.setIdProducto(idProducto);
                    detalleCompra.setCantidad(cantidad);
                    detalleCompraDAO.agregar(detalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("idDetalleCompra"));
                    DetalleCompra dc = detalleCompraDAO.listarCodigoDetalleCompra(codDetalleCompra);
                    request.setAttribute("detalleCompra", dc);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    idCompra = Integer.parseInt(request.getParameter("txtIdCompra"));
                    idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                    idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                    cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    detalleCompra.setIdCompra(idCompra);
                    detalleCompra.setIdProveedor(idProveedor);
                    detalleCompra.setIdProducto(idProducto);
                    detalleCompra.setCantidad(cantidad);
                    detalleCompra.setIdDetalleCompra(codDetalleCompra);
                    detalleCompraDAO.actualizar(detalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("idDetalleCompra"));
                    detalleCompraDAO.eliminar(codDetalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response);
        } else if (menu.equals("PedidoCliente")) {

            switch (accion) {
                case "Listar":
                    List listaPedidoCliente = pedidoClienteDAO.listar();
                    request.setAttribute("pedidoCliente", listaPedidoCliente);
                    break;

                case "Agregar":
                    int idCliente = Integer.parseInt(request.getParameter("txtIdCliente")); //Se tuvo que castear, no estaba casteado
                    int idProducto = Integer.parseInt(request.getParameter("txtIdProducto")); //Se tuvo que castear, no estaba casteado
                    int cantidad = Integer.parseInt(request.getParameter("txtCantidad")); //Se tuvo que castear, no estaba casteado
                    // date fecha = request.getParameter("txtFecha"); //linea comentada por motivos de definicion de fecha
                    double total = Double.parseDouble(request.getParameter("txtTotal")); //Se tuvo que castear, no estaba casteado
                    pedidoCliente.setIdCliente(idCliente); // La varibale no estaba correcta, estaba a medias
                    pedidoCliente.setIdProducto(idProducto); // La varibale no estaba correcta, estaba a medias
                    pedidoCliente.setCantidad(cantidad);
                    // pedidoCliente.setFecha(fecha); //linea comentada, nmotivos de definicion de fecha
                    pedidoCliente.setTotal(total);
                    pedidoClienteDAO.agregar(pedidoCliente);
                    request.getRequestDispatcher("Controlador?menu=PedidoCliente&accion=listar").forward(request, response);
                    break;

                case "Eliminar":
                    codPedidoCliente = Integer.parseInt(request.getParameter("idPedidoCliente"));
                    pedidoClienteDAO.eliminar(codPedidoCliente);
                    request.getRequestDispatcher("Controlador?menu=PedidoCliente&accion=listar").forward(request, response);
                    break;

                case "Editar":
                    codPedidoCliente = Integer.parseInt(request.getParameter("idPedidoCliente"));
                    PedidoCliente p = pedidoClienteDAO.listarCodigoPedidoCliente(codPedidoCliente);
                    request.setAttribute("pedidoCliente", p);
                    request.getRequestDispatcher("Controlador?menu=PedidoCliente&accion=listar").forward(request, response);
                    break;

                case "Actualizar":
                    idCliente = Integer.parseInt(request.getParameter("txtIdCliente")); // la variable ya estaba definida y se tuvo que castear
                    idProducto = Integer.parseInt(request.getParameter("txtIdProducto")); // la variable ya estaba definida y se tuvo que castear
                    cantidad = Integer.parseInt(request.getParameter("txtCantidad")); // la variable ya estaba definida y se tuvo que castear
                    //fecha = request.getParameter("txtFecha"); // la variable ya estaba definida y se comento por motivos de defnicion de fecha
                    total = Double.parseDouble(request.getParameter("txtTotal")); // la variable ya estaba definida y se tuvo que castear
                    pedidoCliente.setIdCliente(idCliente); // La varibale no estaba correcta, estaba a medias
                    pedidoCliente.setIdProducto(idProducto); // La varibale no estaba correcta, estaba a medias
                    pedidoCliente.setCantidad(cantidad);
                    // pedidoCliente.setFecha(fecha); // linea comentada motivo de definicion de fecha
                    pedidoCliente.setTotal(total);
                    pedidoClienteDAO.actualizar(pedidoCliente);
                    request.getRequestDispatcher("Controlador?menu=PedidoCliente&accion=listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("PedidoCliente.jsp").forward(request, response);
        } else if (menu.equals("PedidoProveedor")) {
            switch (accion) {
                case "Listar":
                    List listaPedidoProveedor = pedidoProveedorDAO.listPedidoProveedor();
                    request.setAttribute("pedidoProveedor", listaPedidoProveedor);
                    break;

                case "Agregar":
                    int idProveedor = Integer.parseInt(request.getParameter("txtIDProveedor"));
                    int idProducto = Integer.parseInt(request.getParameter("txtIDProducto"));
                    int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    //Date fecha = (request.getParameter("txtFecha"));
                    double total = Double.parseDouble(request.getParameter("txtTotal"));
                    pedidoProveedor.setIdProveedor(idProveedor);
                    pedidoProveedor.setIdProducto(idProducto);
                    pedidoProveedor.setCantidad(cantidad);
                    //pedidoProveedor.setFecha(fecha); //linea comentada, nmotivos de definicion de fecha
                    pedidoProveedor.setTotal(total);
                    pedidoProveedorDAO.addPedidoProveedor(pedidoProveedor);
                    request.getRequestDispatcher("Controlador?menu=PedidoProveedor&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    codPedidoProveedor = Integer.parseInt(request.getParameter("IdPedidoProveedor"));
                    pedidoProveedorDAO.deletePedidoProveedor(codPedidoProveedor);
                    request.getRequestDispatcher("Controlador?menu=PedidoProveedor&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    codPedidoProveedor = Integer.parseInt(request.getParameter("IdPedidoProveedor"));
                    PedidoProveedor p = pedidoProveedorDAO.getPedidoProveedorByID(codPedidoProveedor);
                    request.setAttribute("pedidoProveedor", p);
                    request.getRequestDispatcher("Controlador?menu=PedidoProveedor&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    idProveedor = Integer.parseInt(request.getParameter("txtIDProveedor"));
                    idProducto = Integer.parseInt(request.getParameter("txtIDProducto"));
                    cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    //fecha = request.getParameter("txtFecha"); // la variable ya estaba definida y se comento por motivos de defnicion de fecha
                    total = Double.parseDouble(request.getParameter("txtTotal"));
                    pedidoProveedor.setIdProveedor(idProveedor);
                    pedidoProveedor.setIdProducto(idProducto);
                    pedidoProveedor.setCantidad(cantidad);
                    // pedidoProveedor.setFecha(fecha); // linea comentada motivo de definicion de fecha
                    pedidoProveedor.setTotal(total);
                    pedidoProveedorDAO.updatePedidoProveedor(pedidoProveedor);
                    request.getRequestDispatcher("Controlador?menu=PedidoProveedor&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("PedidosProveedor.jsp").forward(request, response);
        } else if (menu.equals("Inventario")) {
            switch (accion) {
                case "Listar":
                    List listaInventario = inventarioDAO.listar();
                    request.setAttribute("Inventario", listaInventario);
                    break;

                case "Agregar":
                    inventario.setNombreInventario(request.getParameter("txtName"));
                    inventario.setIdEstablecimiento(Integer.parseInt(request.getParameter("txtIdEstablecimiento")));
                    inventario.setStock(Integer.parseInt(request.getParameter("txtStock")));
                    inventario.setIdProducto(Integer.parseInt(request.getParameter("txtIdProducto")));

                    inventarioDAO.agregar(inventario);
                    request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    inventarioDAO.eliminar(Integer.parseInt(request.getParameter("codigoInventario")));
                    Inventario p = inventarioDAO.buscar(Integer.parseInt(request.getParameter("codigoInventario")));
                    request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    Inventario pe = inventarioDAO.buscar(Integer.parseInt(request.getParameter("codigoInventario")));
                    request.setAttribute("Inventario", pe);
                    request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    inventario.setNombreInventario(request.getParameter("txtName"));
                    inventario.setIdEstablecimiento(Integer.parseInt(request.getParameter("txtIdEstablecimiento")));
                    inventario.setStock(Integer.parseInt(request.getParameter("txtStock")));
                    inventario.setIdProducto(Integer.parseInt(request.getParameter("txtIdProducto")));
                    inventarioDAO.actualizar(inventario);
                    request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("Inventario.jsp").forward(request, response);
        } else if (menu.equals("Ventas")) {
            int item =0;
            String fecha;
            String nombrePro;
            int cod;
            int SubTotal;
            int cantid;
            double precio;
            double subtotal;
            
            switch (accion) {
                case "Agregar":
                        item = item +1;
                        cod =producto.getIdProducto();
                        nombrePro=request.getParameter("txtNombreProducto");
                        precio = Double.parseDouble(request.getParameter("txtPrecio"));
                        cantid=Integer.parseInt(request.getParameter("txtCantidad"));
                        subtotal = precio * cantid;
                        venta.setItem(item);
                        venta.setIdProducto(cod);
                        venta.setDescripcion(nombrePro);
                        venta.setPrecio(precio);
                        venta.setCantidad(cantid);
                        venta.setSubtotal(subtotal);
                        listaVenta.add(venta);
                        request.setAttribute("Ventas",listaVenta );
                    break;
                case "BuscarCliente":
                    int idCliente = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    cliente.setIdCliente(idCliente);
                    cliente = ventaDAO.BuscarCliente(idCliente);
                    request.setAttribute("cliente", cliente);
                    //request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
                    break;
                case "BuscarProducto":
                    int idProducto = Integer.parseInt(request.getParameter("txtCodigoProducto"));
                    producto = productoDAO.listarCodigoProducto(idProducto);
                    request.setAttribute("producto", producto);
                    break;
            }
            request.getRequestDispatcher("Venta.jsp").forward(request, response);
        } else {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
