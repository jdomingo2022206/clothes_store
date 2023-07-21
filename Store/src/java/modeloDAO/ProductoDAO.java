package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    
   Conexion conect = new Conexion();
   Connection con;
   PreparedStatement ps;
   ResultSet rs;
   Producto nProducto = new Producto();
   
   public List listar(){
       ArrayList<Producto> listaProducto = new ArrayList<>();
       String sql = "select - from producto";
       try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Producto nuevoProducto = new Producto();
                nuevoProducto.setIdProducto(rs.getInt("idProducto"));
                nuevoProducto.setNombreProducto(rs.getString("nombreProducto"));
                nuevoProducto.setDescripcion(rs.getString("descripcion"));
                nuevoProducto.setPrecio(rs.getDouble("precio"));
                nuevoProducto.setIdProveedor(rs.getInt("idProveedor"));
                nuevoProducto.setIdCategoría(rs.getInt("idCategoria"));
                listaProducto.add(nuevoProducto);
            }
           
       } catch (Exception e) {
           e.printStackTrace();
       }
       return listaProducto;
   }
   
   
    
}
