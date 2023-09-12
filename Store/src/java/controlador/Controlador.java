/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.Date;
import modelo.Compra;
import modelo.DetalleCompra;
import modelo.PedidoCliente;
import modelo.PedidoProveedor;
import modelo.Producto;
import modelo.Proveedor;
import modeloDAO.CompraDAO;
import modeloDAO.DetalleCompraDAO;
import modeloDAO.PedidoClienteDAO;
import modeloDAO.PedidoProveedorDAO;
import modeloDAO.ProductoDAO;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Categoria categoria = new Categoria();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        int codCategoria = 0;

        Establecimiento establecimiento = new Establecimiento();
        EstablecimientoDAO establecimientoDAO = new EstablecimientoDAO();
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

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        } else if (menu.equals("Proveedor")) {

            switch (accion) {
                case "Listar":
                    List listaProveedor = proveedorDAO.listar();
                    request.setAttribute("proveedor", listaProveedor);
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
                    request.setAttribute("categoria", listaCategoria);
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

        } else if (menu.equals("Establecimiento")) {
            switch (accion) {
                case "listar":
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

                case "listar":
                    List listaProducto = productoDAO.listar();
                    System.out.println("size " + listaProducto.size());
                    request.setAttribute("productos", listaProducto);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombreProducto");
                    String descripcion = request.getParameter("txtDescripcion");
                    String precio = request.getParameter("txtPrecio");
                    String idProveedor = request.getParameter("txtIdProveedor");
                    String idCategoria = request.getParameter("txtIdCategoría");
                    producto.setNombreProducto(nombre);
                    producto.setDescripcion(descripcion);
                    producto.setPrecio(Double.parseDouble(precio));
                    producto.setIdProveedor(Integer.parseInt(idProveedor));
                    producto.setIdCategoria(Integer.parseInt(idCategoria));
                    productoDAO.agregar(producto);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
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
                    request.setAttribute("compra", listaCompra);
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
                case "listar":
                    List listaDetalleCompra = detalleCompraDAO.listar();
                    request.setAttribute("detalleCompra", listaDetalleCompra);
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
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("idDetalleCompra"));
                    DetalleCompra dc = detalleCompraDAO.listarCodigoDetalleCompra(codDetalleCompra);
                    request.setAttribute("detalleCompra", dc);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=listar").forward(request, response);
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
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=listar").forward(request, response);
                    break;
                case "Eliminar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("idDetalleCompra"));
                    detalleCompraDAO.eliminar(codDetalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=listar").forward(request, response);
                    break;
            }

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
            switch(accion){
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
            
            request.getRequestDispatcher("PedidoProveedor.jsp").forward(request, response);
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
