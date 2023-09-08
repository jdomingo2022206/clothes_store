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
import java.sql.Date;

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
        int idEstableci = 0;

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
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

        }else if(menu.equals("Establecimiento")){
                switch(accion){
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
                        idEstableci = Integer.parseInt(request.getParameter("idEstablecimiento"));
                        Establecimiento es = establecimientoDAO.listaCodigoEstablecimiento(idEstableci);
                        request.setAttribute("establecimiento", es);
                        request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);                        
                        break;
                    case "Actualizar":
                        String idEstable = request.getParameter("txtIdEstablecimiento");
                        String nomEstablecimiento2 = request.getParameter("txtNombreEstablecimiento");
                        String direcEs2 = request.getParameter("txtDireccion");
                        String tel2 = request.getParameter("txtTelefono");
                        
                        establecimiento.setNombreEstablecimiento(nomEstablecimiento2);
                        establecimiento.setDireccion(direcEs2);
                        establecimiento.setTelefono(tel2);
                        establecimiento.setIdEstablecimiento(idEstableci);
                        establecimientoDAO.actualizar(establecimiento);
                        request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);                        
                        break;
                    case "Eliminar":
                        idEstableci = Integer.parseInt(request.getParameter("idEstablecimiento"));
                        establecimientoDAO.eliminar(idEstableci);
                        request.getRequestDispatcher("Controlador?menu=Establecimiento&accion=listar").forward(request, response);                                                
                        break;
                }
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
