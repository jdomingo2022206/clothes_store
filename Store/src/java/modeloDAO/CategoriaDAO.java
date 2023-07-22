
package modeloDAO;

import modelo.Categoria;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CategoriaDAO {
  
   Conexion conect = new Conexion();
   Connection con;
   PreparedStatement ps;
   ResultSet rs;
   Categoria nCategoria = new Categoria();
   
   public List listar(){
       ArrayList<Categoria> listaCategoria = new ArrayList<>();
       String sql = "select * from Categoria";
       try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Categoria nuevoProducto = new Categoria();
                nuevoProducto.setIdCategoria(rs.getInt("idCategoria"));
                nuevoProducto.setNombreCategoria(rs.getString("nombreCategoria"));
                nuevoProducto.setDescripcion(rs.getString("descripcion"));
                nuevoProducto.setFechaCreacion(rs.getDate("fechaCreacion"));
                listaCategoria.add(nuevoProducto);
            }
           
       } catch (Exception e) {
           e.printStackTrace();
       }
       return listaCategoria;
   }
   
   
    
}

