
package modeloDAO;

import modelo.Categoria;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CategoriaDAO {
  
   Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
   
   public List listar(){
       ArrayList<Categoria> listaCategoria = new ArrayList<>();
       String sql = "select * from Categoria";
       try {
            con = cn.Conexion();
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
   
   public int agregar(Categoria ca){
       String sql = "insert into Categoria(nombreCategoria, descripcion, fechaCreacion) values (?,?,?)";
       try {
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           ps.setString(1, ca.getNombreCategoria());
           ps.setString(2, ca.getDescripcion());
           ps.setDate(3, ca.getFechaCreacion());
           ps.executeUpdate();
       } catch (Exception e){
           e.printStackTrace();
           System.out.println("No se pudo agregar el registro");
       }
       return resp;
   }
   
   public Categoria listarCodigoCategoria(int id){
       Categoria ca = new Categoria();
       String sql = "Select * from Categoria where idCategoria ="+id;
       try {
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           while(rs.next()){
               ca.setIdCategoria(rs.getInt(1));
               ca.setNombreCategoria(rs.getString(2));
               ca.setDescripcion(rs.getString(3));
               ca.setFechaCreacion(rs.getDate(4));
           }
       } catch (Exception e){
           e.printStackTrace();
       }
       return ca;
   }
   
   public void eliminar(int id){
       String sql = "delete from Categoria where idCategoria = "+id;
       try {
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           ps.executeUpdate();
       } catch (Exception e) {
           e.printStackTrace();
       }
   }
   
   public int actualizar(Categoria ca){
       String sql = "Update Categoria set nombreCategoria = ?, descripcion = ?, fechaCreacion = ? where idCategoria = ?";
       try {
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           ps.setString(1, ca.getNombreCategoria());
           ps.setString(2, ca.getDescripcion());
           ps.setDate(3, ca.getFechaCreacion());
           ps.executeUpdate();
       } catch (Exception e){
           e.printStackTrace();
       }
       return resp;
   }
   
   
    
}

