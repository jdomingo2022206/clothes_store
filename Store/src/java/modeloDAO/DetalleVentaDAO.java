package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DetalleVenta;

public class DetalleVentaDAO {
    

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
           // listar Detalle venta y retorna la listaDetalleCompra
    public List listar() {
        String sql = "Select * from DetalleVenta";
        List <DetalleVenta>  listaDetalleVenta = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                DetalleVenta dv = new DetalleVenta();
                dv.setIdDetalleVenta(rs.getInt(1));
                dv.setIdVenta(rs.getInt(2));
                dv.setIdCliente(rs.getInt(3));
                dv.setIdProducto(rs.getInt(4));
                dv.setCantidad(rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println("No es posible listar");
            e.printStackTrace();
        }
        return listaDetalleVenta;
    }
    
    // Agregar Detalle Compra
    public int agregarDetalleCompra(DetalleVenta dv){
        String sql = "Insert into DetalleVenta (idDetalleVenta,idVenta,idCliente,idProducto,cantidad) values (?,?,?,?,?);";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dv.getIdDetalleVenta());
            ps.setInt(2, dv.getIdVenta());
            ps.setInt(3, dv.getIdCliente());
            ps.setInt(4, dv.getIdProducto());
            ps.setInt(5, dv.getCantidad());
            
        }catch(Exception e){
            System.out.println("No se puede Agregar DetalleVenta");
            e.printStackTrace();
        }
        return resp;
    }
    
    // Actualizar DetalleVenta retorna resp
    public int actualizar(DetalleVenta dv){
        String sql = "update DetalleVenta set idDetalleVenta = ?,idVenta = ?,idCliente = ?,idProducto = ?,cantidad = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dv.getIdDetalleVenta());
            ps.setInt(2, dv.getIdVenta());
            ps.setInt(3, dv.getIdCliente());
            ps.setInt(4, dv.getIdProducto());
            ps.setInt(5, dv.getCantidad());
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println("Nos Se pudo Modificar DetalleVenta");
            e.printStackTrace();
        }
    return resp;
    }
    
    // Eliminar detalle venta no retorna nada
    public void eliminar(int id){
        String sql ="delete from DetalleVenta where idDetalleVenta ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println("No se pudo eliminar DetalleVenta");
            e.printStackTrace();
        }
    }
}
