package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;

public class ProductoDAO {
    
   Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
   
   public List listar(){
       ArrayList<Producto> listaProducto = new ArrayList<>();
       String sql = "select * from producto";
       try {
            con = cn.Conexion();
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
   
   public int agregar (Producto pr){
       String sql = "insert into Producto (nombreProducto, descripcion, precio, idProveedor, idCategoria) values (?,?,?,?,?)";
       try {
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           ps.setString(1, pr.getNombreProducto());
           ps.setString(2, pr.getDescripcion());
           ps.setDouble(3, pr.getPrecio());
           ps.setInt(4, pr.getIdProveedor());
           ps.setInt(5, pr.getIdCategoría());
           ps.executeUpdate();
       } catch (Exception e) {
           e.printStackTrace();
           System.out.println("No se pudo agregar el registro");
       }
       return resp;
   }
   
   public Producto listarCodigoProducto(int id){
            // Instanciar objeto a devolver
            Producto pr = new Producto();
            String sql = "select * from producto where idProducto = "+id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    pr.setIdProducto(rs.getInt(1));//rs.getInt(1)
                    pr.setNombreProducto(rs.getString(2));//rs.getString(2)
                    pr.setDescripcion(rs.getString(3));
                    pr.setPrecio(rs.getDouble(4));
                    pr.setIdProveedor(rs.getInt(5));
                    pr.setIdCategoría(rs.getInt(6));                 
                }
                
            }catch(Exception e){
                e.printStackTrace();
            }
            return pr;
        }
   
   
   public void eliminar(int id){
            String sql = "delete from producto where idProducto ="+id;
            try{
                con=cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
    }
   
   public int actualizar(Producto pr){
            String sql = "update producto set nombreProducto = ?, descripcion = ?, precio = ?, idProveedor = ?, idCategoria = ?  where idProducto = ?";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setString(1, pr.getNombreProducto());
                ps.setString(2, pr.getDescripcion());
                ps.setDouble(3, pr.getPrecio());
                ps.setInt(4, pr.getIdProveedor());
                ps.setInt(5, pr.getIdCategoría());
                ps.setInt(6, pr.getIdProducto());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
            return resp;
        }
}
